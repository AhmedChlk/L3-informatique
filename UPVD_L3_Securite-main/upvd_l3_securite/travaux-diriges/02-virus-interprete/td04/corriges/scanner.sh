#!/bin/bash
# VBashX Scanner - Detection of infected files
echo "=== VBashX Scanner ==="
DIR="${1:-.}"
echo "Scanning directory: $DIR"
echo ""
INFECTED=0
CLEAN=0

for f in "$DIR"/*.sh; do
    [ -f "$f" ] || continue
    INDICATORS=""
    # IoC 1: Marker signature
    if grep -q "VBX_7k9Pz" "$f" 2>/dev/null; then
        INDICATORS="$INDICATORS [MARKER:VBX_7k9Pz]"
    fi
    # IoC 2: Tagged lines (polymorphism)
    if grep -q "#@[0-9]*#" "$f" 2>/dev/null; then
        INDICATORS="$INDICATORS [TAGGED_LINES]"
    fi
    # IoC 3: Behavioral pattern (tail...$0..>>)
    if grep -q 'tail.*\$0.*>>' "$f" 2>/dev/null; then
        INDICATORS="$INDICATORS [TAIL_APPEND]"
    fi
    # IoC 4: Restoration pattern (grep for tags)
    if grep -q 'grep.*#@' "$f" 2>/dev/null; then
        INDICATORS="$INDICATORS [RESTORATION]"
    fi
    if [ -n "$INDICATORS" ]; then
        echo "[INFECTED] $(basename "$f"):$INDICATORS"
        INFECTED=$(($INFECTED + 1))
    else
        echo "[CLEAN]    $(basename "$f")"
        CLEAN=$(($CLEAN + 1))
    fi
done

echo ""
echo "=== Results ==="
echo "Infected: $INFECTED"
echo "Clean:    $CLEAN"
echo "Total:    $(($INFECTED + $CLEAN))"
