"use client";

import Link from "next/link";
import { useMemo, useState } from "react";
import type { Center, CenterOwnership, CenterService } from "@/types/center";
import { formatOwnership, formatService } from "@/lib/format";
import CenterCard from "./CenterCard";

interface CenterFiltersProps {
  centers: Center[];
}

const OWNERSHIP_OPTIONS: CenterOwnership[] = ["privado", "publico", "concertado"];

export default function CenterFilters({ centers }: CenterFiltersProps) {
  const [activeServices, setActiveServices] = useState<CenterService[]>([]);
  const [activeOwnership, setActiveOwnership] = useState<CenterOwnership | null>(null);

  const availableServices = useMemo(() => {
    const services = new Set<CenterService>();
    centers.forEach((center) => center.services.forEach((service) => services.add(service)));
    return Array.from(services);
  }, [centers]);

  const filteredCenters = useMemo(() => {
    return centers.filter((center) => {
      const matchesServices = activeServices.every((service) => center.services.includes(service));
      const matchesOwnership = !activeOwnership || center.ownership === activeOwnership;
      return matchesServices && matchesOwnership;
    });
  }, [centers, activeServices, activeOwnership]);

  function toggleService(service: CenterService) {
    setActiveServices((current) =>
      current.includes(service) ? current.filter((item) => item !== service) : [...current, service]
    );
  }

  if (centers.length === 0) {
    return (
      <p className="rounded-xl border border-dashed border-slate-300 bg-slate-50 p-6 text-sm text-slate-600">
        Todavía no hay centros añadidos para esta búsqueda. Vuelve pronto o{" "}
        <Link href="/anadir-centro" className="font-medium text-sky-700">
          añade un centro
        </Link>
        .
      </p>
    );
  }

  return (
    <div className="flex flex-col gap-6">
      {(availableServices.length > 0 || OWNERSHIP_OPTIONS.length > 0) && (
        <div className="flex flex-wrap gap-2">
          {availableServices.map((service) => {
            const isActive = activeServices.includes(service);
            return (
              <button
                key={service}
                type="button"
                onClick={() => toggleService(service)}
                className={`rounded-full border px-3 py-1.5 text-sm font-medium transition-colors ${
                  isActive ? "border-sky-700 bg-sky-700 text-white" : "border-slate-300 text-slate-700 hover:border-sky-400"
                }`}
              >
                {formatService(service)}
              </button>
            );
          })}
          {OWNERSHIP_OPTIONS.map((ownership) => {
            const isActive = activeOwnership === ownership;
            return (
              <button
                key={ownership}
                type="button"
                onClick={() => setActiveOwnership(isActive ? null : ownership)}
                className={`rounded-full border px-3 py-1.5 text-sm font-medium transition-colors ${
                  isActive ? "border-sky-700 bg-sky-700 text-white" : "border-slate-300 text-slate-700 hover:border-sky-400"
                }`}
              >
                {formatOwnership(ownership)}
              </button>
            );
          })}
        </div>
      )}

      <p className="text-sm text-slate-500">
        {filteredCenters.length} {filteredCenters.length === 1 ? "centro encontrado" : "centros encontrados"}
      </p>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {filteredCenters.map((center) => (
          <CenterCard key={center.id} center={center} />
        ))}
      </div>
    </div>
  );
}
