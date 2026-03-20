---
description: /anty:pipeline — Sales Pipeline Management
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:pipeline — Sales Pipeline Management

## Trigger
User runs `/anty:pipeline` optionally followed by a subcommand.

## Behavior

Manage the sales pipeline stored in `.anty/pipeline/`. Display pipeline board, add/update deals, detect bottlenecks, and track flow.

### Default View (no subcommand)

Display the pipeline as an ASCII table with steps as columns and deals as rows:

```
====================================================
  PIPELINE BOARD
====================================================
Step 1        Step 2        Step 3        Step 4        Step 5
Prospect      Qualify       Demo          Proposal      Close
----------    ----------    ----------    ----------    ----------
Acme Corp     BigCo Inc     StartupX
SmallBiz      MedCorp
TechFirm

Utilization:  60%           40%           20%           0%            0%

Deals: 6 active | Weighted: $127K | Avg cycle: 18 days
====================================================

BBS SUMMARY
----------------------------------------------------
Opening pipeline:    $200K  (6 deals)
+ New this period:   $50K   (2 deals)
- Closed won:        $30K   (1 deal)
- Closed lost:       $15K   (1 deal)
= Closing pipeline:  $205K  (6 deals)
====================================================
```

### Subcommands

#### `/anty:pipeline add`
Add a new deal to the pipeline.

1. Ask for deal information:
   - Company name
   - Contact name and role
   - Estimated deal value
   - Starting step (default: Step 1)
   - Notes
2. Generate deal ID (deal-NNN, sequential)
3. Save to `.anty/pipeline/deals/deal-NNN.yaml`

Deal YAML structure:
```yaml
id: deal-001
company: "Acme Corp"
contact: "Jane Smith, CTO"
value: 25000
step: 1
step_name: "Prospect"
probability: 0.10
status: active
created_at: 2026-03-20T10:00:00Z
updated_at: 2026-03-20T10:00:00Z
dwell_days: 0
notes: "Met at conference"
history:
  - step: 1
    entered_at: 2026-03-20T10:00:00Z
```

#### `/anty:pipeline update [deal-id]`
Update deal details (value, contact, notes, status).

#### `/anty:pipeline advance [deal-id]`
Move a deal to the next step.

1. Read current deal state
2. **Verification checkpoint**: Before advancing, ask the user to confirm:
   - "What evidence supports advancing [company] from [current step] to [next step]?"
   - Require at least one concrete evidence point
3. Update step, step_name, probability
4. Record step transition in deal history
5. Reset dwell_days to 0
6. Save updated deal

Step probabilities (default, configurable in `.anty/pipeline/config.yaml`):
- Step 1 (Prospect): 10%
- Step 2 (Qualify): 25%
- Step 3 (Demo): 50%
- Step 4 (Proposal): 75%
- Step 5 (Close): 90%

#### `/anty:pipeline close [deal-id] [won|lost]`
Close a deal as won or lost.

1. Update status to `closed_won` or `closed_lost`
2. Record final outcome in deal history
3. If won: log `[SUCCESS]` to scratchpad
4. If lost: ask for loss reason, log `[FAILURE]` to scratchpad with reason

### Bottleneck Detection

Calculate utilization per step:
- `utilization = deals_in_step / expected_capacity`
- Expected capacity defaults: each step should hold ~20% of active deals
- Flag any step with > 40% of deals as a bottleneck
- Display bottleneck warnings in the board view

### Stall Detection

Detect stalled deals:
1. Calculate average dwell time per step across all historical deals
2. Flag any deal exceeding 2x the average dwell time for its current step
3. Display stall warnings:
   ```
   STALL WARNING: [company] has been in [step] for [n] days (avg: [m] days)
   ```

### BBS Summary (Beginning-Before-Selling)

Track pipeline flow for the current period:
```
Opening pipeline + New deals - Closed won - Closed lost = Closing pipeline
```
Both deal count and dollar value.

### Data Storage

All pipeline data saved to `.anty/pipeline/`:
- `.anty/pipeline/config.yaml` — Step definitions and capacity settings
- `.anty/pipeline/deals/deal-NNN.yaml` — Individual deal files
