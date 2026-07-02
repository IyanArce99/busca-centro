import type { Metadata } from "next";
import SearchBox from "@/components/SearchBox";
import CityCard from "@/components/CityCard";
import SeoTextBlock from "@/components/SeoTextBlock";
import FAQ from "@/components/FAQ";
import CTASection from "@/components/CTASection";
import Breadcrumbs from "@/components/Breadcrumbs";
import { getCenters } from "@/lib/data/centers";
import { getCities } from "@/lib/data/cities";
import { escuelasInfantilesFaqs } from "@/data/mock-faqs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Escuelas infantiles en España",
  description:
    "Compara escuelas infantiles por ciudad, zona y servicios. Centros que pueden cubrir de 0 a 6 años según su proyecto educativo.",
  alternates: { canonical: "/escuelas-infantiles" },
  robots: robotsMeta(),
};

export default async function EscuelasInfantilesPage() {
  const [allCenters, cities] = await Promise.all([getCenters(), getCities()]);
  const featuredCities = cities.filter((c) => c.isFeatured).length > 0
    ? cities.filter((c) => c.isFeatured)
    : cities;
  const centerCountByCity = allCenters.reduce<Record<string, number>>((acc, c) => {
    acc[c.address.citySlug] = (acc[c.address.citySlug] ?? 0) + 1;
    return acc;
  }, {});

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-12 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Escuelas infantiles" }]} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Escuelas infantiles en España</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          Compara escuelas infantiles por ciudad y barrio, y solicita información directamente al centro que más te interese.
        </p>
        <SearchBox cities={featuredCities} />
      </header>

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Escuelas infantiles por ciudad</h2>
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {featuredCities.map((city) => (
            <CityCard
              key={city.id}
              city={city}
              centerCount={centerCountByCity[city.slug] ?? 0}
              href={`/escuelas-infantiles-en-${city.slug}`}
            />
          ))}
        </div>
      </section>

      <SeoTextBlock
        heading="Guardería o escuela infantil: ¿cuál es la diferencia?"
        text="En España, 'guardería' y 'escuela infantil' se usan a menudo como sinónimos, aunque tienen matices. Una guardería suele asociarse al primer ciclo de educación infantil (0-3 años) con un enfoque más asistencial, mientras que una escuela infantil suele integrar un proyecto educativo más estructurado y, en muchos casos, cubre de 0 a 6 años. La denominación exacta depende de cada comunidad autónoma y de la autorización del centro."
      />

      <FAQ items={escuelasInfantilesFaqs} />

      <CTASection
        title="¿Tienes una escuela infantil?"
        description="Añade tu centro al directorio o reclama tu ficha para mantener tus datos actualizados."
        primaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
        secondaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
      />
    </div>
  );
}
