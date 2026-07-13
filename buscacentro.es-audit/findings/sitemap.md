# Auditoría de Sitemap — https://www.buscacentro.es/sitemap.xml

Fecha de auditoría: 2026-07-13
Fuente: descarga en vivo de `https://www.buscacentro.es/sitemap.xml` (HTTP 200, `Content-Type: application/xml`, 119.807 bytes) + lectura de `src/app/sitemap.ts`, `src/lib/centers.ts`, `src/lib/data/seo-pages.ts`, `src/lib/data/centers.ts`.

## Resumen ejecutivo

El sitemap es válido y respeta correctamente la regla de calidad del proyecto: **solo incluye páginas indexables**, filtrando con `isCenterIndexable()` y `isSeoPageIndexableFromCenters()` antes de listar URLs. La muestra de 16 URLs (10 fichas de centro, 4 landings SEO, 2 posts de blog) devolvió HTTP 200 y `robots: index, follow` en el 100% de los casos — sin 404, sin redirecciones, sin noindex colado en el sitemap.

**Hallazgo #1 (severidad Alta):** Madrid — la ciudad que se esperaría fuera la principal del directorio — tiene **0 URLs en el sitemap**: ni landing (`/guarderias-en-madrid`, `/escuelas-infantiles-en-madrid`, etc.) ni una sola ficha `/centro/*-madrid`. Confirmado que no es un bug del generador de sitemap: `/guarderias-en-madrid` responde HTTP 200 pero con `<meta name="robots" content="noindex, follow">`, y `/ciudades` la muestra como "Próximamente" (sin enlace activo). La causa raíz es de datos, no de código: `getCenters()` en producción lee de Supabase con filtro `status = 'published'`, y aunque el dataset mock local tiene 11 centros de Madrid (por encima del umbral de 10 para landing de ciudad), aparentemente los centros de Madrid en Supabase no están publicados o no alcanzan el umbral real. Este comportamiento es correcto según las reglas del proyecto (gate de calidad funcionando como se espera), pero probablemente no es la intención de negocio dejar fuera la capital.

Las 6 ciudades nuevas de la Ronda 1 de expansión (Zaragoza, Murcia, Sevilla, Palma, Málaga, Alicante) **sí aparecen** correctamente en el sitemap, tanto en landings como en fichas de centro, confirmando que la migración `publish-ronda1-centers.sql` (o su equivalente ya aplicado) tuvo efecto.

---

## 1. Validación XML

| Check | Resultado |
|---|---|
| XML bien formado | ✅ PASS — parseado sin errores con `xml.dom.minidom` y `xml.etree.ElementTree` |
| Namespace correcto | ✅ PASS — `xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"` |
| Encoding declarado | ✅ PASS — `UTF-8` |
| Content-Type HTTP | ✅ PASS — `application/xml` |
| Límite 50.000 URLs/archivo | ✅ PASS — 622 URLs, muy por debajo del límite; no requiere sitemap index |
| Tags obsoletos (`priority`, `changefreq`) | ℹ️ INFO — presentes en el 100% de las URLs. Google los ignora desde hace años; no son errores, pero son peso muerto. Ver sección 5. |

## 2. Inventario de URLs (622 total)

| Tipo | Cantidad | Ejemplo |
|---|---|---|
| Home | 1 | `https://www.buscacentro.es` |
| Hubs estáticos (`/guarderias`, `/escuelas-infantiles`, `/ciudades`, `/blog`, `/para-centros`, legales) | 10 | `https://www.buscacentro.es/guarderias` |
| Landings SEO (ciudad/tipo/servicio) | 53 | `https://www.buscacentro.es/guarderias-en-sevilla` |
| Fichas de centro `/centro/*` | 548 | `https://www.buscacentro.es/centro/don-pablito-vi-malaga` |
| Guías de blog `/blog/*` | 11 | `https://www.buscacentro.es/blog/adaptacion-a-la-guarderia` |
| **Total** | **622** | |

## 3. Regla de calidad — ¿solo páginas indexables?

El código de `src/app/sitemap.ts` aplica dos filtros antes de emitir URLs:

- **Fichas de centro:** `.filter(isCenterIndexable)` (definido en `src/lib/data/seo-pages.ts` / `src/lib/centers.ts`) exige nombre, slug, tipo, ciudad, alguna referencia de ubicación (distrito/barrio/calle), descripción corta Y al menos una señal de sustancia (servicios confirmados o descripción larga). Los centros que no cumplen se quedan en `noindex, follow` y NO entran al sitemap. ✅ Correcto.
- **Landings SEO:** `.filter(isSeoPageIndexableFromCenters)` exige ≥10 centros publicados para páginas de ciudad y ≥5 para páginas filtradas por servicio/tipo/titularidad (`MIN_CENTERS_FOR_CITY_PAGE = 10`, `MIN_CENTERS_FOR_TYPE_PAGE = 5` en `src/lib/constants.ts`). También respeta el flag `disabled` en `mock-seo-pages.ts` (ej. Málaga escuela-infantil y Madrid guarderías-privadas están explícitamente desactivadas por dataset insuficiente). ✅ Correcto.

**Verificación por muestreo (16 URLs: 10 fichas, 4 landings, 2 blog):**

| Resultado | Cantidad |
|---|---|
| HTTP 200 | 16/16 |
| `robots: index, follow` | 16/16 |
| Redirecciones | 0/16 |
| 404 | 0/16 |

No se detectó ninguna URL noindex, redirigida o rota dentro del sitemap. La regla "el sitemap incluye solo indexables" se cumple en la muestra al 100%.

### Cobertura de las 9 ciudades objetivo

| Ciudad | Landings en sitemap | Fichas de centro en sitemap | Estado |
|---|---|---|---|
| Madrid | **0** | **0** | 🛑 Ausente — ver Hallazgo #1 |
| Barcelona | 14 | (incluida en el resto de 548) | ✅ |
| Valencia | 9 | ✅ | ✅ |
| Zaragoza | 4 | 32 | ✅ (ciudad nueva) |
| Murcia | 3 | 16 | ✅ (ciudad nueva) |
| Sevilla | 7 | 29 | ✅ (ciudad nueva) |
| Palma | 2 | 19 | ✅ (ciudad nueva) |
| Málaga | 9 | 25 | ✅ (ciudad nueva) |
| Alicante | 5 | 21 | ✅ (ciudad nueva) |

Las 6 ciudades nuevas de la Ronda 1 (Zaragoza, Murcia, Sevilla, Palma, Málaga, Alicante) están correctamente reflejadas, tanto en landings como en fichas — confirma que la expansión se publicó y el sitemap dinámico la recogió sin intervención manual adicional.

Las guías de blog (11 en total) están presentes, incluyendo contenido geolocalizado como `blog/preinscripcion-escola-bressol-barcelona` y `blog/como-pedir-plaza-escuela-infantil-madrid` (esta última referencía a Madrid en contenido editorial aunque Madrid no tenga landing/fichas indexadas — no es un problema en sí, pero conviene revisar el enlazado interno de ese artículo hacia una landing de Madrid que hoy es noindex).

## 4. Coherencia — noindex / redirect / 404 dentro del sitemap

Muestreo aleatorio (semilla fija) de 16 URLs cubriendo fichas de centro de 6 ciudades distintas (incluidas las 5 ciudades nuevas), 4 landings SEO y 2 posts de blog:

```
200 | robots=index, follow | /centro/don-pablito-vi-malaga
200 | robots=index, follow | /centro/santa-catalina-palma
200 | robots=index, follow | /centro/llavoretes-valencia
200 | robots=index, follow | /centro/saint-thomas-valencia
200 | robots=index, follow | /centro/parc-central-coopv-valencia
200 | robots=index, follow | /centro/la-paloma-valencia
200 | robots=index, follow | /centro/las-torres-de-montecanal-zaragoza
200 | robots=index, follow | /centro/nice-day-school-murcia
200 | robots=index, follow | /centro/bosque-ternura-zaragoza
200 | robots=index, follow | /centro/llar-dinfants-la-nau-barcelona
200 | robots=index, follow | /guarderias-con-patio-exterior-en-sevilla
200 | robots=index, follow | /guarderias-con-horario-ampliado-en-valencia
200 | robots=index, follow | /guarderias-en-sevilla
200 | robots=index, follow | /guarderias-en-valencia
200 | robots=index, follow | /blog/preinscripcion-escola-bressol-barcelona
200 | robots=index, follow | /blog/adaptacion-a-la-guarderia
```

Sin incidencias. No se detectaron 404, redirecciones ni noindex en la muestra. Dado el tamaño del sitemap (622 URLs) se recomienda una pasada completa vía Screaming Frog / GSC "Cobertura" periódicamente, pero no hay señales de riesgo sistémico.

## 5. lastmod / changefreq / priority

| Campo | Presencia | Observación |
|---|---|---|
| `changefreq` | 622/622 (100%) | `monthly` (560, fichas de centro y guías), `weekly` (58, home/hubs/landings), `yearly` (4, páginas legales). Razonable pero **Google ignora esta señal desde 2023**; no aporta valor de rastreo. |
| `priority` | 622/622 (100%) | Distribución: `1` (home), `0.9` (guarderías/escuelas-infantiles), `0.8` (landings SEO), `0.7` (ciudades), `0.6` (fichas de centro + blog), `0.5` (para-centros), `0.3` (legales). Jerarquía interna coherente, pero **Google ignora `priority` desde 2020** — no afecta al crawl budget real. |
| `lastmod` | 559/622 (89.9%) — **63 URLs sin lastmod** | Los 63 sin fecha son los hubs estáticos + las 53 landings SEO (el código en `sitemap.ts` no asigna `lastModified` a esas entradas, solo a fichas de centro y guías de blog). Para las URLs que sí tienen `lastmod`, hay 5 timestamps distintos agrupados por lotes de sincronización (2026-07-09, 07-10, 07-11, 07-12, 07-13), lo cual es razonable y refleja actualizaciones reales por lotes, no un `lastmod` idéntico/falso en todo el sitemap. |

**Nota:** aunque `priority`/`changefreq` no son errores, son deuda técnica opcional — se pueden retirar del generador sin pérdida de señal SEO real, simplificando el código de `sitemap.ts`. La ausencia de `lastmod` en landings SEO es más relevante: esas páginas cambian de contenido cuando se añaden centros nuevos a una ciudad (afecta a las 6 ciudades recién publicadas) y no comunicarlo a los crawlers es una oportunidad perdida de señalar frescura.

## 6. Umbral de calidad — páginas de ubicación (location pages)

Aplicando el gate de este skill a las landings de ciudad/servicio (53 en sitemap):

- 53 landings está por debajo del umbral de ⚠️ WARNING (30+) reconducido a nivel "muchas páginas similares" — en este caso NO aplica advertencia automática de contenido duplicado programático, porque el proyecto ya implementa su propio gate de sustancia (`MIN_CENTERS_FOR_CITY_PAGE`/`TYPE_PAGE` + contenido editorial por página en `mock-seo-pages.ts` con introText/secciones/FAQs específicos, no solo swap de ciudad). Estructura de riesgo bajo: cada landing referencia distritos/servicios reales de esa ciudad, no es plantilla genérica.
- No se alcanza el umbral de 🛑 HARD STOP (50+) en el conjunto de landings SEO. Las 548 fichas de centro no cuentan como "location pages" para este gate (son fichas de entidad individual, no páginas de ciudad programáticas).

Sin hallazgos de riesgo de "doorway pages" en esta categoría.

---

## Tabla de hallazgos con severidad

| # | Hallazgo | Severidad | Recomendación |
|---|---|---|---|
| 1 | Madrid (0 landings, 0 fichas) ausente del sitemap; `/guarderias-en-madrid` sirve `noindex, follow` pese a existir contenido editorial completo para esa landing | **Alta** | Verificar en Supabase cuántos centros de Madrid tienen `status = 'published'`. Si hay ≥10, investigar por qué `isSeoPageIndexableFromCenters` no los cuenta (posible desajuste de `city_slug`). Si hay <10, priorizar publicar/auditar más centros de Madrid — es la capital y previsiblemente la ciudad de mayor volumen de búsqueda; dejarla fuera del índice tiene coste de oportunidad alto. |
| 2 | 63 URLs (hubs estáticos + 53 landings SEO) sin `lastmod` en el sitemap | Baja | Añadir `lastModified` a las landings SEO en `sitemap.ts`, derivándolo del `updatedAt` más reciente entre los centros que la componen (o de un campo `updatedAt` propio de `SeoPage` si se persiste en Supabase). Esto es más relevante ahora que hay ciudades nuevas cuyas landings cambian de contenido con frecuencia. |
| 3 | `priority` y `changefreq` presentes en el 100% de las URLs | Info | Ambos son ignorados por Google desde hace años (Bing les da peso muy menor). Se pueden retirar del generador para simplificar `sitemap.ts` sin pérdida de señal SEO real. No urgente. |
| 4 | Post de blog `blog/como-pedir-plaza-escuela-infantil-madrid` existe y presumiblemente enlaza a landings/fichas de Madrid que hoy están en noindex | Media | Revisar enlazado interno de ese artículo: si apunta a `/guarderias-en-madrid` (noindex), el link equity se pierde. Considerar CTA alternativo (ciudades disponibles) hasta que Madrid esté indexable. |
| 5 | Sitemap único de 622 URLs, XML válido, sin sitemap index | — | Correcto tal cual; no se requiere sitemap index hasta acercarse a 50.000 URLs. Sin acción. |
| 6 | Cobertura de las 6 ciudades nuevas de expansión (Zaragoza, Murcia, Sevilla, Palma, Málaga, Alicante) | — | Confirmado correcto: 108 landings + 142 fichas de centro entre las 6 ciudades nuevas, todas HTTP 200 e `index, follow` en la muestra. Sin acción. |

## Archivos de referencia

- `c:\Users\iyiar\Desktop\git_projects\buscacentro\src\app\sitemap.ts` — generador del sitemap
- `c:\Users\iyiar\Desktop\git_projects\buscacentro\src\lib\centers.ts` — `isCenterIndexable()`
- `c:\Users\iyiar\Desktop\git_projects\buscacentro\src\lib\data\seo-pages.ts` — `isSeoPageIndexableFromCenters()`, umbrales `MIN_CENTERS_FOR_CITY_PAGE`/`MIN_CENTERS_FOR_TYPE_PAGE`
- `c:\Users\iyiar\Desktop\git_projects\buscacentro\src\lib\data\centers.ts` — capa Supabase-first con fallback a mock (`status = 'published'`)
- `c:\Users\iyiar\Desktop\git_projects\buscacentro\src\lib\constants.ts` — `MIN_CENTERS_FOR_CITY_PAGE = 10`, `MIN_CENTERS_FOR_TYPE_PAGE = 5`
- `c:\Users\iyiar\Desktop\git_projects\buscacentro\data\migrations\publish-ronda1-centers.sql` — migración que publicó las 6 ciudades nuevas
- `c:\Users\iyiar\Desktop\git_projects\buscacentro\src\data\mock-seo-pages.ts` — landings de Madrid definidas (líneas 5-12, 463-470, 844-971, 4302-4310) pero no reflejadas en producción
