import type { Metadata } from "next";
import SearchBox from "@/components/SearchBox";
import CityCard from "@/components/CityCard";
import CategoryCard from "@/components/CategoryCard";
import SeoTextBlock from "@/components/SeoTextBlock";
import FAQ from "@/components/FAQ";
import CTASection from "@/components/CTASection";
import Breadcrumbs from "@/components/Breadcrumbs";
import {
  BuildingOfficeIcon,
  SparklesIcon,
  ForkKnifeIcon,
  ClockIcon,
} from "@/components/Icons";
import { getCenters } from "@/lib/data/centers";
import { getCities } from "@/lib/data/cities";
import { guarderiasFaqs } from "@/data/mock-faqs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Guarderías en España",
  description:
    "Compara guarderías por ciudad, zona y servicios como comedor, horario ampliado o programa bilingüe. Datos actualizados y fichas que los centros pueden reclamar.",
  alternates: { canonical: "/guarderias" },
  robots: robotsMeta(),
};

export default async function GuarderiasPage() {
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
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Guarderías" }]} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Guarderías en España</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          Compara guarderías por ciudad, barrio y servicios, y solicita información directamente al centro que más te
          interese.
        </p>
        <SearchBox cities={featuredCities} />
      </header>

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Guarderías por ciudad</h2>
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {featuredCities.map((city) => (
            <CityCard key={city.id} city={city} centerCount={centerCountByCity[city.slug] ?? 0} />
          ))}
        </div>
      </section>

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Categorías relacionadas</h2>
        <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <CategoryCard
            title="Guarderías privadas"
            description="Centros de titularidad privada, empezando por Madrid."
            href="/guarderias-privadas-en-madrid"
            icon={<BuildingOfficeIcon className="h-5 w-5" />}
            accent="sky"
          />
          <CategoryCard
            title="Guarderías bilingües"
            description="Centros con programa bilingüe, empezando por Madrid."
            href="/guarderias-bilingues-en-madrid"
            icon={<SparklesIcon className="h-5 w-5" />}
            accent="emerald"
          />
          <CategoryCard
            title="Guarderías con comedor"
            description="Centros con servicio de comedor propio, empezando por Madrid."
            href="/guarderias-con-comedor-en-madrid"
            icon={<ForkKnifeIcon className="h-5 w-5" />}
            accent="amber"
          />
          <CategoryCard
            title="Guarderías con horario ampliado"
            description="Centros con horario ampliado para conciliar, empezando por Madrid."
            href="/guarderias-con-horario-ampliado-en-madrid"
            icon={<ClockIcon className="h-5 w-5" />}
            accent="violet"
          />
        </div>
      </section>

      <SeoTextBlock
        heading="Cómo elegir guardería en España"
        text="Cada familia tiene necesidades distintas a la hora de elegir guardería: cercanía al domicilio o al trabajo, horario, servicios como comedor u horario ampliado, y el proyecto educativo del centro. En BuscaCentro puedes comparar centros añadidos recientemente, filtrar por ciudad y servicios, y solicitar información directamente desde la ficha de cada guardería antes de tomar una decisión."
      />

      <FAQ items={guarderiasFaqs} />

      <CTASection
        title="¿Tienes una guardería?"
        description="Añade tu centro al directorio o reclama tu ficha para mantener tus datos actualizados."
        primaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
        secondaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
      />
    </div>
  );
}
