---
description: /anty:quickstart — 5-Minute Quick Onboarding to First Action
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:quickstart — 5-Minute Quick Onboarding to First Action

## Purpose

Get the founder from zero to their first actionable marketing/sales action in under 5 minutes. Collects only the minimum information needed to generate useful actions, then deepens context over time through progressive profiling.

This is NOT a replacement for `/anty:onboard`. It is a fast-track entry point:
- `/anty:quickstart` → first action in 5 minutes, shallow context
- `/anty:onboard` → full 14-topic business context, deep strategic planning

## Before Starting

1. Check if `.anty/business-context.yaml` already exists and is complete.
   - If complete: "Your full business context already exists. Running quickstart to generate your first action based on existing context." → Skip to Step 3 (Action Generation).
   - If partial: Read existing data, skip questions already answered, fill gaps with Steps 1-2.
   - If does not exist: Create `.anty/` directory if needed, start from Step 1.

2. Ensure `.anty/config.yaml` exists. Create with defaults if not.

## Step 1: Core Question (1 question, covers Product + Target)

Ask ONE combined question:

"What does your product do, and who is it for? One or two sentences is enough."

Example answer: "AI tool that automates sales and marketing for startup founders who just launched their product."

From this single answer, extract:
- `product.description`
- `product.problem_solved` (infer from the product description)
- `target_market.ideal_customer`

Echo back: "So [product] for [customer]. Got it."

## Step 2: Channel Question (1 question)

"Where do your target customers spend time online? List the top 2-3 places."

Example answer: "HackerNews, Reddit, LinkedIn"

From this, extract:
- `target_market.customer_channels`

Echo back: "Targeting [channels]. Clear."

## Step 3: Action Generation (automatic, no question)

Based on the collected (or pre-existing) context, generate 3 concrete first actions. Each action must be:
- **Immediately executable** (can be done today)
- **Specific** (not "do marketing" but "post X on Y with Z angle")
- **Low-cost** (time only, no paid spend)
- **Measurable** (define what success looks like)

Format:

```
Here are 3 actions you can take right now:

Action 1: [Title]
  What: [Specific description — what to write/post/send]
  Where: [Platform/channel]
  Angle: [The hook or positioning]
  Success metric: [What to measure]
  Time required: [Estimated hours]

Action 2: [Title]
  [Same structure]

Action 3: [Title]
  [Same structure]
```

**Action generation rules:**
- Prioritize the channels the founder named in Step 2.
- Content angles should focus on the problem being solved, not the product features.
- Each action should target a different channel or approach (don't suggest 3 Reddit posts).
- If business-context.yaml exists, use competitive response data, workaround discovery, and pain intensity to sharpen the angles.

## Step 4: Approval (1 question)

"Pick one to start with: 1, 2, 3, or 'none' if none of these work."

### If 1, 2, or 3 selected:

1. Save the chosen action to `.anty/actions/` with `status: approved`.
2. Generate the actual deliverable for that action:
   - If it's a post: write the full post copy.
   - If it's an outreach message: write the full message template.
   - If it's a content piece: write the outline or first draft.
3. Present the deliverable: "Here's the draft. Edit as needed, then execute."
4. Save to `.anty/learning/choice-history.yaml`.

### If 'none' selected:

Ask: "What would be more useful right now?"
Listen, then generate 3 new actions based on the feedback.

## Step 5: Progressive Profiling Prompt

After the action is approved, prompt for deeper context:

"Your first action is ready. To generate better actions over time, you can run `/anty:onboard` for the full strategic setup (about 20 minutes). Or just keep using `/anty:quickstart` — I'll learn from your choices."

## Data Saving

### If business-context.yaml does NOT exist:

Create a minimal version:

```yaml
version: 1
created_at: [timestamp]
updated_at: [timestamp]
status: "quickstart"
completed_topics: []

product:
  description: "[from Step 1]"
  problem_solved: "[inferred from Step 1]"
  differentiation: ""

target_market:
  ideal_customer: "[from Step 1]"
  tam_sam_som: ""
  customer_channels: [from Step 2]

# All other sections left empty — to be filled by /anty:onboard
```

### If business-context.yaml already exists:

Do not overwrite. Use existing data for action generation.

### Action file format:

```yaml
id: action-NNN
goal_id: null  # or existing goal if one exists
driver_id: null
created_at: [timestamp]
updated_at: [timestamp]
status: approved
source: quickstart

title: "[action title]"
description: "[full description]"
approach: "[channel and method]"
expected_timeline: "[hours/days]"
expected_results: "[measurable outcome]"
cost: "[time only]"
first_step: "[the immediate next thing to do]"
deliverable: "[the actual content/copy/template generated]"
```

## QUEST Rules (Simplified for Quickstart)

- **One question at a time.** Never stack questions.
- **No framework dumping.** Don't explain why you're asking — just ask.
- **Echo briefly.** Confirm understanding in one line, then move on.
- **Speed over depth.** Accept rough answers. Precision comes later.
- **Relay runner.** Each step flows into the next without pause.

## Behavioral Rules

- Total interaction should be under 5 minutes (2 questions + action review).
- Never suggest paid marketing as a first action.
- Never suggest actions that require tools/accounts the founder may not have — ask if unsure.
- Source all action angles from the founder's own context, not generic marketing advice.
- If `.anty/business-context.yaml` exists with full context, the actions should be significantly more targeted than with quickstart-only data.
