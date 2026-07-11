import type { Metadata } from "next";
import { notFound } from "next/navigation";
import Breadcrumbs from "@/components/Breadcrumbs";
import GuideCard from "@/components/GuideCard";
import CTASection from "@/components/CTASection";
import { getAllGuides, getGuideBySlug, getRelatedGuides } from "@/lib/guides";
import { buildMetadata } from "@/lib/seo";
import { SITE_NAME, SITE_URL } from "@/lib/constants";

interface PageProps {
  params: Promise<{ slug: string }>;
}

export async function generateStaticParams() {
  return getAllGuides().map((guide) => ({ slug: guide.slug }));
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const guide = getGuideBySlug(slug);
  if (!guide) return {};

  // Temporarily noindex until the blog has real, complete guides.
  return buildMetadata({
    title: guide.title,
    description: guide.excerpt,
    path: `/blog/${guide.slug}`,
    indexable: false,
  });
}

export default async function GuidePage({ params }: PageProps) {
  const { slug } = await params;
  const guide = getGuideBySlug(slug);
  if (!guide) notFound();

  const relatedGuides = getRelatedGuides(guide);

  const articleJsonLd = {
    "@context": "https://schema.org",
    "@type": "Article",
    headline: guide.title,
    description: guide.excerpt,
    datePublished: guide.publishedAt,
    dateModified: guide.updatedAt ?? guide.publishedAt,
    url: `${SITE_URL}/blog/${guide.slug}`,
    author: { "@type": "Organization", name: SITE_NAME, url: SITE_URL },
    publisher: { "@type": "Organization", name: SITE_NAME, url: SITE_URL },
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(articleJsonLd) }}
      />
    <div className="mx-auto flex max-w-3xl flex-col gap-10 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Blog", href: "/blog" }, { label: guide.title }]} />

      <header className="flex flex-col gap-3">
        <span className="text-xs font-semibold uppercase tracking-wide text-sky-700">{guide.category}</span>
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">{guide.title}</h1>
        <p className="text-sm text-slate-500">
          Publicado el {new Date(guide.publishedAt).toLocaleDateString("es-ES")} · {guide.readingTimeMinutes} min de lectura
        </p>
      </header>

      <article className="flex flex-col gap-4 text-base leading-relaxed text-slate-700">
        {guide.content.map((paragraph, index) => (
          <p key={index}>{paragraph}</p>
        ))}
      </article>

      <CTASection
        variant="light"
        title="¿Buscas centro para tu hijo o hija?"
        description="Compara guarderías y escuelas infantiles por ciudad y servicios."
        primaryAction={{ label: "Buscar guarderías", href: "/guarderias" }}
        secondaryAction={{ label: "Ver escuelas infantiles", href: "/escuelas-infantiles" }}
      />

      {relatedGuides.length > 0 ? (
        <section>
          <h2 className="text-2xl font-bold text-slate-900">Otras guías</h2>
          <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {relatedGuides.map((relatedGuide) => (
              <GuideCard key={relatedGuide.id} guide={relatedGuide} />
            ))}
          </div>
        </section>
      ) : null}
    </div>
    </>
  );
}
