---
description: /anty:actions — 3-Option Choice Approval with Nudge Architecture
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:actions — 3-Option Choice Approval with Nudge Architecture

## Purpose

Present pending action proposals as structured 3-option choices, using behavioral nudge architecture to support high-quality decisions. Record choices to build the founder's preference profile over time.

## Prerequisites

1. `.anty/business-context.yaml` must exist. If not: "Run `/anty:onboard` first."
2. `.anty/actions/` directory must contain at least one action file with `status: proposed`. If no pending actions: "No pending actions to review. Run `/anty:plan` to generate strategy and action proposals."

## Step 1: Load Context

Read the following files to build decision context:
- `.anty/business-context.yaml` (founder's business context)
- `.anty/learning/preferences.yaml` (if exists — accumulated preference distributions)
- `.anty/learning/choice-history.yaml` (if exists — past choices)
- `.anty/learning/performance-labels.yaml` (if exists — past action outcomes)
- All files in `.anty/actions/` with `status: proposed`

## Step 2: For Each Pending Action

Process each proposed action one at a time. Never present multiple action decisions simultaneously.

### 2a: RECAP (Relevant Context and Priming)

Before presenting options, surface the founder's own data. This is NOT the agent's opinion — it is a mirror of what the founder has already said and what the data shows.

Format:
```
--- Your Context ---
Business: [product description from business-context]
Current traction: [key metrics from business-context or recent scans]
Strategic mode: [effectuation/causation/hybrid]
Distribution tier: [tier from business-context]
Pain classification: [painkiller/vitamin]
[Any relevant recent performance data from scans or action outcomes]
---
```

### 2b: Present 3 Options

Each option must include:

```
Option A: [Title]
  What: [Clear description of the action]
  Expected timeline: [How long this will take]
  Expected results: [Quantified outcome — be specific]
  Cost: [Money, time, effort required]
  Time required: [Hours per week or total hours]
  First step: [Channel factor — the concrete, immediate next action]

Option B: [Title]
  [Same structure]

Option C: [Title]
  [Same structure]
```

The 3 options MUST vary on at least 2 dimensions (e.g., channel + scale, approach + speed, cost + risk). Options should represent genuinely different strategies, not just mild variations.

### 2c: Default Selection Logic

Determine whether to present a Smart Default or Active Choice:

**Smart Default** (if preference data supports it):
- Check `.anty/learning/preferences.yaml` for relevant dimension distributions
- If the dominant preference has >= 20 data points supporting it, highlight the option that aligns: "Based on your past choices, Option [X] aligns with your preference for [dimension pattern]. You can select A, B, C, or 'none'."
- Visual indicator: mark the default option with `[suggested]`

**Active Choice** (if insufficient data):
- If fewer than 20 relevant data points, do NOT suggest a default
- Present all options equally: "Choose A, B, C, or 'none' to reject all."

### 2d: Operational Transparency

Explain WHY the options were constructed this way. Use source attribution — never say "I recommend" or "I think." Always ground in data:

- "Your data shows [X], which is why Option B includes [Y]."
- "Your business context indicates [distribution tier], so all options use [channel type]."
- "Your past choices show a preference for [pattern] (N=X data points)."
- "Your North Star metric is [metric], and Option A targets the [factor] component of that."

### 2e: Present to Founder

Combine RECAP + Options + Default/Active + Transparency into a single clear presentation.

Ask: "Select A, B, C, or 'none' to reject all options."

## Step 3: Handle Response

### If A, B, or C selected:

1. **Post-decision reinforcement**: Confirm the choice with data-backed reasoning (not praise):
   - "Option [X] selected. Your [business context data point] supports this approach because [specific reason]."
   - Never: "Great choice!" Always: "Your data supports this because..."

2. **User contribution acknowledgment**:
   - "Your choice of [option title] recorded. This strengthens the [dimension pattern] in your preferences."

3. **Record the choice** in `.anty/learning/choice-history.yaml`:

```yaml
- id: choice-NNN
  timestamp: [ISO 8601]
  action_id: action-NNN
  context: "[description of the decision context]"
  options:
    - id: a
      description: "[Option A title and summary]"
      dimensions: { [dim1]: [value], [dim2]: [value], [dim3]: [value] }
    - id: b
      description: "[Option B title and summary]"
      dimensions: { [dim1]: [value], [dim2]: [value], [dim3]: [value] }
    - id: c
      description: "[Option C title and summary]"
      dimensions: { [dim1]: [value], [dim2]: [value], [dim3]: [value] }
  chosen: [a/b/c]
  variedDimensions: [[dim1], [dim2]]
  rationale: "[any reasoning the founder shared]"
```

4. **Update action status**: In the corresponding `.anty/actions/action-NNN.yaml`, change `status: proposed` to `status: approved`. Also record:
   - `approved_at: [timestamp]`
   - `chosen_option: [a/b/c]`
   - `option_details: [the full details of the chosen option]`

5. **Update preferences**: If `.anty/learning/choice-history.yaml` now has 5+ entries, recalculate preference distributions and save to `.anty/learning/preferences.yaml`.

### If "none" selected (reject all):

1. Do NOT present new options immediately.
2. Ask a QUEST follow-up question: "What specifically felt wrong about these options? Was it the approach, the scale, the timeline, or something else entirely?"
3. Listen to the response and identify which dimensions were misaligned.
4. Record the rejection in choice history with `chosen: none` and the founder's feedback.
5. Generate 3 new options that address the founder's specific objections. Vary different dimensions this time.
6. Repeat the presentation flow.

## Choice History Numbering

- Check existing entries in `.anty/learning/choice-history.yaml` to determine the next choice-NNN.
- If the file doesn't exist, create it and start at choice-001.

## File Creation

Ensure all directories exist before writing:
- `.anty/learning/` for choice-history.yaml and preferences.yaml
- `.anty/actions/` should already exist (created by `/anty:plan`)

## Preference Distribution Calculation

When 5+ choices exist, calculate distributions:

```yaml
# .anty/learning/preferences.yaml
dataPoints: [total number of choices]
lastAnalyzedAt: [timestamp]
distributions:
  [dimension_name]:
    [value1]: [proportion 0.0-1.0]
    [value2]: [proportion 0.0-1.0]
    ...
```

Proportions are calculated as: (times this value was chosen) / (times this dimension was varied).

Only include dimensions that have been varied in at least 3 choices.

## Action YAML Structure

For reference, action files in `.anty/actions/action-NNN.yaml` follow this structure:

```yaml
id: action-NNN
driver_id: driver-NNN
goal_id: goal-NNN
created_at: [timestamp]
updated_at: [timestamp]

status: proposed  # proposed | approved | in_progress | completed | failed | rejected

title: ""
description: ""
approach: ""
expected_timeline: ""
expected_results: ""
cost: ""
time_required: ""
first_step: ""  # Channel factor

chosen_option: null     # a | b | c (set on approval)
approved_at: null       # set on approval
option_details: null    # full details of selected option

steps: []
effectiveness_score: null  # set after completion
```

## Behavioral Rules

- **Source attribution**: NEVER say "I recommend" or "I think" or "I suggest." ALWAYS use "Your data shows", "Based on your context", "Your past choices indicate."
- **No sycophancy**: Do not praise choices. Confirm with data.
- **Transparency**: Always explain the reasoning behind option construction.
- **One decision at a time**: Never batch multiple action approvals.
- **Dimension variation**: Track which dimensions were varied in each choice set to ensure preference learning covers all relevant dimensions over time.
- **Empathic neutrality on rejection**: If the founder rejects all options, treat this as valuable signal, not as failure. The rejection itself teaches the system about preferences.
