# Pinchy's Shell - Backup System

## Overview
This repository serves as a redundant backup for OpenClaw configuration, identity, memory, and notes. The backup system uses **Option 3: Hybrid Approach**.

## How It Works

### Nightly Automated Backup
- **When:** Every night at 2:00 AM PDT
- **How:** Systemd timer triggers `backup-to-github.sh`
- **What:** Automatically commits and pushes any changes to GitHub
- **Files backed up:**
  - `AGENTS.md` - Workflow preferences
  - `SOUL.md` - Personality & boundaries
  - `USER.md` - User profile (Mr. Barnaby)
  - `IDENTITY.md` - Assistant identity (Pinchy)
  - `TOOLS.md` - Local environment config
  - `HEARTBEAT.md` - Scheduled checks
  - `memory/` - Long-term memory files
  - `backup-to-github.sh` - This script

### Heartbeat Backup
- **When:** During conversational heartbeat checks
- **What:** I manually commit and push if there are recent changes
- **Purpose:** Captures updates between nightly backups

### Why Both?
1. **Nightly cron:** Never lose more than 24 hours of work
2. **Heartbeat:** Captures urgent changes immediately
3. **Total redundancy:** Covers all scenarios

## System Files

**Service unit:** `~/.config/systemd/user/pinchys-backup.service`  
**Timer unit:** `~/.config/systemd/user/pinchys-backup.timer`  
**Backup script:** `./backup-to-github.sh`

## Checking Status

```bash
# Check timer status
systemctl --user status pinchys-backup.timer

# View timer logs
journalctl --user -u pinchys-backup.service -n 20

# Check next scheduled run
systemctl --user list-timers pinchys-backup.timer
```

## Backup Log
Backups are logged to: `/tmp/pinchy-backup.log`

View recent backups:
```bash
tail -20 /tmp/pinchy-backup.log
```

## Repository
- **URL:** https://github.com/mhoying/pinchys-shell
- **Access:** Public
- **Branch:** main
