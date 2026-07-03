import Link from "next/link";
import { SITE_NAME } from "@/lib/constants";

const COLUMNS = [
  {
    title: "Familias",
    links: [
      { href: "/guarderias", label: "Guarderías" },
      { href: "/escuelas-infantiles", label: "Escuelas infantiles" },
      { href: "/ciudades", label: "Centros por ciudad" },
      { href: "/blog", label: "Guías" },
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
  {
    title: "Legal",
    links: [
      { href: "/contacto", label: "Contacto" },
      { href: "/aviso-legal", label: "Aviso legal" },
      { href: "/privacidad", label: "Privacidad" },
      { href: "/cookies", label: "Cookies" },
    ],
  },
];

export default function Footer() {
  return (
    <footer className="border-t border-slate-200 bg-slate-50">
      <div className="mx-auto max-w-6xl px-4 py-12 sm:px-6">
        <div className="flex items-center gap-1.5">
            <span className="flex h-7 w-7 items-center justify-center rounded-lg bg-sky-700 text-white">
              <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" strokeWidth={2} stroke="currentColor" aria-hidden="true">
                <path strokeLinecap="round" strokeLinejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                <path strokeLinecap="round" strokeLinejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
              </svg>
            </span>
            <p className="text-lg font-bold text-slate-900">
              Busca<span className="text-sky-700">Centro</span>
            </p>
          </div>
          <p className="mt-3 max-w-xs text-sm leading-relaxed text-slate-600">
            Comparador independiente de guarderías y escuelas infantiles en España. Datos actualizados y fichas que los
            propios centros pueden reclamar.
          </p>
          <div className="mt-8 flex gap-8">
            {COLUMNS.map((column) => (
              <nav key={column.title} className="flex-1" aria-label={column.title}>
                <p className="text-sm font-semibold text-slate-900">{column.title}</p>
                <ul className="mt-3 flex flex-col gap-2.5 text-sm text-slate-500">
                  {column.links.map((link) => (
                    <li key={link.href}>
                      <Link href={link.href} className="transition-colors hover:text-sky-700">
                        {link.label}
                      </Link>
                    </li>
                  ))}
                </ul>
              </nav>
            ))}
          </div>
        <div className="mt-10 border-t border-slate-200 pt-6 text-xs text-slate-400">
          <p>© {SITE_NAME}. Titular: Iyan Arcega SL.</p>
          <p className="mt-1">
            La información de los centros puede proceder de fuentes públicas o de datos facilitados por el propio centro.
          </p>
        </div>
      </div>
    </footer>
  );
}
