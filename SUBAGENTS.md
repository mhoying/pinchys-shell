# SUBAGENTS.md - Specialized Agent Registry

Quick reference for spawning specialized subagents when you need specific knowledge, skills, or approaches.

## Available Subagents

(None defined yet — add entries as they're created)

## Format

Each subagent entry should include:

| Name | Purpose | Location | When to Use |
|------|---------|----------|------------|
| `name` | What it does | `/projects/or/agents/path.md` | Specific use cases |

## Example

```markdown
| google-chat-debugger | Debug Google Chat integration issues | `/projects/google-chat-integration.md` | When webhook/auth fails |
| model-benchmarker | Compare local vs cloud model performance | `/agents/model-benchmarker.md` | When evaluating model tradeoffs |
```

## How to Spawn

```bash
sessions_spawn(
  task="Specific task for this subagent",
  label="descriptive-name",
  taskName="stable-handle-for-later"
)
```

See AGENTS.md for full guidance on spawning and context management.
