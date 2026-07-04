"use client";

import { useMemo, useState, useTransition } from "react";
import Link from "next/link";
import { resolveConflict } from "@/lib/admin/actions";
import type { DataConflict } from "@/types/center";
import ConflictCard from "@/components/admin/ConflictCard";
import FilterSelect from "@/components/admin/FilterSelect";
import EmptyState from "@/components/admin/EmptyState";
import { CheckCircleIcon } from "@/components/Icons";

export interface ConflictRow {
  centerId: string;
  centerName: string;
  slug: string;
  district: string | null;
  type: string;
  field: string;
  conflict: DataConflict;
  updatedAt: string;
}

export default function ConflictsView({ rows }: { rows: ConflictRow[] }) {
  const [fieldFilter, setFieldFilter] = useState("");
  const [statusFilter, setStatusFilter] = useState("");
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<string | null>(null);

  const fields = useMemo(() => Array.from(new Set(rows.map((r) => r.field))).sort(), [rows]);

  const filtered = rows.filter((r) => (!fieldFilter || r.field === fieldFilter) && (!statusFilter || r.conflict.status === statusFilter));

  const act = (row: ConflictRow, decision: "accept" | "dismiss" | "pending") => {
    startTransition(async () => {
      const res = await resolveConflict(row.centerId, row.field, decision);
      setMsg(res.ok ? "Actualizado." : (res.error ?? "Error"));
    });
  };

  return (
    <div className="flex flex-col gap-4">
      <div className="flex flex-wrap items-center gap-2 rounded-2xl border border-white/10 bg-white/[0.04] p-3 shadow-2xl shadow-black/20 backdrop-blur-xl">
        <FilterSelect value={fieldFilter} onChange={setFieldFilter}>
          <option value="">Campo (todos)</option>
          {fields.map((f) => (
            <option key={f} value={f}>
              {f}
            </option>
          ))}
        </FilterSelect>
        <FilterSelect value={statusFilter} onChange={setStatusFilter}>
          <option value="">Estado (todos)</option>
          <option value="pending_manual_review">pending_manual_review</option>
          <option value="resolved">resolved</option>
          <option value="dismissed">dismissed</option>
        </FilterSelect>
        {msg ? <span className="text-sm text-slate-500">{msg}</span> : null}
      </div>

      {filtered.length === 0 ? (
        <EmptyState title="Sin conflictos" description="No hay conflictos que coincidan con estos filtros." icon={<CheckCircleIcon className="h-5 w-5" />} />
      ) : (
        <div className="flex flex-col gap-3">
          {filtered.map((row) => (
            <ConflictCard
              key={`${row.centerId}-${row.field}`}
              field={row.field}
              conflict={row.conflict}
              pending={pending}
              onAccept={() => act(row, "accept")}
              onDismiss={() => act(row, "dismiss")}
              onReopen={() => act(row, "pending")}
              headerExtra={
                <Link href={`/admin/centers/${row.centerId}`} className="text-sm font-medium text-slate-200 transition hover:text-white hover:underline">
                  {row.centerName}
                  {row.district ? <span className="ml-1.5 font-normal text-slate-500">· {row.district}</span> : null}
                </Link>
              }
            />
          ))}
        </div>
      )}
    </div>
  );
}
