import { getLeadsAdmin } from "@/lib/admin/data";
import AdminSectionCard from "@/components/admin/AdminSectionCard";
import EmptyState from "@/components/admin/EmptyState";
import CopyButton from "@/components/admin/CopyButton";
import { ChatBubbleIcon, InformationCircleIcon } from "@/components/Icons";

export default async function AdminLeadsPage() {
  const leads = await getLeadsAdmin();

  return (
    <div className="flex flex-col gap-4">
      <p className="text-sm text-slate-500">
        <span className="font-medium text-slate-200">{leads.length}</span> leads recibidos desde las fichas de centro
      </p>

      <div className="flex items-start gap-2.5 rounded-xl border border-cyan-400/20 bg-cyan-500/[0.07] px-4 py-3 text-sm text-cyan-200">
        <InformationCircleIcon className="mt-0.5 h-4 w-4 shrink-0 text-cyan-400" />
        <span>
          La tabla <code className="rounded bg-black/20 px-1 font-mono text-xs">leads</code> todavía no tiene columnas de estado, tipo, origen ni UTM. Aplica{" "}
          <code className="rounded bg-black/20 px-1 font-mono text-xs">011_admin_schema.sql</code> (generada, no ejecutada) para poder gestionar estado, notas y seguimiento de cada lead.
        </span>
      </div>

      <AdminSectionCard>
        {leads.length === 0 ? (
          <EmptyState title="Sin leads" description="Todavía no se ha recibido ningún lead." icon={<ChatBubbleIcon className="h-5 w-5" />} />
        ) : (
          <div className="-m-5 overflow-x-auto">
            <table className="w-full min-w-[800px] text-left text-sm">
              <thead>
                <tr className="border-b border-white/[0.06]">
                  <th className="px-5 py-3 text-xs font-medium text-slate-500">Fecha</th>
                  <th className="px-5 py-3 text-xs font-medium text-slate-500">Nombre</th>
                  <th className="px-5 py-3 text-xs font-medium text-slate-500">Email</th>
                  <th className="px-5 py-3 text-xs font-medium text-slate-500">Teléfono</th>
                  <th className="px-5 py-3 text-xs font-medium text-slate-500">Centro</th>
                  <th className="px-5 py-3 text-xs font-medium text-slate-500">Mensaje</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-white/[0.05]">
                {leads.map((lead) => (
                  <tr key={lead.id} className="transition hover:bg-white/[0.03]">
                    <td className="px-5 py-3 whitespace-nowrap text-slate-500">{new Date(lead.created_at).toLocaleString("es-ES")}</td>
                    <td className="px-5 py-3 font-medium text-slate-100">{lead.name}</td>
                    <td className="px-5 py-3">
                      <CopyButton value={lead.email} label={lead.email} />
                    </td>
                    <td className="px-5 py-3 text-slate-400">{lead.phone ? <CopyButton value={lead.phone} label={lead.phone} /> : "—"}</td>
                    <td className="px-5 py-3">
                      <a href={`/centro/${lead.center_slug}`} target="_blank" rel="noreferrer" className="text-slate-300 transition hover:text-slate-100 hover:underline">
                        {lead.center_slug}
                      </a>
                    </td>
                    <td className="max-w-xs truncate px-5 py-3 text-slate-400" title={lead.message ?? ""}>
                      {lead.message ?? "—"}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </AdminSectionCard>

      <p className="text-xs text-slate-500">
        Estado (nuevo/contactado/en proceso/cerrado/spam/descartado), filtros por fecha/origen y notas llegan en la Fase 2, una vez aplicada la migración 011_admin_schema.sql.
      </p>
    </div>
  );
}
