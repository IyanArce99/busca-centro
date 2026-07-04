import Link from "next/link";
import { ExclamationTriangleIcon, InformationCircleIcon } from "@/components/Icons";

const TONES = {
  critical: { wrap: "border-rose-400/20 bg-rose-500/[0.07] text-rose-200", icon: "text-rose-400" },
  warning: { wrap: "border-amber-400/20 bg-amber-500/[0.07] text-amber-200", icon: "text-amber-400" },
  info: { wrap: "border-cyan-400/20 bg-cyan-500/[0.07] text-cyan-200", icon: "text-cyan-400" },
} as const;

export default function AlertBanner({
  tone = "warning",
  children,
  href,
}: {
  tone?: keyof typeof TONES;
  children: React.ReactNode;
  href?: string;
}) {
  const t = TONES[tone];
  const Icon = tone === "info" ? InformationCircleIcon : ExclamationTriangleIcon;

  const content = (
    <div className={`flex items-center justify-between gap-3 rounded-xl border px-4 py-3 text-sm backdrop-blur-sm transition ${t.wrap} ${href ? "hover:bg-white/[0.03]" : ""}`}>
      <span className="flex items-center gap-2.5">
        <Icon className={`h-4 w-4 shrink-0 ${t.icon}`} />
        {children}
      </span>
      {href ? <span className="shrink-0 text-xs font-semibold text-slate-300">Ver →</span> : null}
    </div>
  );
  return href ? (
    <Link href={href} className="block">
      {content}
    </Link>
  ) : (
    content
  );
}
