# Project: Local Model Integration

**Status:** blocked  
**Last Updated:** 2026-07-02 — CPU inference too slow, viable only for CLI wrapper

## Description
Integrate local Ollama models (Mistral 7B/13B) as fallback agents to reduce Haiku token spend on basic tasks.

## Ask/Requirements
- Run local LLM models as alternative to Haiku for conversational chat
- Maintain fast response times (target <10 sec per response)
- Reduce Haiku token burn on mechanical/simple tasks
- Enable model switching between local and cloud dynamically

## Current State
- Ollama installed with Mistral 7B Instruct and 13B models
- Models integrated into OpenClaw config (`openclaw.json`)
- `ai` CLI wrapper functional for quick local queries (6 sec turnaround)
- Agent integration tested: CPU-only inference = 60+ seconds per response
- Conclusion: Not viable for interactive agent chat, but works for CLI

### What Works
- `ai "quick query"` — 6 second responses, reliable
- `ai --13b "harder question"` — Scales up when needed
- `ai --haiku "needs reasoning"` — Can still use cloud for complex stuff

### What Doesn't Work
- Full OpenClaw agent on 7B/13B — 60+ second latency kills conversation
- Switching main agent model to local — Same latency problem
- CPU-only inference for chat — Throughput insufficient

## Blockers
- **Hardware limitation:** ThinkPad X1 (no discrete GPU)
  - CPU-only inference: ~60-120 seconds per response at 7B/13B
  - Viable latency threshold for chat: <5-10 seconds
  - Gap is unbridgeable without GPU
  
- **Token budget not critical:** Initial panic about Haiku quota unfounded
  - Token bucket = continuous replenishment, not monthly cap
  - 200k token window refreshes as you use it
  - Haiku is cheaper and faster than local on CPU anyway

## Key Prompts
- "i have a feeling that we should be also be running the really simple stuff on a local model and save the tokens"
- "you can also just move between 7b and 13b without my approval because theyre both free and local"
- "so minstral instruct 7b woudl be better than minstral 13b for the chat?"
- "can we jsut ahve you run stuff in the background by defulat keeping me incrementally updated on what is going on?"

## Spec
See: `specs/local-model-integration.md` (not yet written)

## Related Files
- `openclaw.json` — Provider config for Ollama integration
- `~/.local/bin/ai` — CLI wrapper script (working)
- `TOOLS.md` — Hardware specs and constraints
- `MEMORY.md` — Lesson about planning before building

## Decision & Path Forward
**Recommendation:** Keep local models for ad-hoc CLI queries (`ai` wrapper), use Haiku for conversational agent work.

**Why:** 
- Local is fast enough for quick, non-interactive queries
- Haiku is faster AND cheaper for agent conversation
- Trying to force local as main agent hurts UX
- `ai` wrapper is genuinely useful for standalone tasks

## Notes
- This was a learning project about constraints and trade-offs
- Good reminder: always assess hardware limitations upfront
- Token budget panic turned out to be a misunderstanding (token bucket != monthly reset)
- Lesson: Plan viability before building, don't discover problems mid-implementation
