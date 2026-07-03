# Tech Spec: Google Chat Bot API Integration

**Status:** draft  
**Created:** 2026-07-02  
**Method:** Google Chat Bot API (two-way)

## Overview
Integrate Pinchy with Google Chat via the Google Chat Bot API to:
1. Receive messages from Mr. Barnaby's Google Chat space
2. Send proactive messages from Pinchy back to Google Chat

## Architecture

```
Google Chat Space
    ↓ (message event)
    ↓
Bot Webhook Receiver (OpenClaw task/cron)
    ↓ (routes to Pinchy)
    ↓
Pinchy Agent (process message, generate response)
    ↓ (outbound message)
    ↓
Google Chat Bot API (send reply)
    ↓
Google Chat Space
```

## Components

### 1. Google Chat Bot Setup
- Create bot in Google Chat admin console
- Get bot webhook URL (message events)
- Get bot credentials/API key for outbound messages
- Add bot to a Google Chat space

### 2. Inbound Handler
- HTTP endpoint (webhook receiver) that listens for Google Chat message events
- Parses message payload (sender, text, thread ID, space ID)
- Routes to Pinchy for processing
- Responds synchronously or async (depends on Google Chat message ack requirements)

### 3. Outbound Sender
- Function accessible from Pinchy: `send_to_google_chat(message, space_id)`
- Uses Google Chat API to post messages to a space
- Handles threading (optional, for multi-turn conversations)

### 4. Pinchy Integration
- New tool: `send_chat_message(text)` (wraps outbound sender)
- Tool available in Pinchy's execution context
- Can be called anytime during task execution

## Google Chat Bot API Details

### Authentication
- Bot webhook: Google automatically verifies requests (signed headers)
- API calls: Service account key or OAuth token
- Store credentials securely in OpenClaw config

### Message Events
- User sends message → Google Chat posts to webhook
- Webhook payload includes: sender, text, space ID, thread ID, timestamp

### Sending Messages
- POST to `https://chat.googleapis.com/v1/spaces/{spaceId}/messages`
- Requires `Authorization: Bearer <token>`
- Message format: `{ "text": "..." }` (simple) or structured cards

## Implementation Steps

1. **Setup Phase**
   - Create Google Chat bot in admin console
   - Get webhook URL and API credentials
   - Store credentials in OpenClaw config / TOOLS.md

2. **Infrastructure Phase**
   - Build webhook receiver (HTTP endpoint)
   - Deploy on same machine or accessible endpoint
   - Register webhook URL with bot

3. **Integration Phase**
   - Add `send_chat_message(text)` tool to Pinchy
   - Test inbound message routing
   - Test outbound message sending

4. **Testing Phase**
   - Send message from Google Chat → verify Pinchy receives
   - Have Pinchy send message → verify appears in Google Chat
   - Test multi-turn conversation flow

## Config Requirements

```json
{
  "googleChat": {
    "botWebhookUrl": "https://chat.googleapis.com/v1/spaces/...",
    "botName": "Pinchy",
    "spaceId": "AAAAA...",
    "apiKey": "...",
    "localWebhookPort": 3000,
    "localWebhookPath": "/google-chat-webhook"
  }
}
```

## Decisions Made

- **Inbound handler location:** Same machine as Pinchy
- **Message acking:** Async (Pinchy can take time, no need for immediate response)
- **Threading:** Yes, replies thread into conversation
- **Auth method:** Service account key
- **Message format:** Plain text only

## Related

- Project: `projects/google-chat-integration.md`
- OpenClaw docs: Check for built-in bot/messaging integrations
