import type { Metadata } from "next";
import Breadcrumbs from "@/components/Breadcrumbs";
import AddCenterForm from "./AddCenterForm";
import { buildMetadata } from "@/lib/seo";

// Always noindex, regardless of NEXT_PUBLIC_INDEXABLE: pure lead-gen forms
// shouldn't be indexed even on the final production domain.
export const metadata: Metadata = buildMetadata({
  title: "Añadir centro",
  description: "Añade tu guardería o escuela infantil al directorio de BuscaCentro.",
  path: "/anadir-centro",
  indexable: false,
});

export default function AnadirCentroPage() {
  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Para centros", href: "/para-centros" }, { label: "Añadir centro" }]} />

      <header className="flex flex-col gap-4">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Añade tu centro al directorio</h1>
        <p className="text-base text-slate-600">
          Cuéntanos los datos básicos de tu guardería o escuela infantil. Revisaremos la información antes de publicarla en el
          directorio.
        </p>
      </header>

      <AddCenterForm />
    </div>
  );
}
