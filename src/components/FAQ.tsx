import type { FAQItem } from "@/types/faq";

interface FAQProps {
  title?: string;
  items: FAQItem[];
}

export default function FAQ({ title = "Preguntas frecuentes", items }: FAQProps) {
  if (items.length === 0) return null;

  return (
    <section aria-labelledby="faq-heading">
      <h2 id="faq-heading" className="text-2xl font-bold text-slate-900">
        {title}
      </h2>
      <dl className="mt-4 flex flex-col divide-y divide-slate-200 rounded-xl border border-slate-200 bg-white">
        {items.map((item) => (
          <div key={item.question} className="p-5">
            <dt className="font-semibold text-slate-900">{item.question}</dt>
            <dd className="mt-2 text-sm leading-relaxed text-slate-600">{item.answer}</dd>
          </div>
        ))}
      </dl>
    </section>
  );
}
