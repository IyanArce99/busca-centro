import Link from "next/link";
import type { Center, CenterService } from "@/types/center";
import { emailHref, formatAgeRange, formatCenterType, formatOwnership, formatService, phoneHref } from "@/lib/format";
import {
  MapPinIcon,
  PhoneIcon,
  EnvelopeIcon,
  GlobeAltIcon,
  ClockIcon,
  CheckBadgeIcon,
  ExclamationTriangleIcon,
  ExternalLinkIcon,
  ForkKnifeIcon,
  SunIcon,
  SparklesIcon,
  LeafIcon,
  BookOpenIcon,
  PuzzlePieceIcon,
  HeartIcon,
  InformationCircleIcon,
  PhotoIcon,
  MapIcon,
} from "@/components/Icons";
import type { ReactNode } from "react";

const SERVICE_ICONS: Record<CenterService, ReactNode> = {
  comedor: <ForkKnifeIcon className="h-4 w-4" />,
  "horario-ampliado": <ClockIcon className="h-4 w-4" />,
  bilingue: <SparklesIcon className="h-4 w-4" />,
  "aula-0-1-anos": <HeartIcon className="h-4 w-4" />,
  "aula-1-2-anos": <HeartIcon className="h-4 w-4" />,
  "aula-2-3-anos": <HeartIcon className="h-4 w-4" />,
  "patio-exterior": <LeafIcon className="h-4 w-4" />,
  psicomotricidad: <PuzzlePieceIcon className="h-4 w-4" />,
  "orientacion-pedagogica": <BookOpenIcon className="h-4 w-4" />,
  "servicio-madrugadores": <SunIcon className="h-4 w-4" />,
};

interface CenterDetailProps {
  center: Center;
}

export default function CenterDetail({ center }: Readonly<CenterDetailProps>) {
  const { address, contact } = center;
  const location = [address.neighborhood, address.cityName].filter(Boolean).join(", ");

  return (
    <div className="flex flex-col gap-8">
      {/* Header card */}
      <header className="rounded-2xl border border-slate-200 bg-gradient-to-br from-white to-slate-50 p-6 sm:p-8">
        <div className="flex flex-wrap items-center gap-2 text-xs font-medium">
          <span
            className={`rounded-full px-2.5 py-1 ${
              center.type === "guarderia" ? "bg-sky-100 text-sky-700" : "bg-violet-100 text-violet-700"
            }`}
          >
            {formatCenterType(center.type)}
          </span>
          <span className="rounded-full bg-slate-100 px-2.5 py-1 text-slate-600">
            {formatOwnership(center.ownership)}
          </span>
          {center.isVerified ? (
            <span className="flex items-center gap-1 rounded-full bg-emerald-100 px-2.5 py-1 text-emerald-700">
              <CheckBadgeIcon className="h-3.5 w-3.5" />
              Ficha verificada
            </span>
          ) : (
            <span className="flex items-center gap-1 rounded-full bg-amber-100 px-2.5 py-1 text-amber-700">
              <ExclamationTriangleIcon className="h-3.5 w-3.5" />
              Datos sin verificar
            </span>
          )}
        </div>

        <h1 className="mt-4 text-3xl font-bold text-slate-900 sm:text-4xl">{center.name}</h1>

        {location ? (
          <p className="mt-2 flex items-center gap-1.5 text-base text-slate-600">
            <MapPinIcon className="h-4 w-4 shrink-0 text-slate-400" />
            {location}
          </p>
        ) : null}

        <p className="mt-3 text-xs text-slate-400">
          Datos actualizados el{" "}
          {new Date(center.updatedAt).toLocaleDateString("es-ES", {
            day: "numeric",
            month: "long",
            year: "numeric",
          })}
        </p>

        <div className="mt-5 flex flex-wrap gap-3">
          {contact.phone ? (
            <a
              href={phoneHref(contact.phone)}
              className="inline-flex items-center gap-2 rounded-full bg-sky-700 px-5 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-sky-800"
            >
              <PhoneIcon className="h-4 w-4" />
              Llamar al centro
            </a>
          ) : null}
          {contact.website ? (
            <a
              href={contact.website}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 rounded-full border border-slate-300 px-5 py-2.5 text-sm font-semibold text-slate-700 transition-colors hover:bg-slate-50"
            >
              <ExternalLinkIcon className="h-4 w-4" />
              Visitar web
            </a>
          ) : null}
          <a
            href="#solicitar-informacion"
            className="inline-flex items-center gap-2 rounded-full border border-sky-700 px-5 py-2.5 text-sm font-semibold text-sky-700 transition-colors hover:bg-sky-50"
          >
            Solicitar información
          </a>
        </div>
      </header>

      {/* Gallery & map placeholders */}
      <div className="grid gap-3 sm:grid-cols-2">
        <div className="flex h-44 flex-col items-center justify-center gap-3 rounded-xl border border-dashed border-slate-300 bg-slate-50 text-slate-400">
          <PhotoIcon className="h-8 w-8 text-slate-300" />
          <span className="text-sm">Galería de fotos próximamente</span>
        </div>
        <div className="flex h-44 flex-col items-center justify-center gap-3 rounded-xl border border-dashed border-slate-300 bg-slate-50 text-slate-400">
          <MapIcon className="h-8 w-8 text-slate-300" />
          <span className="text-sm">Mapa de ubicación próximamente</span>
        </div>
      </div>

      {/* Contact & schedule */}
      <section className="grid gap-6 rounded-xl border border-slate-200 bg-white p-6 shadow-sm sm:grid-cols-2">
        <div>
          <h2 className="mb-4 text-base font-semibold text-slate-900">Datos de contacto</h2>
          <dl className="flex flex-col gap-3">
            <div className="flex items-start gap-3">
              <MapPinIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
              <div className="text-sm text-slate-600">
                <dt className="sr-only">Dirección</dt>
                <dd>
                  {address.street}, {address.postalCode} {address.cityName}
                </dd>
              </div>
            </div>
            {contact.phone ? (
              <div className="flex items-start gap-3">
                <PhoneIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
                <div className="text-sm">
                  <dt className="sr-only">Teléfono</dt>
                  <dd>
                    <a href={phoneHref(contact.phone)} className="text-sky-700 hover:underline">
                      {contact.phone}
                    </a>
                  </dd>
                </div>
              </div>
            ) : null}
            {contact.email ? (
              <div className="flex items-start gap-3">
                <EnvelopeIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
                <div className="text-sm">
                  <dt className="sr-only">Email</dt>
                  <dd>
                    <a href={emailHref(contact.email)} className="text-sky-700 hover:underline">
                      {contact.email}
                    </a>
                  </dd>
                </div>
              </div>
            ) : null}
            {contact.website ? (
              <div className="flex items-start gap-3">
                <GlobeAltIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
                <div className="text-sm">
                  <dt className="sr-only">Web</dt>
                  <dd>
                    <a
                      href={contact.website}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="break-all text-sky-700 hover:underline"
                    >
                      {contact.website}
                    </a>
                  </dd>
                </div>
              </div>
            ) : null}
          </dl>
        </div>

        <div>
          <h2 className="mb-4 text-base font-semibold text-slate-900">Horario y edades</h2>
          <dl className="flex flex-col gap-3">
            <div className="flex items-start gap-3">
              <ClockIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
              <div className="text-sm text-slate-600">
                <dt className="font-medium text-slate-700">Horario</dt>
                <dd className="mt-0.5">{center.schedule ?? "Consultar con el centro"}</dd>
              </div>
            </div>
            <div className="flex items-start gap-3">
              <HeartIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
              <div className="text-sm text-slate-600">
                <dt className="font-medium text-slate-700">Edad admitida</dt>
                <dd className="mt-0.5">{formatAgeRange(center.ageRange)}</dd>
              </div>
            </div>
          </dl>
        </div>
      </section>

      {/* Services */}
      {center.services.length > 0 ? (
        <section>
          <h2 className="text-lg font-semibold text-slate-900">Servicios</h2>
          <div className="mt-3 flex flex-wrap gap-2">
            {center.services.map((service) => (
              <span
                key={service}
                className="flex items-center gap-1.5 rounded-full bg-sky-50 px-3.5 py-1.5 text-sm font-medium text-sky-700"
              >
                {SERVICE_ICONS[service]}
                {formatService(service)}
              </span>
            ))}
          </div>
        </section>
      ) : null}

      {/* Description */}
      {center.shortDescription || center.longDescription ? (
        <section>
          <h2 className="text-lg font-semibold text-slate-900">Sobre este centro</h2>
          {center.shortDescription ? (
            <p className="mt-3 text-base leading-relaxed text-slate-700">{center.shortDescription}</p>
          ) : null}
          {center.longDescription ? (
            <p className="mt-3 text-sm leading-relaxed text-slate-600">{center.longDescription}</p>
          ) : null}
        </section>
      ) : null}

      {/* Transparency notice */}
      <section className="flex gap-4 rounded-xl border border-slate-200 bg-slate-50 p-5">
        <InformationCircleIcon className="mt-0.5 h-5 w-5 shrink-0 text-slate-400" />
        <p className="text-sm text-slate-600">
          Parte de la información mostrada puede proceder de fuentes públicas o de datos facilitados por el propio
          centro. Si formas parte del equipo del centro, puedes{" "}
          <Link href="/reclamar-ficha" className="font-medium text-sky-700 hover:underline">
            reclamar esta ficha
          </Link>{" "}
          y solicitar una actualización.
        </p>
      </section>
    </div>
  );
}
