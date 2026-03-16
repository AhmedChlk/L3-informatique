#!/bin/bash
# CryptoShell — Phase 1 : Reconnaissance et découverte de fichiers
# Usage: bash phase1_recon.sh <répertoire>

TARGET_DIR="${1:-.}"
TARGETS_FILE="targets.list"
TOTAL_FILES=0
TOTAL_SIZE=0

echo "=== CryptoShell Recon ==="
echo "Scanning: $TARGET_DIR"
echo ""

# En-tête du fichier targets.list
echo "# CryptoShell Target List — $(date)" > "$TARGETS_FILE"
echo "# Format: SIZE DATE PATH" >> "$TARGETS_FILE"

# Parcours récursif des fichiers .txt et .dat
find "$TARGET_DIR" -type f \( -name "*.txt" -o -name "*.dat" \) | while read filepath; do
    SIZE=$(stat --format="%s" "$filepath" 2>/dev/null || stat -f "%z" "$filepath" 2>/dev/null)
    MDATE=$(stat --format="%y" "$filepath" 2>/dev/null || stat -f "%Sm" "$filepath" 2>/dev/null)
    echo "$SIZE $MDATE $filepath"
    echo "$SIZE $MDATE $filepath" >> "$TARGETS_FILE"
    TOTAL_FILES=$((TOTAL_FILES + 1))
    TOTAL_SIZE=$((TOTAL_SIZE + SIZE))
done

# Recompter pour affichage (les variables du pipe sont dans un sous-shell)
TOTAL_FILES=$(grep -c -v "^#" "$TARGETS_FILE")
TOTAL_SIZE=$(grep -v "^#" "$TARGETS_FILE" | awk '{sum += $1} END {print sum+0}')

echo ""
echo "--- Summary ---"
echo "Total files found: $TOTAL_FILES"
echo "Total size: $TOTAL_SIZE bytes"
echo "Target list saved to: $TARGETS_FILE"
