import Link from "next/link";

const VARIANTS = {
  primary: "bg-gradient-to-b from-violet-500 to-violet-600 text-white shadow-lg shadow-violet-950/40 hover:from-violet-400 hover:to-violet-500",
  secondary: "bg-white/[0.06] text-slate-200 ring-1 ring-inset ring-white/10 hover:bg-white/[0.1] hover:ring-white/20",
  ghost: "text-slate-400 hover:bg-white/[0.06] hover:text-slate-100",
  danger: "bg-rose-500/10 text-rose-300 ring-1 ring-inset ring-rose-400/20 hover:bg-rose-500/15",
  success: "bg-emerald-500/10 text-emerald-300 ring-1 ring-inset ring-emerald-400/20 hover:bg-emerald-500/15",
} as const;

const SIZES = {
  sm: "px-2.5 py-1.5 text-xs",
  md: "px-3.5 py-2 text-sm",
} as const;

type Props = {
  children: React.ReactNode;
  variant?: keyof typeof VARIANTS;
  size?: keyof typeof SIZES;
  icon?: React.ReactNode;
  className?: string;
} & (
  | ({ href: string } & Omit<React.AnchorHTMLAttributes<HTMLAnchorElement>, "href" | "className">)
  | ({ href?: undefined } & Omit<React.ButtonHTMLAttributes<HTMLButtonElement>, "className">)
);

export default function ActionButton({ children, variant = "secondary", size = "md", icon, className = "", ...rest }: Props) {
  const cls = `inline-flex items-center gap-1.5 rounded-lg font-medium transition-all duration-150 active:scale-[0.98] disabled:cursor-not-allowed disabled:opacity-50 disabled:active:scale-100 ${VARIANTS[variant]} ${SIZES[size]} ${className}`;

  if ("href" in rest && rest.href !== undefined) {
    const { href, ...anchorProps } = rest;
    return (
      <Link href={href} className={cls} {...anchorProps}>
        {icon}
        {children}
      </Link>
    );
  }

  const { type = "button", ...buttonProps } = rest as React.ButtonHTMLAttributes<HTMLButtonElement>;
  return (
    <button type={type} className={cls} {...buttonProps}>
      {icon}
      {children}
    </button>
  );
}
