# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in Anty Framework, please report it responsibly:

1. **Do NOT** open a public issue
2. Email security concerns to the maintainer via GitHub
3. Include steps to reproduce and potential impact

We will respond within 48 hours and work on a fix promptly.

## Scope

Anty Framework is a Claude Code plugin that stores data locally in `.anty/`. Security concerns include:
- Unintended data exposure in scratchpad or YAML files
- Command injection via hook scripts
- Sensitive information leakage in skill prompts
