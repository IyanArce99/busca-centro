import type { Metadata } from "next";
import Link from "next/link";
import Breadcrumbs from "@/components/Breadcrumbs";
import { robotsMeta } from "@/lib/seo";

export const metadata: Metadata = {
  title: "Aviso legal",
  description:
    "Consulta la información legal de BuscaCentro, titularidad, condiciones de uso y responsabilidad sobre los contenidos.",
  alternates: { canonical: "/aviso-legal" },
  robots: robotsMeta(),
};

export default function AvisoLegalPage() {
  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-8 px-4 py-10 sm:px-6">
      <Breadcrumbs items={[{ label: "Inicio", href: "/" }, { label: "Aviso legal" }]} />

      <header>
        <h1 className="text-3xl font-bold text-slate-900 sm:text-4xl">Aviso legal</h1>
        <p className="mt-2 text-sm text-slate-500">Última actualización: julio de 2026</p>
      </header>

      <div className="flex flex-col gap-8 text-sm leading-relaxed text-slate-700">

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">1. Identificación del titular</h2>
          <p>
            En cumplimiento de lo dispuesto en el artículo 10 de la Ley 34/2002, de 11 de julio, de Servicios de la
            Sociedad de la Información y de Comercio Electrónico (LSSI-CE), se informa de los datos identificativos
            del titular de este sitio web:
          </p>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li><strong>Denominación social:</strong> Iyan Arcega SL</li>
            <li><strong>CIF:</strong> B23869027</li>
            <li><strong>Domicilio social:</strong> Calle Tomás Miller 47, 35007 Las Palmas de Gran Canaria, España</li>
            <li><strong>Sitio web:</strong> BuscaCentro</li>
          </ul>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">2. Objeto del sitio web</h2>
          <p>
            BuscaCentro es un directorio informativo de guarderías, escuelas infantiles y otros centros educativos
            para el primer ciclo de Educación Infantil en España. Su finalidad es facilitar a las familias la
            localización y comparación de centros en función de su ciudad, zona geográfica y servicios disponibles.
          </p>
          <p>
            BuscaCentro no gestiona plazas, no formaliza matrículas ni actúa como intermediario en ningún proceso
            de admisión. Toda gestión deberá realizarse directamente con el centro educativo correspondiente.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">3. Condiciones generales de uso</h2>
          <p>
            El acceso y uso de este sitio web implica la aceptación plena y sin reservas de las presentes
            condiciones de uso. El titular se reserva el derecho a modificarlas en cualquier momento, siendo
            efectivas desde su publicación.
          </p>
          <p>
            El usuario se compromete a hacer un uso lícito del sitio, absteniéndose de cualquier actividad que
            pueda dañar, inutilizar, sobrecargar o deteriorar el sitio web o impedir su normal uso por otros
            usuarios.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">4. Responsabilidad sobre los contenidos</h2>
          <p>
            El titular realiza esfuerzos razonables para mantener la información publicada actualizada y veraz.
            No obstante, no se garantiza la exactitud, integridad o actualización de todos los contenidos, en
            particular los relativos a fichas de centros educativos.
          </p>
          <p>
            El titular no será responsable de los errores u omisiones en los contenidos, ni de los daños que
            pudieran derivarse del uso de la información publicada en este sitio.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">5. Fichas de centros y procedimiento de corrección</h2>
          <p>
            Algunas fichas de centros publicadas en BuscaCentro pueden haber sido elaboradas a partir de fuentes
            públicas o de información facilitada por terceros, y pueden estar pendientes de verificación por parte
            del centro educativo.
          </p>
          <p>
            Si detectas información incorrecta, desactualizada o que vulnere derechos de terceros, puedes
            solicitar su corrección o supresión a través de:
          </p>
          <ul className="ml-4 flex flex-col gap-1.5 list-disc">
            <li>El formulario de reclamación de ficha disponible en <Link href="/reclamar-ficha" className="text-sky-700 underline underline-offset-2 hover:text-sky-800">/reclamar-ficha</Link>.</li>
            <li>O enviando un correo a la dirección de contacto del titular indicada en la página de <Link href="/contacto" className="text-sky-700 underline underline-offset-2 hover:text-sky-800">contacto</Link>.</li>
          </ul>
          <p>
            Atenderemos las solicitudes en el menor tiempo posible, conforme a la normativa aplicable.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">6. Propiedad intelectual</h2>
          <p>
            Los textos, diseños, logotipos, estructuras y demás contenidos propios de BuscaCentro son propiedad
            de Iyan Arcega SL o de sus licenciantes, y están protegidos por la legislación española e
            internacional sobre propiedad intelectual e industrial.
          </p>
          <p>
            Queda prohibida su reproducción, distribución, comunicación pública o transformación sin autorización
            expresa del titular, salvo para uso personal y privado no comercial.
          </p>
          <p>
            Las marcas, nombres comerciales y demás signos distintivos que aparezcan en este sitio web relacionados
            con terceros (como nombres de centros educativos) son propiedad de sus respectivos titulares y se
            mencionan únicamente con fines informativos.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">7. Enlaces externos</h2>
          <p>
            Este sitio puede incluir enlaces a sitios web de terceros, como webs oficiales de centros educativos.
            El titular no tiene control sobre esos sitios y no asume responsabilidad por sus contenidos,
            disponibilidad o prácticas de privacidad. La inclusión de un enlace no implica ningún tipo de
            recomendación o asociación.
          </p>
        </section>

        <section className="flex flex-col gap-3">
          <h2 className="text-base font-semibold text-slate-900">8. Legislación aplicable y jurisdicción</h2>
          <p>
            Las presentes condiciones legales se rigen por la legislación española. Para la resolución de cualquier
            controversia derivada del acceso o uso de este sitio web, las partes se someten, con renuncia expresa a
            cualquier otro fuero que pudiera corresponderles, a los juzgados y tribunales de Las Palmas de Gran
            Canaria, salvo que la normativa aplicable establezca otro fuero imperativo.
          </p>
        </section>

      </div>
    </div>
  );
}
