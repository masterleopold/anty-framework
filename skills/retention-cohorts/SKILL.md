---
name: retention-cohorts
description: Cohort retention analysis — triangle chart construction, curve shape analysis for PMF detection (flattening/declining/rising), layer cake chart, PMF-driven priority shifting, 5 retention anti-patterns, 4 improvement levers, three definitions setup. Use when measuring PMF, analyzing user retention, or deciding whether to scale or improve product.
type: skill
---

# Retention & Cohort Analysis

## When to Apply
- Measuring product-market fit
- Deciding whether to invest in growth vs product improvement
- When the founder asks "do we have PMF?"
- When retention data is available from integrations
- Quarterly PMF reassessment

## Core Framework

### Three Definitions (Set During Onboarding)

Before any retention measurement, guide the founder to define:

1. **Cohort grouping** — How new users are grouped
   - Weekly: daily-use products
   - Monthly: utility products
   - Quarterly: infrequent-use products (travel, tax)

2. **Active action** — What counts as "active." Must reflect genuine value delivery.
   - Ask: "Imagine watching a customer use your product. What moment tells you they're genuinely getting value?"
   - B2B SaaS: "completed a core workflow"
   - Consumer: "engaged with 3+ pieces of content"
   - Marketplace: "completed a transaction"

3. **Time granularity** — How often users should ideally use the product. Cross-check against chosen action for consistency.

### Triangle Chart (Cohort Retention Table)

```
         Week 0  Week 1  Week 2  Week 3  Week 4  Week 5
Jan      100%    62%     45%     38%     35%     34%   <- flattening
Feb      100%    58%     41%     33%     31%     ...
Mar      100%    65%     50%     42%     ...
Apr      100%    71%     55%     ...                    <- improving
```

### Curve Shape Analysis (Most Important Insight)

Analyze SHAPE, not absolute numbers:

| Curve Shape | PMF Signal | Agent Action |
|---|---|---|
| **Flattening** (stabilizes at any level) | PMF detected | Shift to growth Drivers. "Retention flattening at ~34%. Even Google Photos flattened at 20-40%." |
| **Declining to zero** (no stabilization) | No PMF | Shift to product/activation Drivers. Trigger WHY analysis. "Users not sticking. Understand why before investing in growth." |
| **Rising** (curves go up over time) | Strong PMF + network effects | Propose aggressive scaling. "Retention increasing — extremely strong signal." |
| **Newer cohorts better** | Product improving | "Product improvements working — newer cohorts retain better." |
| **Newer cohorts worse** | Product or acquisition degrading | "Warning: newer cohorts retain worse. Investigate product quality or acquisition quality." |

### Layer Cake Chart

Cohorts stacked over absolute calendar time. Shows whether active user base grows from retained cohorts (healthy) or just cycles through new users (treadmill).

### PMF-Driven Priority Shifting

| Situation | Agent Focus |
|---|---|
| No PMF + Vitamin product | Repositioning and pain discovery before growth |
| No PMF + Painkiller product | Product improvement, onboarding, user research |
| PMF signal but no "Locally Famous" group | Deepen penetration in one specific group |
| PMF + Locally Famous confirmed | Shift to scaling: growth Drivers get higher impact_weight |

This directly feeds into the KPI tree's dynamic impact_weight system.

### 5 Retention Anti-Patterns

| Anti-Pattern | Detection | Response |
|---|---|---|
| Time period too large | Quarterly cohorts for daily-use product | "Your product is daily-use. Weekly cohorts give more honest signal." |
| Action too easy | "Opened app" or "visited site" | "Doesn't reflect real value. Consider [specific recommendation]." |
| Payment-only tracking | Only tracking subscription status | "Users stop using before they stop paying. Add usage-based action metric." |
| Cherry-picking | Citing single favorable retention number | "Which period? Show the complete triangle chart." |
| Curve misinterpretation | High initial retention that declines | "50% that declines to zero is worse than 20% that flattens. Shape > number." |

### 4 Improvement Levers

When retention curves don't flatten:

1. **Product improvement** — New use cases, speed, simpler flows
2. **Better user acquisition** — Targeting users who are a better fit. "Paid cohorts retain worse than organic. Consider shifting budget."
3. **Onboarding/activation** — Help users reach "aha moment" faster. Often cheapest lever. "What was the user doing yesterday? What should they do differently today?"
4. **Network effects** — If applicable, user-to-user value. "Each new user could make your product better for existing users."

## Decision Rules

1. **Three definitions before measurement** — no retention analysis without explicit cohort, action, and time definitions
2. **Shape over numbers** — 20% that flattens beats 50% that declines
3. **PMF drives priorities** — no scaling without retention flattening
4. **Newer vs older cohorts** — compare across time to detect product trajectory
5. **Layer cake for growth truth** — reveals treadmill vs genuine growth
6. **Cheapest lever first** — onboarding improvement often has highest ROI

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Scaling before PMF | Growing acquisition with declining retention | "Retention curve hasn't flattened. Fix retention before scaling." |
| Wrong granularity | Mismatched time period and product usage | "Adjust cohort grouping to match actual product usage frequency." |
| Vanity retention | Tracking logins instead of value delivery | "Redefine 'active' to reflect genuine value delivery." |
| Single-number fixation | "Our retention is 40%" | "40% when? Show the full curve over time." |
