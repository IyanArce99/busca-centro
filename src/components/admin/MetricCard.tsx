const TONES = {
  neutral: { icon: "bg-white/[0.06] text-slate-300", ring: "" },
  green: { icon: "bg-emerald-500/10 text-emerald-300", ring: "hover:ring-emerald-400/20" },
  amber: { icon: "bg-amber-500/10 text-amber-300", ring: "hover:ring-amber-400/20" },
  red: { icon: "bg-rose-500/10 text-rose-300", ring: "hover:ring-rose-400/20" },
  sky: { icon: "bg-cyan-500/10 text-cyan-300", ring: "hover:ring-cyan-400/20" },
} as const;

export default function MetricCard({
  label,
  value,
  hint,
  icon,
  tone = "neutral",
}: {
  label: string;
  value: number | string;
  hint?: string;
  icon?: React.ReactNode;
  tone?: keyof typeof TONES;
}) {
  return (
    <div
      className={`group rounded-2xl border border-white/10 bg-white/[0.04] p-4 shadow-2xl shadow-black/20 ring-1 ring-transparent backdrop-blur-xl transition-all duration-200 hover:-translate-y-0.5 hover:bg-white/[0.06] ${TONES[tone].ring}`}
    >
      <div className="flex items-start justify-between">
        <p className="text-xs font-medium text-slate-400">{label}</p>
        {icon ? <span className={`flex h-7 w-7 shrink-0 items-center justify-center rounded-lg ${TONES[tone].icon}`}>{icon}</span> : null}
      </div>
      <p className="mt-2 text-2xl font-semibold tracking-tight text-slate-50">{value}</p>
      {hint ? <p className="mt-1 text-xs text-slate-500">{hint}</p> : null}
    </div>
  );
}
