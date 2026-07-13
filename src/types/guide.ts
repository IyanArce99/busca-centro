import type { FAQItem } from "@/types/faq";

/** An editorial content block rendered as an H2 heading plus one or more paragraphs. */
export interface GuideContentSection {
  heading: string;
  paragraphs: string[];
}

/** A single crawlable internal link surfaced in a guide's "useful links" block. */
export interface GuideRelatedLink {
  label: string;
  href: string;
}

/**
 * Contextual internal links from a guide to the city landing pages it mentions
 * (e.g. `/guarderias-en-madrid`). Rendered as a "useful links" section with
 * `next/link`, because guide paragraphs are plain text and cannot embed anchors.
 */
export interface GuideRelatedLinks {
  /** Short intro sentence shown above the link list. */
  intro: string;
  links: GuideRelatedLink[];
}

export interface Guide {
  id: string;
  slug: string;
  title: string;
  excerpt: string;
  /** Intro paragraphs of plain text, rendered before the sections. */
  content: string[];
  /** Structured H2 sections rendered after the intro paragraphs. */
  sections?: GuideContentSection[];
  category: string;
  publishedAt: string;
  updatedAt?: string;
  readingTimeMinutes: number;
  /** Informational FAQs rendered after the article; also emitted as FAQPage schema. */
  faqs?: FAQItem[];
  /** Crawlable internal links to the city landings this guide mentions. */
  relatedLinks?: GuideRelatedLinks;
}
