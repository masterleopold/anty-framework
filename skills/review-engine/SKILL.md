---
name: review-engine
description: 5-question review framework (result, execution, plan, strategy, analysis), KPI propagation monitoring with 4-layer anomaly patterns, One-Way/Two-Way Door classification, withdrawal decision protocol, and assumption provenance auditing. Use during periodic reviews, buffer zone changes, or when evaluating why results diverge from expectations.
type: skill
---

# Review Engine

## When to Apply
- After each periodic scan
- When buffer zone changes
- When Actions complete but Goal doesn't progress
- Quarterly strategy reviews
- When the founder asks "why isn't this working?"

## Core Framework

### 5-Question Review (Strict Priority Order)

Start at Question 1. Only proceed deeper if the answer is "yes" (problem isn't at that level):

| Priority | Question | Scope | If "No" |
|---|---|---|---|
| 1 | Has the Goal progressed since last review? | WHERE | Re-run WHERE analysis to locate new gap |
| 2 | Were approved Actions executed as planned? | Execution | Investigate blockers, check relay runner compliance |
| 3 | Was the Action plan well-constructed? | Planning | Review Step breakdown, batch config, template fit |
| 4 | Were the chosen Actions appropriate? | HOW | Re-run 3-option choice with different approaches |
| 5 | Was the root-cause analysis correct? | WHY | Rebuild causal structure diagram from scratch |

This prevents the common trap of never questioning upstream assumptions.

### KPI Propagation Monitoring (4-Layer)

Actions are monitored for whether effects propagate upward through the causal chain:

```
Action: "Post 4 thought-leadership threads per week"
  |
  KPI Layer 1 (Execution): Threads posted per week
  -> "Is the Action being executed?" (target: 4/week)
  |
  KPI Layer 2 (Propagation): Engagement rate per thread
  -> "Is it producing the expected intermediate effect?"
  |
  KPI Layer 3 (Driver metric): Monthly new followers
  -> "Is the Driver metric moving?"
  |
  KGI (Goal metric): Paying customers
  -> "Is it reaching the Goal?"
```

**4-Layer Anomaly Patterns:**

| Pattern | Diagnosis | Response |
|---|---|---|
| Layer 1 failing | Action not being executed | Check blockers, re-prioritize, enforce relay runner |
| L1 OK, L2 stalling | Action executed but ineffective | Trigger WHY analysis on L1-L2 gap |
| L1-2 OK, L3 stalling | Intermediate effect not converting | KPI tree may need re-decomposition |
| All layers OK, KGI stalling | Causal model may be wrong | Full review (Question 5) |

**KPI placement rules:**
1. Place on action target and upward propagation path only
2. Closest KPI immediately above action point (fastest feedback)
3. Never place on disproven or uncontrollable nodes
4. Each KPI: quantifiable, measurement frequency, target value, owner

### One-Way Door vs Two-Way Door Classification

Automatically classify every decision:

| Type | Characteristics | Agent Behavior |
|---|---|---|
| **Two-Way Door** | Low cost, reversible, testable | "Reversible. Act at 70% confidence. Move fast." |
| **One-Way Door** | High cost, hard to reverse | "Major commitment. Pre-mortem, assumption audit, founder confirmation required." |

```
Two-Way: "Test LinkedIn DM with 10 prospects" -> Execute quickly
One-Way: "Hire full-time sales rep ($80K/year)" -> Deep analysis first
One-Way: "Pivot from SMB to Enterprise" -> Full Strategy Kernel rebuild
```

Most startup decisions are Two-Way, but founders often treat them as One-Way. Explicitly label reversibility to accelerate decision-making.

### Withdrawal Decision Protocol

Every Goal, Driver, and major Action is created with PRE-COMMITTED stop conditions:

```
WITHDRAWAL PROTOCOL (defined at creation):
  Stop Condition 1 (Quantitative):
    <20 customers after 60% of timeline elapsed
  Stop Condition 2 (Qualitative):
    Retention curve declining to zero after 3 months
  Stop Condition 3 (Temporal):
    No positive growth for 6 consecutive weeks

  Authority: Founder (auto-presented when triggered)
  Process: Present stop conditions + data + 3 options:
    [Continue with modifications] [Pivot to Plan B] [Stop entirely]

  Re-presentation: Every 2 weeks, regardless of performance
```

Stop conditions defined AT LAUNCH, not retroactively. Re-present biweekly to prevent "forgetting" exit criteria.

### Assumption Provenance Auditing

Every load-bearing assumption tracked with source and verification:

```
Assumption: "TAM is $500M"
  Source: Founder estimate from Gartner 2024 report
  Verification: NOT independently verified
  Load-bearing: YES (determines hiring plan + fundraise target)
  Sample size: N/A (third-party estimate)

Assumption: "CTOs are primary buyer persona"
  Source: First 5 customers were CTOs
  Verification: n=5, insufficient sample
  Load-bearing: YES (all outreach targeting CTOs)
```

Each assumption carries: `source`, `verificationStatus` (verified/unverified/disproven), `isLoadBearing`, `sampleSize`.

**Periodic re-audit:** Flag when load-bearing assumptions become stale or when decisions have scaled beyond the evidence base.

## Decision Rules

1. **Questions in strict order** — never skip to Q5 before checking Q1-Q4
2. **Pre-committed stops are binding** — present when triggered, don't negotiate
3. **Re-present biweekly** — withdrawal conditions shown regularly, not just when triggered
4. **One-Way Doors get full analysis** — pre-mortem, assumption audit, confirmation
5. **Two-Way Doors get speed** — act at 70% confidence, adjust later
6. **Unverified load-bearing assumptions are risks** — flag and propose verification

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Skipping upstream questions | Jumping to "wrong strategy" without checking execution | "Before questioning strategy, confirm: were Actions actually executed as planned?" |
| Missing stop conditions | Goal created without withdrawal protocol | "Define stop conditions now, while judgment is clear. Not after sunk costs accumulate." |
| Stale assumptions | Load-bearing assumption >6 months without verification | "This assumption drives major decisions but hasn't been verified. Time to test." |
| Two-Way paralysis | Extensive analysis on reversible decisions | "This is a Two-Way Door. Reversible. Act at 70% confidence." |
| One-Way rushing | Quick decisions on irreversible commitments | "This is a One-Way Door. Slow down. Pre-mortem and assumption audit required." |
| KPI gap blindness | Action executing but no propagation check | "Layer 1 is fine, but is the effect propagating to the Driver metric?" |
