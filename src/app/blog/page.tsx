import type { Metadata } from "next";
import Breadcrumbs from "@/components/Breadcrumbs";
import GuideCard from "@/components/GuideCard";
import { getAllGuides } from "@/lib/guides";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Blog y guías para familias",
  description: "Guías prácticas sobre cómo elegir guardería, adaptación, precios y ayudas para familias en España.",
  alternates: { canonical: "/blog" },
  robots: robotsMeta(),
};

export default function BlogPage() {
  const guides = getAllGuides();

  return (
    <div className="mx-auto flex max-w-6xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Blog" }]} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Guías para familias</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          Recursos prácticos para elegir guardería, entender la diferencia con la escuela infantil y resolver dudas habituales.
        </p>
      </header>

      <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {guides.map((guide) => (
          <GuideCard key={guide.id} guide={guide} />
        ))}
      </section>
    </div>
  );
}
