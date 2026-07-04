export type SeoScore = "bueno" | "medio" | "pobre" | "no-indexar";

const STYLES: Record<SeoScore, string> = {
  bueno: "bg-emerald-500/10 text-emerald-300 ring-emerald-400/20",
  medio: "bg-amber-500/10 text-amber-300 ring-amber-400/20",
  pobre: "bg-orange-500/10 text-orange-300 ring-orange-400/20",
  "no-indexar": "bg-white/[0.06] text-slate-400 ring-white/10",
};

const LABELS: Record<SeoScore, string> = {
  bueno: "Bueno",
  medio: "Medio",
  pobre: "Pobre",
  "no-indexar": "No indexar",
};

const DOT: Record<SeoScore, string> = {
  bueno: "bg-emerald-400",
  medio: "bg-amber-400",
  pobre: "bg-orange-400",
  "no-indexar": "bg-slate-500",
};

export default function SeoScoreBadge({ score }: { score: SeoScore }) {
  return (
    <span className={`inline-flex items-center gap-1.5 rounded-full px-2.5 py-1 text-xs font-medium ring-1 ring-inset backdrop-blur-sm ${STYLES[score]}`}>
      <span className={`h-1.5 w-1.5 rounded-full ${DOT[score]} shadow-[0_0_6px_currentColor]`} />
      {LABELS[score]}
    </span>
  );
}
