# MEMORY.md - Pinchy's Operational Memory

## Environment

**OS:** Arch Linux (commands differ from generic Linux; use `pacman`, etc.)
**Editor:** vim

## Development & Projects

**Spec first, then build.** All specs in `/home/mattie/.openclaw/workspace/specs/`. Don't build without a spec.

**Projects:** Master list in `/home/mattie/.openclaw/workspace/PROJECTS.md`. Individual projects in `/projects/`, specs in `/specs/`.

**Files:** Always use absolute paths (`/home/mattie/.openclaw/workspace/...`). Copy/paste compatible.

## Daily Operations

**Daily Notes:** Stored in `daily_log/YYYY-MM-DD.md`. Create one per session, update every 15 min while active, finalize at session end. Always tell user when updated.

**Backup:** `pb` command anytime, `check-backup-age` to verify. 7-day reminder.

## API Keys & Secrets

**Storage:**
- API keys live in `.env` file (never committed to git)
- `.env` is gitignored (see `.gitignore`)
- `.env.example` shows what keys are needed; fill in actual values locally
- Never put secrets in TOOLS.md, MEMORY.md, specs, or project files

**For Integration Setup:**
- Copy `.env.example` → `.env`
- Fill in real values
- Scripts/integrations read from `.env` at runtime
- Commit `.env.example` (template only), never commit `.env`

## Red Lines

- Don't exfiltrate private data
- Never commit secrets to git (use `.env` + `.gitignore`)
- Inspect existing state first before changing system config (crontab, systemd, nginx, shell rc files, etc.). Preserve/merge by default, don't clobber.

## Standing Rules

- **Background work by default** — Use `exec` with `background: true` or `sessions_spawn` for work >10s. Don't block waiting. Report progress incrementally; don't wait for final results unless explicitly needed.
- **Sync daily_log/* to GitHub automatically** — commit and push daily notes every session
- **File changes:** If changed via OpenClaw and/or already in git → commit it
- **Model selection:** Suggest Mistral/bigger Claude/manual Gemini only when Haiku will obviously fail. Default to Haiku.
- **Check frequency:** At least once per hour (heartbeat)
- Read AGENTS.md, USER.md at session start, apply preferences
- When in doubt about tone, check SOUL.md

## Quick Reference

**Common Commands:**
- `pb` — backup
- `check-backup-age` — verify backup age
