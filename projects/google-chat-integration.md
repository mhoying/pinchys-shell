# Project: Google Chat Integration

**Status:** paused  
**Created:** 2026-07-02  
**Last Updated:** 2026-07-02

## Description
Enable two-way communication between Pinchy and Mr. Barnaby via Google Chat:
1. Mr. Barnaby sends messages to Pinchy through Google Chat
2. Pinchy can proactively send messages to Mr. Barnaby via Google Chat anytime

## Ask/Requirements
- Receive inbound messages from Google Chat and route to Pinchy
- Send outbound messages from Pinchy to Google Chat on-demand
- Single user (Mr. Barnaby only)
- Integrate with existing OpenClaw workflow without disrupting current chat

## Current State
- Project created, scope defined
- Tech spec written (Google Chat Bot API method)
- Implementation not started

## Next Steps
1. ✓ Determine integration method → Google Chat Bot API
2. ✓ Write tech spec: `specs/google-chat-integration.md`
3. ✓ Make all decisions (same machine, async, threading, service account, plain text)
4. Set up Google Chat Space and bot credentials
5. Build webhook receiver (async, threaded)
6. Add `send_chat_message()` tool to Pinchy
7. Test inbound message routing
8. Test outbound message sending
9. Integration testing (full two-way flow)

## Key Prompts
- "also have pinchy be able to text me via google chat whenever it wants"

## Blockers / Unknowns
- None — all decisions made, ready for setup

## Related Files
- `specs/google-chat-integration.md` (tech spec)

## Implementation Notes
- Keep inbound and outbound paths separate for clarity
- Preserve Mr. Barnaby's identity (use his existing Pinchy context)
- Ensure Pinchy can access all tools/functions from Google Chat context
