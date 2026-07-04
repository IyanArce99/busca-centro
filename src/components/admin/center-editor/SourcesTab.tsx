"use client";

import { useState, useTransition } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import { updateVerification } from "@/lib/admin/actions";
import SaveBar from "./SaveBar";
import AdminSectionCard from "../AdminSectionCard";
import { AdminSelect } from "../AdminInput";

export default function SourcesTab({ center }: { center: AdminCenter }) {
  const [verificationStatus, setVerificationStatus] = useState(center.verification_status ?? "unverified");
  const [confidenceLevel, setConfidenceLevel] = useState(center.confidence_level ?? "unknown");
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<{ type: "ok" | "error"; text: string } | null>(null);

  const run = (touchVerifiedAt: boolean) => {
    startTransition(async () => {
      const res = await updateVerification(center.id, { verificationStatus, confidenceLevel, touchVerifiedAt });
      setMsg(res.ok ? { type: "ok", text: "Guardado." } : { type: "error", text: res.error ?? "Error" });
    });
  };

  return (
    <div className="flex flex-col gap-5">
      <AdminSectionCard title="Fuentes" description="Enlaces de referencia usados para verificar los datos">
        <dl className="flex flex-col gap-3">
          <div>
            <dt className="text-xs font-medium text-slate-500">source_url</dt>
            <dd className="mt-0.5 text-sm">
              {center.source_url ? (
                <a href={center.source_url} target="_blank" rel="noreferrer" className="text-cyan-300 hover:underline">
                  {center.source_url}
                </a>
              ) : (
                <span className="text-slate-500">—</span>
              )}
            </dd>
          </div>
          <div>
            <dt className="text-xs font-medium text-slate-500">source_urls_secondary</dt>
            <dd className="mt-0.5 flex flex-col gap-1 text-sm">
              {center.source_urls_secondary && center.source_urls_secondary.length > 0 ? (
                center.source_urls_secondary.map((u) => (
                  <a key={u} href={u} target="_blank" rel="noreferrer" className="text-cyan-300 hover:underline">
                    {u}
                  </a>
                ))
              ) : (
                <span className="text-slate-500">—</span>
              )}
            </dd>
          </div>
        </dl>
      </AdminSectionCard>

      <AdminSectionCard title="Verificación" description="Estado de verificación y nivel de confianza de los datos">
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <AdminSelect
            label="verification_status"
            value={verificationStatus}
            onChange={setVerificationStatus}
            options={[
              ["unverified", "unverified"],
              ["partially_verified", "partially_verified"],
              ["verified", "verified"],
              ["pending_manual_review", "pending_manual_review"],
            ]}
          />
          <AdminSelect
            label="confidence_level"
            value={confidenceLevel}
            onChange={setConfidenceLevel}
            options={[
              ["unknown", "unknown"],
              ["low", "low"],
              ["medium", "medium"],
              ["high", "high"],
            ]}
          />
        </div>
        <p className="mt-4 border-t border-white/[0.06] pt-3 text-xs text-slate-500">verified_at actual: {center.verified_at ? new Date(center.verified_at).toLocaleString("es-ES") : "—"}</p>
        <button type="button" onClick={() => run(true)} disabled={pending} className="mt-2 text-xs font-medium text-slate-500 underline underline-offset-2 hover:text-slate-200">
          Guardar y actualizar verified_at a ahora
        </button>
      </AdminSectionCard>

      <SaveBar pending={pending} message={msg} onSave={() => run(false)} />
    </div>
  );
}
