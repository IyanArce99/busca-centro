import type { Metadata } from "next";
import CityCard from "@/components/CityCard";
import Breadcrumbs from "@/components/Breadcrumbs";
import { getCenters } from "@/lib/data/centers";
import { getCities } from "@/lib/data/cities";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Centros por ciudad",
  description: "Consulta guarderías y escuelas infantiles por ciudad en toda España.",
  alternates: { canonical: "/ciudades" },
  robots: robotsMeta(),
};

export default async function CiudadesPage() {
  const [allCenters, cities] = await Promise.all([getCenters(), getCities()]);
  const centerCountByCity = allCenters.reduce<Record<string, number>>((acc, c) => {
    acc[c.address.citySlug] = (acc[c.address.citySlug] ?? 0) + 1;
    return acc;
  }, {});

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Ciudades" }]} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Centros por ciudad</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          Consulta guarderías y escuelas infantiles añadidas al directorio en cada ciudad.
        </p>
      </header>

      <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {cities.map((city) => (
          <CityCard key={city.id} city={city} centerCount={centerCountByCity[city.slug] ?? 0} />
        ))}
      </section>
    </div>
  );
}
