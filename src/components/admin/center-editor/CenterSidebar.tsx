"use client";

import { useState, useTransition } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import { updateVerification } from "@/lib/admin/actions";
import AdminSectionCard from "../AdminSectionCard";
import SeoScoreBadge, { type SeoScore } from "../SeoScoreBadge";
import ActionButton from "../ActionButton";
import Badge from "../Badge";

function seoScore(c: AdminCenter): SeoScore {
  if (!c.isIndexable) return "no-indexar";
  const signals = [Boolean(c.long_description?.trim()), c.faqCount > 0, c.realServices.length > 0, Boolean(c.district || c.neighborhood || c.street)].filter(Boolean).length;
  return signals >= 4 ? "bueno" : signals >= 2 ? "medio" : "pobre";
}

function Row({ label, value }: { label: string; value: React.ReactNode }) {
  return (
    <div className="flex items-center justify-between gap-3 text-sm">
      <dt className="text-slate-500">{label}</dt>
      <dd className="text-right font-medium text-slate-200">{value ?? "—"}</dd>
    </div>
  );
}

export default function CenterSidebar({ center }: { center: AdminCenter }) {
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<string | null>(null);

  const run = (input: Parameters<typeof updateVerification>[1]) => {
    startTransition(async () => {
      const res = await updateVerification(center.id, input);
      setMsg(res.ok ? "Actualizado." : (res.error ?? "Error"));
    });
  };

  return (
    <div className="flex flex-col gap-4">
      <AdminSectionCard title="Calidad SEO" actions={<SeoScoreBadge score={seoScore(center)} />}>
        <dl className="flex flex-col gap-2">
          <Row label="Servicios" value={center.realServices.length} />
          <Row label="FAQs" value={center.faqCount} />
          <Row label="Long description" value={center.long_description?.trim() ? "Sí" : "No"} />
          <Row label="Conflictos" value={center.conflictCount > 0 ? <Badge variant="red">{center.conflictCount}</Badge> : "0"} />
        </dl>
      </AdminSectionCard>

      <AdminSectionCard title="Resumen">
        <dl className="flex flex-col gap-2">
          <Row label="Ciudad" value={center.city_name} />
          <Row label="Distrito" value={center.district} />
          <Row label="Barrio" value={center.neighborhood_barrio ?? center.neighborhood} />
          <Row label="Tipo" value={center.type === "guarderia" ? "Guardería" : "Escuela infantil"} />
          <Row label="Titularidad" value={center.ownership} />
          <Row label="Estado" value={center.status} />
          <Row label="Actualizado" value={new Date(center.updated_at).toLocaleDateString("es-ES")} />
        </dl>
      </AdminSectionCard>

      <AdminSectionCard title="Verificación" description="Acciones rápidas de estado">
        <div className="flex flex-col gap-2">
          <ActionButton size="sm" variant="success" disabled={pending} onClick={() => run({ verificationStatus: "verified", confidenceLevel: "high", touchVerifiedAt: true })}>
            Marcar verificado
          </ActionButton>
          <ActionButton
            size="sm"
            disabled={pending}
            onClick={() => run({ verificationStatus: "pending_manual_review", confidenceLevel: center.confidence_level ?? "unknown", touchVerifiedAt: false })}
          >
            Marcar revisión pendiente
          </ActionButton>
          <ActionButton size="sm" variant="ghost" disabled={pending} onClick={() => run({ verificationStatus: "unverified", confidenceLevel: "unknown", touchVerifiedAt: false })}>
            Marcar no verificado
          </ActionButton>
          {msg ? <p className="text-xs text-slate-500">{msg}</p> : null}
          <p className="mt-1 text-xs text-slate-500">
            verified_at: {center.verified_at ? new Date(center.verified_at).toLocaleDateString("es-ES") : "—"}
          </p>
        </div>
      </AdminSectionCard>

      <AdminSectionCard title="Fuentes">
        <dl className="flex flex-col gap-2 text-sm">
          <div>
            <dt className="text-xs text-slate-500">source_url</dt>
            <dd className="mt-0.5 truncate">
              {center.source_url ? (
                <a href={center.source_url} target="_blank" rel="noreferrer" className="text-cyan-300 hover:underline">
                  {center.source_url}
                </a>
              ) : (
                <span className="text-slate-400">—</span>
              )}
            </dd>
          </div>
          {center.source_urls_secondary && center.source_urls_secondary.length > 0 ? (
            <div>
              <dt className="text-xs text-slate-500">Fuentes secundarias</dt>
              <dd className="mt-0.5 flex flex-col gap-1">
                {center.source_urls_secondary.map((u) => (
                  <a key={u} href={u} target="_blank" rel="noreferrer" className="truncate text-slate-700 hover:underline">
                    {u}
                  </a>
                ))}
              </dd>
            </div>
          ) : null}
        </dl>
      </AdminSectionCard>
    </div>
  );
}
