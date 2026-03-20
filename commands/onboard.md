---
description: /anty:onboard — QUEST-Based Conversational Interview
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:onboard — QUEST-Based Conversational Interview

## Purpose

Conduct a structured conversational interview with the startup founder to build complete business context. Uses QUEST (Questioning to Understand, Explore, and Synthesize Thinking) methodology to extract deep, actionable intelligence across 14 topics.

## Before Starting

1. Check if `.anty/business-context.yaml` already exists.
   - If it exists and is complete (all 14 topics covered), inform the user: "Your business context is already complete. To re-run onboarding, delete `.anty/business-context.yaml` and run `/anty:onboard` again."
   - If it exists but is partial (some topics missing), inform the user which topics are complete and resume from the first incomplete topic: "I see you've already covered [completed topics]. Let's continue from [next topic]."
   - If it does not exist, create the `.anty/` directory if needed and start fresh.

2. Ensure `.anty/config.yaml` exists. Create it with defaults if not.

## QUEST Methodology Rules

Follow these rules strictly for EVERY question:

- **One question at a time.** Never ask multiple questions in a single message.
- **Downward then upward.** Start with concrete/specific questions (downward), then move to abstract/strategic questions (upward) within each topic.
- **"Tell me..." openers.** Begin questions with "Tell me about...", "Walk me through...", "Describe..." — open invitations, not yes/no gates.
- **Echo questions.** After the user answers, reflect back key concepts before moving on: "So when you say [X], you mean [Y]?" This confirms understanding and makes the user feel heard.
- **Empathic neutrality.** Never judge answers as good or bad. Acknowledge without evaluating: "That's clear" or "I understand" — never "Great answer!" or "That's concerning."
- **Concept identification.** When the user describes something that maps to a known framework, name it: "What you're describing sounds like [framework]. Let me ask a bit more about that."
- **Resolution imbalance detection.** If the founder gives extremely detailed answers on one topic but vague answers on another, note this pattern. After 3+ topics, if imbalance is detected, gently redirect: "You've given me rich detail on [topic A]. I'd like to explore [topic B] with similar depth — tell me more about..."

## Interview Topics (in sequence)

Cover all 14 topics in this exact order. After completing each topic, save the answers incrementally to `.anty/business-context.yaml`.

### Topic 1: Product & Problem
- What problem does the product solve?
- Who experiences this problem?
- How does the product solve it differently from alternatives?
- Save to: `business_context.product` and `business_context.problem`

### Topic 2: Target Market
- Who is the ideal customer (specific persona, not demographics)?
- What is the TAM/SAM/SOM estimate?
- Where do these customers congregate (online and offline)?
- Save to: `business_context.target_market`

### Topic 3: Pricing & Business Model
- Current pricing structure (or planned)
- Revenue model (subscription, transaction, usage, etc.)
- Average deal size / ARPU
- Save to: `business_context.pricing`

### Topic 4: Competitors
- Direct competitors (same solution, same customer)
- Indirect competitors (different solution, same problem)
- What is the current competitive response when prospects compare?
- Save to: `business_context.competitors`

### Topic 5: Current Traction
- Current metrics: users, revenue, growth rate
- Key milestones achieved
- How long has the product been live?
- Save to: `business_context.traction`

### Topic 6: Pain Intensity
- Ask the founder to rate customer pain on a 1-5 scale:
  - 1 = Nice to have (vitamin)
  - 2 = Occasionally annoying
  - 3 = Frequent frustration
  - 4 = Significant daily pain
  - 5 = Hair-on-fire emergency (painkiller)
- Based on rating, classify as **Painkiller** (4-5) or **Vitamin** (1-3)
- If Vitamin: note this as a strategic risk factor and probe for reframing opportunities
- Save to: `business_context.pain_intensity`

### Topic 7: Locally Famous Test
- Ask: "Is there a specific group — a community, company type, niche — where virtually every member uses or knows about your product?"
- If yes: identify the group and its boundaries. This is the atomic network.
- If no: probe for the closest candidate group. Ask "Where have you seen the strongest word-of-mouth?"
- Save to: `business_context.locally_famous`

### Topic 8: Workaround Discovery
- Ask: "Where in your customers' workflow do they currently use spreadsheets, manual processes, email chains, or sticky notes to solve this problem?"
- Map each workaround to a potential feature/value proposition
- Save to: `business_context.workarounds`

### Topic 9: North Star Metric Recommendation
- Based on the business model identified in Topic 3, recommend the appropriate North Star metric:
  - **B2B SaaS** -> MRR or ARR
  - **Consumer social** -> DAU or WAU
  - **Marketplace** -> GMV or transactions
  - **E-commerce** -> Revenue per session
  - **Usage-based** -> Usage volume (API calls, compute hours, etc.)
  - **Enterprise** -> ACV (Annual Contract Value)
- Present the recommendation with reasoning. Ask if the founder agrees or wants to adjust.
- Save to: `business_context.north_star_metric`

### Topic 10: Distribution Tier Matching
- Based on average deal size (from Topic 3), match to distribution tier:
  - **$0-$1K ACV** -> Viral distribution (product-led growth)
  - **$1K-$10K ACV** -> Marketing-driven (content, ads, inbound)
  - **$10K-$25K ACV** -> Dead Zone (too expensive for self-serve, too cheap for sales) — flag this as a risk
  - **$25K-$100K ACV** -> Personal sales (inside sales, demos)
  - **$100K+ ACV** -> Complex sales (multi-stakeholder, long cycle)
- Present the tier with its implications. If Dead Zone, discuss strategies to move up or down.
- Save to: `business_context.distribution_tier`

### Topic 11: Culture Settings
- Ask: "Where are you (the founder/team) located?"
- Ask: "Where are your target customers located?"
- These determine cultural localization layers:
  - Layer A: Agent-to-user communication style
  - Layer B: Content-to-market cultural adaptation
- Save to: `config.culture` in `.anty/config.yaml`

### Topic 12: Effectuation vs Causation Mode
- Apply the 3-condition test to determine the appropriate strategic mode:
  1. **Predictability**: "How predictable is your market? Can you forecast demand?"
  2. **Resources**: "Do you have significant resources (capital, team, data) to execute a deliberate plan?"
  3. **Stakes**: "What happens if your current approach fails? Is this existential or recoverable?"
- Classification:
  - If market is unpredictable AND resources are limited AND stakes are survivable -> **Effectuation** (bird-in-hand, affordable loss, crazy quilt, lemonade)
  - If market is predictable AND resources are available -> **Causation** (goal-driven, planned execution)
  - Mixed conditions -> **Hybrid** (effectuation for exploration, causation for execution)
- Save to: `business_context.strategic_mode`

### Topic 13: Affordable Loss
- Explore four dimensions of what the founder can afford to lose:
  1. **Financial**: "What is the maximum amount of money you can invest/lose without it affecting your personal life?"
  2. **Time**: "How long can you pursue this before you need to see results or move on?"
  3. **Reputation**: "What professional reputation risk are you taking? Would failure in this affect your career?"
  4. **Psychological**: "How would you personally handle this not working out?"
- Save to: `business_context.affordable_loss`

### Topic 14: Retention Measurement Definitions
- Define how retention will be measured for this specific business:
  1. **Cohort grouping**: How should users be grouped? (sign-up week, sign-up month, first-purchase date, etc.)
  2. **Active action**: What constitutes an "active" user? (login, specific feature use, purchase, etc.)
  3. **Time granularity**: What period makes sense? (daily for consumer, weekly for B2B, monthly for enterprise)
- These definitions will be used for all future retention analysis.
- Save to: `business_context.retention_definitions`

## After Each Topic

1. Echo back a one-sentence summary of what was captured for that topic.
2. Save incrementally to `.anty/business-context.yaml` — never wait until the end.
3. If this is Topic 11 (Culture), also update `.anty/config.yaml` with culture settings.

## After All 14 Topics

1. Present a complete summary of the business context.
2. Ask: "Does this accurately represent your business? Anything to correct or add?"
3. Apply any corrections.
4. Confirm the final saved state: "Your business context is saved to `.anty/business-context.yaml`. You can now run `/anty:plan` to generate your strategy."

## YAML Output Format

### .anty/business-context.yaml

```yaml
version: 1
created_at: [timestamp]
updated_at: [timestamp]
completed_topics: [list of completed topic numbers]

product:
  description: ""
  problem_solved: ""
  differentiation: ""

target_market:
  ideal_customer: ""
  tam_sam_som: ""
  customer_channels: []

pricing:
  model: ""
  structure: ""
  average_deal_size: ""
  arpu: ""

competitors:
  direct: []
  indirect: []
  competitive_response: ""

traction:
  users: 0
  revenue: ""
  growth_rate: ""
  milestones: []
  product_live_since: ""

pain_intensity:
  score: 0
  classification: ""  # "painkiller" or "vitamin"
  notes: ""

locally_famous:
  has_atomic_network: false
  group: ""
  boundaries: ""
  word_of_mouth_source: ""

workarounds:
  identified: []
  # Each entry: { current_method: "", pain_point: "", opportunity: "" }

north_star_metric:
  metric: ""
  rationale: ""
  founder_agreed: false

distribution_tier:
  tier: ""  # viral | marketing | dead_zone | personal_sales | complex_sales
  deal_size_range: ""
  implications: ""
  risk_notes: ""

culture:
  founder_location: ""
  target_markets: []

strategic_mode:
  mode: ""  # effectuation | causation | hybrid
  predictability: ""
  resources: ""
  stakes: ""
  rationale: ""

affordable_loss:
  financial: ""
  time: ""
  reputation: ""
  psychological: ""

retention_definitions:
  cohort_grouping: ""
  active_action: ""
  time_granularity: ""
```

### .anty/config.yaml (culture section)

```yaml
culture:
  user_locale: ""
  target_locales: []
  communication_layer_a: ""  # Agent-to-user style
  content_layer_b: ""        # Content-to-market style
```
