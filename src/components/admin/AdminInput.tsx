export function AdminInput({
  label,
  hint,
  wrapperClassName = "",
  ...props
}: { label: string; hint?: string; wrapperClassName?: string } & React.InputHTMLAttributes<HTMLInputElement>) {
  return (
    <label className={`flex flex-col gap-1.5 text-sm ${wrapperClassName}`}>
      <span className="font-medium text-slate-300">{label}</span>
      <input
        {...props}
        className="rounded-lg border border-white/10 bg-slate-900/70 px-3 py-1.5 text-sm text-slate-100 shadow-inner shadow-black/20 transition placeholder:text-slate-500 focus:border-violet-400/40 focus:outline-none focus:ring-2 focus:ring-violet-400/20"
      />
      {hint ? <span className="text-xs text-slate-500">{hint}</span> : null}
    </label>
  );
}

export function AdminSelect({
  label,
  value,
  onChange,
  options,
  wrapperClassName = "",
}: {
  label: string;
  value: string;
  onChange: (v: string) => void;
  options: [string, string][];
  wrapperClassName?: string;
}) {
  return (
    <label className={`flex flex-col gap-1.5 text-sm ${wrapperClassName}`}>
      <span className="font-medium text-slate-300">{label}</span>
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className="rounded-lg border border-white/10 bg-slate-900/70 px-3 py-1.5 text-sm text-slate-100 shadow-inner shadow-black/20 transition focus:border-violet-400/40 focus:outline-none focus:ring-2 focus:ring-violet-400/20"
      >
        {options.map(([v, l]) => (
          <option key={v} value={v} className="bg-slate-900">
            {l}
          </option>
        ))}
      </select>
    </label>
  );
}
