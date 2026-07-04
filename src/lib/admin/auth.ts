import "server-only";
import { redirect } from "next/navigation";
import { cache } from "react";
import { getAuthServerClient } from "@/lib/supabase/auth-server";

function getAdminEmails(): string[] {
  return (process.env.ADMIN_EMAILS ?? "")
    .split(",")
    .map((e) => e.trim().toLowerCase())
    .filter(Boolean);
}

export function isAdminEmail(email: string | null | undefined): boolean {
  if (!email) return false;
  return getAdminEmails().includes(email.toLowerCase());
}

export interface AdminSession {
  userId: string;
  email: string;
}

/**
 * Real (non-optimistic) session + authorization check. Verifies the user
 * against Supabase Auth (not just the cookie) and confirms their email is in
 * ADMIN_EMAILS. Call this in every admin page, layout data-load and server
 * action — the proxy-level cookie check is only a fast redirect, not
 * security. Memoized per request via React `cache`.
 */
export const requireAdmin = cache(async (): Promise<AdminSession> => {
  const supabase = await getAuthServerClient();
  const { data, error } = await supabase.auth.getUser();

  if (error || !data.user?.email) {
    redirect("/admin/login");
  }

  if (!isAdminEmail(data.user.email)) {
    redirect("/admin/login?error=not_authorized");
  }

  return { userId: data.user.id, email: data.user.email };
});

/** Non-redirecting variant for places that need to branch (e.g. the login page itself). */
export const getAdminSession = cache(async (): Promise<AdminSession | null> => {
  const supabase = await getAuthServerClient();
  const { data, error } = await supabase.auth.getUser();
  if (error || !data.user?.email || !isAdminEmail(data.user.email)) return null;
  return { userId: data.user.id, email: data.user.email };
});
