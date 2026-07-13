import type { Metadata } from "next";
import Link from "next/link";
import SearchBox from "@/components/SearchBox";
import CityCard from "@/components/CityCard";
import CategoryCard from "@/components/CategoryCard";
import FAQ from "@/components/FAQ";
import CTASection from "@/components/CTASection";
import Breadcrumbs from "@/components/Breadcrumbs";
import { SparklesIcon, HomeModernIcon, MapPinIcon } from "@/components/Icons";
import { getCenters } from "@/lib/data/centers";
import { getCities } from "@/lib/data/cities";
import { getSeoPageBySlug } from "@/lib/seo-pages";
import { isSeoPageIndexableFromCenters } from "@/lib/data/seo-pages";
import { guarderiasFaqs } from "@/data/mock-faqs";
import { buildMetadata } from "@/lib/seo";
import { faqPageJsonLd, breadcrumbJsonLd } from "@/lib/jsonld";

export const metadata: Metadata = buildMetadata({
  title: "Guarderías: busca y compara centros infantiles",
  description:
    "Encuentra guarderías y centros infantiles con información sobre ubicación, servicios, edades, contacto y fichas verificables.",
  path: "/guarderias",
});

export default async function GuarderiasPage() {
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

  // One "guarderías en X" entry per city with an indexable landing, instead
  // of a single hardcoded city — grows automatically as new cities qualify.
  const cityGuarderiaPages = featuredCities.flatMap((city) => {
    const page = getSeoPageBySlug(`guarderias-en-${city.slug}`);
    return page && isSeoPageIndexableFromCenters(page, allCenters) ? [{ city, page }] : [];
  });

  // Priority service landing (guarderías con comedor en Barcelona): the head
  // keyword we want to concentrate internal link equity on. Only linked when
  // the landing is itself indexable, so we never point internal links at a
  // thin/noindex page.
  const comedorBarcelonaPage = getSeoPageBySlug("guarderias-con-comedor-en-barcelona");
  const comedorBarcelonaLink =
    comedorBarcelonaPage && isSeoPageIndexableFromCenters(comedorBarcelonaPage, allCenters)
      ? comedorBarcelonaPage
      : null;

  const breadcrumbs = [{ label: "Inicio", href: "/" }, { label: "Guarderías" }];
  const jsonLd = [breadcrumbJsonLd(breadcrumbs, "/guarderias"), faqPageJsonLd(guarderiasFaqs)];

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-12 px-4 py-10 sm:px-6">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />

      <Breadcrumbs items={breadcrumbs} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Guarderías: busca y compara centros</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          Compara guarderías por ciudad, barrio y servicios como comedor u horario ampliado, y solicita información
          directamente al centro que más te interese.
        </p>
        <SearchBox cities={featuredCities} />
      </header>

      {cityGuarderiaPages.length > 0 ? (
        <section className="flex flex-col gap-4">
          {cityGuarderiaPages.map(({ city, page }) => (
            <div
              key={page.slug}
              className="rounded-2xl border border-sky-100 bg-sky-50/60 p-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
            >
              <div>
                <h2 className="text-lg font-bold text-slate-900">Guarderías en {city.name}</h2>
                <p className="mt-1 max-w-xl text-sm text-slate-600">
                  Filtra por distrito y servicios, y compara opciones cerca de casa o del trabajo en {city.name}.
                </p>
              </div>
              <Link
                href={`/${page.slug}`}
                className="shrink-0 rounded-full bg-sky-700 px-5 py-2.5 text-center text-sm font-semibold text-white transition-colors hover:bg-sky-800"
              >
                Ver guarderías en {city.name}
              </Link>
            </div>
          ))}
        </section>
      ) : null}

      {comedorBarcelonaLink ? (
        <section>
          <h2 className="text-2xl font-bold text-slate-900">Guarderías por servicio</h2>
          <p className="mt-2 max-w-2xl text-base leading-relaxed text-slate-600">
            Si el comedor es determinante para tu día a día, puedes centrar la búsqueda en centros con este servicio.
            Consulta las{" "}
            <Link
              href={`/${comedorBarcelonaLink.slug}`}
              className="font-semibold text-sky-700 underline underline-offset-2 hover:text-sky-800"
            >
              guarderías con comedor en Barcelona
            </Link>
            , muchas de ellas con cocina propia, y compara cómo gestionan los menús, las alergias y las intolerancias.
          </p>
        </section>
      ) : null}

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Cómo elegir una guardería</h2>
        <div className="mt-4 flex max-w-3xl flex-col gap-3 text-base leading-relaxed text-slate-600">
          <p>
            Cada familia prioriza cosas distintas al buscar guardería: la cercanía al domicilio o al trabajo, el horario
            de entrada y salida, y servicios como comedor u horario ampliado que ayuden a conciliar. También cuenta el
            proyecto del centro para los más pequeños, la ratio de niños por educador y cómo se comunican con las familias
            durante el curso.
          </p>
          <p>
            En BuscaCentro puedes comparar centros añadidos recientemente, filtrar por ciudad y servicios, y solicitar
            información directamente desde la ficha de cada guardería antes de tomar una decisión. Cuando tengas dos o tres
            opciones, lo habitual es confirmar plazas, cuotas y periodo de adaptación con cada centro.
          </p>
        </div>
      </section>

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Guarderías por ciudad</h2>
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {featuredCities.map((city) => (
            <CityCard key={city.id} city={city} centerCount={centerCountByCity[city.slug] ?? 0} />
          ))}
        </div>
      </section>

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Explora también</h2>
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {cityGuarderiaPages.map(({ city, page }) => (
            <CategoryCard
              key={page.slug}
              title={`Guarderías en ${city.name}`}
              description={`Centros de 0 a 3 años por distrito y servicios en ${city.name}.`}
              href={`/${page.slug}`}
              icon={<HomeModernIcon className="h-5 w-5" />}
              accent="sky"
            />
          ))}
          <CategoryCard
            title="Escuelas infantiles"
            description="Centros de educación infantil con proyecto pedagógico."
            href="/escuelas-infantiles"
            icon={<SparklesIcon className="h-5 w-5" />}
            accent="violet"
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

      <FAQ title="Preguntas frecuentes sobre guarderías" items={guarderiasFaqs} />

      <CTASection
        title="¿Tienes una guardería?"
        description="Reclama tu ficha para actualizar servicios, horarios y datos de contacto, o añade tu centro si todavía no aparece en el directorio."
        primaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
        secondaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
      />
    </div>
  );
}
