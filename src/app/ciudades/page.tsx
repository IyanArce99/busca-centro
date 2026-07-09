import type { Metadata } from "next";
import Link from "next/link";
import CityCard from "@/components/CityCard";
import Breadcrumbs from "@/components/Breadcrumbs";
import { getCenters } from "@/lib/data/centers";
import { getCities } from "@/lib/data/cities";
import { getSeoPageBySlug, isSeoPageIndexableFromCenters } from "@/lib/data/seo-pages";
import { robotsMeta } from "@/lib/seo";
import { breadcrumbJsonLd } from "@/lib/jsonld";

export const metadata: Metadata = {
  title: "Guarderías y escuelas infantiles por ciudad",
  description:
    "Consulta las ciudades disponibles en BuscaCentro y encuentra guarderías y escuelas infantiles cerca de ti.",
  alternates: { canonical: "/ciudades" },
  robots: robotsMeta(),
};

export default async function CiudadesPage() {
  const [allCenters, cities] = await Promise.all([getCenters(), getCities()]);
  const centerCountByCity = allCenters.reduce<Record<string, number>>((acc, c) => {
    acc[c.address.citySlug] = (acc[c.address.citySlug] ?? 0) + 1;
    return acc;
  }, {});

  const citiesWithCenters = cities.filter((c) => (centerCountByCity[c.slug] ?? 0) > 0);
  const upcomingCities = cities.filter((c) => (centerCountByCity[c.slug] ?? 0) === 0);

  // Build one "guarderías en X" / "escuelas infantiles en X" CTA pair per
  // city that already has an indexable landing, instead of hardcoding a
  // single city — this list grows automatically as new cities gain enough
  // centers to pass the indexability threshold.
  const cityLandingCtas = await Promise.all(
    citiesWithCenters.map(async (city) => {
      const [guarderiasPage, escuelasPage] = await Promise.all([
        getSeoPageBySlug(`guarderias-en-${city.slug}`),
        getSeoPageBySlug(`escuelas-infantiles-en-${city.slug}`),
      ]);
      return {
        city,
        guarderias:
          guarderiasPage && isSeoPageIndexableFromCenters(guarderiasPage, allCenters) ? guarderiasPage : null,
        escuelas: escuelasPage && isSeoPageIndexableFromCenters(escuelasPage, allCenters) ? escuelasPage : null,
      };
    })
  );

  const breadcrumbs = [{ label: "Inicio", href: "/" }, { label: "Ciudades" }];

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-10 px-4 py-10 sm:px-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbJsonLd(breadcrumbs, "/ciudades")) }}
      />

      <Breadcrumbs items={breadcrumbs} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Guarderías y escuelas infantiles por ciudad</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          BuscaCentro organiza guarderías y escuelas infantiles por ciudad para que encuentres centros cerca de ti.
          Vamos ampliando la cobertura progresivamente a nuevas ciudades de España.
        </p>
      </header>

      {citiesWithCenters.length > 0 ? (
        <section>
          <h2 className="text-2xl font-bold text-slate-900">Ciudades disponibles</h2>
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {citiesWithCenters.map((city) => (
              <CityCard key={city.id} city={city} centerCount={centerCountByCity[city.slug] ?? 0} />
            ))}
          </div>
          <div className="mt-6 flex flex-wrap gap-3">
            {cityLandingCtas.flatMap(({ city, guarderias, escuelas }) => [
              guarderias ? (
                <Link
                  key={guarderias.slug}
                  href={`/${guarderias.slug}`}
                  className="rounded-full bg-sky-700 px-5 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-sky-800"
                >
                  Guarderías en {city.name}
                </Link>
              ) : null,
              escuelas ? (
                <Link
                  key={escuelas.slug}
                  href={`/${escuelas.slug}`}
                  className="rounded-full border border-slate-300 px-5 py-2.5 text-sm font-semibold text-slate-700 transition-colors hover:border-sky-400 hover:text-sky-700"
                >
                  Escuelas infantiles en {city.name}
                </Link>
              ) : null,
            ])}
          </div>
        </section>
      ) : null}

      {upcomingCities.length > 0 ? (
        <section>
          <h2 className="text-xl font-bold text-slate-900">Próximamente en más ciudades</h2>
          <p className="mt-2 max-w-2xl text-sm text-slate-600">
            Estamos ampliando el directorio a nuevas ciudades. Todavía no hay centros añadidos en estas zonas.
          </p>
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {upcomingCities.map((city) => (
              <CityCard key={city.id} city={city} centerCount={0} />
            ))}
          </div>
        </section>
      ) : null}

      <section className="max-w-3xl rounded-2xl border border-slate-200 bg-slate-50 p-6 text-sm leading-relaxed text-slate-600">
        <h2 className="text-base font-semibold text-slate-900">¿Gestionas un centro en una ciudad que no aparece aquí?</h2>
        <p className="mt-2">
          Si tienes una guardería o escuela infantil en otra ciudad, puedes{" "}
          <Link href="/anadir-centro" className="font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800">
            añadir tu centro
          </Link>{" "}
          al directorio. Cuantos más centros haya en una ciudad, antes estará disponible su página.
        </p>
      </section>
    </div>
  );
}
