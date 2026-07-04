"use client";

import { createBrowserClient } from "@supabase/ssr";
import type { Database } from "@/types/database";

/**
 * Cookie-aware Supabase client for Client Components (the login form).
 * Anon key only — never the service role.
 */
export function getAuthBrowserClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !anonKey) {
    throw new Error("Supabase no está configurado.");
  }
  return createBrowserClient<Database>(url, anonKey);
}
