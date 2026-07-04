const BAR_STYLES = {
  emerald: "from-emerald-500 to-emerald-300 shadow-[0_0_12px_rgba(52,211,153,0.5)]",
  amber: "from-amber-500 to-amber-300 shadow-[0_0_12px_rgba(251,191,36,0.5)]",
  sky: "from-cyan-500 to-cyan-300 shadow-[0_0_12px_rgba(34,211,238,0.5)]",
  violet: "from-violet-500 to-violet-300 shadow-[0_0_12px_rgba(167,139,250,0.5)]",
} as const;

export default function ProgressStat({
  label,
  value,
  total,
  tone = "sky",
}: {
  label: string;
  value: number;
  total: number;
  tone?: keyof typeof BAR_STYLES;
}) {
  const pct = total > 0 ? Math.round((value / total) * 100) : 0;

  return (
    <div>
      <div className="mb-2 flex items-baseline justify-between text-sm">
        <span className="text-slate-400">{label}</span>
        <span className="font-semibold text-slate-100">
          {value} <span className="font-normal text-slate-500">/ {total}</span>
        </span>
      </div>
      <div className="h-1.5 w-full overflow-hidden rounded-full bg-white/[0.06]">
        <div className={`h-full rounded-full bg-gradient-to-r transition-all duration-500 ${BAR_STYLES[tone]}`} style={{ width: `${pct}%` }} />
      </div>
    </div>
  );
}
