"use client";

import { useState, useTransition } from "react";
import { updateClaimStatus } from "@/lib/admin/actions";
import Badge from "@/components/admin/Badge";
import CopyButton from "@/components/admin/CopyButton";
import ActionButton from "@/components/admin/ActionButton";
import EmptyState from "@/components/admin/EmptyState";
import { DocumentTextIcon } from "@/components/Icons";
import type { ClaimRow } from "@/lib/admin/data";

const STATUS_OPTIONS = ["nueva", "pendiente_verificacion", "aprobada", "rechazada", "spam"];

function statusVariant(status: string) {
  if (status === "aprobada") return "green" as const;
  if (status === "rechazada" || status === "spam") return "red" as const;
  if (status === "pendiente_verificacion") return "sky" as const;
  return "amber" as const;
}

export default function ClaimsView({ claims }: { claims: ClaimRow[] }) {
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<string | null>(null);

  const changeStatus = (id: string, status: string) => {
    startTransition(async () => {
      const res = await updateClaimStatus(id, status);
      setMsg(res.ok ? "Actualizado." : (res.error ?? "Error"));
    });
  };

  if (claims.length === 0) {
    return <EmptyState title="Sin reclamaciones" description="No hay reclamaciones de ficha todavía." icon={<DocumentTextIcon className="h-5 w-5" />} />;
  }

  return (
    <div className="flex flex-col gap-3">
      {msg ? <p className="text-sm text-slate-500">{msg}</p> : null}
      {claims.map((claim) => (
        <div key={claim.id} className="rounded-2xl border border-white/10 bg-white/[0.04] p-5 shadow-2xl shadow-black/20 backdrop-blur-xl">
          <div className="mb-3 flex flex-wrap items-center justify-between gap-2">
            <div>
              <span className="font-medium text-slate-100">{claim.center_name}</span>
              <span className="ml-2 text-xs text-slate-500">{new Date(claim.created_at).toLocaleString("es-ES")}</span>
            </div>
            <Badge variant={statusVariant(claim.status)}>{claim.status}</Badge>
          </div>

          <dl className="grid grid-cols-1 gap-3 text-sm sm:grid-cols-2">
            <div>
              <dt className="text-xs text-slate-500">Solicitante</dt>
              <dd className="text-slate-300">
                {claim.applicant_name} · {claim.applicant_role}
              </dd>
            </div>
            <div>
              <dt className="text-xs text-slate-500">Email corporativo</dt>
              <dd>
                <CopyButton value={claim.corporate_email} label={claim.corporate_email} />
              </dd>
            </div>
            <div>
              <dt className="text-xs text-slate-500">Teléfono</dt>
              <dd className="text-slate-300">{claim.phone ?? "—"}</dd>
            </div>
            <div>
              <dt className="text-xs text-slate-500">Web del centro (según reclamación)</dt>
              <dd className="text-slate-300">{claim.website ?? "—"}</dd>
            </div>
            <div className="sm:col-span-2">
              <dt className="text-xs text-slate-500">Mensaje</dt>
              <dd className="text-slate-300">{claim.comments ?? "—"}</dd>
            </div>
            <div className="sm:col-span-2">
              <dt className="text-xs text-slate-500">URL ficha</dt>
              <dd>
                <a href={claim.center_url} target="_blank" rel="noreferrer" className="text-cyan-300 hover:underline">
                  {claim.center_url}
                </a>
              </dd>
            </div>
          </dl>

          <div className="mt-4 flex flex-wrap gap-2 border-t border-white/[0.06] pt-3">
            {STATUS_OPTIONS.filter((s) => s !== claim.status).map((s) => (
              <ActionButton key={s} size="sm" disabled={pending} onClick={() => changeStatus(claim.id, s)}>
                Marcar {s}
              </ActionButton>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
