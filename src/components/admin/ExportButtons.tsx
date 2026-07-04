"use client";

import type { AdminCenter } from "@/lib/admin/data";
import ActionButton from "./ActionButton";
import { DocumentTextIcon } from "@/components/Icons";

function download(filename: string, content: string, mime: string) {
  const blob = new Blob([content], { type: mime });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

const CSV_COLUMNS: [string, (c: AdminCenter) => string | number][] = [
  ["nombre", (c) => c.name],
  ["slug", (c) => c.slug],
  ["ciudad", (c) => c.city_name],
  ["distrito", (c) => c.district ?? ""],
  ["tipo", (c) => c.type],
  ["titularidad", (c) => c.ownership],
  ["estado", (c) => c.status],
  ["indexable", (c) => (c.isIndexable ? "si" : "no")],
  ["confidence", (c) => c.confidence_level ?? "unknown"],
  ["verification_status", (c) => c.verification_status ?? "unverified"],
  ["num_servicios", (c) => c.realServices.length],
  ["num_faqs", (c) => c.faqCount],
  ["tiene_long_description", (c) => (c.long_description?.trim() ? "si" : "no")],
  ["conflictos", (c) => c.conflictCount],
  ["actualizado", (c) => c.updated_at],
];

function toCsv(centers: AdminCenter[]): string {
  const escape = (v: string | number) => `"${String(v).replace(/"/g, '""')}"`;
  const header = CSV_COLUMNS.map(([name]) => escape(name)).join(",");
  const rows = centers.map((c) => CSV_COLUMNS.map(([, fn]) => escape(fn(c))).join(","));
  return [header, ...rows].join("\n");
}

export default function ExportButtons({ centers }: { centers: AdminCenter[] }) {
  return (
    <div className="flex gap-2">
      <ActionButton size="sm" icon={<DocumentTextIcon className="h-3.5 w-3.5" />} onClick={() => download("centros.csv", toCsv(centers), "text/csv;charset=utf-8;")}>
        Exportar CSV ({centers.length})
      </ActionButton>
      <ActionButton size="sm" icon={<DocumentTextIcon className="h-3.5 w-3.5" />} onClick={() => download("centros.json", JSON.stringify(centers, null, 2), "application/json")}>
        Exportar JSON ({centers.length})
      </ActionButton>
    </div>
  );
}
