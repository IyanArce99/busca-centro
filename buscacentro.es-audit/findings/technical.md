# Auditoría SEO Técnica — buscacentro.es

Fecha: 2026-07-13
Dominio: https://www.buscacentro.es (Next.js App Router, Vercel, ~1 mes indexado)
Alcance: crawlability, indexability, seguridad, URLs, mobile, Core Web Vitals (estimación lab), datos estructurados, renderizado JS, IndexNow.

Metodología: fetch directo con curl (headers + HTML crudo, sin JS) contra la producción en vivo, más lectura del código fuente (`src/app/sitemap.ts`, `src/app/robots.ts`, `src/app/[slug]/page.tsx`, `src/app/centro/[slug]/page.tsx`, `src/lib/centers.ts`, `src/lib/data/seo-pages.ts`) para confirmar la causa raíz de cada hallazgo, no solo el síntoma.

---

## Resumen ejecutivo

El sitio tiene una arquitectura técnica de SEO muy sólida para su edad (1 mes): SSG real con contenido en el HTML inicial (sin dependencia de JS para crawlers), robots.txt y canonicals correctos, JSON-LD válido (ChildCare, FAQPage, BreadcrumbList), y una estrategia de indexación selectiva bien diseñada a nivel de código (`isCenterIndexable`, `isSeoPageIndexableFromCenters`) que evita contenido fino. Sin embargo, se ha detectado un **bug crítico de staleness**: el sitemap.xml y las páginas de Madrid (ciudad insignia) están congelados en un snapshot de build/deploy anterior a que los datos de Madrid en Supabase cruzaran los umbrales de indexabilidad, y **no hay ningún mecanismo de revalidación (`revalidate`/ISR) que corrija esto sin un nuevo deploy**. Resultado: 0 URLs de Madrid en el sitemap (ni fichas de centro ni landings), y las landings `/guarderias-en-madrid` y `/escuelas-infantiles-en-madrid` sirven `noindex, follow` en el HTML pese a mostrar 20 centros en página — muy por encima del umbral de 10. Esto es la brecha más grande entre "lo que Google puede indexar hoy" y "lo que el sitio realmente tiene publicado". Además faltan cabeceras de seguridad estándar (CSP, X-Content-Type-Options, X-Frame-Options, Referrer-Policy) y no hay implementación de IndexNow, lo cual es especialmente valioso para un dominio joven que necesita indexación rápida.

**Puntuación técnica global: 78/100**

---

## Hallazgos por severidad

### CRITICAL

#### 1. Sitemap y landings de Madrid desincronizados de los datos reales — 0 URLs de Madrid en sitemap.xml pese a tener centros publicados e indexables

**Evidencia:**
- `sitemap.xml` contiene 622 URLs: 548 fichas de centro (`/centro/...`) repartidas así — Barcelona 245, Valencia 162, Zaragoza 32, Sevilla 29, Málaga 25, Alicante 21, Palma 17, Murcia 16, **Madrid 0**.
- Ninguna landing `*-en-madrid` (`/guarderias-en-madrid`, `/escuelas-infantiles-en-madrid`, `/guarderias-bilingues-en-madrid`, etc.) aparece en el sitemap, pese a que los slugs existen en `src/data/mock-seo-pages.ts` y las páginas responden `HTTP 200` en producción.
- Al acceder directamente a `https://www.buscacentro.es/guarderias-en-madrid`: el HTML muestra `<meta name="robots" content="noindex, follow"/>` **pero renderiza 20 centros distintos en la página** (`afuera-iii-b-madrid`, `nazaret-madrid`, `pipos-madrid`, etc.) — muy por encima del umbral de `MIN_CENTERS_FOR_CITY_PAGE = 10` definido en `src/lib/constants.ts`.
- Al acceder directamente a fichas de centro de Madrid individuales (`/centro/nazaret-madrid`, `/centro/pipos-madrid`, `/centro/santa-bernardita-madrid`, `/centro/lar-madrid`, `/centro/afuera-iii-b-madrid`), **todas devuelven `<meta name="robots" content="index, follow"/>`** con canonical propio correcto — es decir, individualmente SÍ pasan el gate de `isCenterIndexable` en `src/lib/centers.ts` — pero ninguna está en el sitemap.

**Causa raíz confirmada en código:**
- `src/app/sitemap.ts`, `src/app/[slug]/page.tsx` (`generateStaticParams`) y `src/app/centro/[slug]/page.tsx` (`generateStaticParams`) todos llaman a `getCenters()` (consulta Supabase `status = 'published'`) para decidir qué incluir, pero **ninguna de estas rutas exporta `export const revalidate = ...`**. Sin esa directiva, Next.js/Vercel trata `sitemap.ts` y las páginas generadas por `generateStaticParams` como completamente estáticas (SSG puro, cacheadas indefinidamente en el edge de Vercel), regenerándose solo en el siguiente deploy.
- Confirmado en headers en vivo: `sitemap.xml` responde con `x-vercel-cache: HIT` y `cache-control: public, max-age=0, must-revalidate` sin ISR — es un snapshot congelado del último build.
- Las páginas de Madrid individuales SÍ responden `index, follow` porque `generateMetadata` en `centro/[slug]/page.tsx` vuelve a evaluar `isCenterIndexable(center)` en cada render — pero como Madrid no estaba en `generateStaticParams` en el build que generó el deploy actual, es probable que estas páginas se sirvan como fallback dinámico (`dynamicParams` por defecto es `true`) y por tanto reflejen datos frescos de Supabase en el momento de la petición — mientras que `sitemap.xml`, al ser una Route Handler estática sin `revalidate`, quedó congelada en el snapshot antiguo donde Madrid aún no cumplía el umbral (o directamente no se incluyó en ese build).
- Contexto adicional: existe una migración pendiente sin ejecutar en el repo (`data/migrations/publish-ronda1-centers.sql`, fechada 2026-07-13) que publica ~593 centros de Zaragoza/Murcia/Sevilla/Palma/Málaga/Alicante — el propio comentario del SQL aclara "No toca Madrid, Barcelona, Valencia ni ninguna otra ciudad", confirmando que el problema de Madrid es independiente de esa migración y es puramente de staleness de build/cache, no de datos en `draft`.

**Impacto:** Madrid es probablemente la ciudad con mayor volumen de búsqueda del nicho en España. Ahora mismo Google Search Console verá 0 fichas de Madrid en el sitemap y una landing de la ciudad más importante marcada `noindex` con contenido claramente suficiente para indexar — esto retrasa semanas de indexación en el peor momento posible (dominio joven que necesita señales de cobertura amplia y consistente).

**Recomendación:**
1. Inmediato: forzar un nuevo deploy en Vercel (o `vercel --prod` / redeploy desde el dashboard) para regenerar el build con los datos actuales de Supabase. Verificar tras el deploy que `sitemap.xml` incluye URLs `/centro/*-madrid` y que `/guarderias-en-madrid` y `/escuelas-infantiles-en-madrid` devuelven `index, follow`.
2. Estructural (para que esto no vuelva a pasar): añadir `export const revalidate = 3600;` (o el intervalo que se considere razonable, p. ej. 1-6 h) tanto en `src/app/sitemap.ts` como en `src/app/[slug]/page.tsx` y `src/app/centro/[slug]/page.tsx`. Esto convierte estas rutas en ISR real, de modo que el sitemap y las decisiones de indexabilidad se mantengan sincronizados con Supabase sin depender de un deploy manual cada vez que un centro cruza el umbral de contenido.
3. Alternativa/complementaria: añadir un paso de CI/CD que dispare un deploy (o al menos una revalidación on-demand vía `revalidateTag`/`revalidatePath`) cada vez que se ejecuta un script de publicación de centros (como el patrón ya usado en `publish-ronda1-centers.sql`), para que "publicar centros en Supabase" y "que aparezcan en el sitemap" queden acoplados de forma fiable.
4. Tras corregir, enviar `https://www.buscacentro.es/sitemap.xml` de nuevo en Search Console y usar la Inspección de URL para forzar recrawl de `/guarderias-en-madrid` y `/escuelas-infantiles-en-madrid`.

---

### HIGH

#### 2. Ausencia total de cabeceras de seguridad HTTP estándar (excepto HSTS)

**Evidencia:** headers completos capturados en homepage, sitemap.xml, robots.txt y fichas de centro — en todos los casos solo aparece `strict-transport-security: max-age=63072000`. No hay `Content-Security-Policy`, `X-Content-Type-Options`, `X-Frame-Options` / `frame-ancestors`, `Referrer-Policy`, ni `Permissions-Policy`.

**Impacto:** No afecta directamente al ranking, pero sí a la superficie de ataque (clickjacking, MIME-sniffing, inyección de scripts en formularios como `/anadir-centro` y `/reclamar-ficha`, que manejan datos de terceros/leads). Es también una señal que auditorías de terceros (Lighthouse "Best Practices", herramientas de seguridad) penalizan, y algunos partners/agencias la usan como filtro de confianza al evaluar un directorio antes de listar su ficha.

**Recomendación:** Añadir cabeceras vía `next.config.js` (`headers()`) o middleware:
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: SAMEORIGIN` (o CSP `frame-ancestors 'self'`)
- `Referrer-Policy: strict-origin-when-cross-origin`
- `Content-Security-Policy` básica (empezar en modo `Content-Security-Policy-Report-Only` para no romper nada, luego promover a bloqueante) cubriendo `script-src`, `img-src`, `connect-src` según los dominios reales usados (Supabase, analytics, fuentes).
- `Permissions-Policy` restringiendo `camera=(), microphone=(), geolocation=()` salvo que se use geolocalización en el buscador.

---

### MEDIUM

#### 3. No hay implementación de IndexNow (Bing, Yandex, Naver)

**Evidencia:** `https://www.buscacentro.es/indexnow-key.txt` devuelve 404; no hay endpoint `/api/indexnow` ni referencias a "indexnow" en el código fuente (`src/`).

**Impacto:** Para un dominio de 1 mes con publicaciones frecuentes (9 ciudades recién lanzadas, ~30 landings, blog activo), IndexNow es la vía más rápida de conseguir indexación temprana en Bing (y de rebote, señales que a veces ayudan indirectamente en Google vía Bing Chat/Copilot y otros consumidores del índice de Bing). Ahora mismo se depende solo del crawling orgánico + sitemap, que es más lento en un dominio sin autoridad todavía.

**Recomendación:**
1. Generar una clave IndexNow y publicarla en `https://www.buscacentro.es/{key}.txt`.
2. Crear un pequeño helper (server action o script) que llame a `https://api.indexnow.org/indexnow` cada vez que se publique/actualice un centro o landing (idealmente enganchado al mismo flujo que dispara la revalidación ISR del punto 1, para que "contenido nuevo visible" e "IndexNow notificado" ocurran juntos).
3. Priorizar el envío inicial para las ~30 landings SEO y las fichas recién publicadas de las 9 ciudades.

#### 4. Estrategia SSG pura sin ISR crea una dependencia frágil entre "publicar en Supabase" y "quedar reflejado en producción"

**Evidencia:** ver Hallazgo Crítico #1 — es la causa raíz general, documentada aquí también como hallazgo de arquitectura porque afecta a más que solo Madrid: cualquier ciudad/landing que cruce el umbral de indexabilidad (`MIN_CENTERS_FOR_CITY_PAGE = 10`, `MIN_CENTERS_FOR_TYPE_PAGE = 5`) *entre* deploys quedará temporalmente mal representada (de-indexada cuando debería indexarse, o viceversa si se elimina un centro y cae por debajo del umbral).

**Recomendación:** cubierto por la recomendación #2 del hallazgo crítico (añadir `revalidate` / ISR). Se lista aparte por su alcance arquitectónico: revisar también `src/app/robots.ts` y cualquier otra ruta que dependa de `IS_INDEXABLE`/conteos de Supabase para asegurarse de que todas usan el mismo patrón de revalidación.

#### 5. Migración de publicación de 6 ciudades pendiente de ejecutar (`data/migrations/publish-ronda1-centers.sql`)

**Evidencia:** el archivo (sin trackear en git, visible en `git status`) publica ~593 centros de Zaragoza, Murcia, Sevilla, Palma, Málaga y Alicante cambiando `status: draft → published`. Los conteos actuales en el sitemap para esas ciudades (32, 16, 29, 25, 17, 21 = 140 centros) sugieren que **la mayoría de esos ~593 centros aún no están publicados** — el sitemap solo refleja los ya publicados, no el total del dataset preparado.

**Impacto:** No es un bug técnico de crawlability/indexability (el sitio se comporta correctamente respecto a lo que SÍ está publicado), pero es relevante para el contexto de la auditoría: gran parte del volumen anunciado ("~1000 fichas") todavía no es visible para Google porque sigue en `draft`. Combinado con el Hallazgo #1, el sitemap actual infrarrepresenta significativamente el inventario real listo para publicar.

**Recomendación:** ejecutar la migración (previa revisión, tal como indica el propio comentario del SQL) y, acto seguido, forzar el redeploy/revalidación del punto 1 para que el sitemap y las landings reflejen el volumen real. Aprovechar para enviar el `rollback-publish-ronda1-centers.sql` a control de versiones también, dado que ya existe.

---

### LOW

#### 6. Ninguna imagen (`<img>`) detectada en el HTML inicial de la ficha de centro muestreada

**Evidencia:** `centro/afuera-iii-b-madrid` no contiene ninguna etiqueta `<img>` en el HTML servido (verificado con extracción de patrón `<img...>`), pese a que el tipo de dato `Center.images` existe en el esquema.

**Impacto:** Riesgo bajo de CLS si en el futuro se añaden imágenes sin `width`/`height` explícitos vía `next/image` (Next.js los infiere automáticamente si se usa el componente correctamente, así que el riesgo es más bien "ausencia de contenido visual" que problema de CWV en sí). Fichas sin foto son menos atractivas en SERP (no hay imagen para rich results de tipo LocalBusiness/imagen) y para el usuario.

**Recomendación:** no es una prioridad técnica de crawlability, pero vale la pena marcarlo para el equipo de contenido: priorizar la carga de al menos una imagen por ficha (usando `next/image` con `width`/`height` fijos para evitar CLS) en el pipeline de enriquecimiento de centros, especialmente para las ~548 fichas ya indexables.

#### 7. `priority` en sitemap.xml no diferenciado por relevancia real dentro de un mismo tipo

**Evidencia:** todas las fichas de centro (`/centro/*`) comparten `priority: 0.6` sin distinguir, por ejemplo, fichas verificadas (`isVerified: true`) vs no verificadas, o centros con ficha más completa vs mínima.

**Impacto:** Mínimo — Google ignora en gran medida `<priority>` desde hace años, así que esto es más una cuestión de higiene que de impacto real en rastreo.

**Recomendación:** opcional, baja prioridad. Si se quiere pulir, usar `priority` más alto (0.7) para fichas verificadas/completas y dejar 0.5 para el resto, aunque el efecto práctico en Google es marginal. No dedicar tiempo de desarrollo a esto salvo que sobre capacidad.

---

## Categorías verificadas — Pass/Fail resumen

| Categoría | Estado | Notas |
|---|---|---|
| 1. Crawlability (robots.txt, sitemap, noindex) | **PASS con reservas** | robots.txt correcto (`Allow: /` + sitemap declarado). Sitemap bien estructurado técnicamente (XML válido, sin http:// mixto, sin duplicados de trailing slash) pero desincronizado de los datos reales (ver Crítico #1). |
| 2. Indexability (canonicals, duplicados, contenido fino) | **PASS (lógica) / FAIL (frescura)** | La lógica de `isCenterIndexable` / `isSeoPageIndexableFromCenters` está bien diseñada e implementada de forma consistente entre `generateMetadata`, `generateStaticParams` y `sitemap.ts`. El problema no es la lógica sino que el snapshot desplegado está desactualizado (Madrid). Canonicals verificados: absolutos, self-referencing, correctos en homepage, hubs, landings y fichas. |
| 3. Seguridad (HTTPS, headers) | **PARTIAL** | HTTPS forzado correctamente (redirect 308 http→https y non-www→www), HSTS presente. Faltan CSP, X-Content-Type-Options, X-Frame-Options, Referrer-Policy (High #2). |
| 4. Estructura de URLs / redirects | **PASS** | URLs limpias y semánticas (`/guarderias-en-madrid`, `/centro/nombre-slug-ciudad`). Redirect 308 consistente para http→https y non-www→www y para trailing slash. 404 real (no soft-404) en rutas inexistentes. |
| 5. Mobile | **PASS** | `<meta name="viewport" content="width=device-width, initial-scale=1"/>` presente y correcto en todas las páginas muestreadas (home, hubs, landings, fichas). |
| 6. Core Web Vitals (estimación lab desde HTML) | **PASS con reservas** | Fuentes con `<link rel="preload" as="font">` (buena señal para LCP de texto). Sin credenciales CrUX no se puede confirmar LCP/INP/CLS reales de campo — recomendar ejecutar Lighthouse/PageSpeed Insights cuando haya tráfico suficiente para CrUX. Sin `<img>` en la muestra analizada, riesgo de CLS no evaluable directamente. |
| 7. Datos estructurados | **PASS** | JSON-LD válido y bien tipado: `ChildCare`, `FAQPage`, `BreadcrumbList` en fichas; `BreadcrumbList` (+ `FAQPage` condicional a indexabilidad) en landings. Correctamente omitido en páginas `noindex` (buena práctica, evita anunciar rich results en páginas no indexables). |
| 8. Renderizado JavaScript (CSR vs SSR/SSG) | **PASS** | Confirmado SSG con contenido completo en el HTML inicial (curl sin ejecutar JS ya devuelve h1, meta, JSON-LD y listados de centros). `x-nextjs-prerender: 1` en todas las rutas muestreadas. Cero dependencia de hidratación para que un crawler vea el contenido. |
| 9. IndexNow | **FAIL** | No implementado (Medium #3). |

---

## Notas metodológicas

- Todas las páginas se comprobaron con `curl` (fetch crudo, sin ejecución de JS) para simular exactamente lo que un crawler ve en el HTML inicial — dado que el punto 8 confirma SSG, esto es representativo de lo que Googlebot indexa.
- No se usó `render_page.py` de forma extensiva porque el fetch crudo ya fue suficiente y consistente (SSG confirmado); se reserva su uso para una futura verificación de renderizado condicional o componentes marcados `"use client"` que pudieran ocultar contenido crítico tras hidratación (no detectado en esta muestra, pero recomendable revisar `CenterFilters` y otros componentes interactivos si en el futuro se sospecha de contenido oculto pre-hidratación).
- No se dispuso de credenciales CrUX/PageSpeed Insights API, por lo que el apartado de Core Web Vitals es una estimación basada en señales de HTML (preload de fuentes, ausencia de layout-shift evidente en el markup), no datos de campo reales. Recomendado como seguimiento: ejecutar `pagespeed_check.py` o Lighthouse una vez el dominio tenga tráfico suficiente para CrUX, y repetir tras la corrección del Hallazgo Crítico #1.
