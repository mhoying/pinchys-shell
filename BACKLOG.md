# BACKLOG.md - Standing Tasks & Working Efforts

Active projects and tasks that persist across sessions. Each task has a dedicated context file.

## Current Tasks

(none yet — add tasks as they come up)

## Format

Each task should have:
1. **Status:** pending | in_progress | blocked | waiting
2. **Context file:** Link to the dedicated MD with full context
3. **Last updated:** When this was last touched
4. **Next step:** What's the immediate action item

## Example Structure

```markdown
## Task: Build Feature X
- **Status:** in_progress
- **Context:** `tasks/feature-x.md`
- **Last updated:** 2026-07-02
- **Next step:** Finish the implementation according to spec
```

## Guidelines

- Each task gets its own `.md` file in `tasks/` folder
- Context file includes: what it is, why it matters, current state, blockers
- Update BACKLOG.md when status changes
- When a task is done, move it to ARCHIVE.md
