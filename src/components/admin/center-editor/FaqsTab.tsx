"use client";

import { useMemo, useState, useTransition } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import { updateCenterFaqs } from "@/lib/admin/actions";
import type { FAQItem } from "@/types/faq";
import SaveBar from "./SaveBar";
import AdminSectionCard from "../AdminSectionCard";
import ActionButton from "../ActionButton";
import EmptyState from "../EmptyState";
import { ChatBubbleIcon, ExclamationTriangleIcon } from "@/components/Icons";

const UNCONFIRMED_SERVICE_WORDS = ["comedor", "bilingüe", "bilingue", "inglés", "ingles", "psicomotricidad", "música", "musica", "uniformes"];

function validateFaqs(faqs: FAQItem[], confirmedServices: string[]): string[] {
  const warnings: string[] = [];
  if (faqs.length < 3) warnings.push("Se recomiendan al menos 3 FAQs.");
  if (faqs.length > 6) warnings.push("Se recomienda un máximo de 6 FAQs.");

  const seen = new Set<string>();
  for (const f of faqs) {
    const key = f.question.trim().toLowerCase();
    if (key && seen.has(key)) warnings.push(`Pregunta duplicada: "${f.question}"`);
    seen.add(key);

    const len = f.answer.trim().length;
    if (len > 0 && (len < 150 || len > 350)) warnings.push(`Respuesta fuera de rango (150-350) en: "${f.question || "(sin pregunta)"}"`);

    for (const word of UNCONFIRMED_SERVICE_WORDS) {
      if (f.question.toLowerCase().includes(word) && !confirmedServices.some((s) => s.includes(word.replace("é", "e").replace("í", "i")))) {
        warnings.push(`La FAQ "${f.question}" menciona un servicio no confirmado (${word}).`);
      }
    }
  }
  return warnings;
}

export default function FaqsTab({ center }: { center: AdminCenter }) {
  const [faqs, setFaqs] = useState<FAQItem[]>(Array.isArray(center.faqs) ? (center.faqs as unknown as FAQItem[]) : []);
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<{ type: "ok" | "error"; text: string } | null>(null);

  const warnings = useMemo(() => validateFaqs(faqs, center.realServices), [faqs, center.realServices]);

  const update = (i: number, field: "question" | "answer", value: string) =>
    setFaqs((prev) => prev.map((f, idx) => (idx === i ? { ...f, [field]: value } : f)));

  const remove = (i: number) => setFaqs((prev) => prev.filter((_, idx) => idx !== i));
  const add = () => setFaqs((prev) => [...prev, { question: "", answer: "" }]);
  const move = (i: number, dir: -1 | 1) =>
    setFaqs((prev) => {
      const next = [...prev];
      const j = i + dir;
      if (j < 0 || j >= next.length) return prev;
      [next[i], next[j]] = [next[j]!, next[i]!];
      return next;
    });

  const save = () => {
    startTransition(async () => {
      const res = await updateCenterFaqs(center.id, faqs);
      setMsg(res.ok ? { type: "ok", text: "Guardado. El JSON-LD FAQPage usará exactamente estas FAQs." } : { type: "error", text: res.error ?? "Error" });
    });
  };

  return (
    <div className="flex flex-col gap-4">
      <AdminSectionCard
        title="Preguntas frecuentes"
        description="El JSON-LD FAQPage de la ficha pública usa exactamente estas FAQs (o el fallback automático si no hay ninguna)"
        actions={
          <div className="flex gap-2">
            <ActionButton size="sm" onClick={add}>
              + Añadir FAQ
            </ActionButton>
            <ActionButton size="sm" onClick={() => navigator.clipboard.writeText(JSON.stringify(faqs, null, 2))}>
              Copiar JSON
            </ActionButton>
            <ActionButton size="sm" variant="danger" onClick={() => setFaqs([])}>
              Limpiar
            </ActionButton>
          </div>
        }
      >
        {warnings.length > 0 ? (
          <div className="mb-4 flex flex-col gap-1.5 rounded-lg bg-amber-500/[0.07] px-3 py-2.5">
            {warnings.map((w) => (
              <span key={w} className="flex items-start gap-2 text-xs text-amber-200">
                <ExclamationTriangleIcon className="mt-0.5 h-3.5 w-3.5 shrink-0 text-amber-400" />
                {w}
              </span>
            ))}
          </div>
        ) : null}

        {faqs.length === 0 ? (
          <EmptyState title="Sin FAQs" description="Añade preguntas frecuentes para mejorar el SEO de esta ficha." icon={<ChatBubbleIcon className="h-5 w-5" />} />
        ) : (
          <div className="flex flex-col gap-3">
            {faqs.map((faq, i) => (
              <div key={i} className="rounded-xl border border-white/10 bg-black/20 p-4">
                <div className="mb-2.5 flex items-center justify-between">
                  <span className="flex h-5 min-w-5 items-center justify-center rounded-full bg-gradient-to-br from-violet-500/30 to-cyan-500/30 px-1.5 text-[11px] font-semibold text-slate-200 ring-1 ring-white/10">
                    {i + 1}
                  </span>
                  <div className="flex items-center gap-0.5 text-xs">
                    <button type="button" onClick={() => move(i, -1)} disabled={i === 0} className="rounded-md px-1.5 py-1 text-slate-500 transition hover:bg-white/[0.08] disabled:opacity-30">
                      ↑
                    </button>
                    <button
                      type="button"
                      onClick={() => move(i, 1)}
                      disabled={i === faqs.length - 1}
                      className="rounded-md px-1.5 py-1 text-slate-500 transition hover:bg-white/[0.08] disabled:opacity-30"
                    >
                      ↓
                    </button>
                    <button type="button" onClick={() => remove(i)} className="ml-1 rounded-md px-2 py-1 font-medium text-rose-400 transition hover:bg-rose-500/10">
                      Eliminar
                    </button>
                  </div>
                </div>
                <input
                  value={faq.question}
                  onChange={(e) => update(i, "question", e.target.value)}
                  placeholder="Pregunta"
                  className="mb-2 w-full rounded-lg border border-white/10 bg-slate-900/70 px-3 py-1.5 text-sm font-medium text-slate-100 shadow-inner shadow-black/20 focus:border-violet-400/40 focus:outline-none focus:ring-2 focus:ring-violet-400/20"
                />
                <textarea
                  value={faq.answer}
                  onChange={(e) => update(i, "answer", e.target.value)}
                  placeholder="Respuesta"
                  rows={3}
                  className="w-full rounded-lg border border-white/10 bg-slate-900/70 px-3 py-1.5 text-sm text-slate-100 shadow-inner shadow-black/20 focus:border-violet-400/40 focus:outline-none focus:ring-2 focus:ring-violet-400/20"
                />
                <span className="mt-1 block text-xs text-slate-500">{faq.answer.trim().length} caracteres</span>
              </div>
            ))}
          </div>
        )}
      </AdminSectionCard>

      <SaveBar pending={pending} message={msg} onSave={save} />
    </div>
  );
}
