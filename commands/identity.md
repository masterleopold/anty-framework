---
description: /anty:identity — View/Edit Agent Identity
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:identity — View/Edit Agent Identity

## Trigger
User runs `/anty:identity`

## Behavior

Read and display the contents of `.anty/identity.md`, then allow the user to view and edit the agent's identity settings. Identity controls how the agent thinks, communicates, and makes decisions.

### Default View (no arguments)

1. Read `.anty/identity.md`
2. Display current identity settings:
   ```
   ====================================================
     AGENT IDENTITY
   ====================================================
   Controls how Anty thinks, communicates, and decides.
   ====================================================

   COMMUNICATION STYLE
   ---------------------------------------------------
   [current style description]

   DECISION PHILOSOPHY
   ---------------------------------------------------
   [current philosophy description]

   RISK TOLERANCE
   ---------------------------------------------------
   [current risk tolerance level and description]

   VALUES
   ---------------------------------------------------
   [current values list]

   ====================================================
   Sections you can edit:
     "style [description]"    — Update communication style
     "philosophy [text]"      — Update decision philosophy
     "risk [level]"           — Update risk tolerance
     "values [list]"          — Update values
     "done"                   — Exit identity editor
   ====================================================
   ```

### Editing Communication Style

When user says "style [description]":
1. Update the Communication Style section in `.anty/identity.md`
2. Display updated identity
3. Confirm: "Communication style updated."

Examples:
- "Direct and concise, no fluff"
- "Detailed with supporting evidence"
- "Casual and conversational"
- "Formal with structured reasoning"

### Editing Decision Philosophy

When user says "philosophy [text]":
1. Update the Decision Philosophy section in `.anty/identity.md`
2. Display updated identity
3. Confirm: "Decision philosophy updated."

Examples:
- "Data-driven, evidence required for every recommendation"
- "Move fast, bias toward action over analysis"
- "Conservative, minimize downside risk"
- "Effectuation — work with what we have"

### Editing Risk Tolerance

When user says "risk [level]":
1. Accept levels: `low`, `medium`, `high`
2. Update the Risk Tolerance section in `.anty/identity.md`
3. Display updated identity with risk implications:
   - **low**: Conservative actions, proven approaches only, wider buffers
   - **medium**: Balanced approach, tested strategies with some experiments
   - **high**: Aggressive actions, experimental approaches, tighter buffers
4. Confirm: "Risk tolerance set to [level]."

### Editing Values

When user says "values [comma-separated list]":
1. Update the Values section in `.anty/identity.md`
2. Display updated identity
3. Confirm: "Values updated."

Examples:
- "transparency, speed, customer-obsession"
- "quality, sustainability, team-first"
- "innovation, frugality, bias-for-action"

### Identity Format in .anty/identity.md

```markdown
# Agent Identity

## Communication Style
[style description]

## Decision Philosophy
[philosophy description]

## Risk Tolerance
Level: [low/medium/high]
[risk implications description]

## Values
- [value 1]
- [value 2]
- [value 3]
```

### Edge Cases
- If `.anty/identity.md` does not exist, create it with sensible defaults:
  - Style: "Direct, evidence-based, with source attribution"
  - Philosophy: "Data-driven with bias toward action"
  - Risk: "medium"
  - Values: "transparency, evidence-based reasoning, user autonomy"
- Preserve any additional custom sections the user may have added
