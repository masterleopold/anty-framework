---
name: pipeline
description: Cash Machine 10-step B2B sales pipeline with 3 presets, verifiable checkpoints per step, trajectory logging, bottleneck detection with utilization formula, lead qualification gate (BANT 6-criteria), pipeline velocity and stall detection (2x threshold), two-tier probability scoring, BBS tracking, end-of-quarter syndrome detection. Use when managing sales pipeline, detecting bottlenecks, or forecasting revenue.
type: skill
---

# Sales Pipeline (Cash Machine)

## When to Apply
- Managing deal flow through the sales pipeline
- Detecting and resolving pipeline bottlenecks
- Revenue forecasting
- When deals stall or pipeline health degrades
- Onboarding pipeline configuration

## Core Framework

### 10-Step B2B Pipeline (Default)

| Step | Name | Completion Criteria |
|---|---|---|
| 1 | Prospect Identified | Prospect entered into system |
| 2 | Qualified | Confirmed: problem, budget, authority, timeline, fit, margin |
| 3 | Needs Assessed | Gathered information to understand specific needs |
| 4 | Needs Confirmed | Prospect agrees with our understanding |
| 5 | Overview Presented | Product overview delivered (no detailed pricing) |
| 6 | Proposal Submitted | Solution proposal + technical feasibility demonstrated |
| 7 | Demo/Trial | Customized demo or trial for specific conditions |
| 8 | Quote Submitted | Formal pricing presented upon request |
| 9 | Negotiation | Active negotiation on price/terms/timeline |
| 10 | Closed Won | Purchase order or contract signed |

### 3 Pipeline Presets

- **B2B SaaS (default):** Full 10-step pipeline above
- **B2C / PLG:** Simplified funnel: Visitor -> Signup -> Activation -> Conversion -> Retention
- **Enterprise / Complex Sales:** Extended with relationship mapping, multi-stakeholder tracking

### Verifiable Checkpoints

Each step has an objective verification criterion — no advancement on belief alone:

| Step | Verification | Method |
|---|---|---|
| 1 | Prospect exists in system | CRM record created (automated) |
| 2 | All BANT fields populated | Data completeness check (automated) |
| 3 | Needs document exists | File/note attached (automated) |
| 4 | Prospect confirmation received | Email/message logged (semi-automated) |
| 5 | Presentation delivered | Calendar event + follow-up sent (automated) |
| 6 | Proposal document sent | Email delivery confirmed (automated) |
| 7 | Demo/trial completed | Calendar event or trial account activated (automated) |
| 8 | Quote delivered | Email delivery + open tracking (automated) |
| 9 | Negotiation active | Reply/counter-proposal within 14 days (automated) |
| 10 | Contract signed | Signed document in system (automated) |

**Trajectory logging:** Full decision trajectory logged per deal — not just outcome, but WHY each approach was chosen. Correct outcomes from terrible processes are flagged.

### Bottleneck Detection

**Formula:** `utilization = actual_throughput / theoretical_capacity x 100%`

```
Step 2 (Qualification):    capacity 200/mo  actual 150  util: 75%
Step 7 (Demo/Trial):       capacity  30/mo  actual  27  util: 90% <- BOTTLENECK
Step 9 (Negotiation):      capacity  50/mo  actual  18  util: 36%
```

When any step exceeds 80% utilization: flag as emerging bottleneck.

At 90%+, apply TOC 5 Focusing Steps:
1. **IDENTIFY:** Demo is the constraint
2. **EXPLOIT:** Optimize scheduling, pre-qualify, batch similar demos, recorded demos for screening
3. **SUBORDINATE:** Reduce upstream lead gen to match demo capacity
4. **ELEVATE:** Increase capacity (hire, self-service trial)
5. **REPEAT:** Re-analyze for next bottleneck

### Lead Qualification Gate (BANT 6-Criteria)

Quality gate at marketing-sales handoff:

| Criteria | Check |
|---|---|
| **Problem** | Prospect has a problem our product solves |
| **Budget** | Budget allocated or likely |
| **Authority** | Decision-maker engaged or accessible |
| **Timeline** | Reasonable purchase timeframe |
| **Fit** | Product capability matches need |
| **Margin** | Achievable margin above threshold |

- Qualified -> Pipeline Step 2
- Unqualified -> Nurture sequence (NOT pipeline)
- When bottleneck is downstream: pumping more unqualified leads only lengthens queues

### Pipeline Velocity & Stall Detection

Track average days per step. Stall threshold: **2x average at current step.**

```
Stalled deals (>2x average):
  Acme Corp: stuck at Step 5 for 38 days (avg 8) <- STALLED
  BetaCo: stuck at Step 7 for 42 days (avg 19)   <- STALLED
```

Investigate stall cause, propose unblock Actions.

### Two-Tier Probability Scoring

| Component | Source | Example |
|---|---|---|
| Stage probability | Historical conversion at that step | Step 7: 65% |
| Deal-specific probability | Agent assessment of deal signals | 80% (high engagement) |
| Weighted forecast | value x stage% x deal% | $24K x 65% x 80% = $12.5K |

### BBS (Backlog-Bookings-Shipments) Tracking

```
Opening Pipeline:    $450K
+ New Qualified:     $120K
- Closed Won:        $85K
- Closed Lost:       $45K
- Disqualified:      $15K
= Closing Pipeline:  $425K

Pipeline-to-quota ratio: 3.2x (healthy > 3x)
```

### End-of-Quarter Syndrome Detection

Monitor monthly closing pattern within quarters:

```
Month 1: $45K (23%)  Month 2: $52K (27%)  Month 3: $98K (50%)
-> 50% concentrated in final month = END-OF-QUARTER SYNDROME
```

Risks: discount escalation, operations overload, backlog rollover.

Proposals: monthly targets, level pipeline flow, eliminate quarter-end discount authority.

## Decision Rules

1. **Verification before advancement** — no step completion without objective evidence
2. **Bottleneck at 80%+ utilization** — flag emerging constraints early
3. **Subordinate to constraint** — don't generate more leads than downstream can handle
4. **Stall at 2x average** — investigate immediately
5. **Pipeline-to-quota > 3x** — healthy pipeline coverage
6. **Monthly, not quarterly** — even flow prevents syndrome

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Advancement without verification | Steps marked complete on belief | "Verification checkpoint required. What's the objective evidence?" |
| Upstream flooding | Lead gen outpacing demo capacity | "Generating more leads than downstream can handle is waste." |
| Stalled deal ignored | Deal at 2x+ average dwell time | "This deal is stalled. Investigate and propose unblock action." |
| Quarter-end concentration | >40% of closes in final month | "End-of-quarter syndrome. Set monthly targets instead." |
| Low pipeline coverage | Pipeline-to-quota < 2x | "Pipeline drying up. Accelerate lead gen Driver." |

---

## Anticipative Execution Reminder

When applying this framework, produce the FULL output immediately. Do not ask the founder which parts to analyze or which options to consider. Infer from business context, present the complete deliverable, and let the founder react to concrete work — not abstract choices.
