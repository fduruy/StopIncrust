# StopIncrust — Architecture

## Overview

- **Backend**: Supabase (Postgres + phone OTP Auth + Deno Edge Functions).
- **Apps**: iOS (Swift/SwiftUI) in `ios/`, Android (Kotlin/Compose) in `android/`.
- **QR codes**: HMAC-SHA256 signed payload (`QR_SIGNING_SECRET`), never plaintext sensitive data. All validation happens **server-side**.

## Data model

See `supabase/migrations/20251101000000_schema.sql`. Entities: `profiles`, `events`, `event_scanners`, `invitations`, `incruste_tickets`, `scans`.

Anti "incruste of incruste" rule: `incruste_tickets.parent_invitation_id` always references an `invitation`, never another ticket — an incruste can therefore never issue tickets.

## Endpoints (Edge Functions)

All functions require an `Authorization: Bearer <jwt>` header (user authenticated via OTP).

| Function | Method | Role | Body |
|---|---|---|---|
| `create-event` | POST | Host creates an event | `{name, event_date, location, max_incrustes_per_guest}` |
| `create-invitation` | POST | Host invites a Guest (app user, lookup by phone) | `{event_id, guest_phone}` → returns signed QR |
| `issue-incruste` | POST | Guest issues an incruste ticket (if allowed, within limit) | `{invitation_id, guest_name, guest_first_name}` → signed QR |
| `issue-incruste-batch` | POST | Guest issues several incruste tickets at once (e.g. from phone contacts) | `{invitation_id, guests: [{first_name, last_name}, ...]}` → `{created[], created_count, skipped}` |
| `add-scanner` | POST | Host designates a Guest as scanner for the event | `{event_id, scanner_phone}` |
| `validate-scan` | POST | Host or designated Guest-scanner validates a QR on event day | `{qr}` → `{valid, reason?, type, guest}` ; marks ticket `scanned` |
| `get-event` | GET `?event_id=` | Host / scanner / invitee views event, invitations, scans | — |

## Security scenarios covered

- Forged or copied QR → rejected (invalid HMAC signature / unknown ticket in DB).
- "Undesired" incruste → no ticket in DB, so no valid signed QR exists.
- Double scan → `already_scanned` (status + unique constraint on `scans`).
- Incruste whose parent invitation is revoked → `parent_invitation_revoked`.
- Only the Host and designated scanners (`event_scanners`) can call `validate-scan`.

## Local deployment

```bash
supabase start                 # dedicated terminal (stays open, streaming logs)
supabase status                # URLs and keys
supabase db reset              # apply migrations
supabase functions serve --env-file .env   # another dedicated terminal
```

Required secret: `QR_SIGNING_SECRET` (long, random) in a `.env` file **at the repo root** (copy from `supabase/.env.example`, gitignored).

Local keys (`supabase status`): **Publishable** `sb_publishable_...` = anon key (the one embedded in the apps), **Secret** `sb_secret_...` = service role key (local scripts/tests only, never in the app).

End-to-end flow test (event → invitation → incruste → valid/invalid scans):

```powershell
scripts/test-flow.ps1 -AnonKey <Publishable> -ServiceKey <Secret>
```
