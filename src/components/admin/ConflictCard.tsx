"use client";

import { useState } from "react";
import Badge from "./Badge";
import ActionButton from "./ActionButton";
import type { DataConflict } from "@/types/center";
import { ArrowRightIcon } from "@/components/Icons";

export default function ConflictCard({
  field,
  conflict,
  pending,
  onAccept,
  onDismiss,
  onReopen,
  headerExtra,
}: {
  field: string;
  conflict: DataConflict;
  pending: boolean;
  onAccept: () => void;
  onDismiss: () => void;
  onReopen: () => void;
  headerExtra?: React.ReactNode;
}) {
  const [confirming, setConfirming] = useState(false);

  const statusVariant = conflict.status === "resolved" ? "green" : conflict.status === "dismissed" ? "slate" : "amber";

  return (
    <div className="rounded-2xl border border-white/10 bg-white/[0.04] p-4 shadow-2xl shadow-black/20 backdrop-blur-xl">
      <div className="mb-3 flex flex-wrap items-center justify-between gap-2">
        <div className="flex items-center gap-2">
          <span className="rounded-md bg-white/[0.06] px-2 py-0.5 font-mono text-xs font-semibold text-slate-300 ring-1 ring-white/10">{field}</span>
          {headerExtra}
        </div>
        <Badge variant={statusVariant}>{conflict.status}</Badge>
      </div>

      <div className="flex flex-col items-stretch gap-3 rounded-xl bg-black/20 p-3 sm:flex-row sm:items-center">
        <div className="flex-1 rounded-lg border border-amber-400/10 bg-amber-500/[0.05] p-2.5">
          <p className="text-[11px] font-medium uppercase tracking-wide text-amber-300/70">Valor actual</p>
          <p className="mt-0.5 text-sm text-slate-300 line-through decoration-amber-400/40">{conflict.current ?? "—"}</p>
        </div>
        <ArrowRightIcon className="hidden h-4 w-4 shrink-0 text-slate-600 sm:block" />
        <div className="flex-1 rounded-lg border border-emerald-400/15 bg-emerald-500/[0.05] p-2.5">
          <p className="text-[11px] font-medium uppercase tracking-wide text-emerald-300/70">Valor propuesto</p>
          <p className="mt-0.5 text-sm font-medium text-emerald-100">{conflict.proposed}</p>
        </div>
      </div>

      <p className="mt-2.5 text-xs text-slate-500">
        <span className="font-medium text-slate-400">Motivo:</span> {conflict.reason}
      </p>

      {conflict.status === "pending_manual_review" ? (
        <div className="mt-3 flex items-center gap-2">
          {confirming ? (
            <>
              <span className="text-xs text-slate-400">¿Aplicar el valor propuesto?</span>
              <ActionButton
                size="sm"
                variant="success"
                disabled={pending}
                onClick={() => {
                  onAccept();
                  setConfirming(false);
                }}
              >
                Confirmar
              </ActionButton>
              <ActionButton size="sm" variant="ghost" onClick={() => setConfirming(false)}>
                Cancelar
              </ActionButton>
            </>
          ) : (
            <>
              <ActionButton size="sm" variant="success" onClick={() => setConfirming(true)}>
                Aceptar propuesta
              </ActionButton>
              <ActionButton size="sm" disabled={pending} onClick={onDismiss}>
                Rechazar
              </ActionButton>
            </>
          )}
        </div>
      ) : (
        <div className="mt-3">
          <ActionButton size="sm" disabled={pending} onClick={onReopen}>
            Volver a pendiente
          </ActionButton>
        </div>
      )}
    </div>
  );
}
