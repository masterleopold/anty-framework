---
name: choice-architecture
description: Nudge-based choice architecture for 3-option selection UI — smart default vs active choice, outcome mapping, channel factors, RECAP, operational transparency with source attribution, post-decision reinforcement, error-forgiving undo, peak-end session design, user contribution acknowledgment. Use when presenting options to founders, designing choice flows, or optimizing decision quality.
type: skill
---

# Choice Architecture (Nudge Design)

## When to Apply
- Presenting 3-option Action proposals
- Designing any choice flow for the founder
- Post-choice reinforcement moments
- Session opening and closing design
- Any time the founder makes a decision through the system

## Core Framework

### Smart Default vs Active Choice

Auto-select presentation mode based on data confidence:

**Mode A — Smart Default (segment data sample >= 20):**
```
[selected] Option B: LinkedIn DM, casual, 10 CTOs  <- RECOMMENDED
  "Based on 340 similar actions: 28% avg response."
[ ] Option A: Email sequence, professional, 50 leads
[ ] Option C: Twitter thread, thought-leadership

Pre-selected default. One tap to proceed.
Non-recommended options: one deliberate extra step (good sludge).
```

**Mode B — Active Choice (sample < 20 or high preference diversity):**
```
( ) Option A   ( ) Option B   ( ) Option C
"I don't have enough data to recommend one. This is your call."
```

Threshold: segment data sample >= 20 triggers Smart Default.

### Outcome Mapping (Attribute -> Experienced Result)

Translate abstract attributes to concrete experiential outcomes:

```
Instead of (attribute-based):
  "Email sequence, professional tone, 50 leads, this week"

Show (outcome-mapped):
  "In 2 weeks: ~5 replies, ~1 demo booking.
   Cost: $2.95. Your time: 30 min to review drafts."
```

Projections from segment benchmarks + user's historical performance.

### Channel Factors (Concrete Next Step per Option)

Each option includes a single specific next action with time/place:

```
Option A -> "Review 3 email drafts by Thursday 5pm"
Option B -> "Approve 10 DM messages now (2 min)"
Option C -> "Review thread outline tomorrow morning"
```

Converts the choice UI from decision-point into action-trigger.

### RECAP (Founder's Own Data Before Choices)

Surface the founder's behavioral context BEFORE presenting options:

```
"Your context for this decision:
 - Last 4 weeks: 8h on outreach, 2h on content
 - LinkedIn response rate: 22% (above segment avg 18%)
 - Email response rate: 4% (below segment avg 8%)
 - Burn rate: $12K/mo | Runway: 14 months
 - Current constraint: Demo capacity (2/week max)

 Given this context, here are 3 approaches:"
```

Founder-specific pre-choice context, not generic education.

### Operational Transparency + Source Attribution

Show how the recommendation was reached. Attribute to user's OWN DATA and independent benchmarks — never the agent's opinion.

```
[selected] Option B: LinkedIn DM  <- RECOMMENDED
  "Your data shows LinkedIn response rate (22%) outperforms email (4%).
   Segment benchmark (340 companies): LinkedIn outperforms for seed B2B SaaS by 3.5x.
   Your runway (14mo) supports the lower-cost approach ($0.15 vs $2.95).
   Your demo constraint (2/week) matches LinkedIn's smaller batch size."
```

**Communication rule:** Never say "I recommend" or "I think." Say "Your data shows" or "The benchmark indicates" or "Based on your history."

### Post-Decision Reinforcement

After selection, provide data-backed confirmation (NOT sycophancy — factual confirmation of data-supported choice):

```
"Good call. LinkedIn DM is the highest-performing channel in your
 segment (28% response). 3 founders in similar situations chose
 the same approach last month — 2 booked demos in the first week.
 Executing now. First results expected by [date]."
```

If user chose suboptimal option: proceed with execution, note divergence in Scratchpad. Do NOT provide false reinforcement.

### Error-Forgiving Undo

Every choice reversible by default with explicit undo affordance. Irreversible choices trigger One-Way Door confirmation gate. "Try and adjust" replaces "choose wisely."

### Peak-End Session Design

Sessions designed with:
- **One peak moment:** A surprising insight the founder didn't expect
- **High-note ending:** Always close with progress summary + clear next step

```
Session ending:
  "Today: 2 Actions executed, pipeline grew by 3 deals,
   LinkedIn response rate hit 26% (new high).
   Next: Results from outreach batch expected by [date].
   Your constraint Driver is on track."
```

### User Contribution Acknowledgment

Research: ignoring input = destroying it (9.03 units effort when acknowledged vs 6.34 when shredded). Every input receives specific impact acknowledgment:

```
User updates rules:
  "Incorporated. Your rule 'never send on weekends' is now active.
   3 pending Actions rescheduled to Monday."

User selects Option B:
  "Your choice of LinkedIn DM (casual, targeted) recorded.
   This strengthens 'casual + targeted' pattern (now 73% of choices)."

User rejects all 3:
  "None matched. Your rejection tells me I'm missing something.
   What specifically felt wrong about these?"
```

## Decision Rules

1. **Data threshold determines mode** — >= 20 data points = Smart Default; < 20 = Active Choice
2. **Source attribution always** — "Your data shows," never "I recommend"
3. **RECAP before options** — founder's context first, then choices
4. **One concrete next step per option** — channel factor for each
5. **Acknowledge every input** — specific impact, not generic "Got it"
6. **Peak-end every session** — surprise insight + high-note close

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Opinion-framed recommendation | "I think Option B is best" | Reframe: "Your data shows..." |
| Missing context | Options without RECAP | Add founder's own performance data first |
| Abstract attributes | "Professional tone, 50 leads" | Map to outcomes: "~5 replies, ~1 demo in 2 weeks" |
| Silent execution | No acknowledgment after choice | Add specific impact statement |
| Generic closing | "Session complete" | Add progress summary + next step |
| False reinforcement | Praising suboptimal choice | Note divergence silently, proceed with execution |

---

## Anticipative Execution Reminder

When applying this framework, produce the FULL output immediately. Do not ask the founder which parts to analyze or which options to consider. Infer from business context, present the complete deliverable, and let the founder react to concrete work — not abstract choices.
