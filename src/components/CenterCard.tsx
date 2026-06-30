import Link from "next/link";
import type { Center } from "@/types/center";
import { formatCenterType, formatOwnership, formatService } from "@/lib/format";

interface CenterCardProps {
  center: Center;
}

export default function CenterCard({ center }: CenterCardProps) {
  const location = [center.address.neighborhood, center.address.cityName].filter(Boolean).join(", ");

  return (
    <Link
      href={`/centro/${center.slug}`}
      className="flex flex-col gap-3 rounded-xl border border-slate-200 bg-white p-5 transition-shadow hover:shadow-md"
    >
      <div className="flex items-start justify-between gap-3">
        <div>
          <h3 className="text-base font-semibold text-slate-900">{center.name}</h3>
          <p className="text-sm text-slate-500">{location}</p>
        </div>
        {center.isVerified ? (
          <span className="shrink-0 rounded-full bg-emerald-50 px-2.5 py-1 text-xs font-medium text-emerald-700">
            Ficha verificada
          </span>
        ) : null}
      </div>

      <div className="flex flex-wrap gap-2 text-xs font-medium text-slate-600">
        <span className="rounded-full bg-slate-100 px-2.5 py-1">{formatCenterType(center.type)}</span>
        <span className="rounded-full bg-slate-100 px-2.5 py-1">{formatOwnership(center.ownership)}</span>
        {center.services.slice(0, 2).map((service) => (
          <span key={service} className="rounded-full bg-sky-50 px-2.5 py-1 text-sky-700">
            {formatService(service)}
          </span>
        ))}
      </div>

      {center.shortDescription ? <p className="text-sm text-slate-600">{center.shortDescription}</p> : null}

      <span className="mt-1 text-sm font-medium text-sky-700">Ver ficha →</span>
    </Link>
  );
}
