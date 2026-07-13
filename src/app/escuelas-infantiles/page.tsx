import type { Metadata } from "next";
import Link from "next/link";
import SearchBox from "@/components/SearchBox";
import CityCard from "@/components/CityCard";
import CategoryCard from "@/components/CategoryCard";
import FAQ from "@/components/FAQ";
import CTASection from "@/components/CTASection";
import Breadcrumbs from "@/components/Breadcrumbs";
import { AcademicCapIcon, HomeModernIcon, MapPinIcon } from "@/components/Icons";
import { getCenters } from "@/lib/data/centers";
import { getCities } from "@/lib/data/cities";
import { getSeoPageBySlug } from "@/lib/seo-pages";
import { isSeoPageIndexableFromCenters } from "@/lib/data/seo-pages";
import { escuelasInfantilesFaqs } from "@/data/mock-faqs";
import { buildMetadata } from "@/lib/seo";
import { faqPageJsonLd, breadcrumbJsonLd } from "@/lib/jsonld";

export const metadata: Metadata = buildMetadata({
  title: "Escuelas infantiles: directorio de centros educativos",
  description:
    "Busca escuelas infantiles y centros de educación infantil. Consulta datos de ubicación, titularidad, etapa educativa, servicios y contacto.",
  path: "/escuelas-infantiles",
});

export default async function EscuelasInfantilesPage() {
  const [allCenters, cities] = await Promise.all([getCenters(), getCities()]);
  const centerCountByCity = allCenters.reduce<Record<string, number>>((acc, c) => {
    acc[c.address.citySlug] = (acc[c.address.citySlug] ?? 0) + 1;
    return acc;
  }, {});
  // Only surface cities with published centers (see home page for rationale).
  const citiesWithCenters = cities.filter((c) => (centerCountByCity[c.slug] ?? 0) > 0);
  const featuredWithCenters = citiesWithCenters.filter((c) => c.isFeatured);
  const featuredCities =
    featuredWithCenters.length > 0
      ? featuredWithCenters
      : citiesWithCenters.length > 0
        ? citiesWithCenters
        : cities.filter((c) => c.isFeatured);

  // One "escuelas infantiles en X" entry per city with an indexable landing,
  // instead of a single hardcoded city — grows automatically over time.
  const cityEscuelasPages = featuredCities.flatMap((city) => {
    const page = getSeoPageBySlug(`escuelas-infantiles-en-${city.slug}`);
    return page && isSeoPageIndexableFromCenters(page, allCenters) ? [{ city, page }] : [];
  });

  const breadcrumbs = [{ label: "Inicio", href: "/" }, { label: "Escuelas infantiles" }];
  const jsonLd = [breadcrumbJsonLd(breadcrumbs, "/escuelas-infantiles"), faqPageJsonLd(escuelasInfantilesFaqs)];

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-12 px-4 py-10 sm:px-6">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />

      <Breadcrumbs items={breadcrumbs} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Escuelas infantiles: directorio de centros educativos</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          Consulta escuelas infantiles y centros de educación infantil por ciudad, titularidad y servicios educativos, con
          datos de ubicación y contacto de cada centro.
        </p>
        <SearchBox cities={featuredCities} />
      </header>

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Guardería o escuela infantil: cuál es la diferencia</h2>
        <div className="mt-4 flex max-w-3xl flex-col gap-3 text-base leading-relaxed text-slate-600">
          <p>
            En España, &laquo;guardería&raquo; y &laquo;escuela infantil&raquo; se usan a menudo como sinónimos, aunque
            tienen matices. El término escuela infantil hace referencia a un centro de educación infantil con proyecto
            pedagógico propio, habitualmente del primer ciclo (0-3 años) y, en algunos casos, hasta los 6. La denominación
            &laquo;guardería&raquo; es más coloquial y suele asociarse a un enfoque más asistencial.
          </p>
          <p>
            La etapa exacta que cubre cada centro depende de su autorización educativa y de la comunidad autónoma. Por eso,
            al comparar escuelas infantiles conviene fijarse en la titularidad (pública, privada o concertada), la etapa
            que atienden y los servicios educativos que ofrecen.
          </p>
        </div>
      </section>

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Titularidad de las escuelas infantiles</h2>
        <div className="mt-4 flex max-w-3xl flex-col gap-3 text-base leading-relaxed text-slate-600">
          <p>
            Conviven escuelas infantiles de titularidad pública (municipales o autonómicas), privadas y concertadas. La
            titularidad condiciona el proceso de admisión: en los centros públicos, la asignación de plaza suele
            gestionarse a través del proceso oficial de escolarización de la comunidad autónoma, mientras que en los
            privados la admisión se acuerda directamente con el centro.
          </p>
          <p>
            Cada ficha del directorio indica la titularidad cuando el dato está disponible, junto con la etapa y los
            servicios registrados. Parte de esta información procede de fuentes públicas y puede estar pendiente de
            verificación por el propio centro.
          </p>
        </div>
      </section>

      {cityEscuelasPages.length > 0 ? (
        <section className="flex flex-col gap-4">
          {cityEscuelasPages.map(({ city, page }) => (
            <div
              key={page.slug}
              className="rounded-2xl border border-violet-100 bg-violet-50/50 p-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
            >
              <div>
                <h2 className="text-lg font-bold text-slate-900">Escuelas infantiles en {city.name}</h2>
                <p className="mt-1 max-w-xl text-sm text-slate-600">
                  Consulta centros de educación infantil de {city.name} por titularidad, etapa y servicios educativos.
                </p>
              </div>
              <Link
                href={`/${page.slug}`}
                className="shrink-0 rounded-full bg-violet-700 px-5 py-2.5 text-center text-sm font-semibold text-white transition-colors hover:bg-violet-800"
              >
                Ver escuelas infantiles en {city.name}
              </Link>
            </div>
          ))}
        </section>
      ) : null}

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

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Explora también</h2>
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {cityEscuelasPages.map(({ city, page }) => (
            <CategoryCard
              key={page.slug}
              title={`Escuelas infantiles en ${city.name}`}
              description={`Centros de educación infantil por titularidad y servicios en ${city.name}.`}
              href={`/${page.slug}`}
              icon={<AcademicCapIcon className="h-5 w-5" />}
              accent="violet"
            />
          ))}
          <CategoryCard
            title="Guarderías"
            description="Compara centros por servicios, horarios y cercanía."
            href="/guarderias"
            icon={<HomeModernIcon className="h-5 w-5" />}
            accent="sky"
          />
          <CategoryCard
            title="Centros por ciudad"
            description="Consulta las ciudades disponibles en el directorio."
            href="/ciudades"
            icon={<MapPinIcon className="h-5 w-5" />}
            accent="amber"
          />
        </div>
      </section>

      <FAQ title="Preguntas frecuentes sobre escuelas infantiles" items={escuelasInfantilesFaqs} />

      <CTASection
        title="¿Tienes una escuela infantil?"
        description="Reclama tu ficha para completar la información de tu centro —titularidad, etapa, servicios y contacto—, o añádelo si todavía no aparece."
        primaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
        secondaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
      />
    </div>
  );
}
