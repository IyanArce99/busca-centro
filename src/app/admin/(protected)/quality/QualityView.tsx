"use client";

import { useState } from "react";
import Link from "next/link";
import type { AdminCenter } from "@/lib/admin/data";
import type { QualityIssue } from "@/lib/admin/quality";
import Badge from "@/components/admin/Badge";
import ExportButtons from "@/components/admin/ExportButtons";
import EmptyState from "@/components/admin/EmptyState";
import ActionButton from "@/components/admin/ActionButton";
import { CheckCircleIcon, ExclamationTriangleIcon, ShieldCheckIcon, ExternalLinkIcon } from "@/components/Icons";

type CenterList = { center: AdminCenter; reasons: string[] }[];
type TabKey = "ready" | "thin" | "problems" | "services" | "descriptions" | "conflicts";

const TABS: { key: TabKey; label: (n: number) => string }[] = [
  { key: "ready", label: (n) => `Listos para indexar (${n})` },
  { key: "thin", label: (n) => `Finos (${n})` },
  { key: "problems", label: (n) => `Problemas (${n})` },
  { key: "services", label: (n) => `Sin servicios (${n})` },
  { key: "descriptions", label: (n) => `Sin long description (${n})` },
  { key: "conflicts", label: (n) => `Conflictos (${n})` },
];

export default function QualityView({
  thin,
  ready,
  problems,
  withoutServices,
  withoutLongDescription,
  withConflicts,
}: {
  thin: CenterList;
  ready: CenterList;
  problems: QualityIssue[];
  withoutServices: CenterList;
  withoutLongDescription: CenterList;
  withConflicts: CenterList;
}) {
  const [tab, setTab] = useState<TabKey>("thin");

  const counts: Record<TabKey, number> = {
    ready: ready.length,
    thin: thin.length,
    problems: problems.length,
    services: withoutServices.length,
    descriptions: withoutLongDescription.length,
    conflicts: withConflicts.length,
  };

  return (
    <div className="flex flex-col gap-4">
      <div className="flex flex-wrap gap-1 rounded-xl border border-white/10 bg-white/[0.04] p-1 shadow-2xl shadow-black/20 backdrop-blur-xl">
        {TABS.map((t) => (
          <button
            key={t.key}
            type="button"
            onClick={() => setTab(t.key)}
            className={`rounded-lg px-3 py-1.5 text-sm font-medium transition ${
              tab === t.key ? "bg-gradient-to-r from-violet-500 to-cyan-500 text-white shadow-lg shadow-violet-950/40" : "text-slate-400 hover:bg-white/[0.06] hover:text-slate-100"
            }`}
          >
            {t.label(counts[t.key])}
          </button>
        ))}
      </div>

      {tab === "ready" ? <CenterListView items={ready} variant="green" emptyText="No hay centros que pasen el gate de calidad todavía." /> : null}
      {tab === "thin" ? <CenterListView items={thin} variant="amber" emptyText="No hay centros finos ahora mismo." /> : null}
      {tab === "services" ? <CenterListView items={withoutServices} variant="amber" emptyText="Todos los centros publicados tienen servicios." /> : null}
      {tab === "descriptions" ? <CenterListView items={withoutLongDescription} variant="amber" emptyText="Todos los centros publicados tienen long_description." /> : null}
      {tab === "conflicts" ? <CenterListView items={withConflicts} variant="red" emptyText="No hay centros con conflictos pendientes." /> : null}

      {tab === "problems" ? (
        <div className="overflow-x-auto rounded-2xl border border-white/10 bg-white/[0.04] shadow-2xl shadow-black/20 backdrop-blur-xl">
          {problems.length === 0 ? (
            <EmptyState title="Sin problemas" description="No se han detectado problemas SEO estructurales." icon={<ShieldCheckIcon className="h-5 w-5" />} />
          ) : (
            <table className="w-full text-left text-sm">
              <thead>
                <tr className="border-b border-white/[0.06]">
                  <th className="px-4 py-3 text-xs font-medium text-slate-500">Centro</th>
                  <th className="px-4 py-3 text-xs font-medium text-slate-500">Tipo</th>
                  <th className="px-4 py-3 text-xs font-medium text-slate-500">Detalle</th>
                  <th className="px-4 py-3 text-xs font-medium text-slate-500">Acciones</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-white/[0.05]">
                {problems.map((p, i) => (
                  <tr key={i} className="transition hover:bg-white/[0.03]">
                    <td className="px-4 py-3 font-medium text-slate-100">{p.centerName}</td>
                    <td className="px-4 py-3">
                      <Badge variant="amber">{p.type}</Badge>
                    </td>
                    <td className="px-4 py-3 text-slate-400">{p.detail}</td>
                    <td className="px-4 py-3">
                      <Link href={`/admin/centers/${p.centerId}`} className="text-sm font-medium text-slate-400 transition hover:text-slate-100 hover:underline">
                        Abrir ficha
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      ) : null}
    </div>
  );
}

function CenterListView({ items, variant, emptyText }: { items: CenterList; variant: "green" | "amber" | "red"; emptyText: string }) {
  if (items.length === 0) {
    return <EmptyState title="Todo en orden" description={emptyText} icon={<CheckCircleIcon className="h-5 w-5" />} />;
  }

  return (
    <div className="flex flex-col gap-3">
      <div className="flex justify-end">
        <ExportButtons centers={items.map((i) => i.center)} />
      </div>
      {items.map(({ center, reasons }) => (
        <div key={center.id} className="rounded-xl border border-white/10 bg-white/[0.04] p-4 shadow-2xl shadow-black/20 backdrop-blur-xl">
          <div className="mb-2.5 flex items-center justify-between gap-3">
            <div className="flex items-center gap-2">
              <span className="font-medium text-slate-100">{center.name}</span>
              {variant === "red" ? <ExclamationTriangleIcon className="h-4 w-4 text-rose-400" /> : null}
            </div>
            <div className="flex items-center gap-3 text-xs">
              <Link href={`/admin/centers/${center.id}`} className="font-medium text-slate-400 transition hover:text-slate-100 hover:underline">
                Abrir ficha admin
              </Link>
              <ActionButton size="sm" href={`/centro/${center.slug}`} target="_blank" icon={<ExternalLinkIcon className="h-3.5 w-3.5" />}>
                Ver pública
              </ActionButton>
            </div>
          </div>
          <div className="flex flex-wrap gap-1.5">
            {reasons.map((r) => (
              <Badge key={r} variant={variant}>
                {r}
              </Badge>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
