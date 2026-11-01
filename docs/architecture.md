# StopIncrust — Architecture

## Vue d'ensemble

- **Backend** : Supabase (Postgres + Auth OTP par téléphone + Edge Functions Deno).
- **Apps** : iOS (Swift/SwiftUI) dans `ios/`, Android (Kotlin/Compose) dans `android/`.
- **QR codes** : payload signé HMAC-SHA256 (`QR_SIGNING_SECRET`), jamais de données sensibles en clair. Toute validation se fait **côté serveur**.

## Modèle de données

Voir `supabase/migrations/20251101000000_schema.sql`. Entités : `profiles`, `events`, `event_scanners`, `invitations`, `incruste_tickets`, `scans`.

Règle anti « incruste d'incruste » : `incruste_tickets.parent_invitation_id` référence toujours une `invitation`, jamais un autre ticket — un incruste ne peut donc jamais émettre de ticket.

## Endpoints (Edge Functions)

Toutes les fonctions exigent un header `Authorization: Bearer <jwt>` (utilisateur authentifié via OTP).

| Fonction | Méthode | Rôle | Corps |
|---|---|---|---|
| `create-event` | POST | Host crée un événement | `{name, event_date, location, max_incrustes_per_guest}` |
| `create-invitation` | POST | Host invite un Guest (user app, lookup par téléphone) | `{event_id, guest_phone}` → renvoie le QR signé |
| `issue-incruste` | POST | Guest émet un ticket d'incruste (si autorisé, limite respectée) | `{invitation_id, guest_name, guest_first_name}` → QR signé |
| `validate-scan` | POST | Host ou Guest-scanner désigné valide un QR le jour J | `{qr}` → `{valid, reason?, type, guest}` ; marque le ticket `scanned` |
| `get-event` | GET `?event_id=` | Host / scanner / invité consulte l'événement, invitations, scans | — |

## Scénarios de sécurité couverts

- QR forgé ou copié → rejeté (signature HMAC invalide / ticket inconnu en base).
- Incruste « non désiré » → aucun ticket en base, donc aucun QR signé valide.
- Double scan → `already_scanned` (statut + contrainte unique sur `scans`).
- Incruste dont l'invitation parente est révoquée → `parent_invitation_not_active`.
- Seuls Host et scanners désignés (`event_scanners`) peuvent appeler `validate-scan`.

## Déploiement local

```bash
supabase start
supabase db reset            # applique les migrations
supabase functions serve     # sert les Edge Functions
```

Secrets requis : `QR_SIGNING_SECRET` (long, aléatoire) via `supabase secrets set`.
