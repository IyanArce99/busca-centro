import type { Metadata } from "next";
import { redirect } from "next/navigation";
import { getAdminSession } from "@/lib/admin/auth";
import { SparklesIcon } from "@/components/Icons";
import LoginForm from "./LoginForm";

export const metadata: Metadata = {
  title: "Acceso administración — BuscaCentro",
  robots: { index: false, follow: false },
};

interface PageProps {
  searchParams: Promise<{ error?: string }>;
}

export default async function AdminLoginPage({ searchParams }: PageProps) {
  const session = await getAdminSession();
  if (session) redirect("/admin");

  const { error } = await searchParams;

  return (
    <div className="relative flex min-h-screen items-center justify-center overflow-hidden bg-slate-950 px-4 text-slate-100">
      <div
        className="pointer-events-none fixed inset-0 bg-[radial-gradient(circle_at_top_left,rgba(124,58,237,0.20),transparent_40%),radial-gradient(circle_at_bottom_right,rgba(34,211,238,0.14),transparent_35%)]"
        aria-hidden="true"
      />
      <div
        className="pointer-events-none fixed inset-0 opacity-[0.03] [background-image:linear-gradient(to_right,white_1px,transparent_1px),linear-gradient(to_bottom,white_1px,transparent_1px)] [background-size:56px_56px]"
        aria-hidden="true"
      />

      <div className="relative w-full max-w-sm rounded-2xl border border-white/10 bg-white/[0.04] p-8 shadow-2xl shadow-black/40 backdrop-blur-xl">
        <div className="relative flex h-10 w-10 items-center justify-center rounded-xl bg-gradient-to-br from-violet-500 to-cyan-500 text-white shadow-lg shadow-violet-950/50">
          <span className="absolute inset-0 rounded-xl bg-gradient-to-br from-violet-400 to-cyan-400 opacity-40 blur-md" aria-hidden="true" />
          <SparklesIcon className="relative h-5 w-5" />
        </div>
        <h1 className="mt-4 text-xl font-semibold text-slate-50">BuscaCentro admin</h1>
        <p className="mt-1 text-sm text-slate-400">Acceso restringido al equipo interno.</p>

        {error === "not_authorized" ? (
          <p className="mt-4 rounded-lg border border-amber-400/20 bg-amber-500/[0.07] px-3 py-2 text-sm text-amber-200">Tu cuenta no tiene permisos de administración.</p>
        ) : null}

        <div className="mt-6">
          <LoginForm />
        </div>
      </div>
    </div>
  );
}
