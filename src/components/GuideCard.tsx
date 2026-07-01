import Link from "next/link";
import type { Guide } from "@/types/guide";
import { ClockIcon, BookOpenIcon } from "@/components/Icons";

interface GuideCardProps {
  guide: Guide;
}

export default function GuideCard({ guide }: Readonly<GuideCardProps>) {
  return (
    <Link
      href={`/blog/${guide.slug}`}
      className="group flex flex-col gap-3 rounded-xl border border-slate-200 bg-white p-5 shadow-sm transition-all hover:-translate-y-0.5 hover:border-violet-200 hover:shadow-md"
    >
      <div className="flex items-center gap-2">
        <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-violet-50 text-violet-600">
          <BookOpenIcon className="h-4 w-4" />
        </div>
        <span className="text-xs font-semibold uppercase tracking-wide text-violet-700">{guide.category}</span>
      </div>
      <h3 className="text-base font-semibold leading-snug text-slate-900 group-hover:text-violet-700">
        {guide.title}
      </h3>
      <p className="line-clamp-2 text-sm leading-relaxed text-slate-600">{guide.excerpt}</p>
      <div className="mt-auto flex items-center justify-between">
        <span className="flex items-center gap-1.5 text-xs text-slate-500">
          <ClockIcon className="h-3.5 w-3.5" />
          {guide.readingTimeMinutes} min de lectura
        </span>
        <span className="flex items-center gap-1 text-sm font-medium text-violet-700">
          Leer
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
        </span>
      </div>
    </Link>
  );
}
