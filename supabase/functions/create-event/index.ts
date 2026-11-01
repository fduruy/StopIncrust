import { jsonResponse, errorResponse } from "../_shared/cors.ts";
import { requireUser, serviceClient } from "../_shared/supabase.ts";
import { serve } from "../_shared/serve.ts";

serve(async (req: Request) => {
  const auth = await requireUser(req);
  if (auth instanceof Response) return auth;

  const body = await req.json().catch(() => null);
  const name = body?.name?.trim();
  const eventDate = body?.event_date;
  const location = body?.location?.trim();
  const maxIncrustes = Number(body?.max_incrustes_per_guest ?? 0);
  if (!name || !eventDate || !location) return errorResponse("name, event_date and location are required");
  if (!Number.isInteger(maxIncrustes) || maxIncrustes < 0) return errorResponse("max_incrustes_per_guest must be a non-negative integer");
  if (new Date(eventDate) <= new Date()) return errorResponse("event_date must be in the future");

  const db = serviceClient();
  const { data, error } = await db
    .from("events")
    .insert({ host_id: auth.user.id, name, event_date: eventDate, location, max_incrustes_per_guest: maxIncrustes })
    .select()
    .single();
  if (error) return errorResponse(error.message, 500);
  return jsonResponse({ event: data }, 201);
});
