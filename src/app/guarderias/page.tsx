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
import { robotsMeta } from "@/lib/seo";
import { faqPageJsonLd, breadcrumbJsonLd } from "@/lib/jsonld";

export const metadata: Metadata = {
  title: "Guarderías: busca y compara centros infantiles | BuscaCentro",
  description:
    "Encuentra guarderías y centros infantiles con información sobre ubicación, servicios, edades, contacto y fichas verificables. Empieza por las guarderías en Madrid.",
  alternates: { canonical: "/guarderias" },
  robots: robotsMeta(),
};

export default async function GuarderiasPage() {
  const [allCenters, cities] = await Promise.all([getCenters(), getCities()]);
  const featuredCities = cities.filter((c) => c.isFeatured).length > 0 ? cities.filter((c) => c.isFeatured) : cities;
  const centerCountByCity = allCenters.reduce<Record<string, number>>((acc, c) => {
    acc[c.address.citySlug] = (acc[c.address.citySlug] ?? 0) + 1;
    return acc;
  }, {});

  const madridPage = getSeoPageBySlug("guarderias-en-madrid");
  const madridIndexable = madridPage ? isSeoPageIndexableFromCenters(madridPage, allCenters) : false;

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

      {madridIndexable ? (
        <section className="rounded-2xl border border-sky-100 bg-sky-50/60 p-6">
          <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
            <div>
              <h2 className="text-lg font-bold text-slate-900">Guarderías en Madrid</h2>
              <p className="mt-1 max-w-xl text-sm text-slate-600">
                Es la ciudad con más centros en el directorio. Filtra por distrito y servicios, y compara opciones cerca
                de casa o del trabajo.
              </p>
            </div>
            <Link
              href="/guarderias-en-madrid"
              className="shrink-0 rounded-full bg-sky-700 px-5 py-2.5 text-center text-sm font-semibold text-white transition-colors hover:bg-sky-800"
            >
              Ver guarderías en Madrid
            </Link>
          </div>
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
          {madridIndexable ? (
            <CategoryCard
              title="Guarderías en Madrid"
              description="Centros de 0 a 3 años por distrito y servicios en Madrid."
              href="/guarderias-en-madrid"
              icon={<HomeModernIcon className="h-5 w-5" />}
              accent="sky"
            />
          ) : null}
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
