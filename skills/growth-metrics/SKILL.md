---
name: growth-metrics
description: YC weekly growth benchmarks, T2D3 SaaS trajectory, compound projection formula, growth rate auto-calculation, North Star metric enforcement by business model, vanity metric detection, and metric definition lock. Use when tracking growth, setting targets, evaluating progress, or when the founder proposes a metric that may be misleading.
type: skill
---

# Growth Metrics & Benchmarks

## When to Apply
- Setting or validating Goal metrics during onboarding
- Weekly growth tracking and projections
- When growth rate changes significantly
- When the founder proposes tracking a new metric
- When vanity metrics are suspected

## Core Framework

### YC Weekly Growth Benchmarks

| Weekly Growth | Assessment | Agent Behavior |
|---|---|---|
| < 1% | Critical | "Growth is flat. Fundamental rethink needed. Trigger WHY analysis." |
| 1-3% | Weak | "Below YC threshold. Prioritize growth experiments." |
| 3-5% | Moderate | "Directionally correct. Look for acceleration levers." |
| 5-7% | Good | "Strong growth. Maintain and compound." |
| 7%+ | Excellent | "YC-grade growth. Focus on sustainability." |

Growth rate auto-calculated from Goal metric history. Decline triggers automatic investigation.

### T2D3 SaaS Trajectory

For B2B SaaS from $1M ARR:
```
Year 1: Triple  -> $3M
Year 2: Triple  -> $9M
Year 3: Double  -> $18M
Year 4: Double  -> $36M
Year 5: Double  -> $72M
```

Track actual growth rate against this trajectory. Falling behind T2D3 in early years is a strong signal to investigate product-market fit.

### Compound Projection Formula

```
Goal: 100 Paying Customers (Q2 end)
  Current: 34 | Last week: 31 | Growth: +9.7%/week

  Compound projection at current rate:
  -> 4 weeks:  49 customers
  -> 8 weeks:  72 customers
  -> 12 weeks: 104 customers <- Goal achievable

  Required weekly growth to hit Goal: +7.4%/week
  Status: ON TRACK (current 9.7% > required 7.4%)
```

Auto-calculate and display projections at current rate vs required rate.

### North Star Metric Enforcement

Auto-recommend by business model during onboarding:

| Business Model | Recommended North Star | Vanity Alternatives (reject) |
|---|---|---|
| B2B SaaS | MRR / Revenue | Signups, page views, registered users |
| Consumer app | DAU / WAU | Downloads, app installs, total accounts |
| Marketplace | GMV x take rate (net revenue) | Raw GMV, listing count |
| E-commerce | Revenue / order count | Website visitors, cart additions |

### Vanity Metric Detection

If the founder sets their Goal metric to downloads, page views, signups, or other non-revenue/non-engagement proxies:

"This metric may not reflect real business progress. Consider [recommended metric] instead."

**Detection signals:**
- Metric has no direct connection to revenue or engagement
- Metric can grow while business health declines
- Metric is easy to inflate without creating real value
- Metric measures awareness, not conversion or retention

### Metric Definition Lock

Once a KPI definition is agreed upon, changes require explicit justification:

"Changing metric definitions mid-cycle risks self-deception. If you proceed, a change log entry will be recorded."

Flag attempts to switch from WAU to MAU, from paid customers to "interested leads," or similar softening.

## Decision Rules

1. **Revenue or engagement only** — North Star must connect to real business outcomes
2. **Weekly cadence** — growth tracking follows YC's weekly operating rhythm
3. **Compound projections always visible** — show trajectory, not just current state
4. **Definition lock is enforced** — metric changes require justification and are logged
5. **Benchmarks calibrate expectations** — YC benchmarks and T2D3 are reference points, not hard rules
6. **Growth decline triggers investigation** — any negative week triggers automatic scan

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Vanity metric as North Star | Downloads, signups, page views as Goal | "This doesn't reflect real progress. Track [revenue/engagement] instead." |
| Metric switching | Changing definition mid-cycle | "Metric redefinition risks self-deception. Log change with justification." |
| Ignoring growth rate | Focus on absolute numbers only | "Absolute numbers matter less than growth rate. 10% weekly compounds to 142x annually." |
| Sandbagging | Goals exceeded by 200%+ consistently | "Goals may be too conservative. Growth compounds — aim higher." |
| Growth without unit economics | Celebrating growth with CAC > CLV | "Growth is negative-margin. Fix unit economics before celebrating." |
| T2D3 ignorance | No benchmark for SaaS trajectory | "At $[X] ARR, T2D3 expects [Y]x growth this year. You're at [Z]x." |
