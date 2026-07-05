"use client";

import Link from "next/link";
import { useState } from "react";

// Nav intentionally omits /blog: the guides are still light and the blog stays
// noindex, so we don't give it a prominent internal link from the main header.
const NAV_LINKS = [
  { href: "/guarderias", label: "Guarderías" },
  { href: "/escuelas-infantiles", label: "Escuelas infantiles" },
  { href: "/ciudades", label: "Ciudades" },
  { href: "/para-centros", label: "Para centros" },
];

export default function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header className="sticky top-0 z-40 border-b border-slate-200 bg-white/95 backdrop-blur-sm">
      <div className="mx-auto flex max-w-6xl items-center justify-between gap-4 px-4 py-3 sm:px-6">
        <Link href="/" className="flex items-center gap-1.5">
          <span className="flex h-7 w-7 items-center justify-center rounded-lg bg-sky-700 text-white">
            <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" strokeWidth={2} stroke="currentColor" aria-hidden="true">
              <path strokeLinecap="round" strokeLinejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
              <path strokeLinecap="round" strokeLinejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
            </svg>
          </span>
          <span className="text-lg font-bold tracking-tight text-slate-900">
            Busca<span className="text-sky-700">Centro</span>
          </span>
        </Link>

        <nav className="hidden items-center gap-6 text-sm font-medium text-slate-600 lg:flex">
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
          className="inline-flex items-center justify-center rounded-lg border border-slate-200 p-2 text-slate-600 transition-colors hover:bg-slate-50 lg:hidden"
          aria-expanded={isMenuOpen}
          aria-label={isMenuOpen ? "Cerrar menú de navegación" : "Abrir menú de navegación"}
        >
          <span className="flex h-4 w-5 flex-col justify-between" aria-hidden="true">
            <span
              className={`block h-0.5 w-full bg-current transition-transform duration-200 ${
                isMenuOpen ? "translate-y-[7px] rotate-45" : ""
              }`}
            />
            <span
              className={`block h-0.5 w-full bg-current transition-opacity duration-200 ${
                isMenuOpen ? "opacity-0" : ""
              }`}
            />
            <span
              className={`block h-0.5 w-full bg-current transition-transform duration-200 ${
                isMenuOpen ? "-translate-y-[7px] -rotate-45" : ""
              }`}
            />
          </span>
        </button>
      </div>

      {isMenuOpen ? (
        <nav className="border-t border-slate-200 bg-white px-4 py-4 lg:hidden">
          <ul className="flex flex-col gap-1 text-sm font-medium text-slate-700">
            {NAV_LINKS.map((link) => (
              <li key={link.href}>
                <Link
                  href={link.href}
                  onClick={() => setIsMenuOpen(false)}
                  className="block rounded-lg px-3 py-2 transition-colors hover:bg-slate-50 hover:text-sky-700"
                >
                  {link.label}
                </Link>
              </li>
            ))}
            <li>
              <Link
                href="/reclamar-ficha"
                onClick={() => setIsMenuOpen(false)}
                className="block rounded-lg px-3 py-2 transition-colors hover:bg-slate-50 hover:text-sky-700"
              >
                Reclamar ficha
              </Link>
            </li>
            <li className="pt-2">
              <Link
                href="/anadir-centro"
                onClick={() => setIsMenuOpen(false)}
                className="block rounded-full bg-sky-700 px-4 py-2 text-center text-white transition-colors hover:bg-sky-800"
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
