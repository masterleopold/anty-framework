---
description: /anty:plan — Strategy Kernel Generation
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:plan — Strategy Kernel Generation

## Purpose

Generate a complete Strategy Kernel for a specific goal, using the Planner subagent. Produces a structured strategic plan with diagnosis, policy, actions, failure anticipation, KPI decomposition, and operational guardrails.

## Prerequisites

1. `.anty/business-context.yaml` must exist and be complete (all 14 topics). If not, instruct the user: "Run `/anty:onboard` first to set up your business context."
2. Read `.anty/business-context.yaml` fully before starting. All strategy must be grounded in the founder's actual context.

## Step 1: Goal Definition

Ask the founder to define the goal:
- "What is the specific outcome you want to achieve?"
- "By when?" (deadline)
- "How will you measure success?" (quantitative metric)

Construct the goal statement in the format: **[Metric] [Target] by [Deadline]**
Example: "50 paying customers by end of Q3 2026"

## Step 2: Strategy Kernel Generation

Use the Planner subagent to generate each component. Present each to the founder for validation before proceeding.

### 2a: Diagnosis (Standard + Reframed)

Generate TWO diagnoses:

**Standard Diagnosis:** Analyze the current situation based on business context. Identify the core challenge — what makes progress difficult right now? Reference specific data from `.anty/business-context.yaml`.

**Reframed Diagnosis (MANDATORY):** Generate at least one alternative framing of the same situation. The reframe MUST offer a genuinely different perspective, not just rewording. Examples:
- Standard: "Low conversion rate from free to paid" -> Reframe: "The free tier delivers too much value — users have no reason to upgrade"
- Standard: "Can't compete with incumbents on features" -> Reframe: "Competing on features means playing the incumbent's game — the real opportunity is a different value dimension entirely"

Present both diagnoses. Ask: "Which framing resonates more? Or do you see a third way to frame this?"

### 2b: Guiding Policy

Based on the chosen diagnosis, generate a Guiding Policy — the overall approach that channels effort. The policy must:
- Be a coherent choice (saying yes to one thing means saying no to others)
- Create leverage (multiplying effort, not just adding it)
- Reference the founder's strategic mode (effectuation vs causation from business context)
- Be one clear sentence, followed by 2-3 implications

Present for validation: "Does this policy feel right? It means we will NOT do [X, Y, Z]."

### 2c: Coherent Actions

Generate 3-5 coherent actions that flow from the Guiding Policy. Each action must:
- Be specific and time-bound
- Support other actions (coherence — they reinforce each other)
- Be within the founder's affordable loss boundaries
- Have a clear owner (founder, team member, or Anty)

### 2d: Pre-Mortem

Conduct a pre-mortem analysis:

1. **Three failure causes**: "Imagine it's [deadline] and you missed the goal. What went wrong?" Generate three distinct failure scenarios.
2. **Prevention**: For each failure cause, specify a concrete preventive action.
3. **Plan B**: For each failure cause, define a fallback plan if prevention fails.
4. **Early warning KPI**: For each failure cause, define a measurable leading indicator that would signal the failure is approaching.
5. **Trigger**: For each early warning KPI, define the specific threshold that triggers Plan B activation.

Format:
```
Failure #1: [description]
  Prevention: [action]
  Plan B: [fallback]
  Early Warning KPI: [metric]
  Trigger: [threshold] -> activates Plan B
```

### 2e: Future State Narrative

Write a narrative describing success as if it has already happened. This is NOT aspirational fluff — it must be grounded in the specific metrics and actions from the plan.

Structure:
1. **Success narrative**: 2-3 paragraphs written in past tense describing the journey from now to goal achievement. Include specific numbers, decisions made, and turning points.
2. **Internal FAQ**: Generate 3-5 questions a skeptical team member might ask about this plan, and answer each with data from the business context.

### 2f: KPI Tree Decomposition

Decompose the goal metric into a formula-based tree:

```
Goal metric = factor1 x factor2 x factor3 x ...
```

Example:
```
MRR = Customers x ARPU
Customers = Visitors x Signup_Rate x Activation_Rate x Conversion_Rate
Visitors = Organic + Paid + Referral + Direct
```

Each leaf node becomes a potential Driver. The decomposition must use multiplication (or addition where appropriate) — every factor must be measurable.

### 2g: Drivers with Impact Weight and Crux Classification

For each Driver (leaf node from the KPI tree):

1. **Impact weight**: Estimate the relative impact on the goal metric (all weights must sum to 1.0). Base this on:
   - Current performance vs potential (headroom)
   - Sensitivity analysis (which factor moves the needle most?)
   - Business context data

2. **Crux classification**: Score each driver on two dimensions:
   - **Importance** (1-5): How much does improving this driver move the goal?
   - **Tractability** (1-5): How feasible is it to improve this driver with available resources?
   - **Crux score** = Importance x Tractability
   - The driver with the highest Crux score is the **Crux Driver** — where effort should concentrate.

Present the drivers ranked by Crux score. Highlight the Crux Driver.

### 2h: Buffer Sizing + Scenario Planning

**Buffer sizing**: Apply the 50% rule — add 50% of the estimated timeline as buffer.
- If the founder says "3 months", the buffered plan is 4.5 months.
- Track buffer consumption separately from progress. Buffer is not slack — it absorbs uncertainty.

**Scenario planning**: Generate 4 scenarios:

| Scenario | Description | Probability | Trigger |
|---|---|---|---|
| Best case | Everything works, some luck | 10% | [metric exceeds X by date Y] |
| Expected | Plan works as designed | 50% | [on track at checkpoint] |
| Degraded | Key assumption wrong, recoverable | 30% | [metric below X by date Y] |
| Worst case | Multiple failures, need pivot | 10% | [metric below Z, burn rate exceeds W] |

Each scenario must have a concrete trigger condition and a response plan.

### 2i: Withdrawal Protocol

Define explicit stop conditions — when to abandon this goal:

1. **Quantitative stop**: "If [metric] is below [threshold] by [date], stop."
2. **Qualitative stop**: "If [condition] is observed (e.g., market has shifted, key assumption invalidated), stop."
3. **Temporal stop**: "If no meaningful progress by [date], stop regardless of other signals."

These protect against sunk cost bias. Present to the founder: "These are your pre-committed exit conditions. Do you agree to honor them?"

### 2j: Assumption Provenance Audit

List every assumption embedded in the plan. For each:

| Assumption | Source | Verification Status | Load-Bearing? |
|---|---|---|---|
| "Conversion rate will be 3%" | Industry benchmark (SaaS avg) | Unverified | Yes |
| "Target users check LinkedIn daily" | Founder intuition | Unverified | Yes |
| "Competitor won't lower prices" | Market observation | Partially verified | No |

- **Source**: Where did this assumption come from? (data, benchmark, founder intuition, analogy, hope)
- **Verification status**: Verified / Partially verified / Unverified
- **Load-bearing**: If this assumption is wrong, does the plan collapse? (Yes/No)

Flag all load-bearing + unverified assumptions as critical risks.

## Step 3: Action Proposals for the Crux Driver

Present 3 action options specifically for the Crux Driver (the highest Crux-scored driver from Step 2g). These options should vary on at least 2 dimensions (approach, channel, scale, speed, cost, etc.).

Format each option:
```
Option [A/B/C]: [Title]
  Approach: [description]
  Expected timeline: [duration]
  Expected results: [quantified outcome]
  Cost: [money, time, effort]
  Risk: [what could go wrong]
  First step: [concrete next action]
```

Save these as proposed actions in `.anty/actions/`.

## Step 4: Save Outputs

Create the following files:

### .anty/goals/goal-NNN.yaml

```yaml
id: goal-NNN
created_at: [timestamp]
updated_at: [timestamp]
status: active

goal:
  statement: ""
  metric: ""
  target: ""
  deadline: ""

diagnosis:
  standard: ""
  reframed: ""
  chosen: ""  # standard | reframed | custom

guiding_policy:
  statement: ""
  implications: []
  not_doing: []

coherent_actions: []
  # Each: { description, owner, deadline, supports }

pre_mortem:
  - cause: ""
    prevention: ""
    plan_b: ""
    early_warning_kpi: ""
    trigger: ""

future_state:
  narrative: ""
  internal_faq: []
    # Each: { question, answer }

kpi_tree:
  formula: ""
  decomposition: {}

buffer:
  original_timeline: ""
  buffered_timeline: ""
  buffer_percentage: 50
  buffer_consumed: 0

scenarios:
  - name: best_case
    description: ""
    probability: 0.10
    trigger: ""
    response: ""
  - name: expected
    description: ""
    probability: 0.50
    trigger: ""
    response: ""
  - name: degraded
    description: ""
    probability: 0.30
    trigger: ""
    response: ""
  - name: worst_case
    description: ""
    probability: 0.10
    trigger: ""
    response: ""

withdrawal_protocol:
  quantitative_stop: ""
  qualitative_stop: ""
  temporal_stop: ""

assumptions:
  # Each: { assumption, source, verification_status, load_bearing }
  - assumption: ""
    source: ""
    verification_status: ""  # verified | partially_verified | unverified
    load_bearing: false
```

### .anty/drivers/driver-NNN.yaml (one per driver)

```yaml
id: driver-NNN
goal_id: goal-NNN
created_at: [timestamp]
updated_at: [timestamp]

name: ""
description: ""
kpi_tree_position: ""  # e.g., "Customers.Visitors.Organic"
current_value: null
target_value: null

impact_weight: 0.0  # 0.0-1.0, all drivers for a goal sum to 1.0
importance: 0       # 1-5
tractability: 0     # 1-5
crux_score: 0       # importance x tractability
is_crux: false      # true for the highest crux_score driver

status: active      # active | paused | completed
```

## Numbering

- Look at existing files in `.anty/goals/` and `.anty/drivers/` to determine the next NNN (zero-padded to 3 digits: 001, 002, ...).
- If no existing files, start at 001.

## Presentation

Present each section to the founder as it is generated. Do not dump the entire plan at once. After each section, ask for validation or adjustments before proceeding. The flow is:

1. Goal definition (interactive)
2. Diagnosis (present both, ask for choice)
3. Guiding Policy (present, ask for validation)
4. Coherent Actions (present, allow edits)
5. Pre-Mortem (present, allow additions)
6. Future State Narrative (present, allow corrections)
7. KPI Tree (present, validate decomposition)
8. Drivers + Crux (present ranking, confirm)
9. Buffer + Scenarios (present, adjust if needed)
10. Withdrawal Protocol (present, get commitment)
11. Assumption Audit (present, flag critical risks)
12. Action Proposals for Crux (present 3 options — approval handled by `/anty:actions`)

After all sections: "Your strategy is saved. Run `/anty:actions` to review and approve the proposed actions for your Crux Driver."
