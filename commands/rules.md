---
description: /anty:rules — View/Edit User Rules
allowed-tools: Read, Write, Edit, Bash, Grep, Glob, Agent, Skill
---

# /anty:rules — View/Edit User Rules

## Trigger
User runs `/anty:rules`

## Behavior

Read and display the contents of `.anty/rules.md`, then allow the user to view, add, modify, or remove rules. Rules are injected into every agent interaction with the highest priority.

### Default View (no arguments)

1. Read `.anty/rules.md`
2. Display current rules with numbered list:
   ```
   ====================================================
     USER RULES
   ====================================================
   Rules are injected into every agent interaction
   with HIGHEST priority. Agents must follow these.
   ====================================================

   1. [rule text]
   2. [rule text]
   3. [rule text]
   ...

   ====================================================
   Commands:
     "add [rule]"    — Add a new rule
     "edit [n]"      — Edit rule number n
     "remove [n]"    — Remove rule number n
     "done"          — Exit rules editor
   ====================================================
   ```

### Adding a Rule

When user says "add [rule text]":
1. Append the new rule to `.anty/rules.md`
2. Display updated rules list
3. Confirm: "Rule added: [rule text]"

### Editing a Rule

When user says "edit [n]":
1. Display current rule #n
2. Ask user for new text
3. Replace rule #n in `.anty/rules.md`
4. Display updated rules list
5. Confirm: "Rule #[n] updated."

### Removing a Rule

When user says "remove [n]":
1. Display rule #n and ask for confirmation
2. On confirmation, remove rule #n from `.anty/rules.md`
3. Renumber remaining rules
4. Display updated rules list
5. Confirm: "Rule #[n] removed."

### Rules Format in .anty/rules.md

```markdown
# User Rules

These rules have the HIGHEST priority and override all other instructions.

1. [rule text]
2. [rule text]
3. [rule text]
```

### Edge Cases
- If `.anty/rules.md` does not exist, create it with the header template
- If file exists but has no rules, display "No rules set. Use 'add [rule]' to create your first rule."
- Preserve any markdown formatting within rule text
