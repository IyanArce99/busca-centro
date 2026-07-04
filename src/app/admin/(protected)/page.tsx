import MetricCard from "@/components/admin/MetricCard";
import AlertBanner from "@/components/admin/AlertBanner";
import AdminSectionCard from "@/components/admin/AdminSectionCard";
import ActionButton from "@/components/admin/ActionButton";
import ProgressStat from "@/components/admin/ProgressStat";
import { getAllCentersAdmin, getLeadsAdmin, getClaimsAdmin, computeStats } from "@/lib/admin/data";
import { IS_INDEXABLE, SITE_URL } from "@/lib/constants";
import {
  BuildingOfficeIcon,
  CheckCircleIcon,
  ExclamationTriangleIcon,
  DocumentTextIcon,
  ChatBubbleIcon,
  ShieldCheckIcon,
  SparklesIcon,
  ExternalLinkIcon,
} from "@/components/Icons";

export default async function AdminDashboardPage() {
  const [centers, leads, claims] = await Promise.all([getAllCentersAdmin(), getLeadsAdmin(), getClaimsAdmin()]);
  const stats = computeStats(centers, leads, claims);
  const alerts = [
    !IS_INDEXABLE && { tone: "warning" as const, text: "La indexación global está desactivada (NEXT_PUBLIC_INDEXABLE=false)." },
    stats.thinCount > 0 && { tone: "warning" as const, href: "/admin/quality", text: `Hay ${stats.thinCount} centros finos en noindex.` },
    stats.withConflicts > 0 && { tone: "critical" as const, href: "/admin/conflicts", text: `Hay ${stats.withConflicts} centros con conflictos pendientes.` },
    stats.withoutServices > 0 && { tone: "info" as const, href: "/admin/centers?services=none", text: `Hay ${stats.withoutServices} centros sin servicios confirmados.` },
    stats.withoutLongDescription > 0 && {
      tone: "info" as const,
      href: "/admin/centers?longDescription=none",
      text: `Hay ${stats.withoutLongDescription} centros sin long description.`,
    },
    stats.leadsTotal > 0 && { tone: "info" as const, href: "/admin/leads", text: `Hay ${stats.leadsTotal} leads recibidos.` },
    stats.claimsNew > 0 && { tone: "info" as const, href: "/admin/claims", text: `Hay ${stats.claimsNew} reclamaciones pendientes.` },
  ].filter(Boolean) as { tone: "critical" | "warning" | "info"; href?: string; text: string }[];

  return (
    <div className="flex flex-col gap-6">
      {/* Hero */}
      <div className="relative overflow-hidden rounded-2xl border border-white/10 bg-gradient-to-br from-violet-950/60 via-slate-900/60 to-cyan-950/40 p-6 shadow-2xl shadow-black/30 backdrop-blur-xl sm:p-8">
        <div
          className="pointer-events-none absolute inset-0 bg-[radial-gradient(circle_at_20%_20%,rgba(167,139,250,0.15),transparent_50%)]"
          aria-hidden="true"
        />
        <div className="relative flex flex-col gap-5 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <p className="inline-flex items-center gap-1.5 text-xs font-medium uppercase tracking-wider text-violet-300">
              <SparklesIcon className="h-3.5 w-3.5" />
              Panel de control
            </p>
            <h1 className="mt-2 text-2xl font-semibold text-slate-50 sm:text-3xl">Gestiona BuscaCentro</h1>
            <p className="mt-1.5 max-w-xl text-sm text-slate-400">Gestiona calidad SEO, fichas, conflictos e indexación de BuscaCentro desde un único lugar.</p>
            <span
              className={`mt-4 inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium ring-1 ring-inset ${
                IS_INDEXABLE ? "bg-emerald-500/10 text-emerald-300 ring-emerald-400/20" : "bg-white/[0.06] text-slate-300 ring-white/10"
              }`}
            >
              <span className={`h-1.5 w-1.5 rounded-full ${IS_INDEXABLE ? "bg-emerald-400 shadow-[0_0_6px_rgba(52,211,153,0.8)]" : "bg-slate-500"}`} />
              {IS_INDEXABLE ? "Indexación activa" : "Indexación desactivada"}
            </span>
          </div>
          <div className="flex shrink-0 flex-wrap gap-2">
            <ActionButton href={SITE_URL} target="_blank" icon={<ExternalLinkIcon className="h-4 w-4" />}>
              Ver web pública
            </ActionButton>
            <ActionButton href="/admin/quality" variant="primary" icon={<ShieldCheckIcon className="h-4 w-4" />}>
              Revisar centros finos
            </ActionButton>
          </div>
        </div>
      </div>

      {alerts.length > 0 ? (
        <section className="flex flex-col gap-2">
          {alerts.map((a) => (
            <AlertBanner key={a.text} tone={a.tone} href={a.href}>
              {a.text}
            </AlertBanner>
          ))}
        </section>
      ) : null}

      <section className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4">
        <MetricCard label="Total centros" value={stats.total} icon={<BuildingOfficeIcon className="h-4 w-4" />} />
        <MetricCard label="Publicados" value={stats.published} icon={<CheckCircleIcon className="h-4 w-4" />} tone="green" />
        <MetricCard label="Indexables" value={stats.indexable} icon={<SparklesIcon className="h-4 w-4" />} tone="green" />
        <MetricCard label="Noindex" value={stats.noindex} icon={<ExclamationTriangleIcon className="h-4 w-4" />} tone="amber" />
        <MetricCard label="Con servicios" value={stats.withServices} icon={<CheckCircleIcon className="h-4 w-4" />} tone="sky" />
        <MetricCard label="Sin servicios" value={stats.withoutServices} tone="amber" />
        <MetricCard label="Con long description" value={stats.withLongDescription} tone="sky" />
        <MetricCard label="Sin long description" value={stats.withoutLongDescription} tone="amber" />
        <MetricCard label="Con FAQs" value={stats.withFaqs} tone="sky" />
        <MetricCard label="Conflictos" value={stats.withConflicts} icon={<ExclamationTriangleIcon className="h-4 w-4" />} tone={stats.withConflicts > 0 ? "red" : "neutral"} />
        <MetricCard label="Pending manual review" value={stats.pendingManualReview} tone="amber" />
        <MetricCard label="Madrid" value={stats.madrid} />
      </section>

      <div className="grid grid-cols-1 gap-4 lg:grid-cols-3">
        <AdminSectionCard title="Salud SEO" description="Progreso general de indexabilidad del directorio" className="lg:col-span-2">
          <div className="flex flex-col gap-5">
            <ProgressStat label="Centros listos para indexar" value={stats.indexable} total={stats.published} tone="emerald" />
            <ProgressStat label="Con long_description" value={stats.withLongDescription} total={stats.total} tone="violet" />
            <ProgressStat label="Con FAQs" value={stats.withFaqs} total={stats.total} tone="sky" />
            <div className="flex items-center justify-between border-t border-white/[0.06] pt-4 text-sm">
              <span className="text-slate-400">Indexación global</span>
              <span className={`font-semibold ${IS_INDEXABLE ? "text-emerald-300" : "text-slate-400"}`}>{IS_INDEXABLE ? "Activa" : "Desactivada"}</span>
            </div>
          </div>
        </AdminSectionCard>

        <AdminSectionCard title="Confianza de los datos" description="Distribución por confidence_level">
          <dl className="flex flex-col gap-3 text-sm">
            {[
              ["Alta", stats.confidenceHigh, "text-emerald-300"],
              ["Media", stats.confidenceMedium, "text-cyan-300"],
              ["Baja", stats.confidenceLow, "text-amber-300"],
              ["Desconocida", stats.confidenceUnknown, "text-slate-500"],
            ].map(([label, value, color]) => (
              <div key={label as string} className="flex items-center justify-between border-b border-white/[0.04] pb-3 last:border-0 last:pb-0">
                <dt className="text-slate-400">{label}</dt>
                <dd className={`text-lg font-semibold ${color}`}>{value}</dd>
              </div>
            ))}
          </dl>
        </AdminSectionCard>
      </div>

      <AdminSectionCard title="Accesos rápidos">
        <div className="flex flex-wrap gap-2">
          <ActionButton href="/admin/quality" icon={<ShieldCheckIcon className="h-4 w-4" />}>
            Revisar centros finos
          </ActionButton>
          <ActionButton href="/admin/conflicts" icon={<ExclamationTriangleIcon className="h-4 w-4" />}>
            Ver conflictos
          </ActionButton>
          <ActionButton href="/admin/centers?services=none">Centros sin servicios</ActionButton>
          <ActionButton href="/admin/centers?longDescription=none">Centros sin long description</ActionButton>
          <ActionButton href="/admin/leads" icon={<ChatBubbleIcon className="h-4 w-4" />}>
            Ver leads
          </ActionButton>
          <ActionButton href="/admin/claims" icon={<DocumentTextIcon className="h-4 w-4" />}>
            Ver reclamaciones
          </ActionButton>
          <ActionButton href="/admin/settings">Ver checklist de lanzamiento</ActionButton>
        </div>
      </AdminSectionCard>
    </div>
  );
}
