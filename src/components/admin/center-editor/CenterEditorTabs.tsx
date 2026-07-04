"use client";

import { useState } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import BasicsTab from "./BasicsTab";
import ServicesTab from "./ServicesTab";
import AgesTab from "./AgesTab";
import DescriptionsTab from "./DescriptionsTab";
import FaqsTab from "./FaqsTab";
import SourcesTab from "./SourcesTab";
import ConflictsTab from "./ConflictsTab";
import PreviewTab from "./PreviewTab";

const TABS = [
  { key: "basics", label: "Datos básicos" },
  { key: "services", label: "Servicios" },
  { key: "ages", label: "Edades" },
  { key: "descriptions", label: "Descripciones" },
  { key: "faqs", label: "FAQs" },
  { key: "sources", label: "Fuentes" },
  { key: "conflicts", label: "Conflictos" },
  { key: "preview", label: "Vista previa" },
] as const;

type TabKey = (typeof TABS)[number]["key"];

export default function CenterEditorTabs({ center }: { center: AdminCenter }) {
  const [tab, setTab] = useState<TabKey>("basics");
  const conflictCount = center.conflictCount;

  return (
    <div className="flex flex-col gap-5">
      <div className="flex flex-wrap gap-1 rounded-xl border border-white/10 bg-white/[0.04] p-1 shadow-2xl shadow-black/20 backdrop-blur-xl">
        {TABS.map((t) => (
          <button
            key={t.key}
            type="button"
            onClick={() => setTab(t.key)}
            className={`relative rounded-lg px-3 py-1.5 text-sm font-medium transition ${
              tab === t.key ? "bg-gradient-to-r from-violet-500 to-cyan-500 text-white shadow-lg shadow-violet-950/40" : "text-slate-400 hover:bg-white/[0.06] hover:text-slate-100"
            }`}
          >
            {t.label}
            {t.key === "conflicts" && conflictCount > 0 ? (
              <span
                className={`ml-1.5 inline-flex h-4 min-w-4 items-center justify-center rounded-full px-1 text-[10px] font-bold ${
                  tab === t.key ? "bg-white/20 text-white" : "bg-rose-500/15 text-rose-300"
                }`}
              >
                {conflictCount}
              </span>
            ) : null}
          </button>
        ))}
      </div>

      <div>
        {tab === "basics" && <BasicsTab center={center} />}
        {tab === "services" && <ServicesTab center={center} />}
        {tab === "ages" && <AgesTab center={center} />}
        {tab === "descriptions" && <DescriptionsTab center={center} />}
        {tab === "faqs" && <FaqsTab center={center} />}
        {tab === "sources" && <SourcesTab center={center} />}
        {tab === "conflicts" && <ConflictsTab center={center} />}
        {tab === "preview" && <PreviewTab center={center} />}
      </div>
    </div>
  );
}
