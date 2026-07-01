import Link from "next/link";
import type { Center } from "@/types/center";
import { formatCenterType, formatOwnership, formatService } from "@/lib/format";
import { MapPinIcon, CheckBadgeIcon } from "@/components/Icons";

interface CenterCardProps {
  center: Center;
}

export default function CenterCard({ center }: CenterCardProps) {
  const location = [center.address.neighborhood, center.address.cityName].filter(Boolean).join(", ");

  return (
    <Link
      href={`/centro/${center.slug}`}
      className="group flex flex-col gap-4 rounded-xl border border-slate-200 bg-white p-5 shadow-sm transition-all hover:-translate-y-0.5 hover:border-sky-200 hover:shadow-md"
    >
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0 flex-1">
          <h3 className="truncate text-base font-semibold text-slate-900 group-hover:text-sky-700">
            {center.name}
          </h3>
          {location ? (
            <p className="mt-0.5 flex items-center gap-1 text-sm text-slate-500">
              <MapPinIcon className="h-3.5 w-3.5 shrink-0 text-slate-400" />
              {location}
            </p>
          ) : null}
        </div>
        {center.isVerified ? (
          <span className="flex shrink-0 items-center gap-1 rounded-full bg-emerald-50 px-2.5 py-1 text-xs font-medium text-emerald-700">
            <CheckBadgeIcon className="h-3.5 w-3.5" />
            Verificado
          </span>
        ) : null}
      </div>

      <div className="flex flex-wrap gap-1.5 text-xs font-medium">
        <span
          className={`rounded-full px-2.5 py-1 ${
            center.type === "guarderia" ? "bg-sky-50 text-sky-700" : "bg-violet-50 text-violet-700"
          }`}
        >
          {formatCenterType(center.type)}
        </span>
        <span className="rounded-full bg-slate-100 px-2.5 py-1 text-slate-600">
          {formatOwnership(center.ownership)}
        </span>
        {center.services.slice(0, 2).map((service) => (
          <span key={service} className="rounded-full bg-amber-50 px-2.5 py-1 text-amber-700">
            {formatService(service)}
          </span>
        ))}
      </div>

      {center.shortDescription ? (
        <p className="line-clamp-2 text-sm leading-relaxed text-slate-600">{center.shortDescription}</p>
      ) : null}

      <div className="mt-auto flex items-center gap-1 text-sm font-medium text-sky-700">
        Ver ficha
        <svg
          className="h-4 w-4 transition-transform group-hover:translate-x-0.5"
          fill="none"
          viewBox="0 0 24 24"
          strokeWidth={2}
          stroke="currentColor"
          aria-hidden="true"
        >
          <path strokeLinecap="round" strokeLinejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
        </svg>
      </div>
    </Link>
  );
}
