import type { Metadata } from "next";
import Link from "next/link";
import SearchBox from "@/components/SearchBox";
import CityCard from "@/components/CityCard";
import CategoryCard from "@/components/CategoryCard";
import CenterCard from "@/components/CenterCard";
import GuideCard from "@/components/GuideCard";
import SectionHeader from "@/components/SectionHeader";
import CTASection from "@/components/CTASection";
import FAQ from "@/components/FAQ";
import { getFeaturedCities, getCenterCountForCity } from "@/lib/cities";
import { getAllCenters } from "@/lib/centers";
import { getAllGuides } from "@/lib/guides";
import { homeFaqs } from "@/data/mock-faqs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  alternates: { canonical: "/" },
  robots: robotsMeta(),
};

const HOW_IT_WORKS = [
  {
    title: "Busca por ciudad y tipo de centro",
    description: "Filtra guarderías y escuelas infantiles por ciudad, barrio y servicios como comedor o bilingüismo.",
  },
  {
    title: "Compara fichas con datos reales",
    description: "Consulta horarios, edades admitidas, servicios y datos de contacto de cada centro en una misma ficha.",
  },
  {
    title: "Solicita información al centro",
    description: "Contacta directamente con el centro que te interese desde su ficha, sin intermediarios.",
  },
];

export default function HomePage() {
  const featuredCities = getFeaturedCities();
  const allCenters = getAllCenters();
  const cityCountWithCenters = featuredCities.filter((city) => getCenterCountForCity(city.slug) > 0).length;
  const recentCenters = [...allCenters].sort((a, b) => (a.updatedAt < b.updatedAt ? 1 : -1)).slice(0, 6);
  const featuredGuides = getAllGuides().slice(0, 3);

  return (
    <div className="flex flex-col gap-16 pb-20">
      <section className="bg-sky-50">
        <div className="mx-auto flex max-w-6xl flex-col items-center gap-8 px-4 py-16 text-center sm:px-6">
          <span className="rounded-full bg-white px-4 py-1.5 text-sm font-medium text-sky-800 shadow-sm">
            Directorio independiente de guarderías y escuelas infantiles
          </span>
          <h1 className="max-w-3xl text-4xl font-bold tracking-tight text-slate-900 sm:text-5xl">
            Encuentra y compara guarderías y escuelas infantiles en España
          </h1>
          <p className="max-w-2xl text-lg text-slate-600">
            Compara centros por ciudad, zona y servicios, y solicita información directamente. Datos actualizados y fichas que
            los propios centros pueden reclamar.
          </p>
          <div className="w-full max-w-2xl">
            <SearchBox cities={featuredCities} />
          </div>
          <p className="text-sm text-slate-500">
            ¿Tienes un centro?{" "}
            <Link href="/para-centros" className="font-medium text-sky-700 hover:underline">
              Añádelo al directorio
            </Link>
          </p>
          <dl className="flex flex-wrap items-center justify-center gap-x-8 gap-y-2 text-sm text-slate-600">
            <div className="flex items-baseline gap-1.5">
              <dt className="sr-only">Centros añadidos</dt>
              <dd className="text-xl font-bold text-slate-900">{allCenters.length}</dd>
              <span>centros añadidos</span>
            </div>
            <div className="flex items-baseline gap-1.5">
              <dt className="sr-only">Ciudades con centros</dt>
              <dd className="text-xl font-bold text-slate-900">{cityCountWithCenters}</dd>
              <span>ciudades con centros</span>
            </div>
          </dl>
        </div>
      </section>

      <section className="mx-auto w-full max-w-6xl px-4 sm:px-6">
        <SectionHeader eyebrow="Ciudades" title="Accesos rápidos a ciudades principales" />
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {featuredCities.map((city) => (
            <CityCard key={city.id} city={city} centerCount={getCenterCountForCity(city.slug)} />
          ))}
        </div>
      </section>

      <section className="mx-auto w-full max-w-6xl px-4 sm:px-6">
        <SectionHeader eyebrow="Categorías" title="Explora por tipo de centro" />
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <CategoryCard title="Guarderías" description="Centros de primer ciclo de educación infantil (0-3 años)." href="/guarderias" />
          <CategoryCard
            title="Escuelas infantiles"
            description="Centros que pueden cubrir de 0 a 6 años, según su proyecto educativo."
            href="/escuelas-infantiles"
          />
          <CategoryCard
            title="Guarderías bilingües"
            description="Centros con programa bilingüe, empezando por Madrid."
            href="/guarderias-bilingues-en-madrid"
          />
          <CategoryCard title="Centros por ciudad" description="Consulta todas las ciudades disponibles en el directorio." href="/ciudades" />
        </div>
      </section>

      <section className="mx-auto w-full max-w-6xl px-4 sm:px-6">
        <SectionHeader eyebrow="Cómo funciona" title="Encontrar centro en tres pasos" align="center" />
        <div className="mt-8 grid gap-6 sm:grid-cols-3">
          {HOW_IT_WORKS.map((step, index) => (
            <div key={step.title} className="rounded-xl border border-slate-200 bg-white p-6">
              <span className="text-sm font-bold text-sky-700">Paso {index + 1}</span>
              <h3 className="mt-2 text-base font-semibold text-slate-900">{step.title}</h3>
              <p className="mt-2 text-sm text-slate-600">{step.description}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="mx-auto w-full max-w-6xl px-4 sm:px-6">
        <SectionHeader eyebrow="Directorio" title="Centros añadidos recientemente" />
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {recentCenters.map((center) => (
            <CenterCard key={center.id} center={center} />
          ))}
        </div>
      </section>

      <section className="mx-auto grid w-full max-w-6xl gap-4 px-4 sm:grid-cols-2 sm:px-6">
        <CTASection
          variant="light"
          title="¿Eres una familia buscando centro?"
          description="Compara guarderías y escuelas infantiles por ciudad y servicios, y solicita información sin compromiso."
          primaryAction={{ label: "Buscar guarderías", href: "/guarderias" }}
          secondaryAction={{ label: "Ver escuelas infantiles", href: "/escuelas-infantiles" }}
        />
        <CTASection
          variant="dark"
          title="¿Gestionas una guardería o escuela infantil?"
          description="Añade tu centro al directorio o reclama tu ficha para mantener tus datos actualizados."
          primaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
          secondaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
        />
      </section>

      <section className="mx-auto w-full max-w-6xl px-4 sm:px-6">
        <div className="flex items-center justify-between gap-4">
          <SectionHeader eyebrow="Blog" title="Guías destacadas para familias" />
          <Link href="/blog" className="shrink-0 text-sm font-medium text-sky-700">
            Ver todas las guías →
          </Link>
        </div>
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {featuredGuides.map((guide) => (
            <GuideCard key={guide.id} guide={guide} />
          ))}
        </div>
      </section>

      <section className="mx-auto w-full max-w-6xl px-4 sm:px-6">
        <FAQ items={homeFaqs} />
      </section>
    </div>
  );
}
