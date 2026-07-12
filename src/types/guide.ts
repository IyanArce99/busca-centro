/** An editorial content block rendered as an H2 heading plus one or more paragraphs. */
export interface GuideContentSection {
  heading: string;
  paragraphs: string[];
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
}
