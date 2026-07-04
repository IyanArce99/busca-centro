import { getAllCentersAdmin } from "@/lib/admin/data";
import { IS_INDEXABLE, SITE_URL } from "@/lib/constants";
import { isSupabaseConfigured } from "@/lib/supabase/client";
import Badge from "@/components/admin/Badge";
import AdminSectionCard from "@/components/admin/AdminSectionCard";
import { CheckCircleIcon } from "@/components/Icons";

function resolveEnv(): string {
  if (process.env.VERCEL_ENV === "production") return "production";
  if (process.env.VERCEL_ENV === "preview") return "preview";
  return "local";
}

function Check({ ok, label }: { ok: boolean; label: string }) {
  return (
    <li className="flex items-center gap-2.5 text-sm">
      {ok ? <CheckCircleIcon className="h-4 w-4 shrink-0 text-emerald-400" /> : <span className="h-4 w-4 shrink-0 rounded-full border-2 border-white/10" />}
      <span className={ok ? "text-slate-200" : "text-slate-500"}>{label}</span>
    </li>
  );
}

function Field({ label, value }: { label: string; value: React.ReactNode }) {
  return (
    <div>
      <dt className="text-xs text-slate-500">{label}</dt>
      <dd className="mt-0.5 text-sm text-slate-100">{value}</dd>
    </div>
  );
}

export default async function AdminSettingsPage() {
  const centers = await getAllCentersAdmin();
  const published = centers.filter((c) => c.status === "published");
  const indexableCount = published.filter((c) => c.isIndexable).length;
  const hasAdminEmails = Boolean(process.env.ADMIN_EMAILS);

  return (
    <div className="flex flex-col gap-5">
      <AdminSectionCard title="Entorno" description="Estado actual — solo lectura, se cambia por variables de entorno">
        <dl className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <Field label="NEXT_PUBLIC_SITE_URL" value={SITE_URL} />
          <Field label="Entorno actual" value={<Badge variant="slate">{resolveEnv()}</Badge>} />
          <Field label="NEXT_PUBLIC_INDEXABLE" value={<Badge variant={IS_INDEXABLE ? "green" : "amber"}>{String(IS_INDEXABLE)}</Badge>} />
          <Field label="Supabase conectado" value={<Badge variant={isSupabaseConfigured() ? "green" : "red"}>{isSupabaseConfigured() ? "Sí" : "No (usando mock data)"}</Badge>} />
          <Field label="ADMIN_EMAILS configurado" value={<Badge variant={hasAdminEmails ? "green" : "red"}>{hasAdminEmails ? "Sí" : "No"}</Badge>} />
          <Field
            label="Centros cargados"
            value={
              <>
                {centers.length} totales · {published.length} publicados · {indexableCount} indexables
              </>
            }
          />
        </dl>
      </AdminSectionCard>

      <AdminSectionCard title="Checklist de lanzamiento">
        <ul className="flex flex-col gap-3">
          <Check ok={Boolean(process.env.NEXT_PUBLIC_SITE_URL)} label="Dominio configurado (NEXT_PUBLIC_SITE_URL)" />
          <Check ok={isSupabaseConfigured()} label="Supabase conectado" />
          <Check ok={indexableCount > 0} label="Hay al menos un centro indexable" />
          <Check ok={IS_INDEXABLE} label="Indexación global activada (NEXT_PUBLIC_INDEXABLE=true) — actívalo solo en producción final" />
          <Check ok={hasAdminEmails} label="ADMIN_EMAILS configurado" />
          <Check ok={false} label="Blog con contenido suficiente para indexar (actualmente excluido del sitemap)" />
          <Check ok={true} label="Formularios (/anadir-centro, /reclamar-ficha) en noindex,follow" />
          <Check ok={true} label="Legales (aviso legal, privacidad, cookies) publicados" />
          <Check ok={false} label="Search Console verificado" />
        </ul>
      </AdminSectionCard>
    </div>
  );
}
