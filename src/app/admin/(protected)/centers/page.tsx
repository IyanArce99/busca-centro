import { getAllCentersAdmin } from "@/lib/admin/data";
import { parseFilters, applyCenterFilters, paginate } from "@/lib/admin/filters";
import CentersFilterBar from "@/components/admin/CentersFilterBar";
import CentersTable from "@/components/admin/CentersTable";
import Pagination from "@/components/admin/Pagination";
import ExportButtons from "@/components/admin/ExportButtons";

interface PageProps {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
}

export default async function AdminCentersPage({ searchParams }: PageProps) {
  const sp = await searchParams;
  const filters = parseFilters(sp);

  const allCenters = await getAllCentersAdmin();
  const filtered = applyCenterFilters(allCenters, filters);
  const { pageItems, page, perPage, totalPages } = paginate(filtered, filters);

  return (
    <div className="flex flex-col gap-4">
      <div className="flex items-center justify-between">
        <p className="text-sm text-slate-500">
          <span className="font-medium text-slate-200">{filtered.length}</span> de {allCenters.length} centros
        </p>
        <ExportButtons centers={filtered} />
      </div>

      <CentersFilterBar />

      <CentersTable centers={pageItems} />

      <Pagination page={page} totalPages={totalPages} perPage={perPage} total={filtered.length} />
    </div>
  );
}
