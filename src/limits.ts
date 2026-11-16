import { intVar, type Env } from "./env";

// Abuse protection, not a paywall: a free generator with no sign-in is otherwise
// a free AI proxy for anyone with a script. Limits are set high enough that a
// teacher planning a full week never meets them.

export const today = (now = new Date()): string => now.toISOString().slice(0, 10);

// Raw IP addresses are never stored: only a salted daily hash, useless after the day ends.
export async function hashIp(ip: string, day: string, salt: string): Promise<string> {
  const data = new TextEncoder().encode(`${salt}|${day}|${ip}`);
  const digest = await crypto.subtle.digest("SHA-256", data);
  return [...new Uint8Array(digest)]
    .slice(0, 12)
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

export type LimitResult =
  | { ok: true; remaining: number }
  | { ok: false; reason: "personal" | "site" };

const BUMP = `INSERT INTO usage (day, ip_hash, count) VALUES (?1, ?2, 1)
              ON CONFLICT (day, ip_hash) DO UPDATE SET count = count + 1
              RETURNING count`;

// Counts one generation and says whether it may run. Three caps, loosest last:
//   per device  - one teacher's browser (a random cookie; no account)
//   per network - a whole school usually shares one address, so this is set high;
//                 it mainly stops scripts that throw the cookie away
//   site-wide   - the ceiling on the day's AI bill
export async function takeGeneration(env: Env, ip: string, deviceId: string, now = new Date()): Promise<LimitResult> {
  const day = today(now);
  const perDevice = intVar(env.DAILY_LIMIT_PER_DEVICE, 40);
  const perNetwork = intVar(env.DAILY_LIMIT_PER_NETWORK, 600);
  const global = intVar(env.GLOBAL_DAILY_LIMIT, 5000);
  const salt = env.IP_SALT || "dev-salt";
  const netKey = await hashIp(ip, day, salt);
  const devKey = "dev:" + (await hashIp(deviceId, day, salt));

  const [dev, net, site] = await env.DB.batch<{ count: number }>([
    env.DB.prepare(BUMP).bind(day, devKey),
    env.DB.prepare(BUMP).bind(day, netKey),
    env.DB.prepare(BUMP).bind(day, "*"),
  ]);
  const devCount = dev.results[0]?.count ?? 1;
  const netCount = net.results[0]?.count ?? 1;
  const siteCount = site.results[0]?.count ?? 1;

  if (devCount > perDevice || netCount > perNetwork) return { ok: false, reason: "personal" };
  if (siteCount > global) return { ok: false, reason: "site" };
  return { ok: true, remaining: perDevice - devCount };
}

// Shares are capped separately so the review queue can't be flooded from one network.
export const SHARES_PER_DAY = 15;

export async function takeShare(env: Env, ip: string, now = new Date()): Promise<boolean> {
  const day = today(now);
  const key = "share:" + (await hashIp(ip, day, env.IP_SALT || "dev-salt"));
  const row = await env.DB.prepare(BUMP).bind(day, key).first<{ count: number }>();
  return (row?.count ?? 1) <= SHARES_PER_DAY;
}

export async function pruneUsage(env: Env, now = new Date()): Promise<void> {
  const cutoff = today(new Date(now.getTime() - 3 * 86400_000));
  await env.DB.prepare("DELETE FROM usage WHERE day < ?1").bind(cutoff).run();
}
