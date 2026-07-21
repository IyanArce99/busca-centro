import Link from "next/link";
import type { City } from "@/types/city";
import { MapPinIcon, BuildingOfficeIcon } from "@/components/Icons";

interface CityCardProps {
  city: City;
  centerCount: number;
  /**
   * Destination landing. Pass `null` when the city has no indexable landing to
   * point at — the card then renders unlinked instead of emitting a 404.
   * Resolve it with `resolveCityLandingHref` rather than building it by
   * template.
   */
  href: string | null;
}

function CityCardBody({ city, centerCount }: Omit<CityCardProps, "href">) {
  return (
    <>
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
    </>
  );
}

export default function CityCard({ city, centerCount, href }: CityCardProps) {
  const cardClass = "group flex items-center gap-4 rounded-xl border border-slate-200 bg-white p-5 shadow-sm";

  // Render unlinked when the city has no centers yet (a "Próximamente" card) or
  // when there is no indexable landing to send the user to. Either way we avoid
  // passing internal link equity to a thin, noindex or non-existent page.
  if (centerCount === 0 || !href) {
    return (
      <div className={`${cardClass} ${centerCount === 0 ? "opacity-80" : ""}`}>
        <CityCardBody city={city} centerCount={centerCount} />
      </div>
    );
  }

  return (
    <Link href={href} className={`${cardClass} transition-all hover:-translate-y-0.5 hover:border-sky-200 hover:shadow-md`}>
      <CityCardBody city={city} centerCount={centerCount} />
    </Link>
  );
}
