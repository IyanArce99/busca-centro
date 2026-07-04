"use client";

import { usePathname } from "next/navigation";
import Link from "next/link";
import { ExternalLinkIcon } from "@/components/Icons";
import { SITE_URL } from "@/lib/constants";

const PAGE_META: Record<string, { title: string; subtitle: string }> = {
  "/admin": { title: "Dashboard", subtitle: "Resumen general de BuscaCentro" },
  "/admin/centers": { title: "Centros", subtitle: "Gestiona y revisa todas las fichas del directorio" },
  "/admin/quality": { title: "Calidad SEO", subtitle: "Auditoría de indexabilidad y contenido" },
  "/admin/conflicts": { title: "Conflictos", subtitle: "Revisa y resuelve discrepancias de datos" },
  "/admin/leads": { title: "Leads", subtitle: "Solicitudes de información recibidas" },
  "/admin/claims": { title: "Reclamaciones", subtitle: "Solicitudes de reclamación de ficha" },
  "/admin/pending": { title: "Pendientes", subtitle: "Cola de trabajo pendiente de revisión" },
  "/admin/settings": { title: "Configuración", subtitle: "Estado del entorno y checklist de lanzamiento" },
};

function resolvePageMeta(pathname: string) {
  if (PAGE_META[pathname]) return PAGE_META[pathname];
  if (pathname.startsWith("/admin/centers/")) return { title: "Editar centro", subtitle: "Ficha completa del centro" };
  return { title: "Admin", subtitle: "" };
}

const ENV_STYLES: Record<string, string> = {
  production: "bg-rose-500/10 text-rose-300 ring-rose-400/20",
  preview: "bg-amber-500/10 text-amber-300 ring-amber-400/20",
  local: "bg-white/[0.06] text-slate-300 ring-white/10",
};

export default function AdminHeader({ env, isIndexable }: { env: "local" | "preview" | "production"; isIndexable: boolean }) {
  const pathname = usePathname();
  const { title, subtitle } = resolvePageMeta(pathname);
  const envLabel = env.charAt(0).toUpperCase() + env.slice(1);

  return (
    <header className="relative z-10 flex h-16 shrink-0 items-center justify-between gap-3 border-b border-white/[0.08] bg-slate-950/60 px-4 backdrop-blur-xl sm:px-6">
      <div className="min-w-0">
        <h1 className="truncate text-base font-semibold text-slate-50">{title}</h1>
        {subtitle ? <p className="hidden truncate text-xs text-slate-500 sm:block">{subtitle}</p> : null}
      </div>

      <div className="flex shrink-0 items-center gap-2">
        <span className={`hidden items-center rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset sm:inline-flex ${ENV_STYLES[env]}`}>{envLabel}</span>
        <span
          className={`hidden items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset md:inline-flex ${
            isIndexable ? "bg-emerald-500/10 text-emerald-300 ring-emerald-400/20" : "bg-white/[0.06] text-slate-300 ring-white/10"
          }`}
        >
          <span className={`h-1.5 w-1.5 rounded-full ${isIndexable ? "bg-emerald-400 shadow-[0_0_6px_rgba(52,211,153,0.8)]" : "bg-slate-500"}`} />
          Indexación {isIndexable ? "ON" : "OFF"}
        </span>
        <Link
          href={SITE_URL}
          target="_blank"
          className="inline-flex items-center gap-1.5 rounded-lg bg-white/[0.06] px-2.5 py-1.5 text-xs font-medium text-slate-300 ring-1 ring-inset ring-white/10 transition hover:bg-white/[0.1] sm:px-3"
        >
          <span className="hidden sm:inline">Ver web pública</span>
          <ExternalLinkIcon className="h-3.5 w-3.5" />
        </Link>
      </div>
    </header>
  );
}
