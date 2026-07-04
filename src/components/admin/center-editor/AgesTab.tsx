"use client";

import type { AdminCenter } from "@/lib/admin/data";
import { formatAgeRange } from "@/lib/format";
import AdminSectionCard from "../AdminSectionCard";

export default function AgesTab({ center }: { center: AdminCenter }) {
  const ageText = formatAgeRange({ minMonths: center.age_min_months, maxMonths: center.age_max_months });
  const stage = center.age_max_months <= 36 ? "Primer ciclo (0-3 años)" : center.age_min_months >= 36 ? "Segundo ciclo (3-6 años)" : "Primer y segundo ciclo";

  return (
    <AdminSectionCard
      title="Edades / etapa educativa"
      description="Se gestionan por separado de los servicios: las aulas (aula-0-1, aula-1-2…) nunca se muestran como servicio, solo como rango de edad"
    >
      <dl className="grid grid-cols-2 gap-5 sm:grid-cols-3">
        <div>
          <dt className="text-xs font-medium text-slate-500">Edad mínima (meses)</dt>
          <dd className="mt-1 bg-gradient-to-r from-violet-300 to-cyan-300 bg-clip-text text-lg font-semibold text-transparent">{center.age_min_months}</dd>
        </div>
        <div>
          <dt className="text-xs font-medium text-slate-500">Edad máxima (meses)</dt>
          <dd className="mt-1 bg-gradient-to-r from-violet-300 to-cyan-300 bg-clip-text text-lg font-semibold text-transparent">{center.age_max_months}</dd>
        </div>
        <div>
          <dt className="text-xs font-medium text-slate-500">Etapa educativa</dt>
          <dd className="mt-1 text-sm font-medium text-slate-200">{stage}</dd>
        </div>
        <div className="col-span-2 border-t border-white/[0.06] pt-4 sm:col-span-3">
          <dt className="text-xs font-medium text-slate-500">Texto visible en la ficha pública</dt>
          <dd className="mt-1 text-sm text-slate-300">{ageText}</dd>
        </div>
      </dl>
      <p className="mt-4 text-xs text-slate-500">
        Para cambiar las edades admitidas, edítalas directamente en Supabase (age_min_months / age_max_months) — no hay edición aquí en esta primera versión para evitar
        desajustes con las aulas reales del centro.
      </p>
    </AdminSectionCard>
  );
}
