import type { AdminCenter } from "@/lib/admin/data";
import type { FAQItem } from "@/types/faq";
import { formatService, formatCenterType, formatOwnership } from "@/lib/format";
import type { CenterService } from "@/types/center";
import AdminSectionCard from "../AdminSectionCard";

export default function PreviewTab({ center }: { center: AdminCenter }) {
  const faqs = Array.isArray(center.faqs) ? (center.faqs as unknown as FAQItem[]) : [];

  return (
    <AdminSectionCard title="Vista previa" description="Aproximación de cómo se verá la ficha pública (fondo claro, igual que el sitio público)">
      <div className="mx-auto max-w-2xl overflow-hidden rounded-xl border border-slate-200 shadow-2xl shadow-black/40">
        <header className="flex flex-col gap-1 border-b border-slate-100 bg-slate-50/60 px-6 py-5">
          <h2 className="text-2xl font-bold text-slate-900">{center.name}</h2>
          <p className="text-sm text-slate-500">
            {formatCenterType(center.type as never)} · {formatOwnership(center.ownership as never)} · {center.district || center.neighborhood || center.city_name}
          </p>
        </header>

        <section className="border-b border-slate-100 px-6 py-4">
          <h3 className="mb-1 text-sm font-semibold text-slate-700">Sobre este centro</h3>
          <p className="text-sm leading-relaxed text-slate-600">{center.long_description?.trim() || center.short_description}</p>
        </section>

        <section className="border-b border-slate-100 px-6 py-4">
          <h3 className="mb-2 text-sm font-semibold text-slate-700">Servicios</h3>
          {center.realServices.length > 0 ? (
            <div className="flex flex-wrap gap-1.5">
              {center.realServices.map((s) => (
                <span key={s} className="rounded-full bg-slate-100 px-2.5 py-1 text-xs font-medium text-slate-600">
                  {formatService(s as CenterService)}
                </span>
              ))}
            </div>
          ) : (
            <p className="text-sm text-slate-400">Sin servicios confirmados todavía.</p>
          )}
        </section>

        <section className="border-b border-slate-100 px-6 py-4">
          <h3 className="mb-2 text-sm font-semibold text-slate-700">Preguntas frecuentes</h3>
          {faqs.length > 0 ? (
            <ul className="flex flex-col gap-3">
              {faqs.map((f, i) => (
                <li key={i}>
                  <p className="text-sm font-medium text-slate-800">{f.question}</p>
                  <p className="text-sm text-slate-600">{f.answer}</p>
                </li>
              ))}
            </ul>
          ) : (
            <p className="text-sm text-slate-400">Sin FAQs en base de datos — se mostrará el fallback automático (2-3 preguntas básicas).</p>
          )}
        </section>

        <section className="px-6 py-4">
          <h3 className="mb-1 text-sm font-semibold text-slate-700">Contacto</h3>
          <p className="text-sm text-slate-600">
            {center.phone || "sin teléfono"} · {center.email || "sin email"} · {center.website || "sin web"}
          </p>
        </section>
      </div>
    </AdminSectionCard>
  );
}
