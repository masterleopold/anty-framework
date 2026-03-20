---
description: /anty:loop — Persistent Operation
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:loop — Persistent Operation

## Trigger
User runs `/anty:loop [interval]`

## Arguments
- `/anty:loop 30m` — Run scan every 30 minutes
- `/anty:loop 1h` — Run scan every hour
- `/anty:loop 2h` — Run scan every 2 hours
- `/anty:loop stop` — Stop the running loop

## Behavior

Establish a persistent scan loop that repeatedly executes `/anty:scan` at the specified interval. Uses the loop skill pattern for continuous operation within a Claude Code session.

### Starting the Loop

1. Parse the interval argument (e.g., `30m`, `1h`, `2h`)
2. Validate interval is between 10m and 24h
3. Display confirmation:
   ```
   Anty loop started.
   Interval: [interval]
   Next scan: [timestamp]
   Use /anty:loop stop to end.
   ```
4. Begin the loop cycle

### Loop Cycle

Each iteration:

1. **Read state**: Load all `.anty/` files to get current state
2. **Execute scan**: Run the full `/anty:scan` 10-point analysis
3. **Evaluate findings**:
   - If issues found with severity >= warning:
     - Generate recovery Action proposals
     - Notify user with a summary of findings
   - If no issues: log clean scan silently
4. **Save results**: Write scan results to `.anty/history/scans/[date].yaml`
5. **Append to scratchpad**: Add scan summary to `.anty/scratchpad.md`
6. **Wait**: Sleep for the specified interval
7. **Repeat**: Go to step 1

### Notification Thresholds

Only notify the user (interrupt their work) when:
- Buffer zone transitions (GREEN->YELLOW, YELLOW->RED)
- Pipeline deal stalls detected (2x average dwell time)
- Failure pattern detected (3+ consecutive failures)
- Anti-pattern detected
- Growth rate drops below 5%/week
- Environmental disruption risk detected
- Oscillation pattern detected

For non-critical findings, accumulate and report at next user interaction.

### Notification Format

```
----------------------------------------------------
ANTY LOOP — [timestamp]
----------------------------------------------------
[severity] [check name]: [one-line summary]

[n] recovery proposals generated.
Run /anty:actions to review.
----------------------------------------------------
```

### Stopping the Loop

When user runs `/anty:loop stop`:
1. End the loop cycle
2. Display summary of the session:
   ```
   Anty loop stopped.
   Session duration: [duration]
   Scans completed: [n]
   Issues detected: [n]
   Recovery proposals generated: [n]
   ```
3. Save final state to `.anty/`

### Loop Implementation

Use the standard loop skill pattern:
- Leverage Claude Code's ability to run persistent background operations
- Use bash `sleep` between iterations with the specified interval
- Track loop state (running/stopped, iteration count, start time)
- Handle graceful shutdown on `/anty:loop stop`

### Interval Parsing
- `Nm` — N minutes (e.g., `30m` = 1800 seconds)
- `Nh` — N hours (e.g., `1h` = 3600 seconds)
- Minimum: 10m
- Maximum: 24h
- Default (no argument): 1h

### Error Handling
- If a scan fails, log the error and continue to next iteration
- If `.anty/` files are corrupted, attempt repair and notify user
- If session is about to end, save all state before termination
