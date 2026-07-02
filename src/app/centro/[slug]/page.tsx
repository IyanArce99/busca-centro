import type { Metadata } from "next";
import { notFound } from "next/navigation";
import Breadcrumbs from "@/components/Breadcrumbs";
import CenterDetail from "@/components/CenterDetail";
import LeadForm from "@/components/LeadForm";
import FAQ from "@/components/FAQ";
import CenterCard from "@/components/CenterCard";
import CTASection from "@/components/CTASection";
import { getAllCenters, isCenterIndexable } from "@/lib/centers";
import { getCenterBySlug, getCentersByCity } from "@/lib/data/centers";
import { formatCenterType } from "@/lib/format";
import { robotsMeta } from "@/lib/seo";

interface PageProps {
  params: Promise<{ slug: string }>;
}

export async function generateStaticParams() {
  return getAllCenters().map((center) => ({ slug: center.slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const center = await getCenterBySlug(slug);
  if (!center) return {};

  const indexable = isCenterIndexable(center);

  return {
    title: `${center.name} - ${center.address.cityName}`,
    description: center.shortDescription || `Ficha de ${center.name}, ${formatCenterType(center.type)} en ${center.address.cityName}.`,
    alternates: { canonical: `/centro/${center.slug}` },
    robots: robotsMeta(indexable),
  };
}

export default async function CenterPage({ params }: PageProps) {
  const { slug } = await params;
  const center = await getCenterBySlug(slug);
  if (!center) notFound();

  const hubHref = center.type === "guarderia" ? "/guarderias" : "/escuelas-infantiles";
  const hubLabel = formatCenterType(center.type) + "s";
  const cityCenters = await getCentersByCity(center.address.citySlug);
  const relatedCenters = cityCenters
    .filter((c) => c.slug !== center.slug && c.type === center.type)
    .slice(0, 3);

  return (
    <div className="mx-auto flex max-w-4xl flex-col gap-12 px-4 py-10 sm:px-6">
      <Breadcrumbs
        items={[
          { label: "Inicio", href: "/" },
          { label: hubLabel, href: hubHref },
          { label: center.address.cityName, href: `/${center.type === "guarderia" ? "guarderias" : "escuelas-infantiles"}-en-${center.address.citySlug}` },
          { label: center.name },
        ]}
      />

      <CenterDetail center={center} />

      <section id="solicitar-informacion">
        <LeadForm centerName={center.name} centerSlug={center.slug} />
      </section>

      <section className="rounded-xl border border-slate-200 bg-white p-6">
        <h2 className="text-lg font-semibold text-slate-900">¿Eres responsable de este centro?</h2>
        <p className="mt-2 text-sm text-slate-600">
          Si formas parte del equipo de {center.name}, puedes reclamar esta ficha para confirmar o actualizar sus datos.
        </p>
        <CTASection
          variant="light"
          title="Reclama tu ficha"
          primaryAction={{ label: "Reclamar ficha", href: "/reclamar-ficha" }}
        />
      </section>

      {center.faqs && center.faqs.length > 0 ? <FAQ title={`Preguntas frecuentes sobre ${center.name}`} items={center.faqs} /> : null}

      {relatedCenters.length > 0 ? (
        <section>
          <h2 className="text-2xl font-bold text-slate-900">Centros similares</h2>
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {relatedCenters.map((relatedCenter) => (
              <CenterCard key={relatedCenter.id} center={relatedCenter} />
            ))}
          </div>
        </section>
      ) : null}
    </div>
  );
}
