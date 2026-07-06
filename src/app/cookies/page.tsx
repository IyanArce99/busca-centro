import type { Metadata } from "next";
import Link from "next/link";
import Breadcrumbs from "@/components/Breadcrumbs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Política de cookies",
  description: "Información sobre el uso de cookies en BuscaCentro y cómo gestionarlas.",
  alternates: { canonical: "/cookies" },
  robots: robotsMeta(),
};

export default function CookiesPage() {
  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Política de cookies" }]} />

      <header>
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Política de cookies</h1>
        <p className="mt-2 text-sm text-slate-500">Última actualización: julio de 2026</p>
      </header>

      <div className="flex flex-col gap-8 text-sm leading-relaxed text-slate-700">

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">1. Qué son las cookies</h2>
          <p>
            Las cookies son pequeños archivos de texto que los sitios web almacenan en el navegador del usuario
            cuando este visita una página. Permiten recordar información sobre la visita, como preferencias de
            idioma, sesión iniciada u otras opciones, con el objetivo de hacer la experiencia de navegación más
            eficiente y personalizada.
          </p>
          <p>
            Las cookies no pueden acceder a los datos del dispositivo del usuario ni provocar daños en él.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">2. Tipos de cookies</h2>
          <p>Según su finalidad, las cookies se clasifican en:</p>
          <ul className="ml-4 flex flex-col gap-2 list-disc">
            <li>
              <strong>Cookies técnicas o estrictamente necesarias:</strong> imprescindibles para el funcionamiento
              correcto del sitio web. Sin ellas, algunas funciones no estarían disponibles. No requieren
              consentimiento del usuario.
            </li>
            <li>
              <strong>Cookies de preferencias:</strong> permiten que el sitio recuerde opciones elegidas por el
              usuario, como el idioma o la región.
            </li>
            <li>
              <strong>Cookies analíticas:</strong> recopilan información sobre cómo los usuarios interactúan con
              el sitio web, de forma agregada y anónima, para mejorar su funcionamiento. Requieren consentimiento
              del usuario.
            </li>
            <li>
              <strong>Cookies de marketing o publicidad:</strong> se usan para mostrar anuncios relevantes.
              BuscaCentro <strong>no utiliza actualmente</strong> cookies de marketing. Si en el futuro se
              activaran, esta política se actualizará.
            </li>
          </ul>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">3. Cookies utilizadas actualmente</h2>
          <p>
            En el MVP actual de BuscaCentro, el sitio web <strong>solo utiliza cookies técnicas o
            estrictamente necesarias</strong> para su funcionamiento. No se han activado herramientas de
            analítica web ni servicios de publicidad.
          </p>
          <p>
            Si en el futuro se activan herramientas de analítica web, se solicitará el consentimiento
            previo del usuario conforme a la normativa aplicable y se actualizará esta política con los
            detalles de cada herramienta (proveedor, finalidad y duración de las cookies).
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">4. Tabla de cookies</h2>
          <div className="overflow-x-auto">
            <table className="w-full border-collapse text-xs">
              <thead>
                <tr className="bg-slate-100 text-left text-slate-700">
                  <th className="border border-slate-200 px-3 py-2 font-semibold">Nombre</th>
                  <th className="border border-slate-200 px-3 py-2 font-semibold">Proveedor</th>
                  <th className="border border-slate-200 px-3 py-2 font-semibold">Finalidad</th>
                  <th className="border border-slate-200 px-3 py-2 font-semibold">Duración</th>
                  <th className="border border-slate-200 px-3 py-2 font-semibold">Tipo</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="border border-slate-200 px-3 py-2 text-slate-500 italic" colSpan={5}>
                    En el MVP actual no se han identificado cookies propias ni de terceros más allá de las
                    estrictamente técnicas del navegador. Esta tabla se actualizará cuando se activen
                    servicios adicionales.
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">5. Cómo gestionar las cookies desde el navegador</h2>
          <p>
            El usuario puede aceptar, rechazar o eliminar las cookies configurando su navegador. A continuación
            se indican los enlaces de ayuda de los navegadores más comunes:
          </p>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li>
              <a href="https://support.google.com/chrome/answer/95647" target="_blank" rel="noopener noreferrer"
                className="text-sky-700 underline underline-offset-2 hover:text-sky-800">
                Google Chrome
              </a>
            </li>
            <li>
              <a href="https://support.mozilla.org/es/kb/habilitar-y-deshabilitar-cookies-sitios-web-rastrear-preferencias" target="_blank" rel="noopener noreferrer"
                className="text-sky-700 underline underline-offset-2 hover:text-sky-800">
                Mozilla Firefox
              </a>
            </li>
            <li>
              <a href="https://support.apple.com/es-es/guide/safari/sfri11471/mac" target="_blank" rel="noopener noreferrer"
                className="text-sky-700 underline underline-offset-2 hover:text-sky-800">
                Apple Safari
              </a>
            </li>
            <li>
              <a href="https://support.microsoft.com/es-es/microsoft-edge/eliminar-las-cookies-en-microsoft-edge-63947406-40ac-c3b8-57b9-2a946a29ae09" target="_blank" rel="noopener noreferrer"
                className="text-sky-700 underline underline-offset-2 hover:text-sky-800">
                Microsoft Edge
              </a>
            </li>
          </ul>
          <p>
            Ten en cuenta que deshabilitar ciertas cookies puede afectar al funcionamiento del sitio.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">6. Más información</h2>
          <p>
            Para cualquier consulta sobre esta política de cookies puedes contactar con nosotros a través de
            la página de{" "}
            <Link href="/contacto" className="text-sky-700 underline underline-offset-2 hover:text-sky-800">
              contacto
            </Link>.
          </p>
          <p>
            Para más información sobre cookies puedes consultar la Guía sobre el uso de cookies publicada
            por la Agencia Española de Protección de Datos en{" "}
            <a href="https://www.aepd.es" target="_blank" rel="noopener noreferrer"
              className="text-sky-700 underline underline-offset-2 hover:text-sky-800">
              www.aepd.es
            </a>.
          </p>
        </section>

      </div>
    </div>
  );
}
