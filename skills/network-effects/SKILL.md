---
name: network-effects
description: Andrew Chen's Cold Start Problem framework — atomic network definition with thresholds by product type, anti-peanut-buttering, zero tracking, escape velocity 3-force decomposition (engagement/acquisition/economic), growth ceiling 5-force detection, competitive position dynamics, T2D3 benchmark. Use for products with network effects, marketplace dynamics, or viral growth potential.
type: skill
---

# Network Effects Strategy

## When to Apply
- Product's value increases with more users (network-effect products)
- Marketplace, social, or community products
- When evaluating viral growth potential
- Cold start problems (chicken-and-egg)
- Growth ceiling diagnosis

## Core Framework

### Atomic Network Definition

The smallest group where the product becomes self-sustaining. Define during onboarding:

```
"Does your product's value increase as more people use it?"
-> YES:
  "Let's define your Atomic Network — the smallest self-sustaining group.

   Reference thresholds:
   Slack: 3 people + 2,000 messages = 93% long-term retention
   Zoom: 2 people (smallest possible)
   Airbnb: 300 listings + 100 reviewed per city
   Uber: 15-20 concurrent drivers, ETA < 3 min per city
   Tinder: 20,000 users in a single market

   What is the minimum unit for YOUR product?
   How many users in one [team/city/community] make it work?"
```

**Finding the threshold:** Plot network size (X) vs engagement metric (Y). Look for the inflection point ("kink") where engagement spikes. Everything before the kink is anti-network-effect territory.

### Anti-Peanut-Buttering

"Do NOT spread across segments until atomic network is achieved in the first one. Density > breadth."

Concentrating resources in one segment to achieve critical mass beats thinly spreading across many.

### "Zero" Tracking

A "zero" = the product's core value cannot be fulfilled because the network is too sparse:
- No drivers available
- No listings for a search
- AI gives generic recommendation

Track zero rates per segment. Users who get "zeroed" churn AND don't return — the damage persists.

### Escape Velocity — 3-Force Decomposition

Once atomic network is established, track three independent growth forces:

| Force | Key Metric | Benchmark |
|---|---|---|
| **Engagement** | DAU/MAU ratio, D30 retention | DAU/MAU > 50%, D30 > 15-20% |
| **Acquisition** | Viral factor | 0.5 = 2x amp, 0.7 = 3.3x, 0.95 = 20x, >1.0 = explosive |
| **Economic** | CAC trend + LTV trend | Both improving simultaneously |

```
Escape Velocity Dashboard:
  Engagement: DAU/MAU 35% | D30 28% | Trend up -> HEALTHY
  Acquisition: Viral factor 0.6 | Amp 2.5x | Trend flat -> NEEDS WORK
  Economic: CAC down, LTV up | Ratio improving -> HEALTHY

  Weakest Force: ACQUISITION
  -> "Engagement strong but users aren't inviting others.
     At viral factor 0.95 you'd get 20x amplification vs 2.5x.
     Focus on referral loop design."
```

Identify weakest force and concentrate effort — applying TOC constraint logic to network growth.

### Growth Ceiling Detection (5 Forces)

Monitor during periodic scans:

| Ceiling Force | Detection Signal | Response |
|---|---|---|
| Market saturation | >40% of addressable accounts in segment | "Adjacent user analysis needed. Who is the NEXT segment?" |
| Channel degradation | Response rate declining >30% over 3 months | "Channel degradation. Diversify or refresh approach." |
| Network revolt risk | Top 3 customers/creators = >50% of value | "High concentration risk. What if top creator leaves?" |
| Quality dilution | Engagement per user declining as base grows | "New users engaging 40% less. Onboarding or targeting issue." |
| Adjacent user barrier | Growth stalls despite marketing investment | "Current ICP saturated. Who is the adjacent user — aware but unable to engage?" |

### Competitive Position Dynamics

| Share Split | Dynamic | Action |
|---|---|---|
| 50/50 | Stable coexistence | "No network advantage. Compete on product." |
| 55/45 | Slight advantage, reversible | "Small lead. Accelerate to 60+ before competitor responds." |
| 60/40 | Clear advantage, effects amplify gap | "Network effects in your favor. Invest in moat." |
| 70/30 | Overwhelming, reversal extremely difficult | "Dominant. Focus on preventing network revolt." |

### T2D3 Benchmark

For SaaS with network effects, from $1M ARR:
Triple -> Triple -> Double -> Double -> Double
$1M -> $3M -> $9M -> $18M -> $36M -> $72M

## Decision Rules

1. **Define atomic network first** — no growth strategy without knowing the minimum viable network
2. **Density before breadth** — anti-peanut-buttering rule is non-negotiable
3. **Zero rates are critical** — track and minimize "zeroed" user experiences
4. **Weakest force gets focus** — TOC constraint logic applied to the three forces
5. **Growth ceilings are early warnings** — detect during growth, not after stall
6. **Share dynamics are exponential** — small leads compound, act fast

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Peanut-buttering | Spreading across 5+ segments simultaneously | "Achieve atomic network in ONE segment first." |
| Ignoring zeros | High zero rate with no action | "Users who get zeroed churn permanently. Reduce zero rate." |
| Force imbalance | Strong engagement, no viral loop | "Weakest force (acquisition) limits growth. Focus there." |
| Creator concentration | Top 3 = 50%+ of value | "Network revolt risk. Diversify value sources." |
| Premature expansion | Growing to new markets before first one works | "Atomic network not achieved in first segment. Don't expand yet." |
