interface SeoTextBlockProps {
  heading?: string;
  text: string;
}

export default function SeoTextBlock({ heading, text }: SeoTextBlockProps) {
  return (
    <section className="max-w-3xl">
      {heading ? <h2 className="mb-3 text-xl font-bold text-slate-900">{heading}</h2> : null}
      <p className="text-base leading-relaxed text-slate-600">{text}</p>
    </section>
  );
}
