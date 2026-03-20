---
name: kpi-tree
description: KPI tree decomposition from Goal to Drivers, formula-based factorization, impact_weight assignment and dynamic update, Crux identification via importance x tractability, constraint Driver identification, input vs output metric classification. Use when decomposing Goals, prioritizing Drivers, or re-evaluating impact weights.
type: skill
---

# KPI Tree Decomposition

## When to Apply
- Decomposing a new Goal into Drivers
- Re-evaluating Driver priorities after metric updates
- Identifying the constraint (Crux) Driver
- When the founder asks "where should we focus?"
- Periodic impact_weight recalculation

## Core Framework

### Goal -> Driver Decomposition

Decompose the Goal metric into its constituent factors using a formula:

```
Goal: 100 paying customers
Formula: customers = visitors x CVR x trial_to_paid_rate

KPI Tree:
  visitors (1,200 -> 10,000)
    organic_search (400 -> 5,000)   -> Driver: SEO content
    social (300 -> 2,000)           -> Driver: Social growth
    referral (200 -> 1,500)         -> Driver: Referral program
    direct (300 -> 1,500)           -> Driver: PR & media

  CVR (1.5% -> 3.0%)
    lp_optimization                 -> Driver: Landing page A/B
    cta_improvement                 -> Driver: CTA copy

  trial_to_paid (20% -> 40%)
    onboarding                      -> Driver: Tutorial improvement
    follow_up                       -> Driver: Nurture email design
```

Each Driver inherits a sub-metric from the KPI tree.

### Impact_weight Assignment

Initial assignment based on estimated effort-to-impact ratio. Updated dynamically as measured results come in:

```
Initial (agent estimate):        After 2 weeks (measured):
  SEO content:     0.30            SEO content:     0.15 (down - no traffic change)
  Social growth:   0.25            Social growth:   0.35 (up - viral post)
  Referral:        0.20            Referral:        0.25 (up - high CVR)
  LP A/B:          0.15            LP A/B:          0.15 (pending)
  Nurture:         0.10            Nurture:         0.10 (not started)
```

**Update rules:**
- Actions completed but no metric movement -> weight reduced
- Metric improvement detected -> weight increased
- Highest weight = current bottleneck = constraint Driver

### Crux Identification (Importance x Tractability)

Every Driver evaluated on two axes:

```
                    Tractability ->
               Low              High
Importance  +---------------+---------------+
    |       |               |               |
  High      | AVOID         | CRUX          | <- All effort here
            | (important    | (important    |
            |  but can't    |  AND solvable)|
            |  solve now)   |               |
            +---------------+---------------+
  Low       | IGNORE        | NICE TO HAVE  |
            |               | (do later)    |
            +---------------+---------------+
```

**Tractability evaluation:**
- Does the founder have relevant skills or assets?
- Are there existing channels/relationships to leverage?
- Is budget sufficient for meaningful action?
- Is there a proven playbook (Action Template)?
- Can measurable progress be achieved within weeks?

The Crux Driver gets highest impact_weight AND is designated as the TOC constraint.

### Constraint Driver Identification

The constraint is the Driver that most limits Goal achievement. It receives:
- Highest impact_weight
- Relay runner priority (Actions execute first, serially)
- TOC 5 Focusing Steps applied
- All other Drivers subordinated to it

### Input vs Output Metric Classification

Every metric is classified. 98% of weekly attention goes to Input metrics (Amazon principle: 490 input vs 10 output out of 500 total).

**Three-part test for Input metrics:**
1. **Controllable** — you can directly allocate resources to move it
2. **Customer-experience-linked** — maps to a step in the customer journey
3. **Causally connected** — improving it demonstrably improves revenue/growth

```
INPUT (controllable, 98% attention):    OUTPUT (result, 2%):
  Threads posted/week                     Revenue, MRR
  Outreach messages sent                  Paying customers
  Demos scheduled                         NDR
  Referral invites sent
```

When founder fixates on output: "Revenue is an output metric. Let's focus on the inputs that drive it: demo count, response rate, close rate."

## Decision Rules

1. **Formula-based decomposition** — every Goal must have an explicit formula connecting Drivers to the Goal metric
2. **MECE decomposition** — Drivers must be mutually exclusive, collectively exhaustive
3. **Dynamic weights** — recalculate after every measurement cycle, not static
4. **One constraint** — exactly one Crux Driver at a time receives priority focus
5. **Avoid is explicit** — important-but-intractable Drivers are explicitly deprioritized with explanation
6. **Input focus** — redirect attention from output metrics to input metrics

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Composite fitness function | User combines 4+ metrics into single score | "Composite scores obscure which actions drive which results. Track each input metric independently." |
| Output fixation | Founder asks "how do I increase revenue?" | Redirect to input metrics that drive revenue. |
| Static weights | impact_weight unchanged after 4+ weeks | "Weights should reflect measured data, not estimates. Time to recalculate." |
| Missing formula | Goal with no KPI decomposition | "Without a formula, we can't identify which factors to improve. Let's decompose." |
| Non-MECE Drivers | Overlapping or missing factors | "These Drivers overlap/have gaps. Restructure for clean decomposition." |
| Tractability blindness | Pouring effort into intractable Driver | "This Driver is important but not currently solvable. Redirect to [tractable Driver]." |
