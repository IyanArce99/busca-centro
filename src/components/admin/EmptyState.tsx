export default function EmptyState({
  title = "Sin resultados",
  description,
  icon,
  action,
}: {
  title?: string;
  description?: string;
  icon?: React.ReactNode;
  action?: React.ReactNode;
}) {
  return (
    <div className="flex flex-col items-center justify-center gap-3 rounded-2xl border border-dashed border-white/10 bg-white/[0.02] px-6 py-14 text-center">
      {icon ? (
        <div className="flex h-12 w-12 items-center justify-center rounded-full bg-white/[0.06] text-slate-400 ring-1 ring-white/10">{icon}</div>
      ) : null}
      <div>
        <p className="text-sm font-medium text-slate-200">{title}</p>
        {description ? <p className="mt-1 max-w-sm text-sm text-slate-500">{description}</p> : null}
      </div>
      {action}
    </div>
  );
}
