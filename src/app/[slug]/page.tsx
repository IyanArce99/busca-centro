import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import Breadcrumbs from "@/components/Breadcrumbs";
import CenterFilters from "@/components/CenterFilters";
import SeoTextBlock from "@/components/SeoTextBlock";
import FAQ from "@/components/FAQ";
import CTASection from "@/components/CTASection";
import { getAllSeoPages, getCentersForSeoPage, getSeoPageBySlug, isSeoPageIndexable } from "@/lib/seo-pages";
import { getCityBySlug } from "@/lib/cities";
import { formatCenterType } from "@/lib/format";
import { robotsMeta } from "@/lib/seo";

interface PageProps {
  params: Promise<{ slug: string }>;
}

export async function generateStaticParams() {
  return getAllSeoPages().map((seoPage) => ({ slug: seoPage.slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const seoPage = getSeoPageBySlug(slug);
  if (!seoPage) return {};

  const indexable = isSeoPageIndexable(seoPage);

  return {
    title: seoPage.title,
    description: seoPage.metaDescription,
    alternates: { canonical: `/${seoPage.slug}` },
    robots: robotsMeta(indexable),
  };
}

export default async function SeoLandingPage({ params }: PageProps) {
  const { slug } = await params;
  const seoPage = getSeoPageBySlug(slug);
  if (!seoPage) notFound();

  const city = getCityBySlug(seoPage.filters.citySlug);
  const centers = getCentersForSeoPage(seoPage);
  const neighborhoods = Array.from(
    new Set(centers.map((center) => center.address.neighborhood).filter((value): value is string => Boolean(value)))
  );
  const relatedSeoPages = getAllSeoPages().filter(
    (page) => page.filters.citySlug === seoPage.filters.citySlug && page.slug !== seoPage.slug
  );
  const hubHref = seoPage.filters.centerType === "guarderia" ? "/guarderias" : "/escuelas-infantiles";
  const hubLabel = formatCenterType(seoPage.filters.centerType) + "s";

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-12 px-4 py-10 sm:px-6">
      <Breadcrumbs
        items={[
          { label: "Inicio", href: "/" },
          { label: hubLabel, href: hubHref },
          { label: city?.name ?? seoPage.h1 },
        ]}
      />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">{seoPage.h1}</h1>
        <p className="max-w-2xl text-lg text-slate-600">{seoPage.subtitle}</p>
      </header>

      <SeoTextBlock text={seoPage.introText} />

      <section>
        <h2 className="text-2xl font-bold text-slate-900">Centros disponibles</h2>
        <div className="mt-6">
          <CenterFilters centers={centers} />
        </div>
      </section>

      {neighborhoods.length > 0 ? (
        <section>
          <h2 className="text-xl font-bold text-slate-900">Zonas con centros disponibles</h2>
          <div className="mt-4 flex flex-wrap gap-2">
            {neighborhoods.map((neighborhood) => (
              <span key={neighborhood} className="rounded-full bg-slate-100 px-3 py-1.5 text-sm text-slate-700">
                {neighborhood}
              </span>
            ))}
          </div>
        </section>
      ) : null}

      {relatedSeoPages.length > 0 ? (
        <section>
          <h2 className="text-xl font-bold text-slate-900">Otras búsquedas relacionadas</h2>
          <div className="mt-4 flex flex-wrap gap-3">
            {relatedSeoPages.map((page) => (
              <Link
                key={page.slug}
                href={`/${page.slug}`}
                className="rounded-full border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:border-sky-400 hover:text-sky-700"
              >
                {page.h1}
              </Link>
            ))}
          </div>
        </section>
      ) : null}

      <SeoTextBlock text={seoPage.outroText} />

      <FAQ title="Preguntas frecuentes sobre esta búsqueda" items={seoPage.faqs} />

      <CTASection
        variant="light"
        title="¿No encuentras lo que buscas?"
        description="Compara más centros en otras ciudades o explora todas las guarderías y escuelas infantiles del directorio."
        primaryAction={{ label: "Ver todas las ciudades", href: "/ciudades" }}
        secondaryAction={{ label: hubLabel, href: hubHref }}
      />

      <CTASection
        title="¿Gestionas un centro en esta búsqueda?"
        description="Añade tu centro al directorio o reclama tu ficha para mantener tus datos actualizados."
        primaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
        secondaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
      />
    </div>
  );
}
