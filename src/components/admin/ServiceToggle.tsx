import { CheckCircleIcon } from "@/components/Icons";

export default function ServiceToggle({ active, label, onClick }: { active: boolean; label: string; onClick: () => void }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`inline-flex items-center gap-1.5 rounded-full px-3 py-1.5 text-sm font-medium ring-1 ring-inset transition ${
        active
          ? "bg-gradient-to-r from-violet-500/20 to-cyan-500/20 text-violet-200 ring-violet-400/30 shadow-[0_0_12px_rgba(139,92,246,0.15)]"
          : "bg-white/[0.02] text-slate-500 ring-white/10 hover:bg-white/[0.06] hover:text-slate-300"
      }`}
    >
      {active ? <CheckCircleIcon className="h-3.5 w-3.5 text-violet-300" /> : null}
      {label}
    </button>
  );
}
