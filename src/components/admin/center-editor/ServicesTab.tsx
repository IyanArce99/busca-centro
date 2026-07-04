"use client";

import { useState, useTransition } from "react";
import type { AdminCenter } from "@/lib/admin/data";
import { updateCenterServices, cleanInvalidServices } from "@/lib/admin/actions";
import SaveBar from "./SaveBar";
import AdminSectionCard from "../AdminSectionCard";
import ActionButton from "../ActionButton";
import ServiceToggle from "../ServiceToggle";
import { ExclamationTriangleIcon } from "@/components/Icons";

const SERVICE_GROUPS: { title: string; items: [string, string][] }[] = [
  {
    title: "Alimentación",
    items: [
      ["comedor", "Comedor"],
      ["cocina-propia", "Cocina propia"],
      ["catering", "Catering"],
    ],
  },
  {
    title: "Horario",
    items: [
      ["horario-ampliado", "Horario ampliado"],
      ["servicio-madrugadores", "Servicio de madrugadores"],
    ],
  },
  {
    title: "Idiomas",
    items: [
      ["ingles", "Inglés"],
      ["bilingue", "Bilingüe"],
    ],
  },
  {
    title: "Instalaciones",
    items: [["patio-exterior", "Patio exterior"]],
  },
  {
    title: "Actividades",
    items: [
      ["psicomotricidad", "Psicomotricidad"],
      ["musica", "Música"],
      ["actividades-extraescolares", "Actividades extraescolares"],
      ["verano-campamentos", "Verano / campamentos"],
    ],
  },
  {
    title: "Pedagogía / familia",
    items: [
      ["orientacion-pedagogica", "Orientación pedagógica"],
      ["escuela-de-padres", "Escuela de padres"],
    ],
  },
  {
    title: "Otros",
    items: [["uniformes", "Uniformes"]],
  },
];

export default function ServicesTab({ center }: { center: AdminCenter }) {
  const [selected, setSelected] = useState<Set<string>>(new Set(center.realServices));
  const [pending, startTransition] = useTransition();
  const [msg, setMsg] = useState<{ type: "ok" | "error"; text: string } | null>(null);

  const toggle = (key: string) =>
    setSelected((prev) => {
      const next = new Set(prev);
      if (next.has(key)) next.delete(key);
      else next.add(key);
      return next;
    });

  const save = () => {
    startTransition(async () => {
      const res = await updateCenterServices(center.id, Array.from(selected));
      setMsg(res.ok ? { type: "ok", text: "Guardado." } : { type: "error", text: res.error ?? "Error" });
    });
  };

  const clean = () => {
    startTransition(async () => {
      const res = await cleanInvalidServices(center.id);
      setMsg(res.ok ? { type: "ok", text: "Servicios inválidos eliminados." } : { type: "error", text: res.error ?? "Error" });
    });
  };

  return (
    <div className="flex flex-col gap-5">
      {center.hasInvalidServices ? (
        <div className="flex items-center justify-between gap-3 rounded-xl border border-rose-400/20 bg-rose-500/[0.07] px-4 py-3 text-sm text-rose-200">
          <span className="flex items-center gap-2.5">
            <ExclamationTriangleIcon className="h-4 w-4 shrink-0 text-rose-400" />
            Este centro tiene servicios legacy tipo aula-* almacenados en la base de datos (no se muestran ni cuentan aquí).
          </span>
          <ActionButton size="sm" variant="danger" onClick={clean} disabled={pending}>
            Limpiar servicios inválidos
          </ActionButton>
        </div>
      ) : null}

      <AdminSectionCard title="Servicios" description={`${selected.size} seleccionados · las aulas nunca se muestran como servicio`}>
        <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {SERVICE_GROUPS.map((group) => (
            <div key={group.title}>
              <h3 className="mb-2.5 text-xs font-semibold uppercase tracking-wide text-slate-500">{group.title}</h3>
              <div className="flex flex-wrap gap-1.5">
                {group.items.map(([key, label]) => (
                  <ServiceToggle key={key} active={selected.has(key)} label={label} onClick={() => toggle(key)} />
                ))}
              </div>
            </div>
          ))}
        </div>
        {center.confidence_level ? <p className="mt-5 border-t border-white/[0.06] pt-3 text-xs text-slate-500">Confidence de la ficha: {center.confidence_level}</p> : null}
      </AdminSectionCard>

      <SaveBar pending={pending} message={msg} onSave={save} />
    </div>
  );
}
