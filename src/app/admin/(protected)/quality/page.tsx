import { getAllCentersAdmin } from "@/lib/admin/data";
import { findSeoProblems, readyReasons, thinReasons } from "@/lib/admin/quality";
import QualityView from "./QualityView";
import MetricCard from "@/components/admin/MetricCard";
import ProgressStat from "@/components/admin/ProgressStat";
import AdminSectionCard from "@/components/admin/AdminSectionCard";
import { ShieldCheckIcon, ExclamationTriangleIcon, SparklesIcon } from "@/components/Icons";

export default async function AdminQualityPage() {
  const centers = await getAllCentersAdmin();
  const published = centers.filter((c) => c.status === "published");

  const thin = published.filter((c) => c.isThin).map((center) => ({ center, reasons: thinReasons(center).map((r) => r.label) }));
  const ready = published.filter((c) => c.isIndexable).map((center) => ({ center, reasons: readyReasons(center).map((r) => r.label) }));
  const problems = findSeoProblems(centers);
  const withoutServices = published.filter((c) => c.realServices.length === 0).map((center) => ({ center, reasons: ["Sin servicios confirmados"] }));
  const withoutLongDescription = published.filter((c) => !c.long_description?.trim()).map((center) => ({ center, reasons: ["Sin long_description"] }));
  const withConflicts = published.filter((c) => c.conflictCount > 0).map((center) => ({ center, reasons: [`${center.conflictCount} conflicto(s) pendiente(s)`] }));

  return (
    <div className="flex flex-col gap-6">
      <AdminSectionCard title="Resumen de auditoría">
        <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
          <ProgressStat label="Listos para indexar" value={ready.length} total={published.length} tone="emerald" />
          <ProgressStat label="Centros finos" value={thin.length} total={published.length} tone="amber" />
          <ProgressStat label="Con conflictos" value={withConflicts.length} total={published.length} tone="amber" />
        </div>
      </AdminSectionCard>

      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
        <MetricCard label="Listos para indexar" value={ready.length} icon={<SparklesIcon className="h-4 w-4" />} tone="green" />
        <MetricCard label="Centros finos" value={thin.length} icon={<ExclamationTriangleIcon className="h-4 w-4" />} tone="amber" />
        <MetricCard label="Problemas SEO" value={problems.length} icon={<ShieldCheckIcon className="h-4 w-4" />} tone={problems.length > 0 ? "red" : "neutral"} />
        <MetricCard label="Con conflictos" value={withConflicts.length} tone={withConflicts.length > 0 ? "red" : "neutral"} />
      </div>

      <QualityView
        thin={thin}
        ready={ready}
        problems={problems}
        withoutServices={withoutServices}
        withoutLongDescription={withoutLongDescription}
        withConflicts={withConflicts}
      />
    </div>
  );
}
