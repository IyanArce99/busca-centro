"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import type { City } from "@/types/city";
import type { CenterType } from "@/types/center";
import { FIELD_CLASS } from "@/lib/ui";

interface SearchBoxProps {
  cities: City[];
}

const TYPE_OPTIONS: { value: CenterType; label: string }[] = [
  { value: "guarderia", label: "Guardería" },
  { value: "escuela-infantil", label: "Escuela infantil" },
];

export default function SearchBox({ cities }: SearchBoxProps) {
  const router = useRouter();
  const [citySlug, setCitySlug] = useState(cities[0]?.slug ?? "");
  const [type, setType] = useState<CenterType>("guarderia");

  function handleSubmit(event: React.FormEvent) {
    event.preventDefault();
    if (!citySlug) return;
    const prefix = type === "guarderia" ? "guarderias-en" : "escuelas-infantiles-en";
    router.push(`/${prefix}-${citySlug}`);
  }

  return (
    <form
      onSubmit={handleSubmit}
      className="flex w-full flex-col gap-3 rounded-2xl bg-white p-4 shadow-lg shadow-slate-900/5 sm:flex-row sm:items-end"
    >
      <label className="flex-1 text-left text-sm">
        <span className="mb-1 block font-medium text-slate-700">Tipo de centro</span>
        <select
          value={type}
          onChange={(event) => setType(event.target.value as CenterType)}
          className={`${FIELD_CLASS} text-slate-900`}
        >
          {TYPE_OPTIONS.map((option) => (
            <option key={option.value} value={option.value}>
              {option.label}
            </option>
          ))}
        </select>
      </label>

      <label className="flex-1 text-left text-sm">
        <span className="mb-1 block font-medium text-slate-700">Ciudad</span>
        <select
          value={citySlug}
          onChange={(event) => setCitySlug(event.target.value)}
          className={`${FIELD_CLASS} text-slate-900`}
        >
          {cities.map((city) => (
            <option key={city.slug} value={city.slug}>
              {city.name}
            </option>
          ))}
        </select>
      </label>

      <button
        type="submit"
        className="rounded-lg bg-sky-700 px-6 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-sky-800"
      >
        Buscar centros
      </button>
    </form>
  );
}
