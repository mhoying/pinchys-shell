# Project: Project Backlog System

**Status:** in_progress  
**Last Updated:** 2026-07-02 — Spec complete, building implementation

## Description
Build a structured system for tracking all in-flight projects, efforts, and planned work using external markdown files. Preserves durable information outside chat history and enables picking up projects without reading full session logs.

## Ask/Requirements
- Single source of truth for all standing efforts
- No information lost in chat compression or history
- Ability to pick up any project without reading session history
- Clear status visibility across all work
- Capture key human prompts that drove the work
- Durable, versioned project context files

## Current State
- Spec written: `specs/project-backlog-system.md`
- PROJECTS.md created as master list
- projects/ folder structure established
- Initial projects added (Pinchy Setup, Local Model Integration, this one)
- System ready for ongoing use

## Next Steps
1. Use this system for all future projects
2. Keep PROJECTS.md updated as status changes
3. Create project file for each new effort
4. Commit to GitHub whenever project changes

## Key Prompts
- "we should always have as a backlog or list of working efforts"
- "it should probably point to dedicated MDs that give adequate context to start or continue that task"
- "we want to have something where we've completed a milestone and there is no work in progress, but we expect we'll continue to work on it"
- "another thing we may want to capture is 'key prompts' and save them literally"

## Spec
See: `specs/project-backlog-system.md`

## Related Files
- `PROJECTS.md` — Master project list
- `projects/` — Individual project files
- `specs/project-backlog-system.md` — Full spec and guidelines

## Implementation Notes
- PROJECTS.md is a quick-scan table format
- Individual project files contain full context
- Status values: planning | in_progress | blocked | paused | milestone | done | archived
- Key Prompts preserve human intent and reasoning
- All changes committed to GitHub for version control

## Notes
- This is the system we're using now for all future work
- Keeps context durable and searchable
- Prevents information loss from chat history compression
- Makes it easy to resume work across sessions
