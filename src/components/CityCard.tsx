import Link from "next/link";
import type { City } from "@/types/city";

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
      className="group flex flex-col gap-1 rounded-xl border border-slate-200 bg-white p-5 transition-shadow hover:shadow-md"
    >
      <span className="text-base font-semibold text-slate-900 group-hover:text-sky-700">{city.name}</span>
      <span className="text-sm text-slate-500">{city.region}</span>
      <span className="mt-2 text-sm font-medium text-sky-700">
        {centerCount > 0 ? `${centerCount} centros añadidos` : "Próximamente"}
      </span>
    </Link>
  );
}
