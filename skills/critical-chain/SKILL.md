---
name: critical-chain
description: Theory of Constraints 5 Focusing Steps, buffer management with 3-zone traffic light, relay runner execution discipline, WIP limits, and late start scheduling. Use when managing Goal execution pace, detecting bottlenecks, or when buffer status changes.
type: skill
---

# Critical Chain & Buffer Management

## When to Apply
- Managing Goal execution pace and timeline
- Buffer zone changes (GREEN/YELLOW/RED)
- Detecting and resolving bottlenecks
- Prioritizing which Actions to execute next
- When the founder asks "are we on track?"

## Core Framework

### TOC 5 Focusing Steps

Applied to the KPI tree. The Crux Driver (highest importance x tractability) is the constraint:

1. **IDENTIFY:** The Crux Driver is the constraint — most important AND most solvable bottleneck
2. **EXPLOIT:** Maximize that Driver's throughput. Execute its Actions first, eliminate waste, remove blockers. Never let constraint Actions wait.
3. **SUBORDINATE:** All other Drivers serve the constraint. Non-constraint Actions only execute when they don't compete for resources with constraint Actions.
4. **ELEVATE:** If Exploit is insufficient, propose additional investment (new Action types, budget, tools) for the constraint.
5. **REPEAT:** When the constraint moves (metric improves, another Driver becomes bottleneck), re-identify and restart.

### Buffer Management (3-Zone Traffic Light)

**Buffer sizing:** Project Buffer = 50% of estimated time to achieve Goal.

**Feeding buffers:** Each non-constraint Driver has a small feeding buffer protecting the constraint. If a non-constraint Action delays, the feeding buffer absorbs it.

| Zone | Buffer Consumed | Agent Behavior |
|---|---|---|
| **GREEN** (0-33%) | On track | Normal execution. Continue planned Actions. Light monitoring. |
| **YELLOW** (33-67%) | Falling behind | Investigate root cause. Generate recovery Actions. Notify user. Increase scan frequency. |
| **RED** (67-100%) | Significantly behind | Auto-propose high-impact recovery. Escalate to user. Deprioritize low-impact Drivers. Consider scope adjustment. |

```
Buffer consumed: 45%  [========----------]
Goal progress:   34%  [======------------]
Status: YELLOW — buffer consumption outpacing progress
```

**Buffer as early warning:** Unlike milestone tracking (detects problems after deadline miss), buffer management provides continuous visibility. YELLOW at 20% progress gives weeks of lead time.

### Relay Runner Principle

Three rules for Action execution:

1. **Start immediately** — When approved, execute in the very next chain invocation. No delay. (Prevents Student Syndrome — postponing when there's perceived slack.)
2. **Full focus, one at a time** — Constraint Driver Actions execute serially. Work one Action to completion before starting the next. (Prevents multitasking waste — context switching consumes 30-50% of capacity.)
3. **Hand off immediately** — On completion, move to verification and next Action with zero idle time. Early completion is celebrated. (Prevents Parkinson's Law — work expanding to fill time.)

### WIP Limits

| Scope | Max In Progress |
|---|---|
| Constraint Driver | 1 Action at a time |
| Non-constraint Drivers | 3 Actions concurrently |
| Total system | 5 Actions across all Drivers |

### Late Start Scheduling

Non-constraint Driver Actions start as late as possible (while respecting feeding buffers). This reduces unnecessary WIP and keeps focus on the constraint.

## Decision Rules

1. **Constraint Actions never wait** — always first priority, immediate execution
2. **Buffer zone determines response intensity** — GREEN: cruise. YELLOW: investigate. RED: escalate.
3. **WIP limits are hard limits** — do not exceed, even if capacity seems available
4. **Relay runner is non-negotiable** — no batching of constraint Actions, no multitasking
5. **Re-identify constraint after every metric update** — the bottleneck can shift
6. **Subordination means saying no** — non-constraint work that threatens constraint throughput is blocked

## Anti-Patterns to Detect

| Anti-Pattern | Signal | Response |
|---|---|---|
| Multitasking on constraint | Multiple constraint Actions in parallel | "Constraint Driver must have exactly 1 Action in progress. Serialize." |
| Student Syndrome | Approved Action not started for >24h | "Relay runner: start immediately on approval. No delay." |
| Ignoring buffer | Buffer RED but no escalation | "Buffer is RED — recovery Actions needed now." |
| Optimizing non-constraints | Heavy effort on non-bottleneck Drivers | "Effort on non-constraints has limited impact until the constraint is resolved." |
| WIP explosion | >5 Actions in progress simultaneously | "WIP limit exceeded. Complete or pause Actions before starting new ones." |
| Parkinson's Law | Action taking much longer than estimate | "Early completion is good. Hand off immediately — don't expand work to fill time." |
