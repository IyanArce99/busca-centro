import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/types/database";

/**
 * Server-only Supabase client.
 * Uses the service role key when available (bypasses RLS for admin reads),
 * falls back to anon key for public reads.
 * NEVER import this file from client components or pages with "use client".
 */
export function getServerClient(): SupabaseClient<Database> | null {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  const key = serviceKey ?? anonKey;

  if (!url || !key) return null;

  return createClient<Database>(url, key, {
    auth: { persistSession: false },
  });
}
