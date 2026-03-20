---
description: /anty:status — CLI Dashboard
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:status — CLI Dashboard

## Trigger
User runs `/anty:status`

## Behavior

Read ALL files in the `.anty/` directory tree to gather current state, then display a formatted ASCII dashboard.

### Steps

1. **Read all .anty/ files:**
   - `.anty/goals/*.yaml` — Goal definitions, progress, buffer
   - `.anty/drivers/*.yaml` — Driver definitions, impact_weight, metrics
   - `.anty/actions/*.yaml` — Action statuses
   - `.anty/pipeline/config.yaml` — Pipeline step definitions
   - `.anty/pipeline/deals/*.yaml` — Active deals
   - `.anty/scratchpad.md` — Working memory entries
   - `.anty/config.yaml` — Configuration
   - `.anty/history/scans/` — Last scan timestamp

2. **Display formatted dashboard:**

```
====================================================
  ANTY STATUS DASHBOARD
====================================================

Goal: [goal name] ([timeframe])
Progress: [progress bar] [current]/[target] ([%])
Buffer:   [zone] ([consumption]% consumed)

Growth:   [weekly rate]%/week (YC: [assessment])

----------------------------------------------------
CRUX DRIVER
----------------------------------------------------
  Constraint: [driver name]
  Impact Weight: [weight]%

----------------------------------------------------
WIP STATUS
----------------------------------------------------
  Constraint WIP: [n]/[limit]
  Non-constraint WIP: [n]
  Total WIP: [total]/[max]

----------------------------------------------------
DRIVERS (sorted by impact_weight)
----------------------------------------------------
  [star] [name]     wt:[weight]%  metric:[value]%  [CONSTRAINT]
         [name]     wt:[weight]%  metric:[value]%
         [name]     wt:[weight]%  metric:[value]%

----------------------------------------------------
PIPELINE
----------------------------------------------------
  Active Deals: [n] | Weighted Value: $[value]
  Bottleneck: Step [n] ([name])

----------------------------------------------------
ACTIONS
----------------------------------------------------
  Pending: [n] actions awaiting approval
  Run /anty:actions to review

----------------------------------------------------
SCRATCHPAD
----------------------------------------------------
  [SUCCESS]: [n] | [FAILURE]: [n]
  [PATTERN]: [n] | [INSIGHT]: [n]

Last scan: [timestamp]
====================================================
```

### Progress Bar Format
- Use filled blocks for progress: `█`
- Use empty blocks for remaining: `░`
- 10 characters wide, scaled to percentage
- Example: `██████░░░░` for 60%

### Buffer Zone Colors
- **GREEN**: Buffer consumption < 33% of elapsed time ratio
- **YELLOW**: Buffer consumption 33-66%
- **RED**: Buffer consumption > 66%

### YC Benchmark Assessment
- `exceptional`: > 15%/week
- `excellent`: 10-15%/week
- `good`: 5-10%/week
- `needs attention`: < 5%/week

### Pipeline Summary
- Count active deals (status != closed_won and != closed_lost)
- Weighted value = sum(deal_value * step_probability) for active deals
- Bottleneck = step with highest utilization (deals_in_step / step_capacity)

### Scratchpad Stats
- Count entries by tag prefix: `[SUCCESS]`, `[FAILURE]`, `[PATTERN]`, `[INSIGHT]`

### Edge Cases
- If no goal exists: display "No goal set. Run /anty:plan to create one."
- If no pipeline exists: display "No pipeline configured. Run /anty:pipeline to set up."
- If no scan history: display "No scans yet. Run /anty:scan."
