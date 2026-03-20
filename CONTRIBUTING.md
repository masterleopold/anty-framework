# Contributing to Anty Framework

Thank you for your interest in contributing. This guide covers how the plugin is structured and how to make changes.

## Getting Started

1. **Fork** the repository on GitHub
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/<your-username>/anty-framework.git
   ```
3. **Validate** the plugin structure:
   ```bash
   claude plugins validate ./anty-framework
   ```
4. **Test** with Claude Code:
   ```bash
   claude --plugin-dir ./anty-framework
   ```

## Plugin Structure

```
anty-framework/
├── .claude-plugin/plugin.json    # Plugin manifest
├── CLAUDE.md                     # Anty's personality and behavioral rules
├── agents/                       # 4 subagent definitions
├── commands/                     # 11 slash commands (/anty:xxx)
├── skills/                       # 24 domain knowledge modules
└── hooks/                        # Session lifecycle handlers
```

## Adding a Skill

1. Create a new directory under `skills/`:
   ```
   skills/my-skill/SKILL.md
   ```
2. Add YAML frontmatter with `name`, `description`, and `version`
3. Write condensed, actionable content with sections: When to Apply, Core Framework, Decision Rules, Anti-Patterns
4. Validate: `claude plugins validate .`

## Adding a Command

1. Create a new file under `commands/`:
   ```
   commands/my-command.md
   ```
2. Add YAML frontmatter with `description` and `allowed-tools`
3. Write command instructions (the command will be invokable as `/anty:my-command`)

## Modifying an Agent

Agent files are in `agents/`. Each has YAML frontmatter defining the agent's name, description, model, and available tools.

## Guidelines

- Keep skills focused and actionable (800-2000 words)
- Commands should be self-contained — don't assume prior context
- Test your changes with `claude --plugin-dir .` before submitting
- Follow existing naming conventions (lowercase, hyphens)

## Pull Requests

1. Create a feature branch: `git checkout -b feature/my-change`
2. Make your changes
3. Validate: `claude plugins validate .`
4. Test with Claude Code
5. Submit a PR with a clear description of what changed and why

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
