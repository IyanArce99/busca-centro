import path from "node:path";
import type { NextConfig } from "next";

/**
 * Content Security Policy directives.
 *
 * Shipped as `Content-Security-Policy-Report-Only` (see headers() below) so it
 * observes and reports violations WITHOUT blocking anything in production. This
 * lets us confirm the policy does not break the app before enforcing it.
 *
 * To promote to a blocking policy later:
 *   1. Watch for violation reports / console warnings for a while.
 *   2. Tighten any directive that reported false positives.
 *   3. Rename the header key below from
 *      "Content-Security-Policy-Report-Only" to "Content-Security-Policy".
 *
 * Notes on the current directives:
 *   - script-src: Next.js App Router injects inline bootstrap scripts, so
 *     'unsafe-inline' is required. 'unsafe-eval' is only needed by the dev
 *     runtime (Turbopack/HMR), hence it is added conditionally in development.
 *   - style-src: Tailwind + Next inline styles require 'unsafe-inline'.
 *   - connect-src: allow the Supabase backend for API/auth/realtime calls.
 *   - font-src: Geist is auto-hosted by next/font at build time, served from
 *     'self' — no Google Fonts domains needed.
 *   - img-src: 'self' plus data:/blob: for inline and generated images.
 */
const isDev = process.env.NODE_ENV !== "production";

const cspDirectives = [
  "default-src 'self'",
  `script-src 'self' 'unsafe-inline'${isDev ? " 'unsafe-eval'" : ""}`,
  "style-src 'self' 'unsafe-inline'",
  "img-src 'self' data: blob:",
  "font-src 'self'",
  "connect-src 'self' https://qqjojugpidgjdffgcmso.supabase.co",
  "object-src 'none'",
  "base-uri 'self'",
  "form-action 'self'",
  "frame-ancestors 'self'",
];

const contentSecurityPolicy = cspDirectives.join("; ");

const nextConfig: NextConfig = {
  turbopack: {
    root: path.resolve(__dirname),
  },
  async headers() {
    return [
      {
        // Apply security headers to every route.
        source: "/:path*",
        headers: [
          // HSTS is intentionally NOT redeclared here: Vercel already sets
          // Strict-Transport-Security in production. Declaring it here too would
          // duplicate the header. If this ever runs off Vercel, uncomment:
          // {
          //   key: "Strict-Transport-Security",
          //   value: "max-age=63072000; includeSubDomains",
          // },
          {
            key: "X-Content-Type-Options",
            value: "nosniff",
          },
          {
            key: "X-Frame-Options",
            value: "SAMEORIGIN",
          },
          {
            key: "Referrer-Policy",
            value: "strict-origin-when-cross-origin",
          },
          {
            key: "Permissions-Policy",
            value: "camera=(), microphone=(), geolocation=()",
          },
          {
            // Report-Only on purpose: this observes and reports CSP violations
            // without blocking any resource, so it is safe to ship to
            // production. Promote to the blocking "Content-Security-Policy"
            // header once reports confirm it does not break anything.
            key: "Content-Security-Policy-Report-Only",
            value: contentSecurityPolicy,
          },
        ],
      },
    ];
  },
};

export default nextConfig;
