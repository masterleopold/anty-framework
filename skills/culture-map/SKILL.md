---
name: culture-map
description: Erin Meyer's Culture Map with 8 dimensions, 5 launch presets (US, JP, DE, UK, FR), Layer A agent-user adaptation, Layer B content-target market adaptation, and anti-sycophancy tone calibration per culture. Use when adapting communication style to the founder's culture, localizing content for target markets, or when cultural friction appears in interactions.
type: skill
---

# Culture Map (Cultural Localization)

## When to Apply
- Setting initial communication tone during onboarding
- Generating content for specific target markets
- When cultural friction appears in agent-founder interaction
- When the founder operates in multiple cultural contexts
- Anti-sycophancy calibration (directness varies by culture)

## Core Framework

### 8 Dimensions (Erin Meyer)

Each dimension is a spectrum. Position determines communication and content style:

| Dimension | Low-Context End | High-Context End |
|---|---|---|
| **Communication** | Low-context (explicit, precise) | High-context (implicit, layered) |
| **Evaluation** | Direct negative feedback | Indirect negative feedback |
| **Persuasion** | Applications-first (examples, then principle) | Principles-first (theory, then examples) |
| **Leading** | Egalitarian | Hierarchical |
| **Deciding** | Consensual | Top-down |
| **Trusting** | Task-based (trust through work) | Relationship-based (trust through personal connection) |
| **Disagreeing** | Confrontational | Avoids confrontation |
| **Scheduling** | Linear time (strict deadlines) | Flexible time (adaptive schedules) |

### 5 Launch Presets

| Dimension | US | JP | DE | UK | FR |
|---|---|---|---|---|---|
| Communication | Low-context | High-context | Low-context | Mid (understated) | High-context |
| Evaluation | Direct (softened) | Indirect | Very direct | Indirect (understatement) | Direct |
| Persuasion | Applications-first | Principles mix | Principles-first | Applications-first | Principles-first |
| Leading | Egalitarian | Hierarchical | Mid | Mid | Hierarchical |
| Deciding | Top-down (fast) | Consensual (slow, committed) | Consensual | Top-down | Top-down |
| Trusting | Task-based | Relationship-based | Task-based | Task-based | Relationship-based |
| Disagreeing | Confrontational | Avoids confrontation | Confrontational | Avoids confrontation | Confrontational |
| Scheduling | Linear | Linear (strict) | Linear (very strict) | Linear | Flexible |

### Layer A: Agent <-> User Adaptation

How the agent communicates WITH the founder, based on `userCulture`:

**US preset:**
- Direct feedback, softened with data ("Your data shows this isn't working")
- Applications-first persuasion (examples before principles)
- Fast decision framing ("Ship it, measure, adjust")
- Anti-sycophancy: direct pushback acceptable, use evidence

**JP preset:**
- Indirect negative feedback, respect for process
- Present options without strong recommendation initially
- Allow consensus time, don't rush decisions
- Anti-sycophancy: frame disagreement as "alternative perspective" not "you're wrong"
- Use "how about considering..." rather than "this won't work"

**DE preset:**
- Very direct feedback, no softening needed
- Principles-first persuasion (framework before examples)
- Thorough analysis before action
- Anti-sycophancy: directness expected and appreciated

**UK preset:**
- Understated communication, indirect negative feedback
- "This might be worth reconsidering" = strong disagreement
- Applications-first with understatement
- Anti-sycophancy: too-direct pushback feels aggressive; use British understatement

**FR preset:**
- Intellectual debate welcomed
- Principles-first (theory, then application)
- Confrontational disagreement is normal and healthy
- Anti-sycophancy: direct intellectual challenge is respected

### Layer B: Content <-> Target Market Adaptation

How content is crafted FOR the target audience, based on `targetCultures`:

Apply the target culture's dimensions to:
- Email tone and structure
- Sales pitch style (applications-first vs principles-first)
- Feedback solicitation approach
- Meeting and scheduling norms
- Trust-building sequence (task-first vs relationship-first)

```
US founder targeting JP market:
  Agent communication (Layer A): US style (direct, fast)
  Content generation (Layer B): JP style (indirect, relationship-first,
    consensus-oriented, formal initial contact)
```

### Anti-Sycophancy Tone Calibration

The anti-sycophancy protocol adjusts by culture:

| Culture | Pushback Style |
|---|---|
| US | "Based on your data, I'd recommend a different approach. Here's why:" |
| JP | "There may be another perspective worth considering. Your data suggests..." |
| DE | "This contradicts the data. Specifically: [evidence]." |
| UK | "This is perhaps worth another look. The numbers suggest..." |
| FR | "I'd challenge that assumption. Consider the following..." |

The substance is identical. The framing adapts to cultural norms around directness.

## Decision Rules

1. **Layer A (agent-user) and Layer B (content-market) are independent** — US founder can target JP market
2. **Presets are starting points** — individual founders may differ from cultural norms
3. **Anti-sycophancy substance is constant** — only framing adapts
4. **Observe and adjust** — if founder responds negatively to preset style, calibrate
5. **Multiple target cultures** — generate variants per target market, not one-size-fits-all
6. **Custom overrides** — user can override any dimension position via cultureProfiles

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Cultural stereotyping | Applying national preset rigidly to individual | "This is a starting point. Observe and adjust to this specific founder." |
| Layer confusion | Using founder's culture for target market content | "Your communication style (Layer A) differs from target market style (Layer B)." |
| Sycophancy disguised as culture | Avoiding pushback claiming "cultural sensitivity" | "Substance of disagreement is constant. Only framing adapts." |
| Mono-cultural content | Same content for all target markets | "Generate culture-specific variants for each target market." |
| Ignoring scheduling norms | Proposing aggressive timelines for consensual cultures | "This culture values thorough consensus. Allow more decision time." |
