const VARIANTS = {
  green: "bg-emerald-500/10 text-emerald-300 ring-emerald-400/20",
  red: "bg-rose-500/10 text-rose-300 ring-rose-400/20",
  amber: "bg-amber-500/10 text-amber-300 ring-amber-400/20",
  slate: "bg-white/[0.06] text-slate-300 ring-white/10",
  sky: "bg-cyan-500/10 text-cyan-300 ring-cyan-400/20",
  violet: "bg-violet-500/10 text-violet-300 ring-violet-400/20",
} as const;

export type BadgeVariant = keyof typeof VARIANTS;

const DOT_COLOR: Record<BadgeVariant, string> = {
  green: "bg-emerald-400",
  red: "bg-rose-400",
  amber: "bg-amber-400",
  slate: "bg-slate-400",
  sky: "bg-cyan-400",
  violet: "bg-violet-400",
};

export default function Badge({
  children,
  variant = "slate",
  dot = false,
}: {
  children: React.ReactNode;
  variant?: BadgeVariant;
  dot?: boolean;
}) {
  return (
    <span
      className={`inline-flex items-center gap-1.5 whitespace-nowrap rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset backdrop-blur-sm ${VARIANTS[variant]}`}
    >
      {dot ? <span className={`h-1.5 w-1.5 shrink-0 rounded-full ${DOT_COLOR[variant]} shadow-[0_0_6px_currentColor]`} /> : null}
      {children}
    </span>
  );
}
