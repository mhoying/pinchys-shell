# Spec: Project Backlog System

## Overview
A structured system for tracking all in-flight projects, efforts, and planned work. Uses external markdown files to maintain durable information outside chat history.

## Goals
- Single source of truth for all standing efforts
- No information lost in chat compression or history
- Ability to pick up any project without reading session history
- Clear status visibility across all work

## Architecture

### 1. Master Backlog File
**Location:** `PROJECTS.md` (root of workspace)

**Format:** Markdown table with minimal info
- Project name (links to project file)
- Status badge
- Last updated date
- One-line description

**Example:**
```markdown
| Project | Status | Updated | Description |
|---------|--------|---------|-------------|
| [CLI Alias Setup](projects/cli-alias-setup.md) | done | 2026-07-02 | Add pinchy alias for quick access |
| [Local Model Integration](projects/local-model-integration.md) | blocked | 2026-07-02 | CPU inference too slow for chat |
| [Backlog System](projects/backlog-system.md) | in_progress | 2026-07-02 | This system we're building |
```

### 2. Individual Project Files
**Location:** `projects/{project-name}.md`

**Required Sections:**
1. **Title** — Clear name of the project/effort
2. **Status** — One of: `planning | in_progress | blocked | paused | done | archived`
3. **Description** — What is this? Why does it matter?
4. **Ask/Requirements** — What needs to happen? What's the end goal?
5. **Current State** — Where are we now? What's been done?
6. **Blockers** — Anything preventing progress? (if status is `blocked`)
7. **Spec** — Link to spec file (if this is a development project)
8. **Related Files** — Links to supporting docs, task files, notes
9. **Last Updated** — Date and brief note on what changed
10. **Notes** — Any additional context

**Example structure:**
```markdown
# Project: Local Model Integration

**Status:** blocked  
**Last Updated:** 2026-07-02 — Attempted CPU inference, too slow

## Description
Integrate local Ollama models (Mistral 7B/13B) as fallback agents to reduce Haiku token spend.

## Ask/Requirements
- Run local LLM models as alternative to Haiku
- Use for conversational chat when possible
- Maintain fast response times (<10 sec per response)

## Current State
- Ollama installed with Mistral 7B and 13B
- Models integrated into OpenClaw config
- Testing revealed: CPU-only inference = 60+ sec latency
- Conclusion: Not viable for interactive chat

## Blockers
- **CPU-only hardware limitation:** ThinkPad X1 has no discrete GPU
- **Latency unacceptable:** 60+ seconds per response kills conversation flow
- **Token budget sufficient:** Haiku is cheaper and faster anyway

## Spec
See: `specs/local-model-integration.md` (not yet created)

## Related Files
- `openclaw.json` — Config with Ollama provider setup
- `~/.local/bin/ai` — Wrapper script for quick local queries (works fine)
- `TOOLS.md` — Hardware specs

## Notes
- `ai` wrapper at CLI works great (6 sec turnaround)
- Full agent integration through OpenClaw not practical
- Keep wrapper for ad-hoc queries, use Haiku for chat
```

### 3. Status Definitions

| Status | Meaning | Example |
|--------|---------|---------|
| `planning` | Spec written, design phase, not started | Initial idea being fleshed out |
| `in_progress` | Active work, making progress | Building the feature |
| `blocked` | Can't proceed, waiting on something | Needs external decision or info |
| `paused` | Intentionally paused, will resume | Deprioritized but not abandoned |
| `done` | Completed and shipped | Feature works, tests pass |
| `archived` | Old projects, reference only | Historical for learning |

### 4. Workflow

**Starting a new project:**
1. Create project file in `projects/{name}.md`
2. Fill in: Title, Status (planning), Description, Ask
3. Add to PROJECTS.md table
4. Write spec if it's a dev project

**During work:**
1. Update project file: Current State, Blockers, Related Files
2. Update PROJECTS.md: Status, Last Updated

**Completing project:**
1. Set Status to `done`
2. Update Current State with final summary
3. Move to ARCHIVE.md (optional, or just mark as done)

### 5. File Organization

```
workspace/
├── PROJECTS.md (master list)
├── projects/
│   ├── README.md
│   ├── cli-alias-setup.md
│   ├── local-model-integration.md
│   └── backlog-system.md
├── specs/
│   └── (specs for projects that need them)
└── (other workspace files)
```

## Success Criteria
- [ ] Master PROJECTS.md exists and is easy to scan
- [ ] Each project has dedicated file with full context
- [ ] Can pick up any project without reading chat history
- [ ] Status is always current and accurate
- [ ] Related files are linked, not buried in docs
- [ ] System doesn't get stale (actively maintained)

## Implementation Notes
- Keep PROJECTS.md simple (table view, quick scanning)
- Project files can be as detailed as needed
- Use relative links for file references
- Spec files go in `specs/`, not `projects/`
- Commit changes to GitHub whenever project status changes
