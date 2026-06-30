interface SectionHeaderProps {
  eyebrow?: string;
  title: string;
  subtitle?: string;
  align?: "left" | "center";
}

export default function SectionHeader({ eyebrow, title, subtitle, align = "left" }: SectionHeaderProps) {
  const alignment = align === "center" ? "text-center items-center" : "text-left items-start";

  return (
    <div className={`flex flex-col gap-2 ${alignment}`}>
      {eyebrow ? <span className="text-sm font-semibold uppercase tracking-wide text-sky-700">{eyebrow}</span> : null}
      <h2 className="text-2xl font-bold text-slate-900 sm:text-3xl">{title}</h2>
      {subtitle ? <p className="max-w-2xl text-base text-slate-600">{subtitle}</p> : null}
    </div>
  );
}
