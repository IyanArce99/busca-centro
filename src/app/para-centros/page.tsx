import type { Metadata } from "next";
import Breadcrumbs from "@/components/Breadcrumbs";
import SectionHeader from "@/components/SectionHeader";
import CTASection from "@/components/CTASection";
import FAQ from "@/components/FAQ";
import { paraCentrosFaqs } from "@/data/mock-faqs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Para centros",
  description: "Haz visible tu guardería o escuela infantil ante más familias: añade tu centro o reclama tu ficha en BuscaCentro.",
  alternates: { canonical: "/para-centros" },
  robots: robotsMeta(),
};

const BENEFITS = [
  {
    title: "Más visibilidad",
    description: "Tu centro aparece en búsquedas por ciudad, barrio y servicios, junto al resto de centros del directorio.",
  },
  {
    title: "Ficha clara y completa",
    description: "Muestra horarios, servicios, edades admitidas y datos de contacto en un solo lugar.",
  },
  {
    title: "Solicitudes directas",
    description: "Las familias interesadas pueden solicitar información directamente desde tu ficha.",
  },
];

const HOW_IT_WORKS = [
  { title: "Añade o reclama tu ficha", description: "Envía los datos básicos de tu centro o reclama una ficha existente." },
  { title: "Revisamos la información", description: "Comprobamos los datos enviados antes de publicarlos o actualizarlos." },
  { title: "Recibe solicitudes de familias", description: "Las familias interesadas te contactan directamente desde tu ficha." },
];

export default function ParaCentrosPage() {
  return (
    <div className="mx-auto flex max-w-5xl flex-col gap-12 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Para centros" }]} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">
          Haz visible tu guardería o escuela infantil ante más familias
        </h1>
        <p className="max-w-2xl text-lg text-slate-600">
          BuscaCentro ayuda a familias a comparar centros y solicitar información. Añade tu centro o reclama tu ficha para
          mantener tus datos actualizados.
        </p>
      </header>

      <section>
        <SectionHeader eyebrow="Beneficios" title="Por qué aparecer en el directorio" />
        <div className="mt-6 grid gap-4 sm:grid-cols-3">
          {BENEFITS.map((benefit) => (
            <div key={benefit.title} className="rounded-xl border border-slate-200 bg-white p-6">
              <h3 className="text-base font-semibold text-slate-900">{benefit.title}</h3>
              <p className="mt-2 text-sm text-slate-600">{benefit.description}</p>
            </div>
          ))}
        </div>
      </section>

      <section>
        <SectionHeader eyebrow="Cómo funciona" title="Tres pasos para aparecer en BuscaCentro" />
        <div className="mt-6 grid gap-4 sm:grid-cols-3">
          {HOW_IT_WORKS.map((step, index) => (
            <div key={step.title} className="rounded-xl border border-slate-200 bg-white p-6">
              <span className="text-sm font-bold text-sky-700">Paso {index + 1}</span>
              <h3 className="mt-2 text-base font-semibold text-slate-900">{step.title}</h3>
              <p className="mt-2 text-sm text-slate-600">{step.description}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="grid gap-4 sm:grid-cols-3">
        <CTASection
          variant="dark"
          title="Reclamar mi ficha"
          description="Si tu centro ya aparece en el directorio."
          primaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
        />
        <CTASection
          variant="light"
          title="Añadir mi centro"
          description="Si tu centro todavía no está en el directorio."
          primaryAction={{ label: "Añadir centro", href: "/anadir-centro" }}
        />
        <CTASection
          variant="light"
          title="Actualizar datos"
          description="Solicita una actualización de tu ficha actual."
          primaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
        />
      </section>

      <FAQ title="Preguntas frecuentes para centros" items={paraCentrosFaqs} />
    </div>
  );
}
