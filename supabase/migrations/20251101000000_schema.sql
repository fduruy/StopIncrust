-- StopIncrust schema
-- Domain: Host creates private Events, issues unique QR Invitations to Guests,
-- Guests may issue IncrusteTickets (max depth = 1: an incruste can never invite).

create type public.ticket_type as enum ('invitation', 'incruste');

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  phone text unique not null,
  first_name text not null,
  last_name text not null,
  created_at timestamptz not null default now()
);

create table public.events (
  id uuid primary key default gen_random_uuid (),
  host_id uuid not null references public.profiles (id),
  name text not null,
  event_date timestamptz not null,
  location text not null,
  max_incrustes_per_guest int not null default 0 check (max_incrustes_per_guest >= 0),
  created_at timestamptz not null default now()
);

-- Guests allowed by the Host to scan QR codes on event day.
create table public.event_scanners (
  event_id uuid not null references public.events (id) on delete cascade,
  user_id uuid not null references public.profiles (id) on delete cascade,
  primary key (event_id, user_id)
);

-- Unique invitation Host -> Guest. Only app users can be guests.
create table public.invitations (
  id uuid primary key default gen_random_uuid (),
  event_id uuid not null references public.events (id) on delete cascade,
  guest_id uuid not null references public.profiles (id),
  qr_payload text not null unique,
  status text not null default 'active' check (status in ('active', 'revoked', 'scanned')),
  created_at timestamptz not null default now(),
  unique (event_id, guest_id)
);

-- Incruste ticket issued by a Guest. parent_invitation_id is always an
-- invitation (never another incruste), which enforces "no incruste of incruste".
create table public.incruste_tickets (
  id uuid primary key default gen_random_uuid (),
  parent_invitation_id uuid not null references public.invitations (id) on delete cascade,
  guest_name text not null,
  guest_first_name text not null,
  qr_payload text not null unique,
  status text not null default 'active' check (status in ('active', 'revoked', 'scanned')),
  created_at timestamptz not null default now()
);

create table public.scans (
  id uuid primary key default gen_random_uuid (),
  event_id uuid not null references public.events (id) on delete cascade,
  ticket_type public.ticket_type not null,
  ticket_id uuid not null,
  scanned_by uuid not null references public.profiles (id),
  scanned_at timestamptz not null default now(),
  unique (event_id, ticket_type, ticket_id)
);

create index invitations_event_idx on public.invitations (event_id);
create index incruste_parent_idx on public.incruste_tickets (parent_invitation_id);
create index scans_event_idx on public.scans (event_id);

alter table public.profiles enable row level security;
alter table public.events enable row level security;
alter table public.event_scanners enable row level security;
alter table public.invitations enable row level security;
alter table public.incruste_tickets enable row level security;
alter table public.scans enable row level security;

-- profiles: read own, update own.
create policy "profiles self read" on public.profiles
  for select using (auth.uid () = id);
create policy "profiles self update" on public.profiles
  for update using (auth.uid () = id);
create policy "profiles self insert" on public.profiles
  for insert with check (auth.uid () = id);
-- Hosts need to look up guests by phone when creating invitations.
create policy "profiles lookup by phone" on public.profiles
  for select using (exists (select 1 from public.events e where e.host_id = auth.uid ()));

-- events: host full access.
create policy "events host all" on public.events
  for all using (auth.uid () = host_id) with check (auth.uid () = host_id);

-- event_scanners: host manages, scanners can read.
create policy "scanners host all" on public.event_scanners
  for all using (exists (select 1 from public.events e where e.id = event_id and e.host_id = auth.uid ()));
create policy "scanners self read" on public.event_scanners
  for select using (auth.uid () = user_id);

-- invitations: host of event sees all; guest sees own.
create policy "invitations host read" on public.invitations
  for select using (exists (select 1 from public.events e where e.id = event_id and e.host_id = auth.uid ()));
create policy "invitations guest read" on public.invitations
  for select using (auth.uid () = guest_id);

-- incruste tickets: host of event, or owner guest of parent invitation.
create policy "incrustes host read" on public.incruste_tickets
  for select using (exists (
    select 1 from public.invitations i join public.events e on e.id = i.event_id
    where i.id = parent_invitation_id and e.host_id = auth.uid ()));
create policy "incrustes guest read" on public.incruste_tickets
  for select using (exists (
    select 1 from public.invitations i
    where i.id = parent_invitation_id and i.guest_id = auth.uid ()));

-- scans: host and designated scanners of the event.
create policy "scans host read" on public.scans
  for select using (exists (select 1 from public.events e where e.id = event_id and e.host_id = auth.uid ()));
create policy "scans scanner read" on public.scans
  for select using (exists (select 1 from public.event_scanners s where s.event_id = scans.event_id and s.user_id = auth.uid ()));
