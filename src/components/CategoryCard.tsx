import Link from "next/link";
import type { ReactNode } from "react";

interface CategoryCardProps {
  title: string;
  description: string;
  href: string;
  icon?: ReactNode;
  accent?: "sky" | "emerald" | "violet" | "amber";
}

const ACCENT: Record<NonNullable<CategoryCardProps["accent"]>, { icon: string; hover: string }> = {
  sky: { icon: "bg-sky-50 text-sky-600", hover: "hover:border-sky-200" },
  emerald: { icon: "bg-emerald-50 text-emerald-600", hover: "hover:border-emerald-200" },
  violet: { icon: "bg-violet-50 text-violet-600", hover: "hover:border-violet-200" },
  amber: { icon: "bg-amber-50 text-amber-600", hover: "hover:border-amber-200" },
};

export default function CategoryCard({ title, description, href, icon, accent = "sky" }: Readonly<CategoryCardProps>) {
  const colors = ACCENT[accent];

  return (
    <Link
      href={href}
      className={`group flex flex-col gap-3 rounded-xl border border-slate-200 bg-white p-5 shadow-sm transition-all hover:-translate-y-0.5 hover:shadow-md ${colors.hover}`}
    >
      {icon ? (
        <div className={`flex h-10 w-10 items-center justify-center rounded-xl ${colors.icon}`}>{icon}</div>
      ) : null}
      <div>
        <span className="text-base font-semibold text-slate-900 group-hover:text-sky-700">{title}</span>
        <p className="mt-1 text-sm text-slate-600">{description}</p>
      </div>
      <span className="mt-auto flex items-center gap-1 text-sm font-medium text-sky-700">
        Ver centros
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
    </Link>
  );
}
