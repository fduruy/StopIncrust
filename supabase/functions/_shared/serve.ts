import { corsHeaders, jsonResponse } from "./cors.ts";

export function serve(handler: (req: Request) => Promise<Response>): void {
  Deno.serve(async (req: Request) => {
    if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
    try {
      return await handler(req);
    } catch (e) {
      const message = e instanceof Error ? e.message : String(e);
      console.error(`[${new Date().toISOString()}] unhandled error:`, message);
      return jsonResponse({ error: message }, 500);
    }
  });
}
