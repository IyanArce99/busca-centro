export default function FilterSelect({
  value,
  onChange,
  children,
  className = "",
}: {
  value: string;
  onChange: (value: string) => void;
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <select
      value={value}
      onChange={(e) => onChange(e.target.value)}
      className={`rounded-lg border border-white/10 bg-slate-900/70 px-2.5 py-1.5 text-sm text-slate-200 transition hover:border-white/20 focus:border-violet-400/40 focus:outline-none focus:ring-2 focus:ring-violet-400/20 ${className}`}
    >
      {children}
    </select>
  );
}
