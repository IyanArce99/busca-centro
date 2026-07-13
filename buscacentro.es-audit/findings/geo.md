# GEO Audit — buscacentro.es

Fecha: 2026-07-13
Alcance: robots.txt, llms.txt, homepage, `/guarderias-en-madrid`, `/blog`, `/blog/bono-infantil-valencia`, `/blog/como-pedir-plaza-escuela-infantil-madrid`, `/blog/cuanto-cuesta-una-guarderia`, sitemap.xml.
Método: fetch directo con distintos User-Agents (GPTBot, ClaudeBot, curl genérico) + inspección de HTML servido en primera respuesta (SSR) y bloques JSON-LD.

---

## GEO Readiness Score: 52/100

| Dimensión | Peso | Score | Ponderado |
|---|---|---|---|
| Citability | 25% | 62/100 | 15.5 |
| Structural Readability | 20% | 55/100 | 11.0 |
| Multi-Modal Content | 15% | 20/100 | 3.0 |
| Authority & Brand Signals | 20% | 25/100 | 5.0 |
| Technical Accessibility | 20% | 90/100 | 18.0 |
| **Total** | | | **~52.5/100** |

---

## Hallazgo #1 — [INFO/POSITIVO] Accesibilidad para crawlers de IA: correcta, sin bloqueos

**Severidad: OK (no requiere acción urgente, pero falta explicitud)**

`robots.txt` actual:
```
User-Agent: *
Allow: /
Sitemap: https://www.buscacentro.es/sitemap.xml
```

No hay ninguna regla `Disallow`, y no hay reglas específicas por user-agent. Esto significa que **GPTBot, OAI-SearchBot, ClaudeBot, PerplexityBot, Google-Extended, CCBot, anthropic-ai y cohere-ai están todos permitidos de facto** (el wildcard `*` los cubre a todos, incluidos los que la guía recomienda considerar bloquear solo para entrenamiento).

Verificado con fetch directo simulando `GPTBot/1.0` y `ClaudeBot/1.0`: ambos reciben HTTP 200 y el HTML completo (43-46 KB), sin diferencias de tratamiento.

Además, el sitio usa **Next.js con SSR real**: el contenido del `<article>`, los headings y el JSON-LD `Article` están presentes en la respuesta HTML inicial (antes de ejecutar JS). Esto es ideal para crawlers de IA, que en su mayoría no ejecutan JavaScript. No es una SPA con shell vacío — confirmado en `/blog/bono-infantil-valencia` y `/guarderias-en-madrid`.

**Recomendación:** Ninguna acción crítica. Opcionalmente, hacer explícitas las reglas por user-agent (Allow explícito para GPTBot/ClaudeBot/PerplexityBot/OAI-SearchBot, y decidir conscientemente si se quiere bloquear CCBot/anthropic-ai/cohere-ai para uso exclusivo de entrenamiento vs. bots de búsqueda). Esto no cambia el acceso actual pero deja constancia de intención y facilita auditorías futuras.
**Esfuerzo:** Bajo (15 min).

---

## Hallazgo #2 — [ALTA] No existe `llms.txt` ni RSL 1.0

**Severidad: Media-Alta**

`https://www.buscacentro.es/llms.txt` → HTTP 404
`https://www.buscacentro.es/llms-full.txt` → HTTP 404

No hay ningún archivo de licenciamiento RSL 1.0 tampoco. El sitio no ofrece a los agentes de IA un mapa curado de contenido citable (que sería especialmente valioso aquí: 10 guías de blog + landings por ciudad/tipo).

**Recomendación:** Crear `/llms.txt` con:
- Descripción de una línea de BuscaCentro (directorio de guarderías/escuelas infantiles en España)
- Enlaces a las guías de blog más citables (bono infantil Valencia, cheque guardería, cómo pedir plaza Madrid, cuánto cuesta guardería, preinscripción Barcelona)
- Enlaces a las landings de ciudad principales
- Nota de licencia de uso del contenido (aunque sea informal, hasta definir RSL 1.0 formalmente)

**Esfuerzo:** Bajo (1-2h, es contenido estático, no requiere cambios de arquitectura).

---

## Hallazgo #3 — [ALTA] FAQPage schema solo existe en la homepage — ausente en landings de ciudad y en las guías de blog

**Severidad: Alta**

Verificado por inspección de JSON-LD en cada tipo de página:

| Página | JSON-LD presente | Tipos |
|---|---|---|
| `/` (home) | Sí | `Organization`, `WebSite`, `FAQPage` (3 preguntas) |
| `/guarderias-en-madrid` | **No — cero bloques JSON-LD** | — |
| `/blog/bono-infantil-valencia` | Sí, pero solo | `Article` |
| `/blog/como-pedir-plaza-escuela-infantil-madrid` | Sí, pero solo | `Article` |
| `/blog/cuanto-cuesta-una-guarderia` | Sí, pero solo | `Article` |
| `/blog` (índice) | **No — cero bloques JSON-LD** | — |

Esto es un desajuste importante entre contenido y marcado:

1. **La landing `/guarderias-en-madrid` sí tiene una sección visual "Preguntas frecuentes sobre guarderías en Madrid"** (5 preguntas, verificado en el HTML) **pero sin `FAQPage` schema**. Es contenido de FAQ invisible para extracción estructurada por un motor de IA, aunque sea legible en texto plano. Además esas preguntas son genéricas/navegacionales ("¿Cómo encuentro una guardería con BuscaCentro?", "¿Puedo buscar por distrito?") y no responden preguntas informacionales reales como "¿cuánto cuesta una guardería en Madrid?" — que es justo la query objetivo mencionada en el contexto de esta auditoría.

2. **Las 3 guías de blog analizadas (que son el contenido más citable y con datos concretos de 2026) usan únicamente schema `Article`, sin `FAQPage` ni `HowTo`.** Dado que su contenido está organizado en secciones tipo pregunta-respuesta implícita ("Cuándo se pide: el plazo de primavera", "Cómo funciona el baremo de puntos"), serían candidatas naturales para añadir `FAQPage` o `HowTo` schema adicional (Article + FAQPage no son mutuamente excluyentes) sin rehacer el contenido.

3. Las 3 preguntas de FAQ en la home son correctas en formato (persona-respuesta autocontenida, 25-28 palabras) pero tratan sobre el propio directorio ("¿Qué es BuscaCentro?", "¿Los datos están verificados?"), no sobre las queries informacionales de alto volumen (precios, plazos, ayudas) que sí cubren las guías de blog sin marcado FAQ.

**Recomendación (prioridad más alta de todo el informe):**
- Añadir `FAQPage` schema a las landings de ciudad, pero con preguntas reformuladas hacia intención informacional real ("¿Cuánto cuesta una guardería en Madrid?", "¿Cuándo se abre el plazo de admisión de escuela infantil pública en Madrid?"), reutilizando los datos concretos que ya existen en las guías de blog (rango 400-800€, plazo 6-17 abril, cheque 177-283€).
- Añadir `FAQPage` schema (2-4 preguntas por guía) a los 3 posts de blog analizados, extraído del propio contenido ya redactado — no requiere nueva redacción, solo estructurar 2-4 pares P/R por post con datos ya presentes en el texto.
- Añadir `FAQPage`/`ItemList` al índice `/blog`.

**Esfuerzo:** Medio (requiere tocar los componentes de landing de ciudad y de blog post — probablemente `src/app/[slug]/page.tsx` y `src/app/blog/[slug]/page.tsx` o equivalentes — para inyectar el schema; el contenido textual de las respuestas ya existe en el copy actual).

---

## Hallazgo #4 — [ALTA] Entidad `Organization` sin `sameAs` — señal de marca débil para IA

**Severidad: Alta**

El JSON-LD `Organization` de la home es:
```json
{"@context":"https://schema.org","@type":"Organization","name":"BuscaCentro","legalName":"Iyan Arcega SL","url":"https://www.buscacentro.es","description":"..."}
```

No incluye `sameAs` (enlaces a perfiles verificables: LinkedIn, redes sociales, Wikipedia, etc.), ni `logo`, ni `contactPoint`. Combinado con:
- Dominio joven (según memoria del proyecto, expansión reciente a Barcelona/Valencia).
- Sin presencia detectada de "BuscaCentro" como entidad en fuentes de alta correlación con citación IA: no hay evidencia de menciones en YouTube (correlación ~0.737, la más fuerte), Reddit, ni entrada en Wikipedia/Wikidata.

Esto es coherente con lo esperado para un sitio nuevo, pero es la dimensión más débil del análisis (Authority & Brand Signals) y la más lenta de corregir — no se arregla solo con cambios on-page.

**Recomendación:**
- Corto plazo (on-page, bajo esfuerzo): añadir `sameAs` con los perfiles sociales que existan o se creen (LinkedIn de empresa, X/Twitter, Instagram), y `logo` al schema `Organization`.
- Medio plazo (off-page, esfuerzo alto pero mayor impacto): generar presencia citable en foros/comunidades de padres (Reddit-equivalent español, grupos de Facebook de crianza, foros de barrio) y buscar backlinks editoriales — dado que Domain Rating tiene correlación débil (~0.266) con citación IA, priorizar menciones de marca en YouTube/comunidades sobre backlinks puros de SEO tradicional.
- Considerar una entrada estructurada en directorios de empresas españolas (que alimentan grafos de entidades) para reforzar reconocimiento de "BuscaCentro" como entidad, no solo como URL.

**Esfuerzo:** Bajo para el schema (sameAs/logo, ~1h); Alto para construcción de menciones de marca (semanas/meses, esfuerzo continuo de contenido/comunidad).

---

## Hallazgo #5 — [MEDIA] Buena citabilidad de contenido en las guías de ayudas 2026, pero infrautilizada por falta de interlinking

**Severidad: Media**

Las 3 guías de blog analizadas tienen contenido de alta calidad para citación por IA:

- **Datos concretos, actuales y atribuidos**: cheque guardería Madrid 177-283€/mes (convocatoria 2026), rango privadas Madrid 400-800€/mes, tarificación social Barcelona 50-406€/mes, Bono Infantil Valencia (gratuidad tramo 2-3 años desde curso 2024-2025), plazo de admisión Madrid 6-17 abril (curso 2026-2027).
- **Respuestas bastante directas** en los primeros párrafos de cada sección (aunque los párrafos individuales rondan 40-70 palabras, más cortos que el óptimo de 134-167 — normalmente 2 párrafos por sección cubren ese rango combinados).
- **Fecha de publicación explícita** en JSON-LD `Article` (`datePublished`/`dateModified`: `2026-07-12`) — señal de frescura correcta.
- Tono factual, sin superlativos no verificables, coherente con las reglas de copy del proyecto.

Puntos débiles detectados:

1. **Headings declarativos, no en formato pregunta.** Ej.: "Cuándo se pide: el plazo de primavera" en lugar de "¿Cuándo se pide plaza en una escuela infantil pública de Madrid?". Los H2 en formato pregunta se extraen y citan más directamente por motores de IA orientados a respuestas.
2. **Cero interlinking entre las guías de blog y las landings de ciudad correspondientes.** `/blog/cuanto-cuesta-una-guarderia` menciona "Madrid", "Barcelona" y "Valencia" repetidamente pero no enlaza a `/guarderias-en-madrid`, `/guarderias-en-barcelona` ni `/guarderias-en-valencia` (0 enlaces detectados). Tampoco `/guarderias-en-madrid` enlaza a ninguna guía de blog (0 enlaces `/blog/*` detectados en esa landing). Esto debilita la señal de entidad temática consolidada que ayuda a un motor de IA a triangular que BuscaCentro es fuente autorizada tanto para "buscar centro en Madrid" como para "cuánto cuesta guardería en Madrid".
3. **La landing `/guarderias-en-madrid` no menciona ninguna cifra de precio ni plazo** en su bloque de texto SEO — el contenido más citable (precios, plazos, cuantías) vive solo en `/blog`, aislado del intento de búsqueda transaccional/local. Un usuario o motor de IA que aterrice en la landing de ciudad no encuentra ahí los datos citables que sí existen en el blog.
4. Desde la home, 2 de las 3 guías analizadas están enlazadas (`bono-infantil-valencia`, `como-pedir-plaza-escuela-infantil-madrid`), pero **falta el enlace a `/blog/cuanto-cuesta-una-guarderia`**, que es probablemente la guía con mayor potencial de captura de AI Overviews dado el volumen de la query "cuánto cuesta guardería".
5. El índice `/blog` no tiene JSON-LD (`Blog`/`ItemList`), perdiendo la oportunidad de reforzar la estructura de la sección completa como colección temática.

**Recomendación:**
- Enlazar cruzado: desde cada landing de ciudad (`/guarderias-en-{ciudad}`), añadir 1-2 enlaces contextuales a las guías de blog relevantes (precio, plazos, ayudas de esa ciudad si existen). Desde cada guía de blog, enlazar a las landings de ciudad que mencione.
- Incluir 1-2 frases con cifras concretas (rango de precio, plazo de admisión) directamente en el bloque de texto SEO de las landings de ciudad, con enlace "ver guía completa" hacia el blog post correspondiente.
- Reescribir H2/H3 de las guías en formato pregunta donde tenga sentido (p.ej. "¿Cuánto cuesta una guardería en Madrid en 2026?").
- Añadir el enlace faltante a `cuanto-cuesta-una-guarderia` desde la home.
- Añadir `Blog`/`CollectionPage` + `ItemList` schema al índice `/blog`.

**Esfuerzo:** Medio (cambios de copy y componentes existentes, sin nueva arquitectura; puede hacerse guía por guía de forma incremental).

---

## Multi-Modal Content — nota aparte

No se detectó contenido multimedia citable (vídeo, imágenes con datos, tablas) en ninguna de las páginas analizadas — todo es texto plano estructurado en `<p>`/`<h2>`. Dado que YouTube tiene la correlación más fuerte (~0.737) con citación en motores de IA, la ausencia total de vídeo es la brecha más grande de la dimensión "Multi-Modal Content" (score 20/100). No es una prioridad inmediata dado el estado actual del proyecto (MVP con datos mock, sin backend), pero debe quedar registrado como oportunidad de medio-largo plazo.

---

## Resumen de prioridades (por impacto/esfuerzo)

| # | Hallazgo | Severidad | Esfuerzo | Prioridad |
|---|---|---|---|---|
| 3 | FAQPage ausente en landings/guías, presente solo en home | Alta | Medio | **1** |
| 5 | Interlinking blog↔landings inexistente; cifras ausentes en landings | Media | Medio | **2** |
| 2 | Falta llms.txt / RSL 1.0 | Media-Alta | Bajo | **3** |
| 4 | Organization sin sameAs / señales de marca débiles | Alta | Bajo (schema) / Alto (off-page) | **4** |
| 1 | Crawlers IA permitidos (positivo) — falta explicitud de reglas | OK | Bajo | 5 (opcional) |

## Platform-specific outlook (estimación cualitativa, sin acceso a herramientas DataForSEO en esta sesión)

| Plataforma | Estado actual estimado | Razón |
|---|---|---|
| Google AI Overviews | Bajo-Medio | Contenido citable existe (guías) pero sin FAQPage/HowTo schema en esas páginas; SSR correcto ayuda a indexación/extracción |
| ChatGPT Search / OAI-SearchBot | Bajo | Sitio muy joven, sin señales de marca externas; acceso técnico no es el problema |
| Perplexity | Bajo-Medio | Perplexity valora fuertemente datos concretos con fecha — las guías de 2026 son un buen fit, pero falta volumen de menciones externas |
| Bing Copilot | Bajo | Mismo patrón: contenido correcto, autoridad de marca insuficiente aún |

No se usaron herramientas DataForSEO (`ai_optimization_chat_gpt_scraper`, `ai_opt_llm_ment_search`) en esta sesión — no estaban disponibles como MCP tools en este entorno. Las puntuaciones de plataforma son cualitativas, basadas en los criterios de la skill, no en datos de citación en vivo.
