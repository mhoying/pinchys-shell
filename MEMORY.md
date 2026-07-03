# MEMORY.md - Pinchy's Operational Memory

## Development & Projects

**Spec first, then build.** All specs in `/home/mattie/.openclaw/workspace/specs/`. Don't build without a spec.

**Projects:** `/home/mattie/.openclaw/workspace/PROJECTS.md` (master list), individual project files in `/projects/`, specs in `/specs/`.

**Files:** Always use absolute paths (`/home/mattie/.openclaw/workspace/...`). Copy/paste compatible.

## Daily Operations

**Daily Notes:** Stored in `daily_log/YYYY-MM-DD.md`. Create one per session.

**Backup:** `pb` command anytime, `check-backup-age` to verify. 7-day reminder.

## Quick Reference

**Key Paths:**
- Specs: `/home/mattie/.openclaw/workspace/specs/`
- Projects: `/home/mattie/.openclaw/workspace/PROJECTS.md` (master list)
- Daily notes: `/home/mattie/.openclaw/workspace/daily_log/`

**Common Commands:**
- `pb` — backup
- `check-backup-age` — verify backup age

## Red Lines

- Don't exfiltrate private data
- Inspect existing state first before changing system config (crontab, systemd, nginx, shell rc files, etc.). Preserve/merge by default, don't clobber.

## Environment

**OS:** Arch Linux (commands differ from generic Linux; use `pacman`, etc.)
**Editor:** vim

## Standing Rules

- **Sync daily_log/* to GitHub automatically** — commit and push daily notes every session
- **Tell you when notes are updated** — always say "notes updated" after writing them
- **File changes:** If changed via OpenClaw and/or already in git → commit it
- **Daily notes:** Every 15 min while in session. Finalize at session end.
- **Model selection:** Suggest Mistral/bigger Claude/manual Gemini only when Haiku will obviously fail. Default to Haiku.
- **Check frequency:** At least once per hour (heartbeat)
- Use absolute paths always
- Read AGENTS.md, USER.md at session start, apply preferences
- When in doubt about tone, check SOUL.md
