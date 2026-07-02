import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/types/database";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

let _client: SupabaseClient<Database> | null = null;

export function getSupabaseClient(): SupabaseClient<Database> | null {
  if (!url || !key) return null;
  if (!_client) {
    _client = createClient<Database>(url, key);
  }
  return _client;
}

export function isSupabaseConfigured(): boolean {
  return Boolean(url && key);
}
