# MEMORY.md - Pinchy's Operational Memory

## Hardware & Performance

**Hardware:** ThinkPad X1 (no GPU) = CPU-only. Local models = 60-120 sec latency. Not viable for agent chat. CLI wrapper works fine (~6 sec).

**Models:**
1. Local `ai` CLI: ~6 sec, free
2. Haiku: conversation, fast, cheap
3. Haiku + /thinking medium: when reasoning needed
4. Sonnet: when Haiku isn't enough
5. Opus: emergency only

**Token Budget:** Token bucket = continuous replenishment, not monthly reset. Safe to use Haiku.

## Development & Projects

**Spec first, then build.** All specs in `/home/mattie/.openclaw/workspace/specs/`. Don't build without a spec.

**Projects:** `/home/mattie/.openclaw/workspace/PROJECTS.md` (master list), individual project files in `/projects/`, specs in `/specs/`.

**Files:** Always use absolute paths (`/home/mattie/.openclaw/workspace/...`). Copy/paste compatible.

## Daily Operations

**Daily Notes:** Stored in `memory/YYYY-MM-DD.md`. Create one per session.

**Backup:** `pb` command anytime, `check-backup-age` to verify. 7-day reminder.

## Standing Rules

- **Sync memory/* to GitHub automatically** — commit and push daily notes every session
- Commit significant changes to GitHub
- Use absolute paths always
- Read AGENTS.md, USER.md at session start, apply preferences
- When in doubt about tone, check SOUL.md
