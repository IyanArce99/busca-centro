import type { Metadata } from "next";
import Breadcrumbs from "@/components/Breadcrumbs";
import ClaimListingForm from "./ClaimListingForm";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Reclamar ficha",
  description: "Reclama la ficha de tu guardería o escuela infantil en BuscaCentro para actualizar sus datos.",
  // Always noindex, regardless of NEXT_PUBLIC_INDEXABLE: pure lead-gen forms
  // shouldn't be indexed even on the final production domain.
  robots: robotsMeta(false),
};

export default function ReclamarFichaPage() {
  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Para centros", href: "/para-centros" }, { label: "Reclamar ficha" }]} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Reclama la ficha de tu centro</h1>
        <p className="text-base text-slate-600">
          Si tu centro ya aparece en el directorio, puedes solicitar la verificación y actualización de su ficha.
        </p>
      </header>

      <ClaimListingForm />
    </div>
  );
}
