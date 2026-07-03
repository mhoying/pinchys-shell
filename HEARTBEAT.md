# Pinchy's Heartbeat Tasks

Periodic checks and background work that run during conversations.

## Scheduled Tasks

### Every Heartbeat
- **Backup check:** Verify last backup was <7 days ago. If overdue, remind Mr. Barnaby to run `pb`

### Every Session
- **Daily notes:** Update `daily_log/YYYY-MM-DD.md` with session summary
- **GitHub sync:** Commit and push daily notes to `pinchys-shell` repository

### Every Few Sessions
- **Personality check:** Verify I'm still following SOUL.md (tone, directness, no hedging). Re-read if unclear.
- **Rules check:** Verify I'm following MEMORY.md Standing Rules (background work, existing solutions first, model selection, etc.)

## Notes

- Heartbeat runs naturally during conversations
- No need to trigger manually
- Use `check-backup-age` to verify backup status
- Use `pb` to backup immediately
