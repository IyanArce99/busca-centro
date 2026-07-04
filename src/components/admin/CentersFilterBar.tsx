"use client";

import { useRouter, usePathname, useSearchParams } from "next/navigation";
import { useCallback, useState, useTransition } from "react";
import { MagnifyingGlassIcon, ChevronRightIcon } from "@/components/Icons";
import FilterSelect from "./FilterSelect";

interface Option {
  value: string;
  label: string;
}

const TYPE_OPTIONS: Option[] = [
  { value: "guarderia", label: "Guardería" },
  { value: "escuela-infantil", label: "Escuela infantil" },
];
const OWNERSHIP_OPTIONS: Option[] = [
  { value: "publico", label: "Público" },
  { value: "privado", label: "Privado" },
  { value: "concertado", label: "Concertado" },
];
const STATUS_OPTIONS: Option[] = [
  { value: "published", label: "Publicado" },
  { value: "draft", label: "Borrador" },
  { value: "archived", label: "Archivado" },
];
const CONFIDENCE_OPTIONS: Option[] = [
  { value: "high", label: "Alta" },
  { value: "medium", label: "Media" },
  { value: "low", label: "Baja" },
  { value: "unknown", label: "Desconocida" },
];
const VERIFICATION_OPTIONS: Option[] = [
  { value: "verified", label: "Verificado" },
  { value: "partially_verified", label: "Parcial" },
  { value: "pending_manual_review", label: "Revisión pendiente" },
  { value: "unverified", label: "No verificado" },
];

const QUICK_FLAGS: [string, string][] = [
  ["thin", "Centros finos"],
  ["conflicts", "Con conflictos"],
  ["pendingReview", "Pending review"],
  ["comedor", "Con comedor"],
  ["horarioAmpliado", "Horario ampliado"],
  ["ingles", "Inglés/bilingüe"],
];

export default function CentersFilterBar() {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const [, startTransition] = useTransition();
  const [advancedOpen, setAdvancedOpen] = useState(false);

  const get = (key: string) => searchParams.get(key) ?? "";

  const setParam = useCallback(
    (key: string, value: string | null) => {
      const params = new URLSearchParams(searchParams.toString());
      if (value) params.set(key, value);
      else params.delete(key);
      params.delete("page");
      startTransition(() => router.push(`${pathname}?${params.toString()}`));
    },
    [pathname, router, searchParams]
  );

  const toggleFlag = (key: string) => setParam(key, get(key) === "1" ? null : "1");

  const activeChips = [
    ...QUICK_FLAGS.filter(([key]) => get(key) === "1").map(([key, label]) => ({ key, label })),
    get("services") === "some" && { key: "services", label: "Con servicios" },
    get("services") === "none" && { key: "services", label: "Sin servicios" },
    get("faqs") === "some" && { key: "faqs", label: "Con FAQs" },
    get("faqs") === "none" && { key: "faqs", label: "Sin FAQs" },
    get("longDescription") === "some" && { key: "longDescription", label: "Con long_description" },
    get("longDescription") === "none" && { key: "longDescription", label: "Sin long_description" },
  ].filter(Boolean) as { key: string; label: string }[];

  const hasAnyFilter = searchParams.toString().length > 0;

  return (
    <div className="flex flex-col gap-3 rounded-2xl border border-white/10 bg-white/[0.04] p-4 shadow-2xl shadow-black/20 backdrop-blur-xl">
      <div className="flex flex-wrap items-center gap-2">
        <div className="relative min-w-[260px] flex-1">
          <MagnifyingGlassIcon className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-500" />
          <input
            type="search"
            placeholder="Buscar por nombre, slug, dirección, teléfono, email o web..."
            defaultValue={get("q")}
            onChange={(e) => setParam("q", e.target.value || null)}
            className="w-full rounded-lg border border-white/10 bg-slate-900/70 py-1.5 pl-9 pr-3 text-sm text-slate-100 shadow-inner shadow-black/20 transition placeholder:text-slate-500 focus:border-violet-400/40 focus:outline-none focus:ring-2 focus:ring-violet-400/20"
          />
        </div>

        <FilterSelect value={get("type")} onChange={(v) => setParam("type", v || null)}>
          <option value="">Tipo</option>
          {TYPE_OPTIONS.map((o) => (
            <option key={o.value} value={o.value}>
              {o.label}
            </option>
          ))}
        </FilterSelect>

        <FilterSelect value={get("ownership")} onChange={(v) => setParam("ownership", v || null)}>
          <option value="">Titularidad</option>
          {OWNERSHIP_OPTIONS.map((o) => (
            <option key={o.value} value={o.value}>
              {o.label}
            </option>
          ))}
        </FilterSelect>

        <FilterSelect value={get("indexable")} onChange={(v) => setParam("indexable", v || null)}>
          <option value="">Indexable</option>
          <option value="yes">Indexable</option>
          <option value="no">Noindex</option>
        </FilterSelect>

        <button
          type="button"
          onClick={() => setAdvancedOpen((v) => !v)}
          className="ml-auto inline-flex items-center gap-1 rounded-lg px-2.5 py-1.5 text-sm font-medium text-slate-400 transition hover:bg-white/[0.06] hover:text-slate-100"
        >
          Filtros avanzados
          <ChevronRightIcon className={`h-3.5 w-3.5 transition-transform ${advancedOpen ? "rotate-90" : ""}`} />
        </button>
      </div>

      {advancedOpen ? (
        <div className="flex flex-wrap items-center gap-2 border-t border-white/[0.06] pt-3">
          <FilterSelect value={get("status")} onChange={(v) => setParam("status", v || null)}>
            <option value="">Estado</option>
            {STATUS_OPTIONS.map((o) => (
              <option key={o.value} value={o.value}>
                {o.label}
              </option>
            ))}
          </FilterSelect>
          <FilterSelect value={get("confidence")} onChange={(v) => setParam("confidence", v || null)}>
            <option value="">Confidence</option>
            {CONFIDENCE_OPTIONS.map((o) => (
              <option key={o.value} value={o.value}>
                {o.label}
              </option>
            ))}
          </FilterSelect>
          <FilterSelect value={get("verification")} onChange={(v) => setParam("verification", v || null)}>
            <option value="">Verificación</option>
            {VERIFICATION_OPTIONS.map((o) => (
              <option key={o.value} value={o.value}>
                {o.label}
              </option>
            ))}
          </FilterSelect>
          <FilterSelect value={get("services")} onChange={(v) => setParam("services", v || null)}>
            <option value="">Servicios</option>
            <option value="some">Con servicios</option>
            <option value="none">Sin servicios</option>
          </FilterSelect>
          <FilterSelect value={get("faqs")} onChange={(v) => setParam("faqs", v || null)}>
            <option value="">FAQs</option>
            <option value="some">Con FAQs</option>
            <option value="none">Sin FAQs</option>
          </FilterSelect>
          <FilterSelect value={get("longDescription")} onChange={(v) => setParam("longDescription", v || null)}>
            <option value="">Long description</option>
            <option value="some">Con long_description</option>
            <option value="none">Sin long_description</option>
          </FilterSelect>

          <div className="flex flex-wrap items-center gap-1.5">
            {QUICK_FLAGS.map(([key, label]) => {
              const active = get(key) === "1";
              return (
                <button
                  key={key}
                  type="button"
                  onClick={() => toggleFlag(key)}
                  className={`rounded-full px-3 py-1 text-xs font-medium ring-1 ring-inset transition ${
                    active
                      ? "bg-gradient-to-r from-violet-500 to-cyan-500 text-white ring-transparent shadow-lg shadow-violet-950/40"
                      : "bg-white/[0.04] text-slate-400 ring-white/10 hover:bg-white/[0.08] hover:text-slate-200"
                  }`}
                >
                  {label}
                </button>
              );
            })}
          </div>
        </div>
      ) : null}

      {activeChips.length > 0 ? (
        <div className="flex flex-wrap items-center gap-1.5 border-t border-white/[0.06] pt-3">
          {activeChips.map((chip) => (
            <button
              key={`${chip.key}-${chip.label}`}
              type="button"
              onClick={() => setParam(chip.key, null)}
              className="inline-flex items-center gap-1 rounded-full bg-violet-500/10 px-2.5 py-1 text-xs font-medium text-violet-300 ring-1 ring-inset ring-violet-400/20 transition hover:bg-violet-500/20"
            >
              {chip.label}
              <span aria-hidden="true">×</span>
            </button>
          ))}
          {hasAnyFilter ? (
            <button
              type="button"
              onClick={() => startTransition(() => router.push(pathname))}
              className="ml-1 text-xs font-medium text-slate-500 underline underline-offset-2 hover:text-slate-300"
            >
              Limpiar todos
            </button>
          ) : null}
        </div>
      ) : null}
    </div>
  );
}
