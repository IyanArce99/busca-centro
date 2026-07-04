"use client";

import Link from "next/link";
import { useRouter, usePathname, useSearchParams } from "next/navigation";
import type { AdminCenter } from "@/lib/admin/data";
import { IndexableBadge } from "./CenterStatusBadges";
import Badge from "./Badge";
import SeoScoreBadge, { type SeoScore } from "./SeoScoreBadge";
import EmptyState from "./EmptyState";
import { ChevronRightIcon, ExternalLinkIcon, DocumentTextIcon } from "@/components/Icons";

const SORT_COLUMNS: { key: string; label: string; className?: string }[] = [
  { key: "name", label: "Centro", className: "min-w-[220px]" },
  { key: "district", label: "Ubicación" },
  { key: "indexable", label: "SEO" },
  { key: "services", label: "Servicios" },
  { key: "faqs", label: "FAQs" },
  { key: "confidence", label: "Confidence" },
  { key: "updated_at", label: "Actualizado" },
];

function seoScore(c: AdminCenter): SeoScore {
  if (!c.isIndexable) return "no-indexar";
  const signals = [Boolean(c.long_description?.trim()), c.faqCount > 0, c.realServices.length > 0, Boolean(c.district || c.neighborhood || c.street)].filter(Boolean).length;
  return signals >= 4 ? "bueno" : signals >= 2 ? "medio" : "pobre";
}

function initials(name: string): string {
  return name
    .split(/\s+/)
    .slice(0, 2)
    .map((w) => w[0])
    .join("")
    .toUpperCase();
}

export default function CentersTable({ centers }: { centers: AdminCenter[] }) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();

  const currentSort = searchParams.get("sort") ?? "updated_at";
  const currentDir = searchParams.get("dir") === "asc" ? "asc" : "desc";

  const toggleSort = (key: string) => {
    const params = new URLSearchParams(searchParams.toString());
    if (currentSort === key) {
      params.set("dir", currentDir === "asc" ? "desc" : "asc");
    } else {
      params.set("sort", key);
      params.set("dir", "desc");
    }
    router.push(`${pathname}?${params.toString()}`);
  };

  const copyUrl = async (slug: string) => {
    await navigator.clipboard.writeText(`${window.location.origin}/centro/${slug}`);
  };

  if (centers.length === 0) {
    return <EmptyState title="Sin resultados" description="No hay centros que coincidan con estos filtros." icon={<DocumentTextIcon className="h-5 w-5" />} />;
  }

  return (
    <div className="overflow-x-auto rounded-2xl border border-white/10 bg-white/[0.04] shadow-2xl shadow-black/20 backdrop-blur-xl">
      <table className="w-full min-w-[1000px] text-left text-sm">
        <thead>
          <tr className="border-b border-white/[0.06]">
            {SORT_COLUMNS.map((col) => (
              <th key={col.key} className={`px-4 py-3 text-xs font-medium text-slate-500 ${col.className ?? ""}`}>
                <button type="button" onClick={() => toggleSort(col.key)} className="flex items-center gap-1 transition hover:text-slate-200">
                  {col.label}
                  {currentSort === col.key ? <span className="text-violet-300">{currentDir === "asc" ? "↑" : "↓"}</span> : null}
                </button>
              </th>
            ))}
            <th className="px-4 py-3 text-xs font-medium text-slate-500">Long desc.</th>
            <th className="px-4 py-3 text-xs font-medium text-slate-500">Conflictos</th>
            <th className="px-4 py-3 text-right text-xs font-medium text-slate-500">Acciones</th>
          </tr>
        </thead>
        <tbody className="divide-y divide-white/[0.05]">
          {centers.map((c) => (
            <tr key={c.id} className="group transition hover:bg-white/[0.03]">
              <td className="px-4 py-3">
                <div className="flex items-center gap-3">
                  <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-violet-500/20 to-cyan-500/20 text-xs font-semibold text-slate-200 ring-1 ring-white/10">
                    {initials(c.name)}
                  </div>
                  <div className="min-w-0">
                    <Link href={`/admin/centers/${c.id}`} className="block truncate font-medium text-slate-100 transition group-hover:text-white hover:underline">
                      {c.name}
                    </Link>
                    <p className="truncate text-xs text-slate-500">{c.slug}</p>
                  </div>
                </div>
              </td>
              <td className="px-4 py-3">
                <p className="text-slate-300">{c.district || c.neighborhood || "—"}</p>
                <p className="text-xs text-slate-500">{c.city_name}</p>
                <div className="mt-1 flex flex-wrap gap-1">
                  <Badge variant="slate">{c.type === "guarderia" ? "Guardería" : "Escuela infantil"}</Badge>
                  <Badge variant="slate">{c.ownership}</Badge>
                </div>
              </td>
              <td className="px-4 py-3">
                <div className="flex flex-col gap-1">
                  <SeoScoreBadge score={seoScore(c)} />
                  <IndexableBadge center={c} />
                </div>
              </td>
              <td className="px-4 py-3 text-slate-300">
                {c.realServices.length}
                {c.hasInvalidServices ? (
                  <span className="ml-1 text-amber-400" title="Contiene servicios legacy aula-*">
                    ⚠
                  </span>
                ) : null}
              </td>
              <td className="px-4 py-3 text-slate-300">{c.faqCount}</td>
              <td className="px-4 py-3">
                <Badge variant={c.confidence_level === "high" ? "green" : c.confidence_level === "medium" ? "sky" : c.confidence_level === "low" ? "amber" : "slate"}>
                  {c.confidence_level ?? "unknown"}
                </Badge>
              </td>
              <td className="px-4 py-3 whitespace-nowrap text-slate-500">{new Date(c.updated_at).toLocaleDateString("es-ES")}</td>
              <td className="px-4 py-3">{c.long_description?.trim() ? <Badge variant="green">Sí</Badge> : <Badge variant="slate">No</Badge>}</td>
              <td className="px-4 py-3">{c.conflictCount > 0 ? <Badge variant="red">{c.conflictCount}</Badge> : <Badge variant="slate">0</Badge>}</td>
              <td className="px-4 py-3">
                <div className="flex items-center justify-end gap-1 opacity-70 transition group-hover:opacity-100">
                  <Link
                    href={`/centro/${c.slug}`}
                    target="_blank"
                    title="Abrir ficha pública"
                    className="flex h-7 w-7 items-center justify-center rounded-lg text-slate-500 transition hover:bg-white/[0.08] hover:text-slate-100"
                  >
                    <ExternalLinkIcon className="h-4 w-4" />
                  </Link>
                  <button
                    type="button"
                    onClick={() => copyUrl(c.slug)}
                    title="Copiar URL"
                    className="flex h-7 w-7 items-center justify-center rounded-lg text-slate-500 transition hover:bg-white/[0.08] hover:text-slate-100"
                  >
                    <DocumentTextIcon className="h-4 w-4" />
                  </button>
                  <Link
                    href={`/admin/centers/${c.id}`}
                    title="Editar"
                    className="flex h-7 items-center gap-0.5 rounded-lg px-2 text-xs font-medium text-slate-400 transition hover:bg-white/[0.08] hover:text-slate-100"
                  >
                    Editar
                    <ChevronRightIcon className="h-3.5 w-3.5" />
                  </Link>
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
