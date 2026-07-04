"use client";

import { useRouter, usePathname, useSearchParams } from "next/navigation";
import FilterSelect from "./FilterSelect";

export default function Pagination({ page, totalPages, perPage, total }: { page: number; totalPages: number; perPage: number; total: number }) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();

  const goTo = (p: number) => {
    const params = new URLSearchParams(searchParams.toString());
    params.set("page", String(p));
    router.push(`${pathname}?${params.toString()}`);
  };

  const setPerPage = (n: string) => {
    const params = new URLSearchParams(searchParams.toString());
    params.set("perPage", n);
    params.set("page", "1");
    router.push(`${pathname}?${params.toString()}`);
  };

  return (
    <div className="flex flex-wrap items-center justify-between gap-3 px-1 text-sm text-slate-500">
      <span>
        {total} centros · página {page} de {totalPages}
      </span>
      <div className="flex items-center gap-2">
        <FilterSelect value={String(perPage)} onChange={setPerPage} className="py-1 text-xs">
          <option value="25">25 / página</option>
          <option value="50">50 / página</option>
          <option value="100">100 / página</option>
        </FilterSelect>
        <button
          type="button"
          disabled={page <= 1}
          onClick={() => goTo(page - 1)}
          className="rounded-lg border border-white/10 bg-white/[0.04] px-2.5 py-1 text-xs font-medium text-slate-300 transition hover:bg-white/[0.08] disabled:cursor-not-allowed disabled:opacity-40"
        >
          Anterior
        </button>
        <button
          type="button"
          disabled={page >= totalPages}
          onClick={() => goTo(page + 1)}
          className="rounded-lg border border-white/10 bg-white/[0.04] px-2.5 py-1 text-xs font-medium text-slate-300 transition hover:bg-white/[0.08] disabled:cursor-not-allowed disabled:opacity-40"
        >
          Siguiente
        </button>
      </div>
    </div>
  );
}
