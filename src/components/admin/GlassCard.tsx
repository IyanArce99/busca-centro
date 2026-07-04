export default function GlassCard({
  children,
  className = "",
  hover = false,
  glow = false,
}: {
  children: React.ReactNode;
  className?: string;
  hover?: boolean;
  glow?: boolean;
}) {
  return (
    <div
      className={`rounded-2xl border border-white/10 bg-white/[0.04] shadow-2xl shadow-black/20 backdrop-blur-xl transition-all duration-200 ${
        hover ? "hover:border-white/20 hover:bg-white/[0.06]" : ""
      } ${glow ? "ring-1 ring-violet-400/20" : ""} ${className}`}
    >
      {children}
    </div>
  );
}
