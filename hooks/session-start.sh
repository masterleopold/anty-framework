#!/bin/bash
# Anty — Session Start Hook
# Runs at the beginning of each Claude Code session.

ANTY_DIR=".anty"

if [ ! -d "$ANTY_DIR" ]; then
  echo "Welcome to Anty! Run /anty-onboard to get started."
  exit 0
fi

echo "=== Anty Session Start ==="
echo ""

# Active goal (first .yaml in goals/)
if [ -d "$ANTY_DIR/goals" ] && ls "$ANTY_DIR/goals/"*.yaml 1>/dev/null 2>&1; then
  GOAL_FILE=$(ls -t "$ANTY_DIR/goals/"*.yaml 2>/dev/null | head -1)
  if [ -n "$GOAL_FILE" ]; then
    GOAL_NAME=$(basename "$GOAL_FILE" .yaml)
    echo "Active goal: $GOAL_NAME"
  fi
else
  echo "Active goal: (none set — run /anty-plan)"
fi

# Buffer zone — check config for scan interval
if [ -f "$ANTY_DIR/config.yaml" ]; then
  SCAN_INTERVAL=$(grep 'scanInterval' "$ANTY_DIR/config.yaml" 2>/dev/null | head -1 | sed 's/.*: *//')
  if [ -n "$SCAN_INTERVAL" ]; then
    echo "Scan interval: $SCAN_INTERVAL"
  fi
fi

# Pending actions count
if [ -d "$ANTY_DIR/actions" ]; then
  ACTION_COUNT=$(ls "$ANTY_DIR/actions/"*.yaml 2>/dev/null | wc -l | tr -d ' ')
  echo "Pending actions: $ACTION_COUNT"
fi

# Last session note from scratchpad
if [ -f "$ANTY_DIR/scratchpad.md" ]; then
  LAST_SESSION=$(grep '^\[SESSION\]' "$ANTY_DIR/scratchpad.md" 2>/dev/null | tail -1)
  if [ -n "$LAST_SESSION" ]; then
    echo "Last session: $LAST_SESSION"
  fi
fi

echo ""
echo "Read .anty/ files for full context."
