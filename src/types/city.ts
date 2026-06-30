export interface City {
  id: string;
  slug: string;
  name: string;
  province: string;
  region: string;
  /** Featured in homepage "main cities" sections. */
  isFeatured: boolean;
}
