---
description: /anty:scan — Analysis Cycle (10-Point)
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:scan — Analysis Cycle (10-Point)

## Trigger
User runs `/anty:scan`

## Behavior

Execute a comprehensive 10-point analysis using the Analyst subagent. Read all `.anty/` state files, perform each check, save results, and propose recovery actions if issues are found.

### Agent
Use the **Analyst** subagent (`agents/analyst.md`) to perform all analysis checks.

### 10-Point Analysis

#### 1. Buffer Consumption vs Progress
- Read goal from `.anty/goals/*.yaml`
- Calculate: `buffer_consumed_pct = (elapsed_time - planned_time_for_current_progress) / total_buffer`
- Compare buffer consumption rate against progress rate
- Flag if buffer consumption outpaces progress (RED zone)
- Assessment: GREEN / YELLOW / RED with explanation

#### 2. KPI Propagation Check
- Read drivers from `.anty/drivers/*.yaml` and actions from `.anty/actions/*.yaml`
- Trace: Action execution -> Driver metric movement -> Goal progress
- Identify broken propagation chains (actions executed but driver metric unchanged)
- Identify phantom metrics (driver moving without corresponding actions)
- Assessment: propagating / partially blocked / blocked

#### 3. Pipeline Stall Detection
- Read deals from `.anty/pipeline/deals/*.yaml`
- Calculate average dwell time per step
- Flag deals exceeding 2x average dwell time for their current step
- List stalled deals with step name, dwell days, and average
- Assessment: flowing / stalls detected / critical stalls

#### 4. Driver Impact Weight Recalculation
- Analyze metric movement data for each driver
- Recalculate impact_weight based on observed correlation between driver metric changes and goal progress
- Compare new weights with current weights
- Propose weight adjustments if delta > 5%
- Assessment: weights accurate / adjustment recommended

#### 5. Failure Pattern Detection
- Read `.anty/scratchpad.md` and `.anty/learning/choice-history.yaml`
- Detect 3+ consecutive failures on the same approach or driver
- Identify repeating failure patterns
- Reference `.anty/learning/failure-patterns.yaml` for known patterns
- Assessment: no patterns / pattern detected (with description)

#### 6. Six-Force Environmental Check
- Use the **Research** subagent (`agents/research.md`) to perform web searches
- Check six forces relevant to the user's business:
  1. Competitors — new entrants, pivots, funding rounds
  2. Customers — sentiment shifts, new needs
  3. Technology — relevant tech changes, new tools
  4. Regulation — policy changes, compliance updates
  5. Market — trend shifts, economic conditions
  6. Substitutes — alternative solutions gaining traction
- Summarize findings with relevance score (high / medium / low)
- Assessment: stable / changes detected / disruption risk

#### 7. Anti-Pattern Detection
- Load the `stupid-games` skill knowledge (12 anti-patterns)
- Check current strategy and actions against all 12 patterns:
  1. Local optimization (optimizing part at expense of whole)
  2. Vanity metrics (tracking metrics that don't drive goal)
  3. Premature scaling (scaling before product-market fit)
  4. Feature creep (building features instead of selling)
  5. Analysis paralysis (over-analyzing, under-acting)
  6. Shiny object syndrome (chasing trends over strategy)
  7. Founder-market mismatch denial
  8. Cargo cult metrics (copying others' KPIs without context)
  9. Survivorship bias (learning only from successes)
  10. Sunk cost escalation (doubling down on failing approach)
  11. False consensus (assuming market wants what founder wants)
  12. Metric gaming (optimizing for measurement, not outcome)
- Assessment: clean / warning (with pattern name) / active anti-pattern

#### 8. Growth Rate + YC Benchmark
- Calculate weekly growth rate from goal progress data
- Compare against YC benchmarks:
  - Exceptional: > 15%/week
  - Excellent: 10-15%/week
  - Good: 5-10%/week
  - Needs attention: < 5%/week
- Track growth trend (accelerating / stable / decelerating)
- Assessment: benchmark tier + trend

#### 9. Input vs Output Metric Classification
- Classify each tracked metric as Input (controllable action) or Output (result)
- Verify that actions target Input metrics
- Flag if team is only tracking Output metrics (lagging indicators)
- Recommend Input metrics if missing
- Assessment: balanced / output-heavy / input-heavy

#### 10. Oscillation Detection
- Read recent action history from `.anty/actions/*.yaml` and `.anty/scratchpad.md`
- Detect A->B->A patterns: switching back to a previously abandoned approach
- Detect strategy flip-flops within short timeframes
- Flag oscillating decisions with the pattern description
- Assessment: stable / oscillation detected (with pattern)

### Output

#### Scan Results File
Save to `.anty/history/scans/[YYYY-MM-DD].yaml`:

```yaml
scan_date: 2026-03-20T14:00:00Z
checks:
  buffer_health:
    status: GREEN
    buffer_consumed_pct: 28
    progress_pct: 24
    summary: "Buffer consumption tracking within acceptable range"
  kpi_propagation:
    status: propagating
    broken_chains: []
    summary: "All action effects reaching goal metrics"
  pipeline_stalls:
    status: flowing
    stalled_deals: []
    summary: "No stalled deals detected"
  impact_weights:
    status: accurate
    adjustments: []
    summary: "Current weights reflect observed metric movement"
  failure_patterns:
    status: no_patterns
    patterns: []
    summary: "No recurring failure patterns detected"
  environmental:
    status: stable
    findings: []
    summary: "No significant environmental changes"
  anti_patterns:
    status: clean
    detected: []
    summary: "No anti-patterns detected in current strategy"
  growth_rate:
    status: excellent
    weekly_rate: 8.3
    trend: stable
    benchmark: "YC excellent tier"
    summary: "8.3%/week growth, stable trend"
  metric_classification:
    status: balanced
    input_metrics: 3
    output_metrics: 2
    summary: "Healthy mix of input and output metrics"
  oscillation:
    status: stable
    patterns: []
    summary: "No A-B-A oscillation patterns detected"
issues_found: 0
recovery_proposals: []
```

#### Scratchpad Append
Append scan findings to `.anty/scratchpad.md`:

```
---
[SCAN] 2026-03-20 14:00 — 10-point analysis complete
- Buffer: GREEN (28% consumed)
- Growth: 8.3%/week (excellent)
- Issues: 0
- [PATTERN] if any patterns found
- [INSIGHT] if any new insights
```

#### Recovery Action Proposals
If any check returns a warning or critical status:
1. Generate recovery Action proposals
2. Save as pending actions in `.anty/actions/`
3. Notify user: "Scan found [n] issues. Run /anty:actions to review [n] recovery proposals."

### Display

Show a summary table after scan completes:

```
====================================================
  SCAN RESULTS — 2026-03-20
====================================================
 #  Check                    Status
----------------------------------------------------
 1  Buffer Health            GREEN
 2  KPI Propagation          Propagating
 3  Pipeline Stalls          Flowing
 4  Impact Weights           Accurate
 5  Failure Patterns         Clean
 6  Environmental            Stable
 7  Anti-Patterns            Clean
 8  Growth Rate              8.3%/week (excellent)
 9  Metric Classification    Balanced
10  Oscillation              Stable
====================================================
Issues: 0 | Recovery proposals: 0
====================================================
```
