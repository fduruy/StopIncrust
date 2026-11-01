import { jsonResponse, errorResponse } from "../_shared/cors.ts";
import { requireUser, serviceClient } from "../_shared/supabase.ts";
import { verifyQrPayload } from "../_shared/qr.ts";
import { serve } from "../_shared/serve.ts";

serve(async (req: Request) => {
  const auth = await requireUser(req);
  if (auth instanceof Response) return auth;

  const body = await req.json().catch(() => null);
  const qr = body?.qr?.trim();
  if (!qr) return errorResponse("qr is required");

  const claims = await verifyQrPayload(qr);
  if (!claims) return jsonResponse({ valid: false, reason: "invalid_or_expired_signature" }, 200);

  const db = serviceClient();
  const { data: event, error: eventError } = await db
    .from("events")
    .select("*")
    .eq("id", claims.eventId)
    .single();
  if (eventError || !event) return jsonResponse({ valid: false, reason: "unknown_event" }, 200);

  // Only the host or a designated scanner may validate tickets for this event.
  const isHost = event.host_id === auth.user.id;
  const { data: scannerRow } = await db
    .from("event_scanners")
    .select("user_id")
    .eq("event_id", event.id)
    .eq("user_id", auth.user.id)
    .maybeSingle();
  if (!isHost && !scannerRow) return errorResponse("you are not allowed to scan for this event", 403);

  if (claims.type === "invitation") {
    const { data: invitation, error } = await db
      .from("invitations")
      .select("*, profiles!invitations_guest_id_fkey(last_name, first_name)")
      .eq("id", claims.ticketId)
      .eq("event_id", event.id)
      .single();
    if (error || !invitation) return jsonResponse({ valid: false, reason: "unknown_ticket" }, 200);
    if (invitation.status === "revoked") return jsonResponse({ valid: false, reason: "revoked" }, 200);
    if (invitation.status === "scanned") return jsonResponse({ valid: false, reason: "already_scanned" }, 200);

    const { error: updError } = await db.from("invitations").update({ status: "scanned" }).eq("id", invitation.id);
    if (updError) return errorResponse(updError.message, 500);
    await db.from("scans").insert({ event_id: event.id, ticket_type: "invitation", ticket_id: invitation.id, scanned_by: auth.user.id });
    return jsonResponse({ valid: true, type: "invitation", guest: invitation.profiles }, 200);
  }

  // incruste ticket: must exist, belong to this event, and belong to an active invitation.
  const { data: ticket, error } = await db
    .from("incruste_tickets")
    .select("*, invitations!inner(id, event_id, status)")
    .eq("id", claims.ticketId)
    .single();
  if (error || !ticket || ticket.invitations.event_id !== event.id) {
    return jsonResponse({ valid: false, reason: "unknown_ticket" }, 200);
  }
  if (ticket.status === "revoked") return jsonResponse({ valid: false, reason: "revoked" }, 200);
  if (ticket.status === "scanned") return jsonResponse({ valid: false, reason: "already_scanned" }, 200);
  if (ticket.invitations.status === "revoked") {
    return jsonResponse({ valid: false, reason: "parent_invitation_revoked" }, 200);
  }

  const { error: updError } = await db.from("incruste_tickets").update({ status: "scanned" }).eq("id", ticket.id);
  if (updError) return errorResponse(updError.message, 500);
  await db.from("scans").insert({ event_id: event.id, ticket_type: "incruste", ticket_id: ticket.id, scanned_by: auth.user.id });
  return jsonResponse({
    valid: true,
    type: "incruste",
    guest: { last_name: ticket.guest_name, first_name: ticket.guest_first_name },
    via_invitation_id: ticket.parent_invitation_id,
  }, 200);
});
