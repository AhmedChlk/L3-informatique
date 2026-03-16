#!/bin/bash
# CryptoShell — Phase 6a : Scanner de détection (IoC)
# Usage: bash phase6_scanner.sh <répertoire>

DIR="${1:-.}"

echo "=========================================="
echo "   CryptoShell IoC Scanner"
echo "=========================================="
echo "Répertoire analysé : $DIR"
echo ""

# Compteurs par catégorie
IOC_LOCKED=0
IOC_RANSOM=0
IOC_HIDDEN=0
IOC_PATTERNS=0

# 1) Fichiers .locked
echo "--- Fichiers chiffrés (.locked) ---"
while IFS= read -r f; do
    echo "  [LOCKED] $f"
    IOC_LOCKED=$((IOC_LOCKED + 1))
done < <(find "$DIR" -name "*.locked" -type f 2>/dev/null)
[ "$IOC_LOCKED" -eq 0 ] && echo "  Aucun fichier .locked trouvé."

echo ""

# 2) Notes de rançon
echo "--- Notes de rançon ---"
while IFS= read -r f; do
    echo "  [RANSOM] $f"
    IOC_RANSOM=$((IOC_RANSOM + 1))
done < <(find "$DIR" -name "RANSOM_NOTE.txt" -type f 2>/dev/null)
[ "$IOC_RANSOM" -eq 0 ] && echo "  Aucune note de rançon trouvée."

echo ""

# 3) Fichiers cachés suspects
echo "--- Fichiers cachés suspects ---"
for hidden_name in ".cs_count" ".cryptoshell_key"; do
    while IFS= read -r f; do
        echo "  [HIDDEN] $f"
        IOC_HIDDEN=$((IOC_HIDDEN + 1))
    done < <(find "$DIR" -name "$hidden_name" -type f 2>/dev/null)
done
[ "$IOC_HIDDEN" -eq 0 ] && echo "  Aucun fichier caché suspect trouvé."

echo ""

# 4) Patterns suspects dans les scripts
echo "--- Patterns suspects dans les scripts ---"
while IFS= read -r f; do
    INDICATORS=""
    grep -q "xor" "$f" 2>/dev/null && INDICATORS="$INDICATORS [xor]"
    grep -q "locked" "$f" 2>/dev/null && INDICATORS="$INDICATORS [locked]"
    grep -q "RANSOM" "$f" 2>/dev/null && INDICATORS="$INDICATORS [RANSOM]"
    grep -q "cryptoshell" "$f" 2>/dev/null && INDICATORS="$INDICATORS [cryptoshell]"
    if [ -n "$INDICATORS" ]; then
        echo "  [SUSPECT] $(basename "$f"):$INDICATORS"
        IOC_PATTERNS=$((IOC_PATTERNS + 1))
    fi
done < <(find "$DIR" -name "*.sh" -type f 2>/dev/null)
[ "$IOC_PATTERNS" -eq 0 ] && echo "  Aucun pattern suspect trouvé."

echo ""
echo "=========================================="
echo "   RAPPORT SYNTHÉTIQUE"
echo "=========================================="
echo "  Fichiers chiffrés (.locked) : $IOC_LOCKED"
echo "  Notes de rançon             : $IOC_RANSOM"
echo "  Fichiers cachés suspects    : $IOC_HIDDEN"
echo "  Scripts avec patterns suspects : $IOC_PATTERNS"
TOTAL=$((IOC_LOCKED + IOC_RANSOM + IOC_HIDDEN + IOC_PATTERNS))
echo "  ---"
echo "  TOTAL IoC détectés          : $TOTAL"

if [ "$TOTAL" -gt 0 ]; then
    echo ""
    echo "  [!] COMPROMISSION DÉTECTÉE — Exécuter recovery.sh"
else
    echo ""
    echo "  [OK] Aucun indicateur de compromission détecté."
fi
