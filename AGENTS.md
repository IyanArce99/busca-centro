<!-- BEGIN:nextjs-agent-rules -->
# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

# Project rules

This project is a SEO-first directory/comparison website for nurseries and early childhood education centers in Spain.

The MVP focuses only on:
- Guarderías
- Escuelas infantiles
- Guarderías privadas
- Guarderías bilingües
- Centros con comedor
- Centros con horario ampliado
- Centros por ciudad

Do not build features for colegios, institutos or FP yet, but keep the architecture extensible for future education center types.

# Technical approach

Use:
- Next.js App Router
- TypeScript
- Tailwind CSS
- Static/mock data for the first development phase

Do not connect Supabase or any backend yet unless explicitly requested.

Use mock data files for now:
- `src/data/mock-centers.ts`
- `src/data/mock-cities.ts`
- `src/data/mock-seo-pages.ts`
- `src/data/mock-guides.ts`

Define strong TypeScript types in:
- `src/types/center.ts`
- `src/types/city.ts`
- `src/types/seo-page.ts`
- `src/types/guide.ts`

The mock data structure should be close to the future Supabase schema so it can be replaced later without rewriting the frontend.

# SEO rules

This project is SEO-first.

Every public page must have:
- Proper `metadata`
- One clear `h1`
- Semantic HTML
- Crawlable internal links using Next.js `Link`
- Clean URLs
- Canonical URL where appropriate
- Breadcrumbs where appropriate

Create:
- `app/sitemap.ts`
- `app/robots.ts`

For now, generate sitemap entries from mock data.

Do not create thin-content pages. A page should only be indexable if it has enough useful data.

Rules:
- City pages should only be indexable if they have at least 10 centers.
- Neighborhood/type pages should only be indexable if they have at least 5 centers.
- Center detail pages should only be indexable if they have enough basic data: name, city, type, location/area, services and description.

For pages that are not ready, set robots to `noindex, follow`.

# URL structure

Use these routes:

- `/`
- `/guarderias`
- `/escuelas-infantiles`
- `/[slug]` for SEO landing pages like:
  - `/guarderias-en-madrid`
  - `/escuelas-infantiles-en-valencia`
  - `/guarderias-bilingues-en-madrid`
- `/centro/[slug]`
- `/para-centros`
- `/anadir-centro`
- `/reclamar-ficha`
- `/blog`
- `/blog/[slug]`

Do not create unnecessary nested routes unless there is a clear SEO or UX reason.

# UI/components

Create reusable components in `src/components`.

Recommended components:
- `Header`
- `Footer`
- `SearchBox`
- `CityCard`
- `CategoryCard`
- `CenterCard`
- `CenterFilters`
- `CenterDetail`
- `LeadForm`
- `FAQ`
- `Breadcrumbs`
- `SeoTextBlock`
- `GuideCard`

Keep components simple, typed and reusable.

# Content and copy rules

Tone must be:
- Clear
- Helpful
- Professional
- Close to parents and families
- Honest about unverified data

Avoid claims like:
- “best nursery”
- “top center”
- “recommended by experts”
- “verified reviews”

Unless there is real methodology and verified data.

Use safer wording:
- “centros añadidos recientemente”
- “datos actualizados”
- “ficha verificada”
- “solicitar información”
- “comparar opciones”

# Data/legal rules

Do not copy descriptions, images or reviews from third-party websites.

Use neutral placeholder descriptions based on structured mock data.

Every center detail page should include a transparency block:
“This profile may include information from public sources or data provided by the center. If you represent this center, you can request an update or claim this profile.”

# Development rules

Before creating new code:
- Check existing files and structure.
- Reuse existing components when possible.
- Keep files small and readable.
- Do not introduce unnecessary dependencies.
- Do not add backend, auth, payments or admin dashboard until explicitly requested.
- Do not over-engineer.

When implementing a feature:
- Create typed data models first.
- Create reusable components.
- Then create pages.
- Then add metadata/SEO.

# MVP priority

Build in this order:
1. Layout, Header and Footer
2. Home
3. Mock data and types
4. `/guarderias`
5. `/escuelas-infantiles`
6. Dynamic SEO pages `/[slug]`
7. Center detail pages `/centro/[slug]`
8. `/para-centros`
9. `/anadir-centro`
10. `/reclamar-ficha`
11. `/blog`
12. `/blog/[slug]`
13. `sitemap.ts`
14. `robots.ts`