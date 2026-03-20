---
name: unit-economics
description: Unit economics health monitoring — CLV vs CAC per channel, NDR monitoring (>100% healthy, <100% leaky, target 125%+), gross margin awareness (AI API costs as real COGS), premature scaling guard (block if CAC>CLV), channel health dashboard format. Use when evaluating channel profitability, monitoring revenue health, or before scaling any acquisition channel.
type: skill
---

# Unit Economics

## When to Apply
- Evaluating channel profitability
- Before scaling any acquisition channel
- When NDR or gross margin changes
- Quarterly unit economics review
- When the founder proposes increasing spend on a channel

## Core Framework

### CLV vs CAC Per Channel

Track unit economics per channel, not in aggregate:

```
Channel Health Dashboard:
  LinkedIn Outreach:
    CAC: $45 | CLV: $2,400 | Ratio: 53x | Verdict: EXCELLENT
    NDR: 125% | Trend: stable

  Paid Ads (Google):
    CAC: $180 | CLV: $800 | Ratio: 4.4x | Verdict: ACCEPTABLE
    NDR: 95% | Trend: slight shrinkage

  Cold Email:
    CAC: $320 | CLV: $600 | Ratio: 1.9x | Verdict: DANGER
    NDR: 80% | Trend: leaking
    -> "Cold email has marginal unit economics.
       Propose: pause, reallocate budget to LinkedIn."
```

**Ratio benchmarks:**
- < 1x: Losing money per customer (CRITICAL)
- 1-3x: Marginal, needs improvement
- 3-5x: Acceptable
- 5x+: Healthy, scale candidate
- 10x+: Excellent, aggressive scaling warranted

### NDR (Net Dollar Retention) Monitoring

NDR measures whether existing cohorts grow or shrink over time:

| NDR Range | Status | Action |
|---|---|---|
| >125% | Excellent | Cohorts growing fast. Strong expansion. Scale acquisition. |
| 100-125% | Healthy | Cohorts stable or growing. Normal operation. |
| 90-100% | Warning | Slight shrinkage. Investigate churn and downgrade causes. |
| <90% | Leaky bucket | Cohorts shrinking significantly. Fix retention before acquisition. |

**Target for early-stage B2B:** 125%+

NDR < 100% means you must continuously acquire new customers just to maintain revenue. The business is on a treadmill.

### Gross Margin Awareness

For AI-powered products, API costs are REAL COGS:

```
Revenue per customer: $49/mo
COGS breakdown:
  Claude API:           $8/mo   (16%)
  Infrastructure:       $3/mo   (6%)
  Third-party APIs:     $4/mo   (8%)
  Support allocation:   $2/mo   (4%)
  --------------------------------
  Total COGS:           $17/mo  (35%)
  Gross margin:         $32/mo  (65%)

  Viable threshold: >60% for SaaS
  Status: ACCEPTABLE (65%)
```

Warn if gross margin drops below viable thresholds:
- SaaS target: >70% (>60% minimum)
- Marketplace target: >50%
- If AI API costs push margin below threshold: "API costs are real COGS. Consider caching, model optimization, or pricing adjustment."

### Premature Scaling Guard

**Block recommendations to scale any channel with CAC > CLV.**

```
Founder: "Let's double our Google Ads budget"

Agent check:
  Google Ads CAC: $180 | CLV: $800 | Ratio: 4.4x
  -> PASS: ratio > 3x, scaling is justified

vs.

  Cold Email CAC: $320 | CLV: $600 | Ratio: 1.9x
  -> BLOCK: "Fix unit economics before scaling.
     Scaling negative or marginal margins makes the problem worse."
```

Premature scaling = accelerating losses. The agent must refuse to recommend it.

### Channel Health Dashboard Format

Standard format for periodic unit economics reporting:

```
CHANNEL HEALTH (Monthly Review)
=================================
Channel          CAC    CLV    Ratio  NDR    Verdict
LinkedIn         $45    $2.4K  53x    125%   SCALE
Content/SEO      $25    $1.8K  72x    118%   SCALE
Paid Ads         $180   $800   4.4x   95%    MONITOR
Cold Email       $320   $600   1.9x   80%    PAUSE
Referral         $15    $2.1K  140x   130%   SCALE

AGGREGATE
  Blended CAC: $85 | Blended CLV: $1.4K | Ratio: 16x
  Warning: aggregate masks unhealthy channels.
  Per-channel analysis is authoritative.
```

## Decision Rules

1. **Per-channel, not aggregate** — blended metrics mask problems
2. **CAC < CLV required for scaling** — no exceptions
3. **NDR < 100% = fix retention first** — acquisition on a leaky bucket is waste
4. **API costs are COGS** — not free, not overhead; real cost of goods sold
5. **Gross margin must be viable** — >60% for SaaS, >50% for marketplace
6. **Channel health reviewed monthly** — economics shift over time

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Scaling negative margins | CAC > CLV + proposal to increase spend | "Fix unit economics before scaling. Scaling losses makes them bigger." |
| Blended metric blindness | "Our overall CAC is fine" | "Per-channel analysis shows Cold Email at 1.9x. Aggregate masks this." |
| Ignoring API costs | Gross margin calculated without API costs | "AI API costs are real COGS. Include in margin calculation." |
| NDR ignorance | No NDR tracking | "Without NDR, you don't know if cohorts are growing or shrinking." |
| Treadmill business | NDR < 100% with heavy acquisition spend | "Cohorts are shrinking. You're acquiring to replace, not grow." |
| Premature channel expansion | Adding new channels before existing ones profitable | "Optimize current channels before adding new ones." |
