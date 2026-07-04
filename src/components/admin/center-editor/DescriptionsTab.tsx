"use client";

import { useMemo, useState, useTransition } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import { updateCenterDescriptions } from "@/lib/admin/actions";
import SaveBar from "./SaveBar";
import AdminSectionCard from "../AdminSectionCard";
import ActionButton from "../ActionButton";
import Badge from "../Badge";
import { ExclamationTriangleIcon } from "@/components/Icons";

function countRepeatedWords(text: string): string | null {
  const words = text.toLowerCase().match(/[a-záéíóúñü]{5,}/g) ?? [];
  const counts = new Map<string, number>();
  for (const w of words) counts.set(w, (counts.get(w) ?? 0) + 1);
  const total = words.length || 1;
  for (const [word, count] of counts) {
    if (count >= 4 && count / total > 0.08) return word;
  }
  return null;
}

function lengthStatus(len: number, min: number, max: number): { label: string; variant: "slate" | "amber" | "green" } {
  if (len === 0) return { label: "Vacío", variant: "slate" };
  if (len < min) return { label: "Corto", variant: "amber" };
  if (len > max) return { label: "Largo", variant: "amber" };
  return { label: "Correcto", variant: "green" };
}

function DescriptionField({
  id,
  label,
  hint,
  value,
  onChange,
  rows,
  min,
  max,
}: {
  id: string;
  label: string;
  hint: string;
  value: string;
  onChange: (v: string) => void;
  rows: number;
  min: number;
  max: number;
}) {
  const len = value.trim().length;
  const status = lengthStatus(len, min, max);
  return (
    <div>
      <div className="mb-1.5 flex items-center justify-between">
        <label htmlFor={id} className="text-sm font-medium text-slate-300">
          {label}
        </label>
        <div className="flex items-center gap-2">
          <Badge variant={status.variant}>{status.label}</Badge>
          <span className="text-xs text-slate-500">
            {len} / recomendado {min}-{max}
          </span>
        </div>
      </div>
      <textarea
        id={id}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        rows={rows}
        className="w-full rounded-lg border border-white/10 bg-slate-900/70 px-3 py-2 text-sm text-slate-100 shadow-inner shadow-black/20 transition focus:border-violet-400/40 focus:outline-none focus:ring-2 focus:ring-violet-400/20"
      />
      <p className="mt-1 text-xs text-slate-500">{hint}</p>
    </div>
  );
}

export default function DescriptionsTab({ center }: { center: AdminCenter }) {
  const [short, setShort] = useState(center.short_description ?? "");
  const [long, setLong] = useState(center.long_description ?? "");
  const [showPreview, setShowPreview] = useState(false);
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<{ type: "ok" | "error"; text: string } | null>(null);

  const repeatedWord = useMemo(() => countRepeatedWords(long), [long]);
  const longTooShortForIndexable = center.isIndexable && long.trim().length > 0 && long.trim().length < 300;
  const emptyLongWhileIndexable = center.isIndexable && !long.trim() && center.realServices.length === 0;

  const warnings = [
    long.trim() && long.trim().length < 300 && "Texto muy corto para una long_description editorial.",
    repeatedWord && `Posible keyword stuffing: la palabra "${repeatedWord}" se repite mucho.`,
    long.trim() && center.confidence_level === "low" && "Hay long_description pero el confidence_level es bajo.",
    emptyLongWhileIndexable && "El centro es indexable pero no tiene long_description ni servicios — revisa el gate de calidad.",
    longTooShortForIndexable && "long_description corta para un centro ya indexable.",
  ].filter((w): w is string => Boolean(w));

  const save = () => {
    startTransition(async () => {
      const res = await updateCenterDescriptions(center.id, short, long);
      setMsg(res.ok ? { type: "ok", text: "Guardado." } : { type: "error", text: res.error ?? "Error" });
    });
  };

  return (
    <div className="flex flex-col gap-5">
      <AdminSectionCard title="Short description" description="Resumen breve usado como meta description">
        <DescriptionField id="short" label="Texto" hint="Recomendado: 180-450 caracteres." value={short} onChange={setShort} rows={3} min={180} max={450} />
      </AdminSectionCard>

      <AdminSectionCard
        title="Long description"
        description="Texto editorial extenso, solo si hay información real"
        actions={
          <div className="flex gap-2">
            <ActionButton size="sm" onClick={() => navigator.clipboard.writeText(long)}>
              Copiar texto
            </ActionButton>
            <ActionButton size="sm" variant="danger" onClick={() => setLong("")}>
              Limpiar
            </ActionButton>
          </div>
        }
      >
        <DescriptionField id="long" label="Texto" hint="Recomendado: 800-1500 caracteres, solo si hay información real." value={long} onChange={setLong} rows={10} min={800} max={1500} />

        {warnings.length > 0 ? (
          <div className="mt-4 flex flex-col gap-1.5 rounded-lg bg-amber-500/[0.07] px-3 py-2.5">
            {warnings.map((w) => (
              <span key={w} className="flex items-start gap-2 text-xs text-amber-200">
                <ExclamationTriangleIcon className="mt-0.5 h-3.5 w-3.5 shrink-0 text-amber-400" />
                {w}
              </span>
            ))}
          </div>
        ) : null}

        <button type="button" onClick={() => setShowPreview((v) => !v)} className="mt-3 text-xs font-medium text-slate-500 underline underline-offset-2 hover:text-slate-200">
          {showPreview ? "Ocultar preview" : "Previsualizar"}
        </button>
        {showPreview ? (
          <div className="mt-2 rounded-lg border border-white/[0.06] bg-black/20 p-4 text-sm leading-relaxed text-slate-300">{long.trim() || short || "Sin contenido."}</div>
        ) : null}
      </AdminSectionCard>

      <SaveBar pending={pending} message={msg} onSave={save} />
    </div>
  );
}
