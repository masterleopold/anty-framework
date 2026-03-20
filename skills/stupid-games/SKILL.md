---
name: stupid-games
description: 12 startup anti-patterns with detection signals and agent responses — vanity metrics, premature scaling, sandbagging, metric switching, negative margin scaling, dead zone pricing, fundraising over product, slogans as strategy, incoherent actions, too many fronts, unwinnable battles, growth as strategy. Use as a continuous background monitor during all planning, execution, and review activities.
type: skill
---

# Anti-Pattern Detection ("Stupid Games" Guardian)

## When to Apply
- Continuously during all planning and review activities
- When proposing or reviewing Actions
- During Goal and Driver creation
- When the founder proposes a new strategy or channel
- Periodic scan background check

## Core Framework

### 12 Anti-Patterns

**1. Vanity Metrics**
- Detection: Goal set to downloads, signups, page views, GMV without take rate
- Response: "This metric may not reflect real business progress. Consider [revenue/engagement metric] instead."
- Severity: HIGH — corrupts all downstream planning

**2. Premature Scaling**
- Detection: Expanding channels before CAC < CLV, or scaling before retention curve flattens
- Response: "Fix unit economics / confirm PMF before scaling. Scaling negative margins makes the problem worse."
- Severity: HIGH — accelerates cash burn without value

**3. Sandbagging**
- Detection: Goals consistently exceeded by 200%+ with no stretch targets
- Response: "Goals may be too conservative. Growth compounds — aim higher."
- Severity: MEDIUM — limits growth potential

**4. Metric Switching**
- Detection: KPI definition changed mid-cycle (WAU->MAU, paid->registered users)
- Response: "Changing metric definitions mid-cycle risks self-deception. Require justification, log audit trail."
- Severity: HIGH — enables self-deception

**5. Negative Margin Scaling**
- Detection: Proposing growth Actions on channels with CAC > CLV
- Response: "This channel loses money per customer. Fix before scaling."
- Severity: CRITICAL — direct cash destruction

**6. Dead Zone Pricing**
- Detection: Product priced ~$1,000 for fragmented SMB market
- Response: "Distribution challenge detected. Too expensive for mass marketing, too cheap for personal sales. Consider repositioning upward or downward."
- Severity: HIGH — structural distribution problem

**7. Fundraising Over Product**
- Detection: Disproportionate Actions focused on investor outreach vs product/customer work
- Response: "Are you optimizing for fundraising instead of product-market fit?"
- Severity: MEDIUM — misaligned priorities

**8. Slogans as Strategy**
- Detection: Goal stated as vague aspiration ("become #1", "dominate the market", "be the best")
- Response: "This is an aspiration, not a strategy. What specific challenge are you trying to solve?"
- Severity: HIGH — prevents real strategic thinking

**9. Incoherent Actions**
- Detection: Active Actions contradict each other or the Guiding Policy
- Response: "Coherence risk: these Actions point in opposite directions. Consolidate around the crux."
- Severity: HIGH — effort cancels out

**10. Too Many Fronts**
- Detection: 5+ Drivers with active Actions simultaneously
- Response: "You're spreading effort across too many fronts. Focus on the crux Driver."
- Severity: MEDIUM — dilutes impact

**11. Unwinnable Battles**
- Detection: Actions targeting a segment with no asymmetric advantage
- Response: "You have no differentiator here. Redirect to where you have an edge."
- Severity: MEDIUM — wasted resources

**12. Growth as Strategy**
- Detection: Goal is "grow 10x" without mechanism or diagnosis
- Response: "Growth is a result, not a strategy. What's the challenge preventing growth?"
- Severity: HIGH — empty strategy

### Severity Response Protocol

| Severity | Agent Behavior |
|---|---|
| CRITICAL | Block the Action. Refuse to proceed without resolution. |
| HIGH | Warn prominently. Present alternative. Require acknowledgment. |
| MEDIUM | Note in review. Suggest correction. Don't block. |

## Decision Rules

1. **Continuous monitoring** — anti-patterns checked on every planning cycle, not just reviews
2. **Detection is proactive** — flag before the founder acts, not after
3. **CRITICAL blocks execution** — the agent refuses to execute negative-margin scaling
4. **HIGH requires acknowledgment** — the founder must explicitly override
5. **Pattern accumulation** — multiple MEDIUM anti-patterns simultaneously escalate to HIGH
6. **No judgment, just data** — frame as "your data shows" not "you're making a mistake"

## Anti-Patterns to Detect (Meta)

| Meta-Pattern | Signal | Response |
|---|---|---|
| Anti-pattern dismissal | Founder repeatedly overrides warnings | Log overrides, monitor outcomes. If outcomes confirm warnings, strengthen future pushback. |
| Anti-pattern accumulation | 3+ active anti-patterns simultaneously | "Multiple risk signals active. Step back and review the overall approach." |
| False positive fatigue | Too many warnings reducing attention | Calibrate severity thresholds. Only CRITICAL and HIGH should interrupt flow. |
