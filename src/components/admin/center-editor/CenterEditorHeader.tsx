"use client";

import Link from "next/link";
import type { AdminCenter } from "@/lib/admin/data";
import { ChevronRightIcon, ExternalLinkIcon, DocumentTextIcon } from "@/components/Icons";
import { IndexableBadge, VerificationBadge } from "../CenterStatusBadges";
import ActionButton from "../ActionButton";

export default function CenterEditorHeader({ center }: { center: AdminCenter }) {
  return (
    <div className="flex flex-col gap-3">
      <Link href="/admin/centers" className="inline-flex w-fit items-center gap-1 text-xs font-medium text-slate-500 transition hover:text-slate-200">
        <ChevronRightIcon className="h-3 w-3 rotate-180" />
        Volver a centros
      </Link>

      <div className="flex flex-wrap items-start justify-between gap-4 rounded-2xl border border-white/10 bg-white/[0.04] p-5 shadow-2xl shadow-black/20 backdrop-blur-xl">
        <div>
          <div className="flex flex-wrap items-center gap-2">
            <h1 className="text-xl font-semibold text-slate-50">{center.name}</h1>
            <IndexableBadge center={center} />
            <VerificationBadge status={center.verification_status} />
          </div>
          <p className="mt-1 text-sm text-slate-500">
            {center.city_name} · <span className="font-mono text-xs text-slate-500">{center.slug}</span>
          </p>
        </div>

        <div className="flex items-center gap-2">
          <ActionButton size="sm" href={`/centro/${center.slug}`} icon={<ExternalLinkIcon className="h-3.5 w-3.5" />} target="_blank">
            Ver ficha pública
          </ActionButton>
          <ActionButton
            size="sm"
            icon={<DocumentTextIcon className="h-3.5 w-3.5" />}
            onClick={() => navigator.clipboard.writeText(`${window.location.origin}/centro/${center.slug}`)}
          >
            Copiar URL
          </ActionButton>
        </div>
      </div>
    </div>
  );
}
