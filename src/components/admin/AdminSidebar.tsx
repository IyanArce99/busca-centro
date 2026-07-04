"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import {
  SparklesIcon,
  BuildingOfficeIcon,
  ShieldCheckIcon,
  ExclamationTriangleIcon,
  ChatBubbleIcon,
  DocumentTextIcon,
  CheckCircleIcon,
  InformationCircleIcon,
} from "@/components/Icons";
import { logoutAction } from "@/app/admin/actions";

const NAV = [
  { href: "/admin", label: "Dashboard", icon: SparklesIcon },
  { href: "/admin/centers", label: "Centros", icon: BuildingOfficeIcon },
  { href: "/admin/quality", label: "Calidad SEO", icon: ShieldCheckIcon },
  { href: "/admin/conflicts", label: "Conflictos", icon: ExclamationTriangleIcon },
  { href: "/admin/leads", label: "Leads", icon: ChatBubbleIcon },
  { href: "/admin/claims", label: "Reclamaciones", icon: DocumentTextIcon },
  { href: "/admin/pending", label: "Pendientes", icon: CheckCircleIcon },
  { href: "/admin/settings", label: "Configuración", icon: InformationCircleIcon },
];

export default function AdminSidebar({ email }: { email: string }) {
  const pathname = usePathname();

  return (
    <nav className="relative z-10 flex h-full w-16 shrink-0 flex-col border-r border-white/[0.08] bg-slate-950/80 backdrop-blur-xl lg:w-64">
      <div className="flex items-center justify-center gap-2.5 px-3 py-5 lg:justify-start lg:px-5">
        <div className="relative flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-gradient-to-br from-violet-500 to-cyan-500 text-white shadow-lg shadow-violet-950/50">
          <span className="absolute inset-0 rounded-xl bg-gradient-to-br from-violet-400 to-cyan-400 opacity-40 blur-md" aria-hidden="true" />
          <SparklesIcon className="relative h-[18px] w-[18px]" />
        </div>
        <div className="hidden leading-tight lg:block">
          <p className="text-sm font-semibold text-slate-50">BuscaCentro</p>
          <p className="text-[11px] font-medium uppercase tracking-wide text-slate-500">Admin</p>
        </div>
      </div>

      <div className="flex-1 overflow-y-auto px-2 py-2 lg:px-3">
        <ul className="flex flex-col gap-0.5">
          {NAV.map((item) => {
            const active = item.href === "/admin" ? pathname === "/admin" : pathname.startsWith(item.href);
            const Icon = item.icon;
            return (
              <li key={item.href}>
                <Link
                  href={item.href}
                  title={item.label}
                  className={`group relative flex items-center justify-center gap-2.5 rounded-lg px-3 py-2 text-sm font-medium transition lg:justify-start ${
                    active ? "bg-white/[0.06] text-slate-50 ring-1 ring-white/10" : "text-slate-500 hover:bg-white/[0.03] hover:text-slate-200"
                  }`}
                >
                  {active ? <span className="absolute inset-y-1 left-0 w-0.5 rounded-full bg-gradient-to-b from-violet-400 to-cyan-400" aria-hidden="true" /> : null}
                  <Icon className={`h-[18px] w-[18px] shrink-0 ${active ? "text-violet-300" : "text-slate-500 group-hover:text-slate-300"}`} />
                  <span className="hidden lg:inline">{item.label}</span>
                </Link>
              </li>
            );
          })}
        </ul>
      </div>

      <div className="border-t border-white/[0.08] px-2 py-3 lg:px-3">
        <div className="flex items-center justify-center gap-2.5 rounded-lg px-2 py-2 lg:justify-start">
          <div
            className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-violet-500/30 to-cyan-500/30 text-xs font-semibold text-slate-100 ring-1 ring-white/10"
            title={email}
          >
            {email.slice(0, 2).toUpperCase()}
          </div>
          <div className="hidden min-w-0 flex-1 lg:block">
            <p className="truncate text-xs font-medium text-slate-300">{email}</p>
            <form action={logoutAction}>
              <button type="submit" className="text-xs font-medium text-slate-500 transition hover:text-slate-200">
                Cerrar sesión
              </button>
            </form>
          </div>
        </div>
        <form action={logoutAction} className="mt-1 flex justify-center lg:hidden">
          <button type="submit" title="Cerrar sesión" className="text-xs font-medium text-slate-500 hover:text-slate-200">
            Salir
          </button>
        </form>
      </div>
    </nav>
  );
}
