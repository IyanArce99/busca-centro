import type { Metadata } from "next";
import { notFound } from "next/navigation";
import Breadcrumbs from "@/components/Breadcrumbs";
import CenterDetail from "@/components/CenterDetail";
import LeadForm from "@/components/LeadForm";
import FAQ from "@/components/FAQ";
import CenterCard from "@/components/CenterCard";
import { isCenterIndexable } from "@/lib/centers";
import { getCenters, getCenterBySlug, getCentersByCity } from "@/lib/data/centers";
import { getSeoPageBySlug } from "@/lib/seo-pages";
import { formatCenterType, formatCenterTypePlural } from "@/lib/format";
import { robotsMeta } from "@/lib/seo";
import { SITE_NAME, SITE_URL, MIN_CENTERS_FOR_CITY_PAGE } from "@/lib/constants";
import {
  buildCenterFaqs,
  buildCenterSummary,
  buildJsonLd,
  buildSimilarCentersIntro,
} from "@/lib/content/center-content";

interface PageProps {
  params: Promise<{ slug: string }>;
}

export async function generateStaticParams() {
  const centers = await getCenters();
  return centers.filter(isCenterIndexable).map((center) => ({ slug: center.slug }));
}

export async function generateMetadata({ params }: Readonly<PageProps>): Promise<Metadata> {
  const { slug } = await params;
  const center = await getCenterBySlug(slug);
  if (!center) return {};

  const indexable = isCenterIndexable(center);
  const adj =
    center.ownership === "publico"
      ? "pública"
      : center.ownership === "concertado"
        ? "concertada"
        : "privada";
  const typeLabel = formatCenterType(center.type);
  const locationLabel = center.address.neighborhood ?? center.address.cityName;
  const titleCity = center.address.neighborhood
    ? `${locationLabel}, ${center.address.cityName}`
    : center.address.cityName;

  return {
    title: `${center.name} en ${titleCity} | ${typeLabel} ${adj}`,
    description: buildCenterSummary(center),
    alternates: { canonical: `/centro/${center.slug}` },
    robots: robotsMeta(indexable),
  };
}

export default async function CenterPage({ params }: PageProps) {
  const { slug } = await params;
  const center = await getCenterBySlug(slug);
  if (!center) notFound();

  const hubHref = center.type === "guarderia" ? "/guarderias" : "/escuelas-infantiles";
  const hubLabel = formatCenterTypePlural(center.type);

  const cityCenters = await getCentersByCity(center.address.citySlug);
  const sameNeighborhood = cityCenters.filter(
    (c) =>
      c.slug !== center.slug &&
      c.type === center.type &&
      c.address.neighborhood === center.address.neighborhood,
  );
  const otherNeighborhood = cityCenters.filter(
    (c) =>
      c.slug !== center.slug &&
      c.type === center.type &&
      c.address.neighborhood !== center.address.neighborhood,
  );
  const relatedCenters = [...sameNeighborhood, ...otherNeighborhood].slice(0, 3);

  // Prioridad: FAQs reales de Supabase (center.faqs). Si no hay ninguna válida,
  // se usa buildCenterFaqs() como fallback (2-3 preguntas básicas). Estas mismas
  // `faqs` se usan tanto en el render visible como en el JSON-LD FAQPage.
  const dbFaqs = (center.faqs ?? []).filter(
    (faq) => faq?.question?.trim() && faq?.answer?.trim(),
  );
  const faqs = dbFaqs.length > 0 ? dbFaqs : buildCenterFaqs(center);
  const similarIntro = buildSimilarCentersIntro(center);
  const centerJsonLd = buildJsonLd(center);

  // Breadcrumb: only link to the city landing page if it exists in mock AND
  // the city has enough published centers to be indexable. Otherwise fall back
  // to the hub (/guarderias or /escuelas-infantiles) to avoid 404 links.
  const typePrefix = center.type === "guarderia" ? "guarderias" : "escuelas-infantiles";
  const expectedLandingSlug = `${typePrefix}-en-${center.address.citySlug}`;
  const landingPageExists = Boolean(getSeoPageBySlug(expectedLandingSlug));
  const landingHref =
    landingPageExists && cityCenters.length >= MIN_CENTERS_FOR_CITY_PAGE
      ? `/${expectedLandingSlug}`
      : hubHref;

  const breadcrumbItems = [
    { label: "Inicio", href: "/" },
    { label: hubLabel, href: hubHref },
    ...(landingHref !== hubHref
      ? [{ label: center.address.cityName, href: landingHref }]
      : []),
    { label: center.name },
  ];

  // FAQPage schema — helps Google show FAQ rich results for individual fichas.
  const faqJsonLd = {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: faqs.map((faq) => ({
      "@type": "Question",
      name: faq.question,
      acceptedAnswer: { "@type": "Answer", text: faq.answer },
    })),
  };

  // BreadcrumbList schema — used by Google to display breadcrumb paths in SERPs.
  const breadcrumbJsonLd = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    name: SITE_NAME,
    itemListElement: breadcrumbItems.map((item, index) => ({
      "@type": "ListItem",
      position: index + 1,
      name: item.label,
      ...(item.href ? { item: `${SITE_URL}${item.href}` } : {}),
    })),
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(centerJsonLd) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(faqJsonLd) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbJsonLd) }}
      />

      <div className="mx-auto flex max-w-4xl flex-col gap-12 px-4 py-10 sm:px-6">
        <Breadcrumbs items={breadcrumbItems} />

        <CenterDetail center={center} />

        <section id="solicitar-informacion">
          <LeadForm centerName={center.name} centerSlug={center.slug} />
        </section>

        <FAQ title={`Preguntas frecuentes sobre ${center.name}`} items={faqs} />

        {relatedCenters.length > 0 ? (
          <section>
            <h2 className="text-2xl font-bold text-slate-900">Centros similares</h2>
            <p className="mt-1 text-sm text-slate-500">{similarIntro}</p>
            <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {relatedCenters.map((relatedCenter) => (
                <CenterCard key={relatedCenter.id} center={relatedCenter} />
              ))}
            </div>
          </section>
        ) : null}
      </div>
    </>
  );
}
