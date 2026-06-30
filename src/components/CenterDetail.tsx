import type { Center } from "@/types/center";
import { emailHref, formatAgeRange, formatCenterType, formatOwnership, formatService, phoneHref } from "@/lib/format";

interface CenterDetailProps {
  center: Center;
}

export default function CenterDetail({ center }: CenterDetailProps) {
  const { address, contact } = center;
  const location = [address.neighborhood, address.cityName].filter(Boolean).join(", ");

  return (
    <div className="flex flex-col gap-8">
      <header className="flex flex-col gap-3">
        <div className="flex flex-wrap items-center gap-2 text-xs font-medium text-slate-600">
          <span className="rounded-full bg-slate-100 px-2.5 py-1">{formatCenterType(center.type)}</span>
          <span className="rounded-full bg-slate-100 px-2.5 py-1">{formatOwnership(center.ownership)}</span>
          {center.isVerified ? (
            <span className="rounded-full bg-emerald-50 px-2.5 py-1 text-emerald-700">Ficha verificada</span>
          ) : (
            <span className="rounded-full bg-amber-50 px-2.5 py-1 text-amber-700">Datos sin verificar</span>
          )}
        </div>
        <h1 className="text-3xl font-bold text-slate-900">{center.name}</h1>
        <p className="text-base text-slate-600">{location}</p>
        <p className="text-xs text-slate-400">
          Datos actualizados el {new Date(center.updatedAt).toLocaleDateString("es-ES", { day: "numeric", month: "long", year: "numeric" })}
        </p>
      </header>

      <div className="grid gap-4 rounded-xl border border-dashed border-slate-300 bg-slate-50 p-6 text-center text-sm text-slate-500 sm:grid-cols-2">
        <div className="flex h-40 items-center justify-center rounded-lg bg-slate-200/60">Galería de fotos próximamente</div>
        <div className="flex h-40 items-center justify-center rounded-lg bg-slate-200/60">Mapa de ubicación próximamente</div>
      </div>

      <section className="grid gap-6 sm:grid-cols-2">
        <div>
          <h2 className="text-lg font-semibold text-slate-900">Datos de contacto</h2>
          <dl className="mt-3 flex flex-col gap-2 text-sm text-slate-600">
            <div>
              <dt className="font-medium text-slate-700">Dirección</dt>
              <dd>
                {address.street}, {address.postalCode} {address.cityName}
              </dd>
            </div>
            {contact.phone ? (
              <div>
                <dt className="font-medium text-slate-700">Teléfono</dt>
                <dd>
                  <a href={phoneHref(contact.phone)} className="text-sky-700">
                    {contact.phone}
                  </a>
                </dd>
              </div>
            ) : null}
            {contact.email ? (
              <div>
                <dt className="font-medium text-slate-700">Email</dt>
                <dd>
                  <a href={emailHref(contact.email)} className="text-sky-700">
                    {contact.email}
                  </a>
                </dd>
              </div>
            ) : null}
            {contact.website ? (
              <div>
                <dt className="font-medium text-slate-700">Web</dt>
                <dd>
                  <a href={contact.website} target="_blank" rel="noopener noreferrer" className="text-sky-700">
                    {contact.website}
                  </a>
                </dd>
              </div>
            ) : null}
          </dl>
        </div>

        <div>
          <h2 className="text-lg font-semibold text-slate-900">Horario y edades</h2>
          <dl className="mt-3 flex flex-col gap-2 text-sm text-slate-600">
            <div>
              <dt className="font-medium text-slate-700">Horario</dt>
              <dd>{center.schedule ?? "Consultar con el centro"}</dd>
            </div>
            <div>
              <dt className="font-medium text-slate-700">Edad admitida</dt>
              <dd>{formatAgeRange(center.ageRange)}</dd>
            </div>
          </dl>
        </div>
      </section>

      {center.services.length > 0 ? (
        <section>
          <h2 className="text-lg font-semibold text-slate-900">Servicios</h2>
          <div className="mt-3 flex flex-wrap gap-2">
            {center.services.map((service) => (
              <span key={service} className="rounded-full bg-sky-50 px-3 py-1.5 text-sm font-medium text-sky-700">
                {formatService(service)}
              </span>
            ))}
          </div>
        </section>
      ) : null}

      {center.shortDescription || center.longDescription ? (
        <section>
          <h2 className="text-lg font-semibold text-slate-900">Sobre este centro</h2>
          {center.shortDescription ? <p className="mt-3 text-base text-slate-700">{center.shortDescription}</p> : null}
          {center.longDescription ? <p className="mt-3 text-sm leading-relaxed text-slate-600">{center.longDescription}</p> : null}
        </section>
      ) : null}

      <div className="flex flex-wrap gap-3">
        {contact.phone ? (
          <a
            href={phoneHref(contact.phone)}
            className="rounded-full bg-sky-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-sky-800"
          >
            Llamar al centro
          </a>
        ) : null}
        {contact.website ? (
          <a
            href={contact.website}
            target="_blank"
            rel="noopener noreferrer"
            className="rounded-full border border-slate-300 px-5 py-2.5 text-sm font-semibold text-slate-700 hover:bg-slate-50"
          >
            Visitar web
          </a>
        ) : null}
        <a
          href="#solicitar-informacion"
          className="rounded-full border border-sky-700 px-5 py-2.5 text-sm font-semibold text-sky-700 hover:bg-sky-50"
        >
          Solicitar información
        </a>
      </div>

      <section className="rounded-xl border border-amber-200 bg-amber-50 p-5 text-sm text-amber-900">
        <p>
          Parte de la información mostrada puede proceder de fuentes públicas o de datos facilitados por el propio centro. Si
          formas parte del equipo del centro, puedes reclamar esta ficha y solicitar una actualización.
        </p>
      </section>
    </div>
  );
}
