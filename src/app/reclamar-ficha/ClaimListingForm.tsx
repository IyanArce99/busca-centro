"use client";

import { useRef, useState } from "react";
import { FIELD_CLASS } from "@/lib/ui";
import { CheckCircleIcon } from "@/components/Icons";
import { createCenterClaim } from "@/lib/data/forms";

const REQUIRED = <span className="text-rose-500">*</span>;

export default function ClaimListingForm() {
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
          <p className="font-semibold text-emerald-900">Solicitud de reclamación enviada</p>
          <p className="mt-1 text-sm text-emerald-700">
            Gracias por tu solicitud. Vamos a verificar tu vinculación con el centro antes de actualizar la ficha.
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

    const result = await createCenterClaim({
      centerName: data.get("center_name") as string,
      centerUrl: data.get("center_url") as string,
      applicantName: data.get("applicant_name") as string,
      applicantRole: data.get("applicant_role") as string,
      corporateEmail: data.get("corporate_email") as string,
      phone: (data.get("phone") as string) || undefined,
      website: (data.get("website") as string) || undefined,
      comments: (data.get("comments") as string) || undefined,
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
      <div className="grid gap-4 sm:grid-cols-2">
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Nombre del centro {REQUIRED}</span>
          <input required name="center_name" type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">URL de la ficha o ciudad {REQUIRED}</span>
          <input required name="center_url" type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Nombre del solicitante {REQUIRED}</span>
          <input required name="applicant_name" type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Cargo {REQUIRED}</span>
          <input required name="applicant_role" type="text" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Email corporativo {REQUIRED}</span>
          <input required name="corporate_email" type="email" className={FIELD_CLASS} />
        </label>
        <label className="text-sm">
          <span className="mb-1.5 block font-medium text-slate-700">Teléfono</span>
          <input name="phone" type="tel" className={FIELD_CLASS} />
        </label>
        <label className="text-sm sm:col-span-2">
          <span className="mb-1.5 block font-medium text-slate-700">Web del centro</span>
          <input name="website" type="url" className={FIELD_CLASS} />
        </label>
        <label className="text-sm sm:col-span-2">
          <span className="mb-1.5 block font-medium text-slate-700">Comentarios</span>
          <textarea name="comments" rows={3} className={FIELD_CLASS} />
        </label>
      </div>

      {error && (
        <p role="alert" className="rounded-lg border border-rose-200 bg-rose-50 px-4 py-2.5 text-sm text-rose-700">
          {error}
        </p>
      )}

      <button
        type="submit"
        disabled={isLoading}
        className="self-start rounded-lg bg-sky-700 px-5 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-sky-800 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2 disabled:opacity-60"
      >
        {isLoading ? "Enviando…" : "Enviar solicitud"}
      </button>
    </form>
  );
}
