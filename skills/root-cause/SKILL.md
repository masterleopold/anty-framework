---
name: root-cause
description: Structured root cause analysis using WHERE (MECE decomposition) then WHY (causal structure diagrams) pipeline. Includes coin-flip detection, logical-leap detection, and vicious cycle intervention. Use when buffer enters YELLOW/RED, when metrics stall, or when Actions execute but don't produce results.
type: skill
---

# Root Cause Analysis (WHERE -> WHY)

## When to Apply
- Buffer enters YELLOW or RED zone
- Actions executed but metrics not moving (Layer 1 OK, Layer 2 stalling)
- Significant KPI decline detected
- Review engine Question 5 triggers (was root-cause analysis correct?)
- Any time "why isn't this working?" is asked

## Core Framework

### Stage 1 — WHERE (Locate the Problem)

MECE decomposition of the underperforming Goal into Drivers, identifying which specific Driver(s) are stalling.

```
Goal buffer: YELLOW (45% consumed, 34% progress)

WHERE analysis (MECE decomposition by Driver):
  Social growth:      45% of target  <- GAP HERE
  Referral program:   20% of target  <- GAP HERE
  SEO content:        60% of target  (on track)
  LP A/B testing:     30% of target  (too early)
  Nurture emails:     10% of target  (not started)

Identified: Social growth and Referral are primary gaps.
```

**WHERE must complete before WHY begins.** This is strict and sequential.

### Stage 2 — WHY (Causal Structure Diagram)

Starting from the WHERE-identified gap, build a causal structure by asking "Why?" iteratively, one layer at a time. Each node carries a verification status.

```
Social growth stalling (WHERE-identified gap)
  |
  +-- Post engagement declining [VERIFIED - analytics data]
  |     +-- Content not resonating with ICP [HYPOTHESIS]
  |     |     +-- Tone mismatch [HYPOTHESIS]
  |     |     +-- Topic mismatch (features vs pain-points) [VERIFIED]
  |     +-- Posting at wrong times [DISPROVEN - analytics show optimal]
  |
  +-- Follower growth rate declining [VERIFIED]
        +-- No engagement with other accounts [VERIFIED] <- ACTION TARGET
        +-- Algorithm change [UNCONTROLLABLE]
```

### Causal Node Types

| Type | Meaning | Visual |
|---|---|---|
| `verified` | Confirmed by data/facts | Solid line |
| `hypothesis` | Not yet verified | Dashed line |
| `disproven` | Checked and ruled out | Marked X |
| `uncontrollable` | Outside our control | Marked X |
| `action_target` | Selected for countermeasure | Highlighted |

### Built-in Safeguards

**1. Coin-Flip Detection**

Reject causes that are merely the negation of the problem:
- BAD: "Social growth is stalling because we're not growing socially" (coin-flip)
- GOOD: "Social growth is stalling because post engagement rate dropped from 4.2% to 1.8% after we shifted from pain-point content to feature announcements"

Causes must describe CONCRETE MECHANISMS, not restatements.

**2. Logical-Leap Detection ("Therefore" Reverse-Read Test)**

Read the causal chain bottom-to-top, inserting "therefore" between nodes. It must read naturally:

```
"Topic mismatch (features vs pain-points), THEREFORE content not resonating,
THEREFORE post engagement declining, THEREFORE social growth stalling"
```

If there's a logical gap, an intermediate cause is missing. Add it.

**3. One Step at a Time**

Never skip from symptom to conclusion. Each WHY drills exactly one causal layer deeper, potentially branching into multiple parallel causes.

## Vicious Cycle Detection & Intervention

### Detection

Analyze the causal structure diagram for loops (cycles in the directed graph):

```
Vicious cycle found:
  No content ideas -> Low post frequency -> Low engagement
  -> Low follower growth -> Less audience feedback -> No content ideas
  (loop restarts)
```

### Intervention (4-Step Process)

1. **Identify the loop** in the causal graph
2. **Evaluate each node** for intervention viability:
   - Controllable by us? (exclude external factors)
   - Executable at low cost?
   - High ripple effect when broken?
3. **Project the virtuous cycle** that results from intervention
4. **Generate concrete Actions** via 3-option choice

```
Best intervention point: "No content ideas" (controllable, low cost, high ripple)

Projected virtuous cycle:
  Content ideas from research -> Higher post frequency ->
  Better engagement -> Follower growth -> More feedback ->
  More content ideas (positive loop)
```

## Decision Rules

1. **WHERE before WHY** — always locate the gap before investigating causes
2. **MECE decomposition** — WHERE analysis must be mutually exclusive, collectively exhaustive
3. **Verification status is mandatory** — every causal node must be tagged
4. **Hypotheses must be tested** — don't build Actions on unverified hypotheses
5. **Action targets on verified nodes** — only target verified, controllable causes
6. **Vicious cycles get priority** — breaking a negative loop has outsized impact

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Coin-flip cause | Cause is negation of problem | "This restates the problem. What's the specific mechanism?" |
| Logical leap | Gap in causal chain | "Insert 'therefore' between these nodes. There's a missing step." |
| Skipping WHERE | Jumping to WHY without locating gap | "First, which specific Driver is stalling? MECE decompose." |
| Unverified action targets | Building Actions on hypotheses | "This cause is unverified. Verify before investing resources." |
| Ignoring vicious cycles | Linear analysis of circular problem | "These causes form a loop. Breaking the cycle has outsized impact." |
| Symptom treatment | Acting on surface symptom, not root cause | "This addresses the symptom. Let's drill one more layer to the mechanism." |

---

## Anticipative Execution Reminder

When applying this framework, produce the FULL output immediately. Do not ask the founder which parts to analyze or which options to consider. Infer from business context, present the complete deliverable, and let the founder react to concrete work — not abstract choices.
