import Link from "next/link";
import { getAllCentersAdmin, getLeadsAdmin, getClaimsAdmin } from "@/lib/admin/data";
import EmptyState from "@/components/admin/EmptyState";
import { CheckCircleIcon, ChevronRightIcon } from "@/components/Icons";

function Row({ label, count, href }: { label: string; count: number; href: string }) {
  if (count === 0) return null;
  return (
    <Link
      href={href}
      className="group flex items-center justify-between rounded-xl border border-white/10 bg-white/[0.04] px-4 py-3.5 shadow-2xl shadow-black/20 backdrop-blur-xl transition hover:border-violet-400/20 hover:bg-white/[0.06]"
    >
      <span className="text-sm text-slate-300">{label}</span>
      <span className="flex items-center gap-2">
        <span className="rounded-full bg-gradient-to-r from-violet-500/20 to-cyan-500/20 px-2.5 py-0.5 text-xs font-semibold text-slate-100 ring-1 ring-white/10">{count}</span>
        <ChevronRightIcon className="h-4 w-4 text-slate-600 transition group-hover:translate-x-0.5 group-hover:text-slate-300" />
      </span>
    </Link>
  );
}

export default async function AdminPendingPage() {
  const [centers, leads, claims] = await Promise.all([getAllCentersAdmin(), getLeadsAdmin(), getClaimsAdmin()]);
  const published = centers.filter((c) => c.status === "published");

  const rows = [
    { label: "Centros pending_manual_review", count: centers.filter((c) => c.verification_status === "pending_manual_review").length, href: "/admin/centers?verification=pending_manual_review" },
    { label: "Conflictos sin resolver", count: centers.filter((c) => c.conflictCount > 0).length, href: "/admin/conflicts" },
    { label: "Leads recibidos", count: leads.length, href: "/admin/leads" },
    { label: "Reclamaciones nuevas", count: claims.filter((c) => c.status === "nueva" || c.status === "pendiente_verificacion").length, href: "/admin/claims" },
    { label: "Centros sin servicios", count: centers.filter((c) => c.realServices.length === 0).length, href: "/admin/centers?services=none" },
    { label: "Centros sin FAQs", count: centers.filter((c) => c.faqCount === 0).length, href: "/admin/centers?faqs=none" },
    { label: "Centros sin long_description", count: centers.filter((c) => !c.long_description?.trim()).length, href: "/admin/centers?longDescription=none" },
    { label: "Centros sin web", count: published.filter((c) => !c.website).length, href: "/admin/centers" },
    { label: "Centros sin teléfono", count: published.filter((c) => !c.phone).length, href: "/admin/centers" },
    { label: "Centros sin email", count: published.filter((c) => !c.email).length, href: "/admin/centers" },
    { label: "Centros no indexables", count: published.filter((c) => !c.isIndexable).length, href: "/admin/quality" },
  ];

  const visibleRows = rows.filter((r) => r.count > 0);

  return (
    <div className="flex flex-col gap-4">
      <p className="text-sm text-slate-500">Cola de trabajo: todo lo que necesita atención ahora mismo.</p>

      {visibleRows.length === 0 ? (
        <EmptyState title="Todo al día" description="No hay nada pendiente ahora mismo." icon={<CheckCircleIcon className="h-5 w-5" />} />
      ) : (
        <div className="flex flex-col gap-2">
          {rows.map((r) => (
            <Row key={r.label} {...r} />
          ))}
        </div>
      )}
    </div>
  );
}
