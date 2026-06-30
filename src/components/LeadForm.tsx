"use client";

import { useState } from "react";
import { FIELD_CLASS } from "@/lib/ui";

interface LeadFormProps {
  centerName: string;
}

export default function LeadForm({ centerName }: LeadFormProps) {
  const [isSubmitted, setIsSubmitted] = useState(false);

  if (isSubmitted) {
    return (
      <div className="rounded-xl border border-emerald-200 bg-emerald-50 p-6 text-sm text-emerald-800">
        <p className="font-semibold">Solicitud enviada</p>
        <p className="mt-1">
          Hemos registrado tu solicitud de información para {centerName}. El centro podrá contactarte por teléfono o email
          para responder a tu consulta.
        </p>
      </div>
    );
  }

  return (
    <form
      onSubmit={(event) => {
        event.preventDefault();
        setIsSubmitted(true);
      }}
      className="flex flex-col gap-4 rounded-xl border border-slate-200 bg-white p-6"
    >
      <h3 className="text-lg font-semibold text-slate-900">Solicitar información</h3>
      <label className="text-sm">
        <span className="mb-1 block font-medium text-slate-700">
          Nombre <span className="text-rose-600">*</span>
        </span>
        <input required type="text" className={FIELD_CLASS} />
      </label>
      <label className="text-sm">
        <span className="mb-1 block font-medium text-slate-700">
          Email <span className="text-rose-600">*</span>
        </span>
        <input required type="email" className={FIELD_CLASS} />
      </label>
      <label className="text-sm">
        <span className="mb-1 block font-medium text-slate-700">Teléfono</span>
        <input type="tel" className={FIELD_CLASS} />
      </label>
      <label className="text-sm">
        <span className="mb-1 block font-medium text-slate-700">Mensaje</span>
        <textarea rows={3} className={FIELD_CLASS} />
      </label>
      <button
        type="submit"
        className="rounded-lg bg-sky-700 px-4 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-sky-800"
      >
        Enviar solicitud
      </button>
    </form>
  );
}
