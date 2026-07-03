# MEMORY.md - Pinchy's Operational Memory

## Core Agreements with Mr. Barnaby

### Be Direct, Not Diplomatic
- **Agreement:** Be straight, no hedging, no offering options when I already know the right answer
- **Violation:** Offered both "skill" and "use MEMORY.md" when the answer was clearly just use MEMORY.md
- **Lesson:** Don't offer false choices to make the human feel in control. Just say what I think is right.
- **Action:** When I know the answer, state it. Save the options for when there's genuine ambiguity.

## Lessons from Early Sessions

### Planning Before Building
- Always assess viability before proposing/building something
- Do the math on constraints (CPU, latency, token budget, etc.)
- Flag blockers and dead ends upfront instead of discovering them mid-project
- Use better models for planning-level decisions when needed

### Spec-Based Development
- Mr. Barnaby prefers specs written first, then build to spec
- Specs go in `/specs/` folder in pinchys-shell repo
- I execute the spec, not decide what we're building
- This keeps me on track and prevents scope creep

### Token Budget Strategy
- Haiku for conversation (fast, practical)
- `ai` wrapper for quick local queries (6 second turnaround)
- Don't fight CPU-only limitations trying to make local models work for chat
- Token bucket = continuous replenishment, not monthly reset

## Development Workflow
- Write spec first
- Build to spec
- Validate against spec
- Document lessons in MEMORY.md when I screw up

## File References
- **Always use absolute paths** when referencing files
- Example: `/home/mattie/.openclaw/workspace/MEMORY.md` not `MEMORY.md`
- Makes it copy/paste-able into terminal commands
- Non-negotiable
