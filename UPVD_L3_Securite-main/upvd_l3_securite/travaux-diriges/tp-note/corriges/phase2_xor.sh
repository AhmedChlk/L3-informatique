#!/bin/bash
# CryptoShell — Phase 2 : Chiffrement XOR (encrypt + decrypt)
# Ce fichier contient les deux scripts : encrypt.sh et decrypt.sh

# === ENCRYPT (2c) ===
# Usage: bash phase2_xor.sh encrypt <fichier>
# === DECRYPT (2d) ===
# Usage: bash phase2_xor.sh decrypt <fichier.locked>

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/../fournis/xor_helper.sh"

KEY_FILE=".cryptoshell_key"

encrypt_file() {
    local input="$1"
    if [ ! -f "$input" ]; then
        echo "Erreur: fichier '$input' introuvable."
        exit 1
    fi
    # Générer une clé aléatoire de 8 octets
    local key
    key=$(generate_key 8)
    # Chiffrer le fichier
    xor_file "$input" "${input}.locked" "$key"
    # Supprimer l'original
    rm -f "$input"
    # Sauvegarder la clé
    echo "$key" > "$KEY_FILE"
    echo "[+] Fichier chiffré: ${input}.locked"
    echo "[+] Clé sauvegardée dans $KEY_FILE"
}

decrypt_file() {
    local input="$1"
    if [ ! -f "$input" ]; then
        echo "Erreur: fichier '$input' introuvable."
        exit 1
    fi
    if [ ! -f "$KEY_FILE" ]; then
        echo "Erreur: clé introuvable ($KEY_FILE)."
        exit 1
    fi
    local key
    key=$(cat "$KEY_FILE")
    # Restaurer le nom original (retirer .locked)
    local original="${input%.locked}"
    # Déchiffrer le fichier
    xor_file "$input" "$original" "$key"
    # Supprimer le fichier chiffré
    rm -f "$input"
    echo "[+] Fichier déchiffré: $original"
}

case "$1" in
    encrypt) encrypt_file "$2" ;;
    decrypt) decrypt_file "$2" ;;
    *)
        echo "Usage: $0 {encrypt|decrypt} <fichier>"
        echo "  encrypt <fichier>        — Chiffre un fichier avec XOR"
        echo "  decrypt <fichier.locked> — Déchiffre un fichier .locked"
        exit 1
        ;;
esac
