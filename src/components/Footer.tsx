import Link from "next/link";
import { SITE_NAME } from "@/lib/constants";

const COLUMNS = [
  {
    title: "Familias",
    links: [
      { href: "/guarderias", label: "Guarderías" },
      { href: "/escuelas-infantiles", label: "Escuelas infantiles" },
      { href: "/ciudades", label: "Centros por ciudad" },
      { href: "/blog", label: "Blog" },
    ],
  },
  {
    title: "Centros",
    links: [
      { href: "/para-centros", label: "Para centros" },
      { href: "/anadir-centro", label: "Añadir centro" },
      { href: "/reclamar-ficha", label: "Reclamar ficha" },
    ],
  },
];

export default function Footer() {
  return (
    <footer className="border-t border-slate-200 bg-slate-50">
      <div className="mx-auto max-w-6xl px-4 py-10 sm:px-6">
        <div className="grid grid-cols-2 gap-8 sm:grid-cols-4">
          <div className="col-span-2">
            <p className="text-lg font-bold text-sky-900">{SITE_NAME}</p>
            <p className="mt-2 max-w-xs text-sm text-slate-600">
              Comparador de guarderías y escuelas infantiles en España. Datos actualizados y fichas que los propios centros pueden reclamar.
            </p>
          </div>
          {COLUMNS.map((column) => (
            <nav key={column.title} aria-label={column.title}>
              <p className="text-sm font-semibold text-slate-900">{column.title}</p>
              <ul className="mt-3 flex flex-col gap-2 text-sm text-slate-600">
                {column.links.map((link) => (
                  <li key={link.href}>
                    <Link href={link.href} className="hover:text-sky-700">
                      {link.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </nav>
          ))}
        </div>
        <div className="mt-10 border-t border-slate-200 pt-6 text-xs text-slate-500">
          <p>
            © {new Date().getFullYear()} {SITE_NAME}. La información de los centros puede proceder de fuentes públicas o de
            datos facilitados por el propio centro.
          </p>
        </div>
      </div>
    </footer>
  );
}
