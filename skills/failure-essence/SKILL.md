---
name: failure-essence
description: 4 strategic failure patterns from Essence of Failure — dual-objective trap (conflict stress test), strategic ambiguity (operationalizability test), withdrawal decision protocol (pre-committed stop conditions, re-present biweekly), assumption provenance auditing (source, verification, load-bearing flag, sample size). Use when creating strategy, detecting organizational dysfunction, or when decisions seem stuck.
type: skill
---

# Strategic Failure Patterns (Essence of Failure)

## When to Apply
- Creating or reviewing Strategy Kernels
- When Goals have multiple competing objectives
- When strategy language is vague or ambiguous
- When a project should potentially be stopped
- When assumptions underlying strategy need validation

## Core Framework

### 1. Dual-Objective Trap Detection

When a Goal or Driver has two stated objectives, run a conflict stress test:

```
Goal: "Acquire 100 enterprise customers AND maintain 90% gross margin"

Conflict Stress Test:
  "Under what resource/timing constraints do these conflict?"
  -> Enterprise sales requires high-touch (high CAC)
  -> 90% margin limits sales investment
  -> Below $50K deal size, these are mutually exclusive

  "DUAL-OBJECTIVE CONFLICT detected. Under resource constraints,
   you cannot maximize both. Which is PRIMARY?"
  -> User designates primary; other becomes subordinate with floor.
```

**Applied to:** Goal creation, Driver creation, Strategy Kernel formulation. Any time two objectives appear in the same scope.

**Resolution:** One objective is PRIMARY (maximized). The other becomes SUBORDINATE with a minimum acceptable floor (not zero, just not maximized).

### 2. Strategic Ambiguity Detection

When Strategy Kernel or User Rules contain terms that could be interpreted divergently, test for operationalizability:

```
Guiding Policy: "Focus on high-value customers"

Ambiguity Test:
  "Could two people read 'high-value' and derive opposite actions?"
  Interpretation A: "Enterprise, $100K+ deals"
  Interpretation B: "High-NPS users who generate referrals"
  -> DIVERGENT INTERPRETATION detected.

  "Define 'high-value' operationally:
   - What metric defines it?
   - What threshold?
   - What would PROVE this strategy is working?
   - What would PROVE it is failing?"
```

**Applied to:** Guiding Policy terms, Driver titles, Action descriptions. Any abstract concept that drives resource allocation.

**The test:** Can two reasonable people read this and derive opposite actions? If yes, the term is dangerously ambiguous.

### 3. Withdrawal Decision Protocol

Every Goal, Driver, and major Action created with PRE-COMMITTED stop conditions — defined at launch, not retroactively. Prevents the structural inability to stop.

```
WITHDRAWAL PROTOCOL (defined at creation):
  Stop Condition 1 (Quantitative):
    <20 customers after 60% of timeline elapsed
  Stop Condition 2 (Qualitative):
    Retention curve declining to zero after 3 months
  Stop Condition 3 (Temporal):
    No positive growth for 6 consecutive weeks

  Authority: Founder (auto-presented by agent when triggered)
  Process: Present conditions + data + 3 options:
    [Continue with modifications] [Pivot to Plan B] [Stop entirely]

  Re-presentation: Every 2 weeks, regardless of performance
```

**Why pre-committed:** When conditions deteriorate, human judgment is compromised by:
- Sunk cost fallacy ("We've already invested so much")
- Loss aversion ("Stopping feels like losing")
- Status quo bias ("Maybe it'll turn around")
- Identity attachment ("This is my idea")

Pre-committed conditions remove these biases from the decision.

**Re-present biweekly:** Even when not triggered, show the withdrawal conditions regularly. This prevents "forgetting" the exit criteria and normalizes the concept of stopping.

### 4. Assumption Provenance Auditing

Every load-bearing assumption tracked with provenance:

```
Strategy Kernel Assumptions:

  Assumption: "TAM is $500M"
    Source: Founder estimate from Gartner 2024 report
    Verification: NOT independently verified
    Load-bearing: YES (determines hiring + fundraise target)
    Sample size: N/A (third-party estimate)

  Assumption: "CTOs are primary buyer persona"
    Source: First 5 customers were CTOs
    Verification: n=5, insufficient sample
    Load-bearing: YES (all outreach targeting CTOs)
    Sample size: 5
```

**Each assumption carries:**
- `source` — where it came from
- `verificationStatus` — verified / unverified / disproven
- `isLoadBearing` — whether major decisions depend on it
- `sampleSize` — if derived from data, how much data

**Self-deception cascade to prevent:**
Fabricated/unverified data -> Strategy built on it -> Irreversible commitment -> Discovery too late

**Agent flags:** "2 load-bearing assumptions are unverified. Recommend verification before scaling decisions."

**Periodic re-audit:** Flag when load-bearing assumptions become stale or when decisions have scaled beyond the evidence base.

## Decision Rules

1. **Dual objectives require explicit primary/subordinate** — never allow two objectives to compete silently
2. **Ambiguity test on all strategy language** — if two people could derive opposite actions, clarify
3. **Stop conditions at creation** — not retroactively when judgment is compromised
4. **Biweekly re-presentation** — keep exit criteria visible even when not triggered
5. **Load-bearing assumptions must be verified** — or explicitly flagged as unverified risks
6. **Sample size matters** — n=5 is not enough to bet the company on

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Dual-objective silence | Two competing objectives, no explicit primary | "These objectives conflict under constraints. Which is primary?" |
| Strategic ambiguity | Key terms undefined operationally | "Could two people derive opposite actions from this? Define operationally." |
| No stop conditions | Goal created without withdrawal protocol | "Define stop conditions now. Not when sunk costs compromise judgment." |
| Assumption inflation | n=5 treated as proven fact | "Based on sample of 5. Need n=20+ before building strategy on this." |
| Stale assumptions | Load-bearing assumption >6 months old | "This assumption drives major decisions but is stale. Re-verify." |
| Withdrawal avoidance | Stop conditions triggered but ignored | "Pre-committed conditions are met. Present the decision: continue, pivot, or stop." |
