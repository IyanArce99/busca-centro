import type { FAQItem } from "@/types/faq";
import type { BreadcrumbItem } from "@/components/Breadcrumbs";
import { SITE_URL } from "@/lib/constants";

/**
 * Build a schema.org FAQPage object from the exact FAQs shown on the page.
 * Keep the array identical to what `<FAQ />` renders so the structured data
 * never advertises questions the user can't actually see.
 */
export function faqPageJsonLd(faqs: FAQItem[]): Record<string, unknown> {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: faqs.map((faq) => ({
      "@type": "Question",
      name: faq.question,
      acceptedAnswer: { "@type": "Answer", text: faq.answer },
    })),
  };
}

/**
 * Build a schema.org BreadcrumbList from the same items passed to <Breadcrumbs>.
 * The final item (current page) needs an absolute URL, so pass `currentPath`.
 */
export function breadcrumbJsonLd(items: BreadcrumbItem[], currentPath: string): Record<string, unknown> {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: items.map((item, index) => ({
      "@type": "ListItem",
      position: index + 1,
      name: item.label,
      item: item.href ? `${SITE_URL}${item.href}` : `${SITE_URL}${currentPath}`,
    })),
  };
}
