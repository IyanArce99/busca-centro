import Link from "next/link";

interface CategoryCardProps {
  title: string;
  description: string;
  href: string;
}

export default function CategoryCard({ title, description, href }: CategoryCardProps) {
  return (
    <Link
      href={href}
      className="group flex flex-col gap-2 rounded-xl border border-slate-200 bg-white p-5 transition-shadow hover:shadow-md"
    >
      <span className="text-base font-semibold text-slate-900 group-hover:text-sky-700">{title}</span>
      <span className="text-sm text-slate-600">{description}</span>
      <span className="mt-1 text-sm font-medium text-sky-700">Ver centros →</span>
    </Link>
  );
}
