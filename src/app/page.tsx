import type { Metadata } from "next";
import Link from "next/link";
import SearchBox from "@/components/SearchBox";
import CityCard from "@/components/CityCard";
import CategoryCard from "@/components/CategoryCard";
import CenterCard from "@/components/CenterCard";
import GuideCard from "@/components/GuideCard";
import SectionHeader from "@/components/SectionHeader";
import CTASection from "@/components/CTASection";
import FaqSection from "@/components/FAQ";
import {
  HomeModernIcon,
  AcademicCapIcon,
  SparklesIcon,
  MapPinIcon,
  MagnifyingGlassIcon,
  DocumentTextIcon,
  ChatBubbleIcon,
  UsersIcon,
  BuildingOfficeIcon,
} from "@/components/Icons";
import { getCenters } from "@/lib/data/centers";
import { getCities } from "@/lib/data/cities";
import { getAllGuides } from "@/lib/guides";
import { homeFaqs } from "@/data/mock-faqs";
import { robotsMeta } from "@/lib/seo";
import { SITE_DESCRIPTION, SITE_NAME, SITE_URL } from "@/lib/constants";

export const metadata: Metadata = {
  alternates: { canonical: "/" },
  robots: robotsMeta(),
};

const HOW_IT_WORKS = [
  {
    icon: <MagnifyingGlassIcon className="h-6 w-6" />,
    title: "Busca por ciudad y tipo de centro",
    description: "Filtra guarderías y escuelas infantiles por ciudad, barrio y servicios como comedor o bilingüismo.",
  },
  {
    icon: <DocumentTextIcon className="h-6 w-6" />,
    title: "Compara fichas con datos reales",
    description:
      "Consulta horarios, edades admitidas, servicios y datos de contacto de cada centro en una misma ficha.",
  },
  {
    icon: <ChatBubbleIcon className="h-6 w-6" />,
    title: "Solicita información al centro",
    description: "Contacta directamente con el centro que te interese desde su ficha, sin intermediarios.",
  },
];

export default async function HomePage() {
  const [allCenters, cities] = await Promise.all([getCenters(), getCities()]);
  const featuredCities = cities.filter((c) => c.isFeatured).length > 0
    ? cities.filter((c) => c.isFeatured)
    : cities;
  const centerCountByCity = allCenters.reduce<Record<string, number>>((acc, c) => {
    acc[c.address.citySlug] = (acc[c.address.citySlug] ?? 0) + 1;
    return acc;
  }, {});
  const cityCountWithCenters = Object.keys(centerCountByCity).length;
  const recentCenters = [...allCenters].sort((a, b) => (a.updatedAt < b.updatedAt ? 1 : -1)).slice(0, 6);
  const featuredGuides = getAllGuides().slice(0, 3);

  // Site-level structured data. No SearchAction: there is no dedicated search
  // results endpoint yet, so advertising one would be misleading.
  const siteJsonLd = [
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      name: SITE_NAME,
      legalName: "Iyan Arcega SL",
      url: SITE_URL,
      description: SITE_DESCRIPTION,
    },
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      name: SITE_NAME,
      url: SITE_URL,
    },
  ];

  return (
    <div className="flex flex-col">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(siteJsonLd) }}
      />
      {/* ── Hero ── */}
      <section className="relative overflow-hidden bg-gradient-to-br from-sky-900 via-sky-800 to-slate-900">
        {/* Decorative blobs — pure CSS, no images */}
        <div className="pointer-events-none absolute inset-0" aria-hidden="true">
          <div className="absolute -left-32 -top-32 h-72 w-72 rounded-full bg-sky-500/20 blur-3xl" />
          <div className="absolute -right-16 top-0 h-96 w-96 rounded-full bg-sky-600/10 blur-3xl" />
          <div className="absolute bottom-0 left-1/3 h-64 w-64 rounded-full bg-indigo-500/10 blur-2xl" />
        </div>

        <div className="relative mx-auto flex max-w-6xl flex-col items-center gap-8 px-4 py-20 text-center sm:px-6 lg:py-28">
          <span className="inline-flex items-center rounded-full border border-white/20 bg-white/10 px-4 py-1.5 text-sm font-medium text-sky-100 backdrop-blur-sm">
            Directorio independiente de guarderías y escuelas infantiles
          </span>

          <h1 className="max-w-3xl text-4xl font-bold tracking-tight text-white sm:text-5xl lg:text-6xl">
            Encuentra y compara guarderías y escuelas infantiles en España
          </h1>

          <p className="max-w-2xl text-lg text-sky-100">
            Compara centros por ciudad, zona y servicios, y solicita información directamente. Datos actualizados y
            fichas que los propios centros pueden reclamar.
          </p>

          <div className="w-full max-w-2xl">
            <SearchBox cities={featuredCities} />
          </div>

          <dl className="flex flex-wrap items-center justify-center gap-6 sm:gap-10">
            <div className="text-center">
              <dd className="text-3xl font-bold text-white">{allCenters.length}</dd>
              <dt className="mt-0.5 text-sm text-sky-200">centros añadidos</dt>
            </div>
            <div className="hidden h-8 w-px bg-white/20 sm:block" aria-hidden="true" />
            <div className="text-center">
              <dd className="text-3xl font-bold text-white">{cityCountWithCenters}</dd>
              <dt className="mt-0.5 text-sm text-sky-200">ciudades con centros</dt>
            </div>
          </dl>

          <p className="text-sm text-sky-300">
            ¿Tienes un centro?{" "}
            <Link
              href="/para-centros"
              className="font-medium text-white underline underline-offset-2 hover:text-sky-100"
            >
              Añádelo al directorio
            </Link>
          </p>
        </div>
      </section>

      {/* ── Cities ── */}
      <section className="bg-slate-50 py-16">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <SectionHeader eyebrow="Ciudades" title="Accesos rápidos a ciudades principales" />
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {featuredCities.map((city) => (
              <CityCard key={city.id} city={city} centerCount={centerCountByCity[city.slug] ?? 0} />
            ))}
          </div>
        </div>
      </section>

      {/* ── Categories ── */}
      <section className="py-16">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <SectionHeader eyebrow="Categorías" title="Explora por tipo de centro" />
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <CategoryCard
              title="Guarderías"
              description="Centros de primer ciclo de educación infantil (0-3 años)."
              href="/guarderias"
              icon={<HomeModernIcon className="h-5 w-5" />}
              accent="sky"
            />
            <CategoryCard
              title="Escuelas infantiles"
              description="Centros que pueden cubrir de 0 a 6 años, según su proyecto educativo."
              href="/escuelas-infantiles"
              icon={<AcademicCapIcon className="h-5 w-5" />}
              accent="violet"
            />
            <CategoryCard
              title="Guarderías en Madrid"
              description="Más de 200 guarderías y escuelas infantiles disponibles en Madrid."
              href="/guarderias-en-madrid"
              icon={<SparklesIcon className="h-5 w-5" />}
              accent="emerald"
            />
            <CategoryCard
              title="Centros por ciudad"
              description="Consulta todas las ciudades disponibles en el directorio."
              href="/ciudades"
              icon={<MapPinIcon className="h-5 w-5" />}
              accent="amber"
            />
          </div>
        </div>
      </section>

      {/* ── How it works ── */}
      <section className="bg-slate-50 py-16">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <SectionHeader eyebrow="Cómo funciona" title="Encontrar centro en tres pasos" align="center" />
          <div className="mt-10 grid gap-6 sm:grid-cols-3">
            {HOW_IT_WORKS.map((step, index) => (
              <div key={step.title} className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
                <div className="mb-4 flex items-center gap-3">
                  <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-sky-700 text-white shadow-sm shadow-sky-700/30">
                    {step.icon}
                  </div>
                  <span className="text-sm font-bold text-sky-700">Paso {index + 1}</span>
                </div>
                <h3 className="text-base font-semibold text-slate-900">{step.title}</h3>
                <p className="mt-2 text-sm leading-relaxed text-slate-600">{step.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── Recent centers ── */}
      <section className="py-16">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <SectionHeader eyebrow="Directorio" title="Centros añadidos recientemente" />
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {recentCenters.map((center) => (
              <CenterCard key={center.id} center={center} />
            ))}
          </div>
        </div>
      </section>

      {/* ── CTA blocks ── */}
      <section className="bg-slate-50 py-16">
        <div className="mx-auto grid max-w-6xl gap-4 px-4 sm:grid-cols-2 sm:px-6">
          <CTASection
            variant="light"
            icon={<UsersIcon className="h-5 w-5" />}
            title="¿Eres una familia buscando centro?"
            description="Compara guarderías y escuelas infantiles por ciudad y servicios, y solicita información sin compromiso."
            primaryAction={{ label: "Buscar guarderías", href: "/guarderias" }}
            secondaryAction={{ label: "Ver escuelas infantiles", href: "/escuelas-infantiles" }}
          />
          <CTASection
            variant="dark"
            icon={<BuildingOfficeIcon className="h-5 w-5" />}
            title="¿Gestionas una guardería o escuela infantil?"
            description="Añade tu centro al directorio o reclama tu ficha para mantener tus datos actualizados."
            primaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
            secondaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
          />
        </div>
      </section>

      {/* ── Guides ── */}
      <section className="py-16">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <div className="flex items-end justify-between gap-4">
            <SectionHeader eyebrow="Blog" title="Guías destacadas para familias" />
            <Link
              href="/blog"
              className="shrink-0 text-sm font-medium text-sky-700 hover:underline"
            >
              Ver todas →
            </Link>
          </div>
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {featuredGuides.map((guide) => (
              <GuideCard key={guide.id} guide={guide} />
            ))}
          </div>
        </div>
      </section>

      {/* ── FAQ ── */}
      <section className="bg-slate-50 py-16 pb-20">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <FaqSection items={homeFaqs} />
        </div>
      </section>
    </div>
  );
}
