import { jsonResponse, errorResponse } from "../_shared/cors.ts";
import { requireUser, serviceClient } from "../_shared/supabase.ts";
import { serve } from "../_shared/serve.ts";

serve(async (req: Request) => {
  const auth = await requireUser(req);
  if (auth instanceof Response) return auth;

  const body = await req.json().catch(() => null);
  const eventId = body?.event_id;
  const scannerPhone = body?.scanner_phone?.trim();
  if (!eventId || !scannerPhone) return errorResponse("event_id and scanner_phone are required");

  const db = serviceClient();
  const { data: event, error: eventError } = await db
    .from("events")
    .select("id")
    .eq("id", eventId)
    .eq("host_id", auth.user.id)
    .single();
  if (eventError || !event) return errorResponse("event not found or not owned by you", 404);

  const { data: scanner, error: scannerError } = await db
    .from("profiles")
    .select("id")
    .eq("phone", scannerPhone)
    .single();
  if (scannerError || !scanner) return errorResponse("scanner must be a registered app user (phone not found)", 404);

  const { error } = await db
    .from("event_scanners")
    .upsert({ event_id: eventId, user_id: scanner.id }, { onConflict: "event_id,user_id" });
  if (error) return errorResponse(error.message, 500);
  return jsonResponse({ event_id: eventId, scanner_user_id: scanner.id }, 201);
});
