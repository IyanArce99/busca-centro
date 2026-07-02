"use client";

import { useRef, useState } from "react";
import { FIELD_CLASS } from "@/lib/ui";
import { CheckCircleIcon } from "@/components/Icons";
import { createLead } from "@/lib/data/forms";

interface LeadFormProps {
  centerName: string;
  centerSlug: string;
}

export default function LeadForm({ centerName, centerSlug }: Readonly<LeadFormProps>) {
  const formRef = useRef<HTMLFormElement>(null);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

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

  async function handleSubmit() {
    if (!formRef.current) return;
    setError(null);
    setIsLoading(true);

    const data = new FormData(formRef.current);

    const result = await createLead({
      centerSlug,
      name: data.get("name") as string,
      email: data.get("email") as string,
      phone: (data.get("phone") as string) || undefined,
      message: (data.get("message") as string) || undefined,
    });

    setIsLoading(false);

    if (result.error) {
      setError(result.error);
      return;
    }

    setIsSubmitted(true);
  }

  return (
    <form
      ref={formRef}
      onSubmit={(e) => { e.preventDefault(); void handleSubmit(); }}
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
          <input required name="name" type="text" placeholder="Tu nombre" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">
            Email <span className="text-rose-500">*</span>
          </span>
          <input required name="email" type="email" placeholder="tu@email.com" className={FIELD_CLASS} />
        </label>
      </div>

      <label className="text-sm">
        <span className="mb-1.5 block font-medium text-slate-700">Teléfono</span>
        <input name="phone" type="tel" placeholder="6XX XXX XXX" className={FIELD_CLASS} />
      </label>

      <label className="text-sm">
        <span className="mb-1.5 block font-medium text-slate-700">Mensaje</span>
        <textarea
          name="message"
          rows={3}
          placeholder="¿Qué quieres saber sobre este centro?"
          className={FIELD_CLASS}
        />
      </label>

      {error && (
        <p role="alert" className="rounded-lg border border-rose-200 bg-rose-50 px-4 py-2.5 text-sm text-rose-700">
          {error}
        </p>
      )}

      <button
        type="submit"
        disabled={isLoading}
        className="rounded-lg bg-sky-700 px-4 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-800 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2 disabled:opacity-60"
      >
        {isLoading ? "Enviando…" : "Enviar solicitud"}
      </button>
    </form>
  );
}
