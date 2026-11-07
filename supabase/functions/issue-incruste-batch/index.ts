import { jsonResponse, errorResponse } from "../_shared/cors.ts";
import { requireUser, serviceClient } from "../_shared/supabase.ts";
import { signQrPayload } from "../_shared/qr.ts";
import { serve } from "../_shared/serve.ts";

interface GuestInput {
  first_name?: string;
  last_name?: string;
}

serve(async (req: Request) => {
  const auth = await requireUser(req);
  if (auth instanceof Response) return auth;

  const body = await req.json().catch(() => null);
  const invitationId = body?.invitation_id;
  const guests = body?.guests;
  if (!invitationId || !Array.isArray(guests) || guests.isEmpty) {
    return errorResponse("invitation_id and a non-empty guests array are required");
  }
  const cleanGuests = (guests as GuestInput[])
    .map((g) => ({
      first_name: (g.first_name ?? "").trim(),
      last_name: (g.last_name ?? "").trim(),
    }))
    .filter((g) => g.first_name.isNotEmpty && g.last_name.isNotEmpty);
  if (cleanGuests.isEmpty) return errorResponse("each guest needs first_name and last_name");
  if (cleanGuests.length > 50) return errorResponse("max 50 guests per batch", 422);

  const db = serviceClient();
  const { data: invitation, error: invError } = await db
    .from("invitations")
    .select("id, status, guest_id, events(id, max_incrustes_per_guest)")
    .eq("id", invitationId)
    .single();
  if (invError || !invitation) return errorResponse("invitation not found", 404);
  if (invitation.guest_id !== auth.user.id) return errorResponse("not your invitation", 403);
  if (invitation.status !== "active") return errorResponse("invitation is not active", 403);

  const event = Array.isArray(invitation.events) ? invitation.events[0] : invitation.events;
  const maxIncrustes = event?.max_incrustes_per_guest as number | null;
  if (maxIncrustes === 0) {
    return errorResponse("the host did not allow incrustes for this event", 403);
  }

  let remaining = cleanGuests.length;
  if (maxIncrustes !== null) {
    const { count, error: countError } = await db
      .from("incruste_tickets")
      .select("id", { count: "exact", head: true })
      .eq("parent_invitation_id", invitationId)
      .neq("status", "revoked");
    if (countError) return errorResponse(countError.message, 500);
    remaining = Math.max(0, maxIncrustes - (count ?? 0));
    if (remaining === 0) return errorResponse(`incruste limit reached (${maxIncrustes})`, 409);
  }

  const toCreate = cleanGuests.slice(0, remaining);
  const created: unknown[] = [];
  for (const g of toCreate) {
    const { data: ticket, error } = await db
      .from("incruste_tickets")
      .insert({
        parent_invitation_id: invitationId,
        guest_name: g.last_name,
        guest_first_name: g.first_name,
      })
      .select()
      .single();
    if (error) return errorResponse(error.message, 500);
    const qr = await signQrPayload({ v: 1, type: "incruste", eventId: event.id as string, ticketId: ticket.id });
    const { error: updError } = await db.from("incruste_tickets").update({ qr_payload: qr }).eq("id", ticket.id);
    if (updError) return errorResponse(updError.message, 500);
    created.push({ ...ticket, qr_payload: qr });
  }

  return jsonResponse(
    { created, created_count: created.length, skipped: cleanGuests.length - created.length },
    201,
  );
});
