import Badge from "./Badge";
import type { AdminCenter } from "@/lib/admin/data";

export function IndexableBadge({ center }: { center: AdminCenter }) {
  if (center.status !== "published") return <Badge variant="slate">{center.status}</Badge>;
  return center.isIndexable ? (
    <Badge variant="green" dot>
      Indexable
    </Badge>
  ) : (
    <Badge variant="amber" dot>
      Noindex
    </Badge>
  );
}

export function ConfidenceBadge({ level }: { level: string | null }) {
  const l = level || "unknown";
  const variant = l === "high" ? "green" : l === "medium" ? "sky" : l === "low" ? "amber" : "slate";
  const label: Record<string, string> = { high: "Alta", medium: "Media", low: "Baja", unknown: "Desconocida" };
  return <Badge variant={variant}>{label[l] ?? l}</Badge>;
}

export function VerificationBadge({ status }: { status: string | null }) {
  const s = status || "unverified";
  const variant = s === "verified" ? "green" : s === "partially_verified" ? "sky" : s === "pending_manual_review" ? "amber" : "slate";
  const label: Record<string, string> = {
    verified: "Verificado",
    partially_verified: "Parcial",
    pending_manual_review: "Revisión pendiente",
    unverified: "No verificado",
  };
  return <Badge variant={variant}>{label[s] ?? s}</Badge>;
}
