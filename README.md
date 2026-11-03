# StopIncrust

iOS and Android mobile app.

## Repository layout

- `app/` — Flutter app (Dart): one codebase for iOS + Android, see `app/README.md`
- `supabase/` — Supabase backend: SQL migrations (schema + RLS) and Edge Functions (API)
- `docs/` — project documentation (see `docs/architecture.md`)
- `scripts/` — local end-to-end test scripts (`scripts/test-flow.ps1`)
- `ios/`, `android/` — legacy native skeletons (Swift / Kotlin), kept for reference; the app lives in `app/`

## Stack

- App: Flutter (Dart) — iOS + Android from one codebase; the final iOS build requires a Mac (or cloud CI)
- Backend: Supabase (Postgres + OTP Auth + Deno Edge Functions), see `docs/architecture.md`
- QR codes signed with HMAC-SHA256, 100 % server-side validation

## App setup (Windows)

See `app/README.md`: install Flutter SDK + Android Studio, then `cd app && flutter create . && flutter pub get`, put the local Publishable key in `app/lib/config.dart`, press F5 in VS Code.

## Getting started

1. Clone the repository:
   ```bash
   gh repo clone fduruy/StopIncrust
   ```
2. Open the project in VS Code.
3. Commit and push your changes directly on `main` while the project is bootstrapping.

## Local backend

```bash
supabase start                    # dedicated terminal (stays open, streaming logs)
supabase status                   # URLs and keys
supabase db reset                 # apply migrations
supabase functions serve --env-file .env   # another dedicated terminal
```

`.env` at the repo root must contain `QR_SIGNING_SECRET` (copy `supabase/.env.example`). It is gitignored — never commit it.

## Workflow

- Bootstrap phase: work directly on `main`.
- Once the project matures: feature branches + pull requests with review.
- Track tasks with GitHub issues.
- Pull with rebase before pushing to avoid merge conflicts:
  ```bash
  git pull --rebase
  ```
