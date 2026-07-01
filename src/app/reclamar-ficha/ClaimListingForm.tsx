"use client";

import { useState } from "react";
import { FIELD_CLASS } from "@/lib/ui";
import { CheckCircleIcon } from "@/components/Icons";

const REQUIRED = <span className="text-rose-500">*</span>;

export default function ClaimListingForm() {
  const [isSubmitted, setIsSubmitted] = useState(false);

  if (isSubmitted) {
    return (
      <div className="flex flex-col items-center gap-4 rounded-xl border border-emerald-200 bg-emerald-50 p-8 text-center">
        <div className="flex h-12 w-12 items-center justify-center rounded-full bg-emerald-100 text-emerald-600">
          <CheckCircleIcon className="h-6 w-6" />
        </div>
        <div>
          <p className="font-semibold text-emerald-900">Solicitud de reclamación enviada</p>
          <p className="mt-1 text-sm text-emerald-700">
            Gracias por tu solicitud. Vamos a verificar tu vinculación con el centro antes de actualizar la ficha.
          </p>
        </div>
      </div>
    );
  }

  return (
    <form
      onSubmit={(e) => {
        e.preventDefault();
        setIsSubmitted(true);
      }}
      className="flex flex-col gap-5 rounded-xl border border-slate-200 bg-white p-6 shadow-sm"
    >
      <div className="grid gap-4 sm:grid-cols-2">
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Nombre del centro {REQUIRED}</span>
          <input required type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">URL de la ficha o ciudad {REQUIRED}</span>
          <input required type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Nombre del solicitante {REQUIRED}</span>
          <input required type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Cargo {REQUIRED}</span>
          <input required type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Email corporativo {REQUIRED}</span>
          <input required type="email" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Teléfono</span>
          <input type="tel" className={FIELD_CLASS} />
        </label>
        <label className="text-sm sm:col-span-2">
          <span className="mb-1.5 block font-medium text-slate-700">Web del centro</span>
          <input type="url" className={FIELD_CLASS} />
        </label>
        <label className="text-sm sm:col-span-2">
          <span className="mb-1.5 block font-medium text-slate-700">Comentarios</span>
          <textarea rows={3} className={FIELD_CLASS} />
        </label>
      </div>

      <button
        type="submit"
        className="self-start rounded-lg bg-sky-700 px-5 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-sky-800 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2"
      >
        Enviar solicitud
      </button>
    </form>
  );
}
