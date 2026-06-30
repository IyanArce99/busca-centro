import Link from "next/link";

interface CTAAction {
  label: string;
  href: string;
}

interface CTASectionProps {
  title: string;
  description?: string;
  primaryAction: CTAAction;
  secondaryAction?: CTAAction;
  variant?: "light" | "dark";
}

export default function CTASection({ title, description, primaryAction, secondaryAction, variant = "dark" }: CTASectionProps) {
  const isDark = variant === "dark";

  return (
    <section
      className={`rounded-2xl px-6 py-10 sm:px-10 ${
        isDark ? "bg-sky-900 text-white" : "border border-slate-200 bg-white text-slate-900"
      }`}
    >
      <div className="flex flex-col items-start gap-5">
        <div className="max-w-xl">
          <h2 className="text-xl font-bold sm:text-2xl">{title}</h2>
          {description ? <p className={`mt-2 text-sm ${isDark ? "text-sky-100" : "text-slate-600"}`}>{description}</p> : null}
        </div>
        <div className="flex flex-wrap gap-3">
          <Link
            href={primaryAction.href}
            className={`rounded-full px-5 py-2.5 text-center text-sm font-semibold transition-colors ${
              isDark ? "bg-white text-sky-900 hover:bg-sky-50" : "bg-sky-700 text-white hover:bg-sky-800"
            }`}
          >
            {primaryAction.label}
          </Link>
          {secondaryAction ? (
            <Link
              href={secondaryAction.href}
              className={`rounded-full border px-5 py-2.5 text-center text-sm font-semibold transition-colors ${
                isDark ? "border-white/40 text-white hover:bg-white/10" : "border-slate-300 text-slate-700 hover:bg-slate-50"
              }`}
            >
              {secondaryAction.label}
            </Link>
          ) : null}
        </div>
      </div>
    </section>
  );
}
