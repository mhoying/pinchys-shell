# Spec: Daily Notes System

## Overview
Structured daily log captured in `memory/YYYY-MM-DD.md` files. Records session work, decisions, corrections, and project progress. Updated every 15 minutes to capture progress even if session ends abruptly.

## File Location & Naming
- Location: `memory/YYYY-MM-DD.md`
- Create fresh file each calendar day
- Example: `memory/2026-07-02.md`

## Structure

### 1. Session Summary
Brief overview of what was accomplished in this session.

```markdown
## Session Summary
- Date: 2026-07-02
- Time: 19:44 - 21:50 PDT
- Focus: Pinchy setup, local model integration, backlog system
- Status: All major setup tasks complete, ready for ongoing development
```

### 2. Decisions Made
Every decision made during the session with context.

```markdown
## Decisions

- **Model Strategy:** Use Haiku for conversation, local `ai` CLI for quick queries. Local models too slow for agent chat.
- **Backup System:** Heartbeat-driven (during chats) + 7-day reminder. No nightly cron (laptop sleeps).
- **Project Tracking:** Implement PROJECTS.md + individual project files with key prompts captured.
- **Development Workflow:** Spec-first development. All specs in `/specs/` folder.
- **Token Budget:** Token bucket model (continuous replenishment), not monthly cap. Safe to use Haiku.
```

### 3. Corrections & Lessons
Times when Mr. Barnaby corrected me or I had to learn something.

```markdown
## Corrections & Lessons

- **Lesson:** Don't hedge. When I know the answer, state it. Offering false choices wastes time.
- **Lesson:** Always assess viability before building. Do the math on constraints upfront.
- **Correction:** OpenClaw defaults to Crestodian from CLI when config is set. Use `openclaw tui` or alias `pinchy` to get to main agent.
- **Correction:** Local Mistral on CPU = 60+ sec latency. Not viable for agent chat, only for CLI wrapper.
```

### 4. Projects & Progress
Current status of each project worked on, with delta/changes.

```markdown
## Projects & Progress

| Project | Status | Delta/Change |
|---------|--------|--------------|
| Pinchy Setup | done | ✓ Complete — all config and identity locked in |
| Local Model Integration | blocked | ✓ Tested, determined not viable for agent chat |
| Project Backlog System | in_progress | ✓ Spec written, PROJECTS.md + project files created |

### Detailed Progress
- **Pinchy Setup:** Identity files created, MEMORY.md established, GitHub backup working
- **Local Model Integration:** Ollama installed, models tested, `ai` wrapper functional but agent integration too slow
- **Project Backlog System:** Full spec in place, 3 initial projects documented, system ready for use
```

## Update Frequency
- **Every 15 minutes:** Update the daily notes file
  - Add new decisions
  - Log corrections as they happen
  - Update project progress
  - Keep summary current

- **On session end:** Final summary and full context capture

## Format Guidelines

- **Decisions:** Clear statement + brief context (1-2 lines)
- **Corrections:** What was wrong + what we learned (1-2 lines)
- **Projects:** Project name, current status, what changed (delta)
- **Time stamps:** Include in session summary and major decision blocks if helpful

## Example Full File

```markdown
# Daily Notes - 2026-07-02

## Session Summary
- Date: 2026-07-02
- Time: 19:44 - 21:50 PDT
- Duration: 2h 6m
- Focus: Initial Pinchy setup, local model testing, backlog system design
- Status: Setup complete, ready for ongoing work

## Decisions Made

- **Identity:** Pinchy = crab assistant, direct/sarcastic, no corporate fluff
- **User:** Mr. Barnaby, West Philly background, curses naturally
- **Model Strategy:** Haiku for chat, local models for CLI only
- **Backup:** Heartbeat-driven with 7-day reminder (no cron, laptop sleeps)
- **Development:** Spec-first approach, all specs in `/specs/` folder
- **Project Tracking:** PROJECTS.md + individual project files with key prompts
- **Token Budget:** Understood as token bucket (continuous), not monthly reset

## Corrections & Lessons

- **Lesson:** Be direct, don't hedge when answer is clear
- **Lesson:** Always assess viability before building
- **Lesson:** Plan constraints upfront, don't discover mid-project
- **Correction:** OpenClaw defaults to Crestodian when config is set
- **Correction:** CPU inference at 60+ sec is not viable for agent chat

## Projects & Progress

| Project | Status | Delta |
|---------|--------|-------|
| Pinchy Setup | done | Complete |
| Local Model Integration | blocked | Not viable for agent |
| Project Backlog System | in_progress | System live |

### Detailed Changes
- **Pinchy Setup:** IDENTITY.md, SOUL.md, USER.md created; MEMORY.md with core agreements; GitHub backup operational
- **Local Model Integration:** Ollama + Mistral models installed; tested with agent (too slow); CLI wrapper works fine
- **Project Backlog System:** Spec written and approved; PROJECTS.md created; 3 initial projects documented; system ready to use

## Files Created/Modified
- IDENTITY.md, SOUL.md, USER.md, AGENTS.md, TOOLS.md
- MEMORY.md (core agreements)
- HEARTBEAT.md (backup check task)
- BACKLOG.md (standing tasks list)
- PROJECTS.md (project master list)
- projects/ (pinchy-setup.md, local-model-integration.md, project-backlog-system.md)
- specs/ (project-backlog-system.md, daily-notes-system.md)
- openclaw.json (Ollama config)
- ~/.local/bin/ai (CLI wrapper)
- ~/.local/bin/pb (backup command)
- ~/.local/bin/check-backup-age (backup monitor)

## Next Session
- Use daily notes system (this spec)
- Continue with #2 from improvements list (actual boundaries/character)
- Look for opportunities to use spec-first development
```

## Implementation Notes
- Create memory/ folder if it doesn't exist
- Start new file each calendar day
- Update file every 15 minutes during active sessions
- Commit to GitHub daily
- Use this as input for MEMORY.md weekly reviews
- Keep language casual/raw (this is a log, not polished)

## Success Criteria
- [ ] Daily notes file created and updated consistently
- [ ] All decisions captured
- [ ] Corrections logged in real-time
- [ ] Project progress tracked with deltas
- [ ] Easy to scan and understand
- [ ] Committed to GitHub daily
