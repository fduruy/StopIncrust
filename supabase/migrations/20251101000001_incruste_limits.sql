-- max_incrustes_per_guest semantics:
--   0    = incruste tickets forbidden for this event
--   N > 0 = at most N incruste tickets per guest invitation
--   NULL = unlimited (fully open event)
alter table public.events alter column max_incrustes_per_guest drop not null;
