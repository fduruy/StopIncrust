import { jsonResponse, errorResponse } from "../_shared/cors.ts";
import { requireUser, serviceClient } from "../_shared/supabase.ts";
import { signQrPayload } from "../_shared/qr.ts";
import { serve } from "../_shared/serve.ts";

serve(async (req: Request) => {
  const auth = await requireUser(req);
  if (auth instanceof Response) return auth;

  const body = await req.json().catch(() => null);
  const invitationId = body?.invitation_id;
  const guestName = body?.guest_name?.trim();
  const guestFirstName = body?.guest_first_name?.trim();
  if (!invitationId || !guestName || !guestFirstName) {
    return errorResponse("invitation_id, guest_name and guest_first_name are required");
  }

  const db = serviceClient();
  const { data: invitation, error: invError } = await db
    .from("invitations")
    .select("*, events(*)")
    .eq("id", invitationId)
    .single();
  if (invError || !invitation) return errorResponse("invitation not found", 404);
  if (invitation.guest_id !== auth.user.id) return errorResponse("only the invited guest can issue incruste tickets", 403);
  if (invitation.status !== "active") return errorResponse("invitation is not active", 409);

  const event = invitation.events;
  const maxIncrustes = event.max_incrustes_per_guest as number | null;
  if (maxIncrustes === 0) {
    return errorResponse("the host did not allow incrustes for this event", 403);
  }

  if (maxIncrustes !== null) {
    const { count, error: countError } = await db
      .from("incruste_tickets")
      .select("id", { count: "exact", head: true })
      .eq("parent_invitation_id", invitationId)
      .neq("status", "revoked");
    if (countError) return errorResponse(countError.message, 500);
    if ((count ?? 0) >= maxIncrustes) {
      return errorResponse(`incruste limit reached (${maxIncrustes})`, 409);
    }
  }

  const ticketId = crypto.randomUUID();
  const claims = {
    v: 1 as const,
    type: "incruste" as const,
    ticketId,
    eventId: event.id,
    name: guestName,
    firstName: guestFirstName,
    exp: Math.floor(new Date(event.event_date).getTime() / 1000) + 24 * 3600,
  };
  const qrPayload = await signQrPayload(claims);

  const { data: ticket, error } = await db
    .from("incruste_tickets")
    .insert({ id: ticketId, parent_invitation_id: invitationId, guest_name: guestName, guest_first_name: guestFirstName, qr_payload: qrPayload })
    .select()
    .single();
  if (error) return errorResponse(error.message, 500);
  return jsonResponse({ incruste_ticket: { ...ticket, qr_payload: qrPayload } }, 201);
});
