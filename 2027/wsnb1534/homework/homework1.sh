#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
NOTE_DIR="$(cd -- "$SCRIPT_DIR/../notes" && pwd)"
NOTE_FILE="$NOTE_DIR/lesson1-notes.md"
OUTPUT_FILE="$SCRIPT_DIR/output.txt"
HISTORY_FILE="${HISTFILE:-$HOME/.bash_history}"

{
    echo "===== 1. System Time ====="
    date "+%Y-%m-%d %H:%M:%S %Z"
    echo

    echo "===== 2. Last 10 Commands ====="
    if [[ -f "$HISTORY_FILE" ]]; then
        tail -n 10 "$HISTORY_FILE"
    else
        echo "History file not found: $HISTORY_FILE"
    fi
    echo

    echo "===== 3. Note Statistics ====="
    echo "Note file: $NOTE_FILE"
    echo "Words: $(wc -w < "$NOTE_FILE")"
    echo "Characters: $(wc -m < "$NOTE_FILE")"
} > "$OUTPUT_FILE"

echo "Output written to $OUTPUT_FILE"
