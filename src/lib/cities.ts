import { mockCities } from "@/data/mock-cities";
import { mockCenters } from "@/data/mock-centers";
import type { City } from "@/types/city";
import { MIN_CENTERS_FOR_CITY_PAGE } from "./constants";

export function getAllCities(): City[] {
  return mockCities;
}

export function getCityBySlug(slug: string): City | undefined {
  return mockCities.find((city) => city.slug === slug);
}

export function getFeaturedCities(): City[] {
  return mockCities.filter((city) => city.isFeatured);
}

export function getCenterCountForCity(citySlug: string): number {
  return mockCenters.filter((center) => center.address.citySlug === citySlug).length;
}

/** A city hub is only indexable once it has at least 10 centers in the directory. */
export function isCityIndexable(citySlug: string): boolean {
  return getCenterCountForCity(citySlug) >= MIN_CENTERS_FOR_CITY_PAGE;
}

export function getCitiesSortedByCenterCount(): City[] {
  return [...mockCities].sort((a, b) => getCenterCountForCity(b.slug) - getCenterCountForCity(a.slug));
}
