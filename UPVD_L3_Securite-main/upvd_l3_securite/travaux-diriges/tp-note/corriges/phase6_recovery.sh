#!/bin/bash
# CryptoShell — Phase 6b : Outil de récupération
# Usage: bash phase6_recovery.sh <répertoire>

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/../fournis/xor_helper.sh"

DIR="${1:-.}"
KEY_FILE=""
RECOVERED=0

echo "=========================================="
echo "   CryptoShell Recovery Tool"
echo "=========================================="
echo "Répertoire : $DIR"
echo ""

# 1) Rechercher le fichier .cryptoshell_key
echo "[*] Recherche de la clé de chiffrement..."
KEY_FILE=$(find "$DIR" -name ".cryptoshell_key" -type f 2>/dev/null | head -n 1)

# Chercher aussi dans le répertoire courant
if [ -z "$KEY_FILE" ] && [ -f ".cryptoshell_key" ]; then
    KEY_FILE=".cryptoshell_key"
fi

if [ -z "$KEY_FILE" ]; then
    echo "[!] ERREUR : Clé introuvable (.cryptoshell_key)."
    echo "    Déchiffrement impossible sans la clé."
    exit 1
fi

KEY=$(cat "$KEY_FILE")
echo "[+] Clé trouvée : $KEY_FILE"
echo "[+] Valeur : $KEY"
echo ""

# 2) Déchiffrer tous les fichiers .locked
echo "[*] Déchiffrement des fichiers..."
while IFS= read -r locked_file; do
    original="${locked_file%.locked}"
    xor_file "$locked_file" "$original" "$KEY"
    rm -f "$locked_file"
    echo "  [+] $(basename "$locked_file") -> $(basename "$original")"
    RECOVERED=$((RECOVERED + 1))
done < <(find "$DIR" -name "*.locked" -type f 2>/dev/null)

echo ""

# 3) Nettoyage des artefacts
echo "[*] Nettoyage des artefacts CryptoShell..."
CLEANED=0

# Supprimer les notes de rançon
while IFS= read -r f; do
    rm -f "$f"
    echo "  [-] Supprimé: $f"
    CLEANED=$((CLEANED + 1))
done < <(find "$DIR" -name "RANSOM_NOTE.txt" -type f 2>/dev/null)

# Supprimer les fichiers d'état
for artifact in ".cryptoshell_key" ".cs_count"; do
    while IFS= read -r f; do
        rm -f "$f"
        echo "  [-] Supprimé: $f"
        CLEANED=$((CLEANED + 1))
    done < <(find "$DIR" -name "$artifact" -type f 2>/dev/null)
done
# Aussi dans le répertoire courant
for artifact in ".cryptoshell_key" ".cs_count"; do
    if [ -f "$artifact" ]; then
        rm -f "$artifact"
        echo "  [-] Supprimé: ./$artifact"
        CLEANED=$((CLEANED + 1))
    fi
done

echo ""
echo "=========================================="
echo "   RÉSULTAT"
echo "=========================================="
echo "  Fichiers récupérés : $RECOVERED"
echo "  Artefacts nettoyés : $CLEANED"
if [ "$RECOVERED" -gt 0 ]; then
    echo "  [OK] Récupération terminée avec succès."
else
    echo "  [!] Aucun fichier .locked trouvé."
fi
