# Anty Framework

[![release](https://img.shields.io/badge/release-v0.1.0-blue)](https://github.com/masterleopold/anty-framework/releases) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![GitHub stars](https://img.shields.io/github/stars/masterleopold/anty-framework)](https://github.com/masterleopold/anty-framework/stargazers) [![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-blueviolet)](https://docs.anthropic.com/en/docs/claude-code) [![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-pink)](https://github.com/sponsors/masterleopold)

> Your AI co-worker for startup sales & marketing — powered by Claude Code.

A Claude Code plugin that gives startup founders a proactive AI co-worker for sales & marketing. Anty doesn't wait for instructions — it analyzes your situation, plans strategy, proposes actions, and executes with graduated autonomy.

You describe your business. Anty builds the go-to-market plan and runs it.

## What is Anty?

Anty is an AI workforce agent that operates as your S&M (Sales & Marketing) team member. It combines 15+ strategic frameworks from business literature into an integrated planning and execution engine:

- **Strategy Kernel** (Rumelt) — Diagnosis → Guiding Policy → Coherent Actions
- **Critical Chain** (Goldratt/TOC) — Buffer management, relay runner execution, constraint focus
- **QUEST** (Wiss) — Socratic questioning methodology for deep understanding
- **Nudge** (Thaler) — Choice architecture for better decision-making
- **Culture Map** (Meyer) — 8-dimension cultural localization for global outreach
- **Cold Start Problem** (Chen) — Network effects, atomic networks, escape velocity
- **Value Stick** (Oberholzer-Gee) — WTP/WTS pricing strategy
- And more: Effectuation, Pre-Mortem, Plan B, Cash Machine pipeline, PMF detection...

## Installation

```bash
# Clone the framework
git clone https://github.com/4n7y/anty-framework.git

# Launch Claude Code with the plugin
claude --plugin-dir ./anty-framework
```

Or install permanently via marketplace:

```bash
# Add as a local marketplace
claude plugins marketplace add ./anty-framework

# Install the plugin
claude plugins install anty@anty-marketplace
```

Requires [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI installed and authenticated.

## Quick Start

```
/anty:onboard     # Conversational interview — builds your business context
/anty:plan         # Generates Strategy Kernel + KPI tree + action proposals
/anty:actions      # Review and approve 3-option action proposals
/anty:status       # CLI dashboard — goals, buffer health, pipeline
/anty:loop 30m     # Start persistent operation (scans every 30 min)
```

## Commands

| Command | Description |
|---|---|
| `/anty:onboard` | QUEST-based conversational interview (14 topics) |
| `/anty:plan` | Strategy Kernel + KPI tree + Pre-Mortem + scenarios |
| `/anty:actions` | 3-option choice approval with Nudge architecture |
| `/anty:status` | CLI dashboard (goals, buffer, growth, pipeline) |
| `/anty:pipeline` | Sales pipeline management (Cash Machine) |
| `/anty:scan` | 10-point analysis cycle |
| `/anty:loop` | Persistent operation at specified interval |
| `/anty:rules` | View/edit User Rules (highest priority) |
| `/anty:identity` | View/edit Agent Identity (communication style, values) |
| `/anty:review` | 5-question review engine |

## How It Works

1. **You onboard** — `/anty:onboard` runs a 14-topic Socratic interview covering product, market, pricing, competitors, pain intensity, PMF signals, culture settings, and more
2. **Anty plans** — `/anty:plan` generates a Strategy Kernel (diagnosis with reframing, guiding policy, coherent actions), decomposes into a KPI tree, identifies the Crux (most important AND solvable challenge), runs pre-mortem analysis, and proposes 3-option actions
3. **You choose** — `/anty:actions` presents options with Nudge choice architecture (smart defaults, outcome mapping, your own data surfaced before choices)
4. **Anty executes** — Actions are executed by specialized subagents (Research, Planner, Content, Analyst) with graduated autonomy
5. **Anty learns** — Every choice you make trains the preference model. Over time, proposals get more accurate and autonomy increases
6. **Anty scans** — `/anty:loop` runs continuous analysis checking buffer health, KPI propagation, pipeline stalls, environmental changes, and anti-patterns

## Domain Knowledge (24 Skills)

Anty's intelligence comes from 24 domain-specific knowledge modules across 7 domains:

| Domain | Skills |
|---|---|
| **Strategy** | Strategy Kernel, Pre-Mortem & Plan B, Effectuation, Disruption Analysis |
| **Planning** | Critical Chain & TOC, KPI Tree, Root Cause Analysis, Review Engine |
| **Behavioral** | QUEST Interview, Choice Architecture, Confidence Calibration, Culture Map |
| **Marketing** | Growth Metrics & YC Benchmarks, Retention Cohorts & PMF, Network Effects, Content Rules |
| **Sales** | Pipeline (Cash Machine), Lead Qualification, Anticipatory Selling |
| **Pricing** | Value Stick (WTP/WTS), Unit Economics (CLV/CAC/NDR) |
| **Failure Patterns** | Anti-Pattern Detection (12 patterns), Failure Essence (4 patterns), Plan B Framework |

## Subagents

| Agent | Role | Model |
|---|---|---|
| **Research** | Market research, competitor analysis, six-force environmental scanning | Opus |
| **Planner** | Strategy, KPI tree, crux identification, action generation | Opus |
| **Content** | Outreach drafts, content creation, cultural localization | Opus |
| **Analyst** | KPI tracking, verification, root cause analysis, anti-pattern detection | Opus |

## Data Storage

All data persists locally in `.anty/` (gitignored — your data stays private):

```
.anty/
├── config.yaml              # Plugin config (culture, scan frequency, mode)
├── business-context.yaml    # Onboarding results
├── rules.md                 # User Rules (CLAUDE.md-style)
├── identity.md              # Agent Identity (SOUL.md-style)
├── scratchpad.md            # Working memory (append-only)
├── goals/                   # Goals with Strategy Kernels
├── drivers/                 # KPI tree drivers
├── actions/                 # Action items with status
├── pipeline/deals/          # Sales pipeline deals
├── learning/                # Choice history, preferences, templates
└── history/scans/           # Historical scan results
```

## Key Design Principles

- **Invisible AI** — Frameworks are never front-loaded; they surface exactly when relevant (JIT knowledge delivery)
- **Anti-sycophancy** — Anty pushes back with evidence when your strategy conflicts with data
- **Source attribution** — "Your data shows..." never "I recommend..."
- **Contextual confidence** — Deflates overconfidence on irreversible decisions, protects momentum on reversible ones
- **Cultural localization** — Adapts communication to your culture (Layer A) and outreach to target market culture (Layer B)
- **Customer as protagonist** — All generated content puts the customer at center, never the company

## Web App

Anty Framework is the Phase 0 prototype. The full web application (SaaS) is planned at [4n7y.com](https://4n7y.com) with:
- Real-time dashboard (Convex + Next.js)
- Data integrations (Stripe, PostHog, HubSpot via MCP)
- Cross-company learning (Action Performance Index)
- Stripe billing (per-action metering)

Plugin logic transfers directly to the web app — skills become knowledge modules, commands become dashboard screens, `.anty/` files become database tables.

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated
- Claude Max or API subscription

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding skills, commands, and agents.

## License

[MIT](LICENSE)
