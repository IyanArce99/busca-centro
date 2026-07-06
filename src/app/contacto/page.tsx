import type { Metadata } from "next";
import Link from "next/link";
import Breadcrumbs from "@/components/Breadcrumbs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Contacto",
  description:
    "Contacta con BuscaCentro para consultas generales, corrección de fichas de centros o cuestiones legales y de privacidad.",
  alternates: { canonical: "/contacto" },
  robots: robotsMeta(),
};

export default function ContactoPage() {
  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Contacto" }]} />

      <header className="flex flex-col gap-3">
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Contacto</h1>
        <p className="max-w-2xl text-lg text-slate-600">
          ¿Tienes una consulta sobre BuscaCentro o sobre la ficha de un centro? Estos son nuestros
          canales de contacto.
        </p>
      </header>

      <div className="grid gap-4 sm:grid-cols-2">
        <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
          <h2 className="text-base font-semibold text-slate-900">Consultas generales</h2>
          <p className="mt-2 text-sm leading-relaxed text-slate-600">
            Para dudas sobre el directorio, sugerencias o colaboración con centros:
          </p>
          <a
            href="mailto:hola@buscacentro.es"
            className="mt-3 inline-block text-sm font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800"
          >
            hola@buscacentro.es
          </a>
        </section>

        <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
          <h2 className="text-base font-semibold text-slate-900">Asuntos legales y privacidad</h2>
          <p className="mt-2 text-sm leading-relaxed text-slate-600">
            Para ejercer tus derechos de protección de datos o cuestiones legales:
          </p>
          <a
            href="mailto:legal@buscacentro.es"
            className="mt-3 inline-block text-sm font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800"
          >
            legal@buscacentro.es
          </a>
        </section>
      </div>

      <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <h2 className="text-base font-semibold text-slate-900">¿Representas un centro?</h2>
        <p className="mt-2 text-sm leading-relaxed text-slate-600">
          Si eres responsable de una guardería o escuela infantil y quieres corregir, actualizar o
          reclamar la ficha de tu centro, puedes hacerlo directamente desde el formulario de{" "}
          <Link
            href="/reclamar-ficha"
            className="font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800"
          >
            reclamación de ficha
          </Link>
          . Si tu centro todavía no aparece en el directorio, puedes{" "}
          <Link
            href="/anadir-centro"
            className="font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800"
          >
            añadirlo
          </Link>
          .
        </p>
      </section>

      <section className="rounded-xl border border-slate-200 bg-slate-50 p-6 text-sm leading-relaxed text-slate-600">
        <h2 className="text-base font-semibold text-slate-900">Titular del sitio</h2>
        <ul className="mt-2 flex flex-col gap-1.5">
          <li>Iyan Arcega SL</li>
          <li>CIF: B23869027</li>
          <li>Calle Tomás Miller 47, 35007 Las Palmas de Gran Canaria, España</li>
        </ul>
        <p className="mt-3 text-xs text-slate-500">
          Consulta más información en el{" "}
          <Link
            href="/aviso-legal"
            className="font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800"
          >
            aviso legal
          </Link>{" "}
          y en la{" "}
          <Link
            href="/privacidad"
            className="font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800"
          >
            política de privacidad
          </Link>
          .
        </p>
      </section>
    </div>
  );
}
