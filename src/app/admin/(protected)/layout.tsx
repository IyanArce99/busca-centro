import type { Metadata } from "next";
import AdminSidebar from "@/components/admin/AdminSidebar";
import AdminHeader from "@/components/admin/AdminHeader";
import { requireAdmin } from "@/lib/admin/auth";
import { IS_INDEXABLE } from "@/lib/constants";

// Blanket noindex for the whole /admin tree. Individual pages don't need to
// repeat this — Next.js merges child metadata over this, but none of the
// admin pages define their own `robots`, so this is the only source.
export const metadata: Metadata = {
  robots: { index: false, follow: false },
};

function resolveEnv(): "local" | "preview" | "production" {
  if (process.env.VERCEL_ENV === "production") return "production";
  if (process.env.VERCEL_ENV === "preview") return "preview";
  return "local";
}

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const session = await requireAdmin();

  return (
    <div className="flex h-screen overflow-hidden bg-slate-950 text-slate-100">
      <div
        className="pointer-events-none fixed inset-0 bg-[radial-gradient(circle_at_top_left,rgba(124,58,237,0.20),transparent_40%),radial-gradient(circle_at_bottom_right,rgba(34,211,238,0.14),transparent_35%)]"
        aria-hidden="true"
      />
      <div
        className="pointer-events-none fixed inset-0 opacity-[0.03] [background-image:linear-gradient(to_right,white_1px,transparent_1px),linear-gradient(to_bottom,white_1px,transparent_1px)] [background-size:56px_56px]"
        aria-hidden="true"
      />
      <AdminSidebar email={session.email} />
      <div className="relative flex min-w-0 flex-1 flex-col">
        <AdminHeader env={resolveEnv()} isIndexable={IS_INDEXABLE} />
        <main className="flex-1 overflow-y-auto px-4 py-6 sm:px-6 lg:px-8 lg:py-8">
          <div className="mx-auto max-w-7xl">{children}</div>
        </main>
      </div>
    </div>
  );
}
