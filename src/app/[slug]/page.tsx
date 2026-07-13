import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import Breadcrumbs from "@/components/Breadcrumbs";
import CenterFilters from "@/components/CenterFilters";
import SeoTextBlock from "@/components/SeoTextBlock";
import FAQ from "@/components/FAQ";
import CTASection from "@/components/CTASection";
import { getAllSeoPages, getSeoPageBySlug } from "@/lib/seo-pages";
import { getCenters, getCentersByFilters } from "@/lib/data/centers";
import { getCityBySlug } from "@/lib/data/cities";
import { isSeoPageIndexableFromCenters } from "@/lib/data/seo-pages";
import { formatCenterTypePlural } from "@/lib/format";
import { buildMetadata } from "@/lib/seo";
import { SITE_URL } from "@/lib/constants";

interface PageProps {
  params: Promise<{ slug: string }>;
}

// Revalidate hourly so index/noindex and the rendered center list re-sync with
// Supabase after new centers are published, instead of staying frozen to the
// build snapshot until the next deploy.
export const revalidate = 3600;

// Only pre-render landing pages that have enough real published centers.
// Pages failing the threshold are excluded from the build rather than being
// served as near-empty thin-content pages.
export async function generateStaticParams() {
  const allCenters = await getCenters();
  return getAllSeoPages()
    .filter((page) => isSeoPageIndexableFromCenters(page, allCenters))
    .map((page) => ({ slug: page.slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const seoPage = getSeoPageBySlug(slug);
  if (!seoPage) return {};

  // Use real center data for the robots check so metadata stays consistent
  // with the sitemap and generateStaticParams decisions.
  const allCenters = await getCenters();
  const indexable = isSeoPageIndexableFromCenters(seoPage, allCenters);

  return buildMetadata({
    title: seoPage.title,
    description: seoPage.metaDescription,
    path: `/${seoPage.slug}`,
    indexable,
  });
}

export default async function SeoLandingPage({ params }: PageProps) {
  const { slug } = await params;
  const seoPage = getSeoPageBySlug(slug);
  if (!seoPage) notFound();

  const [city, centers, allCenters] = await Promise.all([
    getCityBySlug(seoPage.filters.citySlug),
    getCentersByFilters(seoPage.filters),
    getCenters(),
  ]);
  const neighborhoods = Array.from(
    new Set(centers.map((center) => center.address.neighborhood).filter((value): value is string => Boolean(value)))
  );
  // Only link to related landings that are themselves indexable, so we don't
  // pass internal links to noindex/disabled or thin landing pages.
  const relatedSeoPages = getAllSeoPages().filter(
    (page) =>
      page.filters.citySlug === seoPage.filters.citySlug &&
      page.slug !== seoPage.slug &&
      isSeoPageIndexableFromCenters(page, allCenters)
  );
  const hubHref = seoPage.filters.centerType === "guarderia" ? "/guarderias" : "/escuelas-infantiles";
  const hubLabel = formatCenterTypePlural(seoPage.filters.centerType);

  // The cross-type counterpart in the same city (guardería <-> escuela
  // infantil), so families can jump between both without losing the city
  // context. Only offered for "pure" city pages (no service/ownership), and
  // only if that counterpart landing is itself indexable — works for any
  // city, not just Madrid.
  const isPureCityPage = !seoPage.filters.service && !seoPage.filters.ownership;
  const counterpartType = seoPage.filters.centerType === "guarderia" ? "escuela-infantil" : "guarderia";
  const counterpartPage = isPureCityPage
    ? relatedSeoPages.find(
        (page) =>
          page.filters.centerType === counterpartType && !page.filters.service && !page.filters.ownership
      )
    : undefined;
  const counterpart =
    counterpartPage && city
      ? {
          href: `/${counterpartPage.slug}`,
          label: `${formatCenterTypePlural(counterpartType).toLowerCase()} en ${city.name}`,
        }
      : null;

  const indexable = isSeoPageIndexableFromCenters(seoPage, allCenters);
  const breadcrumbJsonLd = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      { "@type": "ListItem", position: 1, name: "Inicio", item: SITE_URL },
      { "@type": "ListItem", position: 2, name: hubLabel, item: `${SITE_URL}${hubHref}` },
      { "@type": "ListItem", position: 3, name: seoPage.h1, item: `${SITE_URL}/${seoPage.slug}` },
    ],
  };
  // FAQPage JSON-LD uses exactly the FAQs rendered below, and only when the
  // page is indexable — no point advertising structured data for a noindex page.
  const faqJsonLd =
    indexable && seoPage.faqs.length > 0
      ? {
          "@context": "https://schema.org",
          "@type": "FAQPage",
          mainEntity: seoPage.faqs.map((faq) => ({
            "@type": "Question",
            name: faq.question,
            acceptedAnswer: { "@type": "Answer", text: faq.answer },
          })),
        }
      : null;
  const jsonLd = faqJsonLd ? [breadcrumbJsonLd, faqJsonLd] : [breadcrumbJsonLd];

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-12 px-4 py-10 sm:px-6">
      {indexable ? (
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      ) : null}

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

      {seoPage.sections && seoPage.sections.length > 0 ? (
        <div className="flex flex-col gap-8">
          {seoPage.sections.map((section) => (
            <section key={section.heading} className="max-w-3xl">
              <h2 className="mb-3 text-xl font-bold text-slate-900">{section.heading}</h2>
              <div className="flex flex-col gap-3">
                {section.paragraphs.map((paragraph, index) => (
                  <p key={index} className="text-base leading-relaxed text-slate-600">
                    {paragraph}
                  </p>
                ))}
              </div>
            </section>
          ))}
        </div>
      ) : null}

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

      {counterpart ? (
        <section className="max-w-3xl rounded-2xl border border-slate-200 bg-slate-50 p-6">
          <h2 className="text-lg font-bold text-slate-900">
            {seoPage.filters.centerType === "guarderia"
              ? "¿Buscas un centro con proyecto educativo?"
              : "¿Prefieres una búsqueda más orientada a la conciliación?"}
          </h2>
          <p className="mt-2 text-sm leading-relaxed text-slate-600">
            {seoPage.filters.centerType === "guarderia"
              ? "Si te interesa un enfoque educativo del primer ciclo o el segundo ciclo (3-6 años), consulta también las "
              : "Si buscas sobre todo cercanía, horarios y servicios como comedor, echa un vistazo también a las "}
            <Link href={counterpart.href} className="font-semibold text-sky-700 underline underline-offset-2 hover:text-sky-800">
              {counterpart.label}
            </Link>
            .
          </p>
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

      <FAQ title={`Preguntas frecuentes sobre ${seoPage.h1.toLowerCase()}`} items={seoPage.faqs} />

      {/* Trust / transparency */}
      <section className="max-w-3xl rounded-2xl border border-slate-200 bg-white p-6 text-sm leading-relaxed text-slate-600 shadow-sm">
        <h2 className="text-base font-semibold text-slate-900">Sobre la información de este directorio</h2>
        <p className="mt-2">
          Los datos de cada ficha pueden proceder de fuentes públicas o de información facilitada por el propio centro, y
          algunas fichas están pendientes de verificación. Si detectas un dato incorrecto, puedes comunicárnoslo desde la
          página de{" "}
          <Link href="/contacto" className="font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800">
            contacto
          </Link>
          .
        </p>
      </section>

      <CTASection
        variant="light"
        title="¿No encuentras lo que buscas?"
        description="Compara más centros en otras ciudades o explora todas las guarderías y escuelas infantiles del directorio."
        primaryAction={{ label: "Ver todas las ciudades", href: "/ciudades" }}
        secondaryAction={{ label: hubLabel, href: hubHref }}
      />

      <CTASection
        title="¿Gestionas un centro en esta búsqueda?"
        description="Reclama tu ficha para actualizar servicios, horarios y datos de contacto, o añade tu centro si todavía no aparece."
        primaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
        secondaryAction={{ label: "Añadir mi centro", href: "/anadir-centro" }}
      />
    </div>
  );
}
