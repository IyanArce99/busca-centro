import { getClaimsAdmin } from "@/lib/admin/data";
import ClaimsView from "./ClaimsView";

export default async function AdminClaimsPage() {
  const claims = await getClaimsAdmin();

  return (
    <div className="flex flex-col gap-4">
      <p className="text-sm text-slate-500">
        <span className="font-medium text-slate-200">{claims.length}</span> solicitudes recibidas desde /reclamar-ficha
      </p>
      <ClaimsView claims={claims} />
    </div>
  );
}
