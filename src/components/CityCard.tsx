import Link from "next/link";
import type { City } from "@/types/city";
import { MapPinIcon, BuildingOfficeIcon } from "@/components/Icons";

interface CityCardProps {
  city: City;
  centerCount: number;
  /** Defaults to the guarderías landing for this city. */
  href?: string;
}

export default function CityCard({ city, centerCount, href }: CityCardProps) {
  return (
    <Link
      href={href ?? `/guarderias-en-${city.slug}`}
      className="group flex items-center gap-4 rounded-xl border border-slate-200 bg-white p-5 shadow-sm transition-all hover:-translate-y-0.5 hover:border-sky-200 hover:shadow-md"
    >
      <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-sky-50 text-sky-600 transition-colors group-hover:bg-sky-100">
        <MapPinIcon className="h-5 w-5" />
      </div>
      <div className="min-w-0 flex-1">
        <p className="truncate font-semibold text-slate-900 group-hover:text-sky-700">{city.name}</p>
        <p className="text-sm text-slate-500">{city.region}</p>
      </div>
      <div className="shrink-0 text-right">
        {centerCount > 0 ? (
          <span className="inline-flex items-center gap-1 rounded-full bg-slate-100 px-2.5 py-1 text-xs font-medium text-slate-600">
            <BuildingOfficeIcon className="h-3.5 w-3.5" />
            {centerCount}
          </span>
        ) : (
          <span className="text-xs text-slate-400">Próximamente</span>
        )}
      </div>
    </Link>
  );
}
