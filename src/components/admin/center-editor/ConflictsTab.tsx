"use client";

import { useState, useTransition } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import { resolveConflict } from "@/lib/admin/actions";
import type { DataConflict } from "@/types/center";
import ConflictCard from "../ConflictCard";
import EmptyState from "../EmptyState";
import { CheckCircleIcon } from "@/components/Icons";

export default function ConflictsTab({ center }: { center: AdminCenter }) {
  const conflicts = (center.data_conflicts as unknown as Record<string, DataConflict>) ?? {};
  const entries = Object.entries(conflicts);
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<string | null>(null);

  const act = (field: string, decision: "accept" | "dismiss" | "pending") => {
    startTransition(async () => {
      const res = await resolveConflict(center.id, field, decision);
      setMsg(res.ok ? "Actualizado." : (res.error ?? "Error"));
    });
  };

  if (entries.length === 0) {
    return <EmptyState title="Sin conflictos" description="Este centro no tiene conflictos de datos registrados." icon={<CheckCircleIcon className="h-5 w-5" />} />;
  }

  return (
    <div className="flex flex-col gap-3">
      {msg ? <p className="text-sm text-slate-500">{msg}</p> : null}
      {entries.map(([field, conflict]) => (
        <ConflictCard
          key={field}
          field={field}
          conflict={conflict}
          pending={pending}
          onAccept={() => act(field, "accept")}
          onDismiss={() => act(field, "dismiss")}
          onReopen={() => act(field, "pending")}
        />
      ))}
    </div>
  );
}
