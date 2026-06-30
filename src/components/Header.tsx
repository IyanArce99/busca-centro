"use client";

import Link from "next/link";
import { useState } from "react";

const NAV_LINKS = [
  { href: "/guarderias", label: "Guarderías" },
  { href: "/escuelas-infantiles", label: "Escuelas infantiles" },
  { href: "/ciudades", label: "Ciudades" },
  { href: "/para-centros", label: "Para centros" },
  { href: "/blog", label: "Blog" },
];

export default function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header className="sticky top-0 z-40 border-b border-slate-200 bg-white/95 backdrop-blur">
      <div className="mx-auto flex max-w-6xl items-center justify-between gap-4 px-4 py-3 sm:px-6">
        <Link href="/" className="text-lg font-bold tracking-tight text-sky-900">
          BuscaCentro
        </Link>

        <nav className="hidden items-center gap-6 text-sm font-medium text-slate-700 lg:flex">
          {NAV_LINKS.map((link) => (
            <Link key={link.href} href={link.href} className="transition-colors hover:text-sky-700">
              {link.label}
            </Link>
          ))}
        </nav>

        <div className="hidden items-center gap-3 lg:flex">
          <Link href="/reclamar-ficha" className="text-sm font-medium text-slate-600 hover:text-sky-700">
            Reclamar ficha
          </Link>
          <Link
            href="/anadir-centro"
            className="rounded-full bg-sky-700 px-4 py-2 text-sm font-semibold text-white transition-colors hover:bg-sky-800"
          >
            Añadir centro
          </Link>
        </div>

        <button
          type="button"
          onClick={() => setIsMenuOpen((open) => !open)}
          className="inline-flex items-center justify-center rounded-md border border-slate-300 p-2 text-slate-700 lg:hidden"
          aria-expanded={isMenuOpen}
          aria-label={isMenuOpen ? "Cerrar menú de navegación" : "Abrir menú de navegación"}
        >
          <span className="flex h-4 w-5 flex-col justify-between" aria-hidden="true">
            <span
              className={`block h-0.5 w-full bg-current transition-transform ${isMenuOpen ? "translate-y-[7px] rotate-45" : ""}`}
            />
            <span className={`block h-0.5 w-full bg-current transition-opacity ${isMenuOpen ? "opacity-0" : ""}`} />
            <span
              className={`block h-0.5 w-full bg-current transition-transform ${isMenuOpen ? "-translate-y-[7px] -rotate-45" : ""}`}
            />
          </span>
        </button>
      </div>

      {isMenuOpen ? (
        <nav className="border-t border-slate-200 bg-white px-4 py-4 lg:hidden">
          <ul className="flex flex-col gap-3 text-sm font-medium text-slate-700">
            {NAV_LINKS.map((link) => (
              <li key={link.href}>
                <Link href={link.href} onClick={() => setIsMenuOpen(false)}>
                  {link.label}
                </Link>
              </li>
            ))}
            <li>
              <Link href="/reclamar-ficha" onClick={() => setIsMenuOpen(false)}>
                Reclamar ficha
              </Link>
            </li>
            <li>
              <Link
                href="/anadir-centro"
                onClick={() => setIsMenuOpen(false)}
                className="inline-block rounded-full bg-sky-700 px-4 py-2 text-white"
              >
                Añadir centro
              </Link>
            </li>
          </ul>
        </nav>
      ) : null}
    </header>
  );
}
