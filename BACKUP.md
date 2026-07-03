# Pinchy's Shell - Backup System

## Overview
This repository serves as a redundant backup for OpenClaw configuration, identity, memory, and notes. The backup system uses **Heartbeat-Driven Backups** with a **7-day reminder**.

## How It Works

### Heartbeat Backups
- **When:** During conversational sessions with Mr. Barnaby
- **How:** I manually commit and push any changes
- **What:** Captures all updates in real-time during active use
- **Files backed up:**
  - `AGENTS.md` - Workflow preferences
  - `SOUL.md` - Personality & boundaries
  - `USER.md` - User profile (Mr. Barnaby)
  - `IDENTITY.md` - Assistant identity (Pinchy)
  - `TOOLS.md` - Local environment config
  - `HEARTBEAT.md` - Scheduled checks
  - `memory/` - Long-term memory files
  - All other config files

### 7-Day Reminder
- **When:** During heartbeat checks, I verify last backup timestamp
- **If overdue:** I remind you that it's been >7 days since last backup
- **Action:** Run `pb` command to backup immediately

### Why This Approach?
1. **Laptop-friendly:** No scheduled jobs on a sleeping laptop
2. **Real-time:** Captures changes during active sessions
3. **Safety net:** 7-day reminder ensures you never go too long without backup
4. **Zero friction:** One-word command `pb` to backup anytime

## Quick Commands

**Backup now:**
```bash
pb
```

**Check backup age:**
```bash
check-backup-age
```

**View last backup info:**
```bash
cat ~/.openclaw/workspace/.backup-state.json
```

## How to Interpret Reminders

✓ `Backup is current (2d ago)` → All good, no action needed  
⚠ `Last backup was 8 days ago. Run 'pb' to backup.` → You should backup soon  
⚠ `Never backed up! Run 'pb' to backup now.` → First time setup

## Repository
- **URL:** https://github.com/mhoying/pinchys-shell
- **Access:** Public
- **Branch:** main
