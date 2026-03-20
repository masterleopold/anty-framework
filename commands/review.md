---
description: /anty:review — 5-Question Review Engine
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:review — 5-Question Review Engine

## Trigger
User runs `/anty:review`

## Behavior

Execute the 5-question review engine using the **Analyst** subagent (`agents/analyst.md`). Evaluate in strict priority order, proceeding deeper only if the answer to each question is "yes". Surface the level where the problem is.

### Agent
Use the **Analyst** subagent for all evaluation steps.

### The 5 Questions (Strict Priority Order)

#### Question 1: WHERE — Has the Goal progressed since last review?

Read `.anty/goals/*.yaml` and `.anty/history/scans/*.yaml`.

- Compare current goal metric to last review's metric
- Calculate absolute and percentage change
- Check if progress rate is sufficient to reach target within timeline (including buffer)

Display:
```
Q1: Has the Goal progressed since last review?
----------------------------------------------------
Goal: [goal name]
Last review: [metric value] ([date])
Current:     [metric value] ([date])
Change:      [+/- delta] ([+/- %])
On track:    [yes/no — based on required run rate]
----------------------------------------------------
```

**If NO (goal has not progressed):** STOP HERE. The problem is at the WHERE level.
- Diagnosis: Goal is not moving. No further investigation needed until progress resumes.
- Recommend: Review which Drivers should be generating movement.
- Skip Q2-Q5.

**If YES:** Proceed to Q2.

#### Question 2: Execution — Were approved Actions executed as planned?

Read `.anty/actions/*.yaml` — check actions with status `approved` or `in_progress`.

- Compare planned steps vs completed steps for each action
- Check if execution timeline matches planned timeline
- Identify any actions that were approved but not started
- Identify partially completed actions

Display:
```
Q2: Were approved Actions executed as planned?
----------------------------------------------------
Action: [action name]
  Planned steps: [n] | Completed: [m] | Status: [status]
  Timeline: [on-time / delayed by N days]
...
Overall execution rate: [completed/planned] ([%])
----------------------------------------------------
```

**If NO (actions not executed as planned):** STOP HERE. The problem is at the Execution level.
- Diagnosis: Strategy exists, actions were approved, but execution failed.
- Recommend: Investigate execution blockers (capacity, skills, dependencies).
- Skip Q3-Q5.

**If YES:** Proceed to Q3.

#### Question 3: Planning — Was the Action plan well-constructed?

Read completed actions and their outcomes from `.anty/actions/*.yaml` and `.anty/scratchpad.md`.

- Check if action steps were logically sequenced
- Check if resource estimates were accurate
- Check if dependencies were identified
- Check if the plan had clear success criteria
- Compare expected outcomes vs actual outcomes

Display:
```
Q3: Was the Action plan well-constructed?
----------------------------------------------------
Action: [action name]
  Steps logical:     [yes/no]
  Estimates accurate: [yes/no — expected N, actual M]
  Dependencies met:  [yes/no]
  Success criteria:  [defined/undefined]
  Outcome vs plan:   [matched / partial / missed]
----------------------------------------------------
```

**If NO (plan was poorly constructed):** STOP HERE. The problem is at the Planning level.
- Diagnosis: Right actions chosen, but plan construction was flawed.
- Recommend: Improve planning process (better estimation, dependency mapping, success criteria).
- Skip Q4-Q5.

**If YES:** Proceed to Q4.

#### Question 4: HOW — Were the chosen Actions appropriate?

Read `.anty/drivers/*.yaml`, `.anty/actions/*.yaml`, and `.anty/learning/choice-history.yaml`.

- Check if actions targeted the Crux Driver (highest impact_weight)
- Check if actions addressed the constraint (not non-constraints)
- Check if action selection aligned with learned preferences
- Check if alternative actions might have been more effective
- Reference action templates and their success rates

Display:
```
Q4: Were the chosen Actions appropriate for the situation?
----------------------------------------------------
Crux Driver: [driver name] (weight: [%])
Actions targeted crux: [yes/no]
Constraint-focused:    [yes/no]
Template success rate: [%] (based on [n] similar executions)
Alternative analysis:  [description of potentially better options]
----------------------------------------------------
```

**If NO (wrong actions chosen):** STOP HERE. The problem is at the HOW level.
- Diagnosis: Root cause was correct, but the response actions were wrong.
- Recommend: Re-evaluate action selection, consider different approaches.
- Skip Q5.

**If YES:** Proceed to Q5.

#### Question 5: WHY — Was the root-cause analysis correct?

Read `.anty/drivers/*.yaml`, `.anty/goals/*.yaml`, and recent scan history.

- Check if the identified constraint is actually the binding constraint
- Check if impact_weights reflect observed reality
- Check if the causal model (Driver -> Goal) is validated by data
- Look for evidence that a different driver might be the true constraint

Display:
```
Q5: Was the root-cause analysis correct?
----------------------------------------------------
Identified constraint: [driver name]
Evidence supporting:   [list of supporting data points]
Evidence against:      [list of contradicting data points]
Alternative hypotheses:
  - [alternative constraint 1]: [supporting evidence]
  - [alternative constraint 2]: [supporting evidence]
Confidence: [high/medium/low]
----------------------------------------------------
```

**If NO:** The problem is at the WHY level.
- Diagnosis: The fundamental understanding of what drives the goal is wrong.
- Recommend: Restart root-cause analysis. Run /anty:scan for fresh data.

**If YES:** All 5 levels check out — the strategy is sound and executing well. Continue current course.

### Summary Output

After completing the review (stopping at the appropriate level):

```
====================================================
  REVIEW RESULTS
====================================================
Q1 Goal Progress:    [PASS/FAIL]
Q2 Execution:        [PASS/FAIL/SKIPPED]
Q3 Planning:         [PASS/FAIL/SKIPPED]
Q4 Action Selection: [PASS/FAIL/SKIPPED]
Q5 Root Cause:       [PASS/FAIL/SKIPPED]

Problem Level: [WHERE/Execution/Planning/HOW/WHY/None]
Diagnosis: [one-line diagnosis]
Recommendation: [one-line recommendation]
====================================================
```

### Save Results

Append review results to `.anty/scratchpad.md`:
```
---
[REVIEW] 2026-03-20 14:00 — Problem at [level] level
- Q1: [PASS/FAIL] | Q2: [PASS/FAIL/SKIP] | Q3-Q5: [status]
- Diagnosis: [summary]
- Recommendation: [summary]
```

### Edge Cases
- If no previous review exists, use goal creation date as baseline for Q1
- If no actions exist, Q2 automatically fails (nothing to execute)
- If no choice history exists, Q4 skips preference alignment check
