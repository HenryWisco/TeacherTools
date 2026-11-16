CREATE TABLE IF NOT EXISTS resources (
  id TEXT PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  type TEXT NOT NULL,
  grade TEXT NOT NULL DEFAULT '',
  subject TEXT NOT NULL DEFAULT '',
  summary TEXT NOT NULL DEFAULT '',
  standards TEXT NOT NULL DEFAULT '',
  body TEXT NOT NULL,
  -- 'pending' = reachable by link only, hidden from library and search engines
  -- 'published' = reviewed, listed in library and sitemap
  status TEXT NOT NULL DEFAULT 'pending',
  source TEXT NOT NULL DEFAULT 'user',
  views INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_resources_listing ON resources (status, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_resources_facets ON resources (status, subject, grade, type);

-- Daily generation counters. ip_hash is a salted hash (never a raw IP); '*' is the site-wide total.
CREATE TABLE IF NOT EXISTS usage (
  day TEXT NOT NULL,
  ip_hash TEXT NOT NULL,
  count INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (day, ip_hash)
);

CREATE TABLE IF NOT EXISTS subscribers (
  email TEXT PRIMARY KEY,
  created_at TEXT NOT NULL
);
