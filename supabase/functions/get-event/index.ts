import { corsHeaders, jsonResponse, errorResponse } from "../_shared/cors.ts";
import { requireUser, serviceClient } from "../_shared/supabase.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
  const auth = await requireUser(req);
  if (auth instanceof Response) return auth;

  const url = new URL(req.url);
  const eventId = url.searchParams.get("event_id");
  if (!eventId) return errorResponse("event_id query param is required");

  const db = serviceClient();
  const { data: event, error } = await db.from("events").select("*").eq("id", eventId).single();
  if (error || !event) return errorResponse("event not found", 404);

  const isHost = event.host_id === auth.user.id;
  const { data: scannerRow } = await db
    .from("event_scanners")
    .select("user_id")
    .eq("event_id", eventId)
    .eq("user_id", auth.user.id)
    .maybeSingle();
  const { data: invitation } = await db
    .from("invitations")
    .select("*")
    .eq("event_id", eventId)
    .eq("guest_id", auth.user.id)
    .maybeSingle();
  if (!isHost && !scannerRow && !invitation) return errorResponse("access denied", 403);

  const { data: invitations } = isHost
    ? await db.from("invitations").select("*, profiles!invitations_guest_id_fkey(phone, first_name, last_name)").eq("event_id", eventId)
    : { data: invitation ? [invitation] : [] };
  const { data: scanners } = await db.from("event_scanners").select("user_id").eq("event_id", eventId);
  const { data: scans } = await db.from("scans").select("*").eq("event_id", eventId).order("scanned_at");

  return jsonResponse({ event, invitations, scanners, scans });
});
