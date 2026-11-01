import { corsHeaders, jsonResponse, errorResponse } from "../_shared/cors.ts";
import { requireUser, serviceClient } from "../_shared/supabase.ts";
import { signQrPayload } from "../_shared/qr.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  const auth = await requireUser(req);
  if (auth instanceof Response) return auth;

  const body = await req.json().catch(() => null);
  const eventId = body?.event_id;
  const guestPhone = body?.guest_phone?.trim();
  if (!eventId || !guestPhone) return errorResponse("event_id and guest_phone are required");

  const db = serviceClient();
  const { data: event, error: eventError } = await db
    .from("events")
    .select("*")
    .eq("id", eventId)
    .eq("host_id", auth.user.id)
    .single();
  if (eventError || !event) return errorResponse("event not found or not owned by you", 404);

  const { data: guest, error: guestError } = await db
    .from("profiles")
    .select("*")
    .eq("phone", guestPhone)
    .single();
  if (guestError || !guest) return errorResponse("guest must be a registered app user (phone not found)", 404);
  if (guest.id === auth.user.id) return errorResponse("host cannot invite themselves", 400);

  const invitationId = crypto.randomUUID();
  const claims = {
    v: 1 as const,
    type: "invitation" as const,
    ticketId: invitationId,
    eventId: event.id,
    name: guest.last_name,
    firstName: guest.first_name,
    exp: Math.floor(new Date(event.event_date).getTime() / 1000) + 24 * 3600,
  };
  const qrPayload = await signQrPayload(claims);

  const { data: invitation, error } = await db
    .from("invitations")
    .insert({ id: invitationId, event_id: event.id, guest_id: guest.id, qr_payload: qrPayload })
    .select()
    .single();
  if (error) {
    if (error.code === "23505") return errorResponse("this guest already has an invitation for this event", 409);
    return errorResponse(error.message, 500);
  }
  return jsonResponse({ invitation: { ...invitation, qr_payload: qrPayload } }, 201);
});
