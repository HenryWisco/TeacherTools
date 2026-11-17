export type Env = {
  DB: D1Database;
  ASSETS: Fetcher;
  // Secrets
  ANTHROPIC_API_KEY?: string;
  ADMIN_TOKEN?: string;
  IP_SALT?: string;
  SUPPORTER_CODE?: string;
  // Settings (wrangler.jsonc "vars")
  SITE_NAME: string;
  SITE_TAGLINE: string;
  SITE_URL: string;
  CONTACT_EMAIL: string;
  MODEL: string;
  CHECK_ANSWERS?: string; // "0" switches off the second pass that re-works answer keys
  DAILY_LIMIT_PER_DEVICE: string;
  DAILY_LIMIT_PER_NETWORK: string;
  GLOBAL_DAILY_LIMIT: string;
  ADSENSE_CLIENT: string;
  ADSENSE_SLOT: string;
  ADS_PERSONALIZED: string;
  AMAZON_TAG: string;
  SUPPORT_URL: string;
  SPONSOR_TEXT: string;
  SPONSOR_URL: string;
  SHOW_AD_PLACEHOLDERS: string;
};

export const intVar = (v: string | undefined, fallback: number): number => {
  const n = parseInt(v ?? "", 10);
  return Number.isFinite(n) && n >= 0 ? n : fallback;
};
