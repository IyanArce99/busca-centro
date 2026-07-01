import type { FAQItem } from "@/types/faq";

interface FAQProps {
  title?: string;
  items: FAQItem[];
}

export default function FAQ({ title = "Preguntas frecuentes", items }: Readonly<FAQProps>) {
  if (items.length === 0) return null;

  return (
    <section aria-labelledby="faq-heading">
      <h2 id="faq-heading" className="text-2xl font-bold text-slate-900">
        {title}
      </h2>
      <dl className="mt-6 flex flex-col gap-3">
        {items.map((item) => (
          <div key={item.question} className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
            <dt className="flex items-start gap-3 font-semibold text-slate-900">
              <span className="mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-sky-50 text-xs font-bold text-sky-700">
                ?
              </span>
              {item.question}
            </dt>
            <dd className="mt-3 pl-8 text-sm leading-relaxed text-slate-600">{item.answer}</dd>
          </div>
        ))}
      </dl>
    </section>
  );
}
