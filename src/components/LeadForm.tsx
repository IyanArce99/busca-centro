"use client";

import { useState } from "react";
import { FIELD_CLASS } from "@/lib/ui";
import { CheckCircleIcon } from "@/components/Icons";

interface LeadFormProps {
  centerName: string;
}

export default function LeadForm({ centerName }: Readonly<LeadFormProps>) {
  const [isSubmitted, setIsSubmitted] = useState(false);

  if (isSubmitted) {
    return (
      <div className="flex flex-col items-center gap-4 rounded-xl border border-emerald-200 bg-emerald-50 p-8 text-center">
        <div className="flex h-12 w-12 items-center justify-center rounded-full bg-emerald-100 text-emerald-600">
          <CheckCircleIcon className="h-6 w-6" />
        </div>
        <div>
          <p className="font-semibold text-emerald-900">Solicitud enviada</p>
          <p className="mt-1 text-sm text-emerald-700">
            Hemos registrado tu solicitud para {centerName}. El centro podrá contactarte por teléfono o email para
            responder a tu consulta.
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
      <div>
        <h3 className="text-lg font-semibold text-slate-900">Solicitar información</h3>
        <p className="mt-1 text-sm text-slate-500">
          Envía tu consulta y el centro se pondrá en contacto contigo.
        </p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">
            Nombre <span className="text-rose-500">*</span>
          </span>
          <input required type="text" placeholder="Tu nombre" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">
            Email <span className="text-rose-500">*</span>
          </span>
          <input required type="email" placeholder="tu@email.com" className={FIELD_CLASS} />
        </label>
      </div>

      <label className="text-sm">
        <span className="mb-1.5 block font-medium text-slate-700">Teléfono</span>
        <input type="tel" placeholder="6XX XXX XXX" className={FIELD_CLASS} />
      </label>

      <label className="text-sm">
        <span className="mb-1.5 block font-medium text-slate-700">Mensaje</span>
        <textarea
          rows={3}
          placeholder="¿Qué quieres saber sobre este centro?"
          className={FIELD_CLASS}
        />
      </label>

      <button
        type="submit"
        className="rounded-lg bg-sky-700 px-4 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-800 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2"
      >
        Enviar solicitud
      </button>
    </form>
  );
}
