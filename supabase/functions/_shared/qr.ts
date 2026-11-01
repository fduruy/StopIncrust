const encoder = new TextEncoder();

function toBase64Url(bytes: Uint8Array): string {
  let bin = "";
  for (const b of bytes) bin += String.fromCharCode(b);
  return btoa(bin).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

function fromBase64Url(s: string): Uint8Array {
  const b64 = s.replace(/-/g, "+").replace(/_/g, "/");
  const bin = atob(b64);
  const bytes = new Uint8Array(bin.length);
  for (let i = 0; i < bin.length; i++) bytes[i] = bin.charCodeAt(i);
  return bytes;
}

async function hmacKey(): Promise<CryptoKey> {
  const secret = Deno.env.get("QR_SIGNING_SECRET");
  if (!secret || secret.length < 32) {
    throw new Error("QR_SIGNING_SECRET is missing or too short (min 32 chars) in the Edge Function environment");
  }
  return await crypto.subtle.importKey(
    "raw",
    encoder.encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign", "verify"],
  );
}

export interface QrClaims {
  v: 1;
  type: "invitation" | "incruste";
  ticketId: string;
  eventId: string;
  name: string;
  firstName: string;
  exp: number;
}

export async function signQrPayload(claims: QrClaims): Promise<string> {
  const payload = toBase64Url(encoder.encode(JSON.stringify(claims)));
  const key = await hmacKey();
  const sig = await crypto.subtle.sign("HMAC", key, encoder.encode(payload));
  return `${payload}.${toBase64Url(new Uint8Array(sig))}`;
}

export async function verifyQrPayload(qr: string): Promise<QrClaims | null> {
  try {
    const parts = qr.split(".");
    if (parts.length !== 2) return null;
    const [payload, sigB64] = parts;
    const key = await hmacKey();
    const valid = await crypto.subtle.verify(
      "HMAC",
      key,
      fromBase64Url(sigB64),
      encoder.encode(payload),
    );
    if (!valid) return null;
    const claims = JSON.parse(new TextDecoder().decode(fromBase64Url(payload))) as QrClaims;
    if (claims.v !== 1 || typeof claims.ticketId !== "string" || typeof claims.eventId !== "string") return null;
    if (claims.exp * 1000 < Date.now()) return null;
    return claims;
  } catch {
    return null;
  }
}
