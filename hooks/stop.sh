#!/bin/bash
# Anty — Session Stop Hook
# Runs at the end of each Claude Code session.

ANTY_DIR=".anty"
SCRATCHPAD="$ANTY_DIR/scratchpad.md"

# Only write if the .anty directory exists
if [ ! -d "$ANTY_DIR" ]; then
  exit 0
fi

# Ensure scratchpad exists
if [ ! -f "$SCRATCHPAD" ]; then
  touch "$SCRATCHPAD"
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M')

echo "" >> "$SCRATCHPAD"
echo "[SESSION] $TIMESTAMP — Session ended." >> "$SCRATCHPAD"
