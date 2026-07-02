import Link from "next/link";
import type { Center, CenterService } from "@/types/center";
import {
  emailHref,
  formatCenterType,
  formatOwnership,
  formatPedagogicalApproach,
  formatService,
  phoneHref,
} from "@/lib/format";
import {
  buildCenterIntro,
  buildContactText,
  buildEducationStageText,
  buildLocationText,
  buildQuestionsToAsk,
  buildScheduleAndAdmissionsText,
  buildServicesText,
  buildVerificationText,
  getCenterStructuredHighlights,
} from "@/lib/content/center-content";
import {
  AcademicCapIcon,
  BookOpenIcon,
  CheckBadgeIcon,
  ClockIcon,
  EnvelopeIcon,
  ExclamationTriangleIcon,
  ExternalLinkIcon,
  ForkKnifeIcon,
  GlobeAltIcon,
  HeartIcon,
  InformationCircleIcon,
  LeafIcon,
  MapIcon,
  MapPinIcon,
  MusicalNoteIcon,
  PhoneIcon,
  PhotoIcon,
  PuzzlePieceIcon,
  ShirtIcon,
  SparklesIcon,
  SunIcon,
  UsersIcon,
} from "@/components/Icons";
import type { ReactNode } from "react";

const SERVICE_ICONS: Record<CenterService, ReactNode> = {
  // Alimentación
  comedor: <ForkKnifeIcon className="h-4 w-4" />,
  "cocina-propia": <ForkKnifeIcon className="h-4 w-4" />,
  catering: <ForkKnifeIcon className="h-4 w-4" />,
  // Horario
  "horario-ampliado": <ClockIcon className="h-4 w-4" />,
  "servicio-madrugadores": <SunIcon className="h-4 w-4" />,
  // Idiomas
  bilingue: <SparklesIcon className="h-4 w-4" />,
  ingles: <SparklesIcon className="h-4 w-4" />,
  // Aulas por edad
  "aula-0-1-anos": <HeartIcon className="h-4 w-4" />,
  "aula-1-2-anos": <HeartIcon className="h-4 w-4" />,
  "aula-2-3-anos": <HeartIcon className="h-4 w-4" />,
  // Instalaciones
  "patio-exterior": <LeafIcon className="h-4 w-4" />,
  // Actividades
  psicomotricidad: <PuzzlePieceIcon className="h-4 w-4" />,
  musica: <MusicalNoteIcon className="h-4 w-4" />,
  "actividades-extraescolares": <PuzzlePieceIcon className="h-4 w-4" />,
  "verano-campamentos": <SunIcon className="h-4 w-4" />,
  // Pedagogía / familia
  "orientacion-pedagogica": <BookOpenIcon className="h-4 w-4" />,
  "escuela-de-padres": <UsersIcon className="h-4 w-4" />,
  // Otros
  uniformes: <ShirtIcon className="h-4 w-4" />,
};

const CONFIDENCE_LABELS: Record<string, string> = {
  high: "Alta",
  medium: "Media",
  low: "Baja",
  unknown: "Desconocida",
};

const CONFIDENCE_STYLES: Record<string, string> = {
  high: "bg-emerald-100 text-emerald-700",
  medium: "bg-amber-100 text-amber-700",
  low: "bg-red-100 text-red-700",
  unknown: "bg-slate-100 text-slate-600",
};

interface CenterDetailProps {
  center: Center;
}

export default function CenterDetail({ center }: Readonly<CenterDetailProps>) {
  const { address, contact } = center;
  const displayDistrict = address.district ?? address.neighborhood;
  const location = [displayDistrict, address.cityName].filter(Boolean).join(", ");
  const hasContactInfo = !!(contact.phone || contact.email || contact.website);
  const hasSocialLinks = !!(
    center.socialLinks?.instagram ||
    center.socialLinks?.facebook ||
    center.socialLinks?.linkedin
  );
  const hasPedagogicalApproach = !!center.pedagogicalApproach?.length;

  const intro = buildCenterIntro(center);
  const locationText = buildLocationText(center);
  const educationStageText = buildEducationStageText(center);
  const servicesText = buildServicesText(center);
  const scheduleText = buildScheduleAndAdmissionsText(center);
  const contactText = buildContactText(center);
  const verificationText = buildVerificationText(center);
  const questionsToAsk = buildQuestionsToAsk(center);
  const highlights = getCenterStructuredHighlights(center);

  return (
    <div className="flex flex-col gap-6">

      {/* ── 1. Header card ─────────────────────────────────────────────────── */}
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
          {center.confidenceLevel && center.confidenceLevel !== "unknown" ? (
            <span
              className={`rounded-full px-2.5 py-1 ${CONFIDENCE_STYLES[center.confidenceLevel] ?? ""}`}
            >
              Confianza: {CONFIDENCE_LABELS[center.confidenceLevel]}
            </span>
          ) : null}
        </div>

        <h1 className="mt-4 text-3xl font-bold text-slate-900 sm:text-4xl">{center.name}</h1>

        {location ? (
          <p className="mt-2 flex items-center gap-1.5 text-base text-slate-600">
            <MapPinIcon className="h-4 w-4 shrink-0 text-slate-400" />
            {location}
          </p>
        ) : null}

        {hasPedagogicalApproach ? (
          <div className="mt-3 flex flex-wrap gap-1.5">
            {center.pedagogicalApproach!.map((approach) => (
              <span
                key={approach}
                className="rounded-full bg-violet-50 px-2.5 py-1 text-xs font-medium text-violet-700"
              >
                {formatPedagogicalApproach(approach)}
              </span>
            ))}
          </div>
        ) : null}

        <p className="mt-3 text-xs text-slate-400">
          Datos actualizados el{" "}
          {new Date(center.updatedAt).toLocaleDateString("es-ES", {
            day: "numeric",
            month: "long",
            year: "numeric",
          })}
        </p>

        {/* Highlights */}
        {highlights.length > 0 ? (
          <div className="mt-4 flex flex-wrap gap-2">
            {highlights.map((h) => (
              <span
                key={h.label}
                className="rounded-full border border-slate-200 bg-white px-3 py-1 text-xs font-medium text-slate-600 shadow-sm"
              >
                {h.label}
              </span>
            ))}
          </div>
        ) : null}

        {/* CTAs */}
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

      {/* ── 2. Galería y mapa ───────────────────────────────────────────────── */}
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

      {/* ── 3. Resumen del centro ───────────────────────────────────────────── */}
      <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <h2 className="text-base font-semibold text-slate-900">Sobre este centro</h2>
        <div className="mt-3 flex flex-col gap-3">
          {intro.map((paragraph, i) => (
            <p key={i} className="text-sm leading-relaxed text-slate-600">
              {paragraph}
            </p>
          ))}
        </div>
      </section>

      {/* ── 4. Ubicación y Contacto ─────────────────────────────────────────── */}
      <div className="grid gap-6 sm:grid-cols-2">
        {/* Ubicación */}
        <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
          <h2 className="mb-3 flex items-center gap-2 text-base font-semibold text-slate-900">
            <MapPinIcon className="h-4 w-4 text-slate-400" />
            Ubicación y zona
          </h2>
          <dl className="mb-4 flex flex-col gap-2 text-sm text-slate-600">
            {address.street ? (
              <div>
                <dt className="font-medium text-slate-700">Dirección</dt>
                <dd className="mt-0.5">
                  {address.street}
                  {address.postalCode ? `, ${address.postalCode}` : ""} {address.cityName}
                </dd>
              </div>
            ) : null}
            {displayDistrict ? (
              <div>
                <dt className="font-medium text-slate-700">Distrito</dt>
                <dd className="mt-0.5">{displayDistrict}</dd>
              </div>
            ) : null}
            {address.neighborhoodBarrio ? (
              <div>
                <dt className="font-medium text-slate-700">Barrio</dt>
                <dd className="mt-0.5">{address.neighborhoodBarrio}</dd>
              </div>
            ) : null}
          </dl>
          <p className="text-xs leading-relaxed text-slate-500">{locationText}</p>
        </section>

        {/* Contacto */}
        <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
          <h2 className="mb-3 flex items-center gap-2 text-base font-semibold text-slate-900">
            <PhoneIcon className="h-4 w-4 text-slate-400" />
            Datos de contacto
          </h2>
          {hasContactInfo ? (
            <dl className="flex flex-col gap-3">
              {contact.phone ? (
                <div className="flex items-start gap-3">
                  <PhoneIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
                  <div className="text-sm">
                    <dt className="font-medium text-slate-700">Teléfono</dt>
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
                    <dt className="font-medium text-slate-700">Email</dt>
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
                    <dt className="font-medium text-slate-700">Web</dt>
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
              {hasSocialLinks ? (
                <div className="flex items-start gap-3">
                  <ExternalLinkIcon className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
                  <div className="text-sm">
                    <dt className="font-medium text-slate-700">Redes sociales</dt>
                    <dd className="mt-1 flex flex-wrap gap-2">
                      {center.socialLinks?.instagram ? (
                        <a
                          href={center.socialLinks.instagram}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-sky-700 hover:underline"
                        >
                          Instagram
                        </a>
                      ) : null}
                      {center.socialLinks?.facebook ? (
                        <a
                          href={center.socialLinks.facebook}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-sky-700 hover:underline"
                        >
                          Facebook
                        </a>
                      ) : null}
                      {center.socialLinks?.linkedin ? (
                        <a
                          href={center.socialLinks.linkedin}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-sky-700 hover:underline"
                        >
                          LinkedIn
                        </a>
                      ) : null}
                    </dd>
                  </div>
                </div>
              ) : null}
            </dl>
          ) : (
            <p className="text-sm text-slate-500">{contactText.intro}</p>
          )}
          <p className="mt-3 text-xs text-slate-500">
            {hasContactInfo ? contactText.intro : contactText.note}
          </p>
          {hasContactInfo && contactText.note ? (
            <p className="mt-1 text-xs text-slate-500">{contactText.note}</p>
          ) : null}
        </section>
      </div>

      {/* ── 5. Etapa educativa y edades ─────────────────────────────────────── */}
      <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <h2 className="mb-3 flex items-center gap-2 text-base font-semibold text-slate-900">
          <AcademicCapIcon className="h-4 w-4 text-slate-400" />
          Etapa educativa y edades
        </h2>
        <p className="text-sm leading-relaxed text-slate-600">{educationStageText}</p>
      </section>

      {/* ── 6. Servicios disponibles ─────────────────────────────────────────── */}
      <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <h2 className="mb-3 text-base font-semibold text-slate-900">Servicios disponibles</h2>
        {center.services.length > 0 ? (
          <>
            <div className="mb-4 flex flex-wrap gap-2">
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
            <p className="text-sm leading-relaxed text-slate-600">{servicesText}</p>
          </>
        ) : (
          <div className="rounded-lg border border-slate-100 bg-slate-50 p-4">
            <p className="text-sm leading-relaxed text-slate-600">{servicesText}</p>
            <Link
              href="/reclamar-ficha"
              className="mt-3 inline-block text-sm font-medium text-sky-700 underline underline-offset-2 hover:text-sky-800"
            >
              Reclamar ficha para completar esta información →
            </Link>
          </div>
        )}
      </section>

      {/* ── 7. Horario, plazas y admisión ────────────────────────────────────── */}
      <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <h2 className="mb-3 flex items-center gap-2 text-base font-semibold text-slate-900">
          <ClockIcon className="h-4 w-4 text-slate-400" />
          Horario, plazas y admisión
        </h2>
        <p className="text-sm leading-relaxed text-slate-600">{scheduleText}</p>
      </section>

      {/* ── 8. Qué preguntar antes de elegir ─────────────────────────────────── */}
      <section className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <h2 className="mb-3 flex items-center gap-2 text-base font-semibold text-slate-900">
          <InformationCircleIcon className="h-4 w-4 text-slate-400" />
          Qué preguntar antes de elegir este centro
        </h2>
        <ul className="mt-2 flex flex-col gap-2">
          {questionsToAsk.map((question) => (
            <li key={question} className="flex items-start gap-2.5 text-sm text-slate-600">
              <span className="mt-2 h-1.5 w-1.5 shrink-0 rounded-full bg-sky-400" aria-hidden="true" />
              {question}
            </li>
          ))}
        </ul>
      </section>

      {/* ── 9. Verificación ──────────────────────────────────────────────────── */}
      <section
        className={`flex gap-4 rounded-xl border p-5 ${
          center.isVerified
            ? "border-emerald-200 bg-emerald-50"
            : "border-amber-200 bg-amber-50"
        }`}
      >
        {center.isVerified ? (
          <CheckBadgeIcon className="mt-0.5 h-5 w-5 shrink-0 text-emerald-500" />
        ) : (
          <ExclamationTriangleIcon className="mt-0.5 h-5 w-5 shrink-0 text-amber-500" />
        )}
        <div className="flex-1">
          <h2
            className={`text-sm font-semibold ${
              center.isVerified ? "text-emerald-800" : "text-amber-800"
            }`}
          >
            {verificationText.heading}
          </h2>
          <p
            className={`mt-1 text-sm leading-relaxed ${
              center.isVerified ? "text-emerald-700" : "text-amber-700"
            }`}
          >
            {verificationText.body}
          </p>
          {center.verifiedAt ? (
            <p className={`mt-1 text-xs ${center.isVerified ? "text-emerald-600" : "text-amber-600"}`}>
              Última revisión:{" "}
              {new Date(center.verifiedAt).toLocaleDateString("es-ES", {
                day: "numeric",
                month: "long",
                year: "numeric",
              })}
            </p>
          ) : null}
          {!center.isVerified ? (
            <Link
              href="/reclamar-ficha"
              className="mt-2 inline-block text-sm font-medium text-amber-800 underline underline-offset-2 hover:text-amber-900"
            >
              Reclamar esta ficha →
            </Link>
          ) : null}
        </div>
      </section>
    </div>
  );
}
