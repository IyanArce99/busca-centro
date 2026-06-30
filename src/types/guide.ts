export interface Guide {
  id: string;
  slug: string;
  title: string;
  excerpt: string;
  /** Paragraphs of plain text; swappable for rich content later. */
  content: string[];
  category: string;
  publishedAt: string;
  updatedAt?: string;
  readingTimeMinutes: number;
}
