# Auditoría SEO completa — buscacentro.es

**Fecha:** 2026-07-13
**Dominio:** https://www.buscacentro.es (Next.js App Router · Vercel · ~1 mes indexado)
**Objetivo de negocio:** rankear #1 en Madrid, Barcelona y Valencia para búsquedas de guarderías / escuelas infantiles.
**Datos:** Supabase (1.214 centros `published`), enriquecido con Google Search Console (rango 13 jun–13 jul 2026, propiedad `sc-domain:buscacentro.es`).

---

## SEO Health Score: **82 / 100**

> Sube de un ~74 estimado antes del fix. El salto se debe a que el hallazgo crítico #1 (Madrid fuera de índice) **ya está corregido en código** en esta sesión, pendiente solo de deploy.

| Categoría | Peso | Score | Ponderado |
|---|---|---|---|
| SEO Técnico | 22% | 85 | 18.7 |
| Calidad de contenido | 23% | 80 | 18.4 |
| On-Page SEO | 20% | 88 | 17.6 |
| Schema / datos estructurados | 10% | 78 | 7.8 |
| Rendimiento (CWV) | 10% | 80 | 8.0 |
| AI Search / GEO | 10% | 60 | 6.0 |
| Imágenes | 5% | 40 | 2.0 |
| **Total** | | | **~82** |

---

## Resumen ejecutivo

BuscaCentro tiene una **base técnica de SEO excelente para su edad**: SSG real con contenido completo en el HTML inicial (no depende de JS para los crawlers), canonicals correctos, JSON-LD válido (`ChildCare`, `FAQPage`, `BreadcrumbList`), robots.txt bien configurado y una lógica de indexación selectiva bien diseñada (`isCenterIndexable`, `isSeoPageIndexableFromCenters`) que evita contenido fino. La arquitectura es sólida y extensible.

El problema dominante del sitio era **un único bug de datos que dejaba a Madrid —la ciudad de mayor demanda— completamente fuera del índice**. Se ha diagnosticado la causa raíz real (no era lo que apuntaban los primeros análisis) y **se ha corregido en esta sesión**.

### El hallazgo crítico, ya resuelto: Madrid fuera de índice por el límite de 1000 filas de Supabase

- **Síntoma:** 0 URLs de Madrid en el sitemap (de 622 totales); `/guarderias-en-madrid` y `/escuelas-infantiles-en-madrid` servían `noindex, follow` pese a mostrar 20 y 179 centros respectivamente (muy por encima del umbral de 10).
- **Causa raíz (confirmada y reproducida):** Supabase limita cada consulta a **1000 filas por defecto**. Hay **1.214 centros `published`**, así que `getCenters()` solo recibía 1000. Como ordena por `updated_at DESC`, los 214 centros editados hace más tiempo caían fuera del corte — y los **199 de Madrid caían enteros**. Al no llegar a `getCenters()`, las landings de Madrid veían "0 centros" → `noindex`, y ninguna ficha de Madrid entraba en el sitemap. No era regresión de datos ni RLS ni build congelado: era el corte de 1000 combinado con el orden por fecha de edición, por eso "antes salía y ahora no" (cada edición de otras ciudades reordenaba qué 1000 entraban).
- **Fix aplicado:** paginación en bloques de 1000 en `getCenters()` ([src/lib/data/centers.ts](../src/lib/data/centers.ts)) → ahora devuelve los 1.214 completos. Verificado contra Supabase: Madrid pasa de 0 a 199. **También recupera trozos de otras ciudades** que estaban parcialmente cortadas (Zaragoza, Palma, etc.).
- **Refuerzo:** añadido `export const revalidate = 3600` en [sitemap.ts](../src/app/sitemap.ts), [\[slug\]/page.tsx](../src/app/[slug]/page.tsx) y [centro/\[slug\]/page.tsx](../src/app/centro/[slug]/page.tsx) para que sitemap y decisiones de index/noindex se resincronicen con Supabase sin depender de un deploy manual.
- **Daño acumulado:** mínimo. El bug lleva <5h, Google apenas ha visto Madrid en `noindex`; se recupera en el próximo rastreo tras el deploy, sin penalización arrastrada.
- **Estado:** ✅ corregido en código y verificado · ⏳ **pendiente de commit + push** para que producción lo tome.

### Lo que confirma Search Console (por qué esto importaba tanto)

- **El sitemap enviado (622 URLs) tiene `indexed: 0`** — Google aún no ha indexado nada (dominio de 1 mes). Urge reenviar el sitemap corregido.
- **La demanda de búsqueda es abrumadoramente de Madrid.** Las páginas con más impresiones/clics son casi todas fichas de Madrid: `las-pleyades-madrid` (74 impresiones), `la-bola-de-cristal-madrid` (33), `rocio-durcal-madrid` (24), `alaria-*-madrid`, `mudarra-madrid`... Google ya mostraba impresiones de Madrid mientras le servíamos `noindex`. **El fix cae exactamente donde está la demanda.**
- Muchas fichas de Madrid están en **posición 40–80** — coherente con haber estado fuera del sitemap y con la landing de ciudad en `noindex` (contexto temático debilitado). Deberían consolidar al reindexar.
- Las únicas queries con clic son **navegacionales por nombre de centro** ("escuela infantil mudarra", "escuela infantil pleyades", "rocio durcal escuela infantil"). Las keywords cabeza genéricas están en pos ~50, en evaluación normal, no penalizadas.

---

## 1. SEO Técnico — 85/100

**Lo que funciona:** SSG confirmado (`x-nextjs-prerender: 1`, contenido en HTML crudo), HTTPS forzado (308 http→https y non-www→www), HSTS presente, canonicals absolutos y self-referencing correctos, 404 real (no soft-404), viewport móvil correcto, JSON-LD válido y omitido correctamente en páginas `noindex`.

| # | Hallazgo | Severidad | Estado |
|---|---|---|---|
| 1 | Madrid fuera de índice por límite de 1000 filas de Supabase | ~~CRÍTICO~~ | ✅ **Corregido** (paginación + revalidate), pendiente deploy |
| 2 | Faltan cabeceras de seguridad HTTP (CSP, X-Content-Type-Options, X-Frame-Options, Referrer-Policy). Solo HSTS presente | Alta | Abierto |
| 3 | No hay IndexNow (Bing/Yandex) — `/indexnow-key.txt` da 404 | Media | Abierto |
| 4 | SSG puro sin ISR acoplaba "publicar en Supabase" a "hacer deploy" | Media | ✅ Mitigado con `revalidate` |
| 5 | Migración `publish-ronda1-centers.sql` — control de versiones | Baja | Ya ejecutada por el usuario |

## 2. Calidad de contenido — 80/100

**Lo que funciona:** copy editorial específico por landing (introText/secciones/FAQs propios, no plantilla con swap de ciudad), 11 guías de blog con datos reales y actuales de 2026 (cheque guardería 177-283€, plazos de admisión, Bono Infantil Valencia, tarificación social Barcelona), tono factual sin superlativos no verificables (cumple `AGENTS.md`).

| # | Hallazgo | Severidad |
|---|---|---|
| 1 | Guía `/blog/que-es-el-cheque-guarderia` corta (~760 palabras) frente a las guías líder del nicho; falta tabla de tramos de renta y enlace al trámite oficial | Media |
| 2 | Cero interlinking blog ↔ landings de ciudad: las guías mencionan Madrid/Barcelona/Valencia pero no enlazan a sus landings, y las landings no enlazan a las guías | Media |
| 3 | Las landings de ciudad no incluyen ninguna cifra citable (precio, plazo) — esos datos viven aislados en el blog | Media |

## 3. On-Page SEO — 88/100

**Lo que funciona:** URLs limpias y semánticas, un solo H1 por página, breadcrumbs, metadata por página, títulos y descripciones diferenciados. Tras el fix del layout, las referencias a "solo 3 ciudades" se sustituyeron por lógica que surfacea automáticamente las ciudades con centros publicados.

| # | Hallazgo | Severidad |
|---|---|---|
| 1 | 63 URLs (hubs + landings SEO) sin `lastmod` en el sitemap — oportunidad perdida de señalar frescura, relevante ahora con ciudades nuevas | Baja |
| 2 | `priority`/`changefreq` en el 100% de URLs — Google los ignora; deuda técnica opcional | Info |

## 4. Schema / datos estructurados — 78/100

**Lo que funciona:** `ChildCare`, `FAQPage`, `BreadcrumbList` en fichas; `Article` en guías; `Organization`/`WebSite`/`FAQPage` en home. Válido y bien tipado.

| # | Hallazgo | Severidad |
|---|---|---|
| 1 | `FAQPage` solo en la home. Las landings de ciudad tienen FAQ **visual** pero sin schema; las guías de blog solo tienen `Article` (sin `FAQPage`/`HowTo`) | Alta |
| 2 | `Organization` sin `sameAs`, `logo` ni `contactPoint` — señal de marca débil para buscadores e IA | Alta |
| 3 | Índice `/blog` sin `Blog`/`ItemList` schema | Media |

## 5. Rendimiento (CWV) — 80/100 (estimación lab)

Fuentes con `preload`, SSG (buen LCP de texto esperado). Sin credenciales CrUX no hay datos de campo — recomendado Lighthouse/PSI cuando haya tráfico suficiente para CrUX.

## 6. AI Search / GEO — 60/100

**Lo que funciona:** crawlers de IA permitidos (GPTBot, ClaudeBot, PerplexityBot reciben 200 + HTML completo por SSR). Guías con datos concretos y fechados = buen material citable.

| # | Hallazgo | Severidad |
|---|---|---|
| 1 | No existe `llms.txt` (404) | Media-Alta |
| 2 | Sin `sameAs`/menciones de marca externas — dimensión de autoridad débil (esperable en dominio de 1 mes) | Alta (lenta de corregir) |
| 3 | Sin contenido multimodal (vídeo/tablas/imágenes con datos) — YouTube es la señal más fuerte de citación IA | Media (largo plazo) |

## 7. Imágenes — 40/100

Ninguna `<img>` detectada en las fichas muestreadas pese a existir el campo `Center.images`. Fichas sin foto = menos atractivas en SERP y sin opción de rich results de imagen. Priorizar ≥1 imagen por ficha con `next/image` (width/height fijos para evitar CLS).

---

## Análisis SXO — ¿qué keywords son realmente batibles?

(SXO Gap Score independiente: 34/100 — no es calidad de contenido, es correspondencia página↔intención + madurez de dominio.)

| Keyword | Alineamiento | ¿Top 3 realista? | Acción |
|---|---|---|---|
| **guarderías con comedor en barcelona** | ✅ El mejor del set | **Sí, 3-6 meses** — SERP dominada por negocios individuales de nicho, no instituciones | **Landing prioritaria**: enlaces internos, schema de servicio, FAQ de alérgenos |
| guarderías en madrid | Formato correcto (era noindex) | Sí, una vez indexada + autoridad | ✅ Desbloqueada por el fix; ahora es cuestión de autoridad |
| cheque guardería madrid | ✅ Formato guía correcto | Condicional | Ampliar profundidad + FAQPage schema + tabla de tramos |
| escuelas infantiles madrid | ❌ SERP institucional (comunidad.madrid, madrid.es) | No en forma pura | No perseguir la keyword madre; ir a long-tail (barrio+servicio) |
| escola bressol barcelona | ❌ Mismatch de **idioma** (catalán) | No sin landing en catalán | Decisión de producto: crear landing catalana o descartar |
| mejores guarderías madrid | ❌ Página inexistente; Micole satura con rankings | No sin metodología propia | No fabricar ranking (viola reglas de copy); guía "cómo elegir" |

**Conclusión SXO:** la apuesta ganadora a plazo razonable es **"guarderías con comedor en barcelona"**. Para Madrid, el fix desbloquea la competición, pero el techo lo pone la autoridad de dominio (meses), no la plantilla.

---

## Notas metodológicas

- Verificación en vivo con `curl` (fetch crudo sin JS) contra producción + lectura de código fuente para confirmar causa raíz, no solo síntoma.
- Causa raíz de Madrid **reproducida** ejecutando la query exacta de `getCenters()` contra Supabase (con y sin paginación) — no es una hipótesis.
- Datos de GSC vía MCP (`sc-domain:buscacentro.es`, permiso siteRestrictedUser), rango 13 jun–13 jul 2026.
- Sin credenciales CrUX/PSI → CWV es estimación lab, no campo.
- Los primeros findings de los especialistas atribuyeron Madrid a "datos no publicados en Supabase"; ese diagnóstico quedó **superado** por la investigación en vivo de esta sesión (los 199 están `published`; el problema era el límite de 1000).
