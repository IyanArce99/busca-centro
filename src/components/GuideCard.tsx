import Link from "next/link";
import type { Guide } from "@/types/guide";

interface GuideCardProps {
  guide: Guide;
}

export default function GuideCard({ guide }: GuideCardProps) {
  return (
    <Link
      href={`/blog/${guide.slug}`}
      className="flex flex-col gap-2 rounded-xl border border-slate-200 bg-white p-5 transition-shadow hover:shadow-md"
    >
      <span className="text-xs font-semibold uppercase tracking-wide text-sky-700">{guide.category}</span>
      <span className="text-lg font-semibold text-slate-900">{guide.title}</span>
      <p className="text-sm text-slate-600">{guide.excerpt}</p>
      <span className="mt-2 text-xs text-slate-500">{guide.readingTimeMinutes} min de lectura</span>
    </Link>
  );
}
