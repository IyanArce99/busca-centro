import type { Metadata } from "next";
import Breadcrumbs from "@/components/Breadcrumbs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Política de privacidad",
  description: "Consulta cómo tratamos los datos personales enviados a través de BuscaCentro.",
  alternates: { canonical: "/privacidad" },
  robots: robotsMeta(),
};

export default function PrivacidadPage() {
  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Privacidad" }]} />

      <header>
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Política de privacidad</h1>
        <p className="mt-2 text-sm text-slate-500">Última actualización: julio de 2026</p>
      </header>

      <div className="flex flex-col gap-8 text-sm leading-relaxed text-slate-700">

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">1. Responsable del tratamiento</h2>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li><strong>Denominación social:</strong> Iyan Arcega SL</li>
            <li><strong>CIF:</strong> B23869027</li>
            <li><strong>Domicilio:</strong> Calle Tomás Miller 47, 35007 Las Palmas de Gran Canaria, España</li>
            <li><strong>Email de contacto:</strong> legal@buscacentro.es</li>
          </ul>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">2. Datos personales que pueden recogerse</h2>
          <p>
            BuscaCentro puede recoger los siguientes datos personales a través de los formularios disponibles en
            el sitio web:
          </p>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li>Nombre y datos de contacto proporcionados en formularios de solicitud de información sobre centros.</li>
            <li>Nombre y datos proporcionados en el formulario de alta de nuevos centros.</li>
            <li>Nombre y datos proporcionados en el formulario de reclamación o actualización de fichas.</li>
            <li>Datos técnicos básicos de navegación (dirección IP, tipo de navegador, páginas visitadas) si se
              activan herramientas de analítica web.</li>
          </ul>
          <p>
            No recogemos datos de menores de edad. Este sitio está dirigido exclusivamente a adultos, padres,
            madres o tutores legales.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">3. Finalidades y base legal del tratamiento</h2>
          <div className="overflow-x-auto">
            <table className="w-full border-collapse text-xs">
              <thead>
                <tr className="bg-slate-100 text-left text-slate-700">
                  <th className="border border-slate-200 px-3 py-2 font-semibold">Finalidad</th>
                  <th className="border border-slate-200 px-3 py-2 font-semibold">Base legal</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                <tr>
                  <td className="border border-slate-200 px-3 py-2">Responder consultas enviadas a través del formulario de contacto</td>
                  <td className="border border-slate-200 px-3 py-2">Consentimiento del usuario</td>
                </tr>
                <tr className="bg-slate-50">
                  <td className="border border-slate-200 px-3 py-2">Gestionar solicitudes de información sobre centros</td>
                  <td className="border border-slate-200 px-3 py-2">Consentimiento del usuario</td>
                </tr>
                <tr>
                  <td className="border border-slate-200 px-3 py-2">Gestionar altas de centros o reclamaciones de fichas</td>
                  <td className="border border-slate-200 px-3 py-2">Consentimiento del usuario</td>
                </tr>
                <tr className="bg-slate-50">
                  <td className="border border-slate-200 px-3 py-2">Corregir o actualizar datos de fichas de centros</td>
                  <td className="border border-slate-200 px-3 py-2">Interés legítimo</td>
                </tr>
                <tr>
                  <td className="border border-slate-200 px-3 py-2">Mejorar el funcionamiento del sitio web mediante analítica</td>
                  <td className="border border-slate-200 px-3 py-2">Consentimiento del usuario (cuando aplique)</td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">4. Conservación de datos</h2>
          <p>
            Los datos personales se conservarán durante el tiempo estrictamente necesario para cumplir la
            finalidad para la que fueron recogidos. Una vez atendida la solicitud correspondiente, los datos
            serán eliminados o anonimizados, salvo que exista obligación legal de conservarlos durante un
            período determinado.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">5. Derechos del usuario</h2>
          <p>
            De acuerdo con el Reglamento (UE) 2016/679 (RGPD) y la Ley Orgánica 3/2018 (LOPD-GDD), el usuario
            tiene derecho a:
          </p>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li><strong>Acceso:</strong> conocer qué datos personales tratamos sobre él.</li>
            <li><strong>Rectificación:</strong> solicitar la corrección de datos inexactos o incompletos.</li>
            <li><strong>Supresión:</strong> solicitar la eliminación de sus datos cuando ya no sean necesarios.</li>
            <li><strong>Oposición:</strong> oponerse al tratamiento de sus datos en determinadas circunstancias.</li>
            <li><strong>Limitación del tratamiento:</strong> solicitar que se restrinja el uso de sus datos.</li>
            <li><strong>Portabilidad:</strong> recibir sus datos en formato estructurado cuando el tratamiento esté
              basado en el consentimiento.</li>
          </ul>
          <p>
            Asimismo, el usuario tiene derecho a retirar el consentimiento prestado en cualquier momento, sin que
            ello afecte a la licitud del tratamiento previo a su retirada.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">6. Cómo ejercer los derechos</h2>
          <p>
            Para ejercer cualquiera de los derechos anteriores, el usuario puede dirigir su solicitud a:
          </p>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li><strong>Por correo electrónico:</strong> legal@buscacentro.es</li>
            <li><strong>Por correo postal:</strong> Iyan Arcega SL, Calle Tomás Miller 47, 35007 Las Palmas de Gran Canaria</li>
          </ul>
          <p>
            La solicitud deberá incluir nombre, apellidos y copia de un documento de identidad que acredite la
            identidad del solicitante. Responderemos en el plazo máximo establecido por la normativa aplicable.
          </p>
          <p>
            Si considera que sus derechos no han sido atendidos correctamente, puede presentar una reclamación
            ante la Agencia Española de Protección de Datos (AEPD) en{" "}
            <a
              href="https://www.aepd.es"
              target="_blank"
              rel="noopener noreferrer"
              className="text-sky-700 underline underline-offset-2 hover:text-sky-800"
            >
              www.aepd.es
            </a>.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">7. Cesiones y proveedores tecnológicos</h2>
          <p>
            Los datos personales no serán cedidos a terceros salvo obligación legal. No obstante, para el
            funcionamiento del sitio web se utilizan los siguientes proveedores tecnológicos que pueden acceder
            a datos en calidad de encargados del tratamiento:
          </p>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li><strong>Supabase:</strong> base de datos y backend del directorio. Puede almacenar datos de
              formularios enviados a través del sitio.</li>
            <li><strong>Vercel:</strong> plataforma de alojamiento web.</li>
            <li><strong>Servicios de correo electrónico:</strong> si se activan en el futuro para la gestión de
              solicitudes.</li>
            <li><strong>Herramientas de analítica web:</strong> si se activan en el futuro, serán indicadas en la
              política de cookies.</li>
          </ul>
          <p>
            Todos los proveedores están sujetos a acuerdos de encargado del tratamiento conforme al RGPD.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">8. Transferencias internacionales</h2>
          <p>
            Algunos de los proveedores tecnológicos mencionados (Supabase, Vercel) pueden procesar datos en
            servidores ubicados fuera del Espacio Económico Europeo. En tales casos, las transferencias se
            realizan bajo las garantías adecuadas exigidas por el RGPD, como cláusulas contractuales tipo
            aprobadas por la Comisión Europea o la adhesión al marco de protección de datos UE-EE.UU. cuando
            aplique.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">9. Medidas de seguridad</h2>
          <p>
            Iyan Arcega SL aplica medidas técnicas y organizativas razonables para proteger los datos personales
            frente a accesos no autorizados, pérdida, alteración o divulgación. No obstante, ninguna transmisión
            por internet es completamente segura, por lo que no podemos garantizar la seguridad absoluta de los
            datos transmitidos.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">10. Menores de edad</h2>
          <p>
            BuscaCentro está dirigido exclusivamente a adultos: padres, madres, tutores legales o profesionales
            del sector educativo. No recogemos datos de menores de edad de forma intencionada. Si detectamos que
            hemos recibido datos de un menor sin el consentimiento de sus tutores, procederemos a su eliminación.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">11. Cambios en esta política</h2>
          <p>
            Esta política puede actualizarse para reflejar cambios normativos o en el funcionamiento del sitio.
            La fecha de última actualización aparece al inicio de esta página. Te recomendamos revisarla
            periódicamente.
          </p>
        </section>

      </div>
    </div>
  );
}
