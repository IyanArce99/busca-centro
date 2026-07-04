import { getAllCentersAdmin } from "@/lib/admin/data";
import ConflictsView, { type ConflictRow } from "./ConflictsView";
import type { DataConflict } from "@/types/center";

export default async function AdminConflictsPage() {
  const centers = await getAllCentersAdmin();

  const rows: ConflictRow[] = [];
  for (const center of centers) {
    const conflicts = (center.data_conflicts as unknown as Record<string, DataConflict>) ?? {};
    for (const [field, conflict] of Object.entries(conflicts)) {
      rows.push({
        centerId: center.id,
        centerName: center.name,
        slug: center.slug,
        district: center.district,
        type: center.type,
        field,
        conflict,
        updatedAt: center.updated_at,
      });
    }
  }
  rows.sort((a, b) => new Date(b.updatedAt).getTime() - new Date(a.updatedAt).getTime());

  return (
    <div className="flex flex-col gap-4">
      <p className="text-sm text-slate-500">
        <span className="font-medium text-slate-200">{rows.length}</span> conflictos registrados en total
      </p>
      <ConflictsView rows={rows} />
    </div>
  );
}
