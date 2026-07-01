import Link from "next/link";
import type { ReactNode } from "react";

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
  icon?: ReactNode;
}

export default function CTASection({
  title,
  description,
  primaryAction,
  secondaryAction,
  variant = "dark",
  icon,
}: Readonly<CTASectionProps>) {
  const isDark = variant === "dark";

  return (
    <section
      className={`rounded-2xl px-6 py-8 sm:px-10 sm:py-10 ${
        isDark
          ? "bg-gradient-to-br from-sky-900 to-slate-900 text-white"
          : "border border-slate-200 bg-white text-slate-900"
      }`}
    >
      <div className="flex flex-col items-start gap-5">
        {icon ? (
          <div
            className={`flex h-11 w-11 items-center justify-center rounded-xl ${
              isDark ? "bg-white/10 text-white" : "bg-sky-50 text-sky-600"
            }`}
          >
            {icon}
          </div>
        ) : null}
        <div className="max-w-xl">
          <h2 className="text-xl font-bold sm:text-2xl">{title}</h2>
          {description ? (
            <p className={`mt-2 text-sm leading-relaxed ${isDark ? "text-sky-100" : "text-slate-600"}`}>
              {description}
            </p>
          ) : null}
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
                isDark
                  ? "border-white/30 text-white hover:bg-white/10"
                  : "border-slate-300 text-slate-700 hover:bg-slate-50"
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
