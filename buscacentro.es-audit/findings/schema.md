# Auditoría de Schema.org / JSON-LD — buscacentro.es

Fecha: 2026-07-13
Método: fetch HTML crudo (Next.js SSG/ISR, `X-Nextjs-Prerender: 1`, `is_spa: false` — todo el JSON-LD se sirve server-side, no requiere Playwright) de 6 páginas representativas + verificación cruzada con `curl` y con el código fuente (`src/app/[slug]/page.tsx`, `src/lib/data/seo-pages.ts`, `src/types/center.ts`).

---

## Resumen ejecutivo

**Hallazgo #1 (Crítico):** Las fichas de centro (`/centro/[slug]`) YA usan `EducationalOrganization` — no falta el tipo por completo como cabría esperar en un directorio joven — pero la implementación está **incompleta**: le faltan `latitude/longitude`, `openingHoursSpecification`, `image`, `areaServed`/`description`, `sameAs` y sobre todo un **`@type` más específico y potente para rich results locales** (`ChildCare` como subtipo, o al menos combinar con `LocalBusiness`/`Preschool` vía array de tipos). Con teléfono, dirección completa, email y coordenadas ya disponibles en el modelo de datos (`src/types/center.ts`), esto es una oportunidad de alto impacto y bajo esfuerzo: añadir `geo`, `openingHoursSpecification` y ampliar el `@type` habilita Google Maps/Local Pack y knowledge panel de forma más fiable que `EducationalOrganization` a solas.

**Hallazgo #2 (Crítico/Bug de producción, no de schema en sí):** `/guarderias-en-madrid` sirve `noindex, follow` y por tanto **0 bloques JSON-LD** en producción — pese a mostrar 20 centros, FAQs completas y breadcrumb visibles. La página gemela `/guarderias` (hub) sí indexa y sí lleva `BreadcrumbList` + `FAQPage`. El código (`src/app/[slug]/page.tsx` línea 122) suprime el `<script type="application/ld+json">` correctamente cuando `indexable === false` — el comportamiento del código es correcto por diseño (no anunciar structured data en página noindex) — pero el hecho de que la página *insignia* del sitio (guarderías en Madrid, la ciudad con más cobertura) esté noindex sugiere una discrepancia entre datos mock (usados en build) y datos reales publicados en Supabase, o un fallo en el umbral de 10 centros/ciudad. Esto no es un problema del JSON-LD en sí, pero bloquea toda ganancia de rich results en la página más importante del sitio. Se recomienda que el orquestador del audit lo derive a un hallazgo de indexación/datos, pero se documenta aquí porque determina directamente la cobertura de schema.

**Hallazgo #3 (Alto):** Ninguna landing de ciudad/tipo (`guarderias-en-madrid`, `guarderias` hub) usa `ItemList` para el listado de centros, pese a listar 20 centros con nombre, tipo, zona y servicios — oportunidad clara y de bajo riesgo.

**Hallazgo #4 (Medio):** El blog (`bono-infantil-valencia`) usa `Article` correctamente en cuanto a sintaxis, pero le falta `image` (no requerido por Google pero sí recomendado para elegibilidad de rich result con miniatura) y usa la misma `Organization` como `author` y `publisher` sin `logo` en `publisher` (requerido por Google para el ícono en resultados de Article/NewsArticle).

**Hallazgo #5 (Info, no Crítico):** `FAQPage` está presente en home, hub `/guarderias`, y ficha de centro, y el texto coincide exactamente con el contenido visible en los 2 casos verificados en detalle (home y ficha `mudarra-madrid`). Dado que Google retiró el rich result de FAQ para todos los sitios (7 mayo 2026), este markup ya no genera SERP feature — pero se recomienda **mantenerlo** porque ayuda a la citación por LLMs/IA (GEO). No se recomienda quitarlo ni añadirlo masivamente solo por SEO clásico.

---

## 1. Home — `https://www.buscacentro.es/`

### Schema detectado
Un único `<script type="application/ld+json">` con un **array de 3 nodos**, cada uno con su propio `@context`:

```json
[
  { "@context": "https://schema.org", "@type": "Organization", "name": "BuscaCentro", "legalName": "Iyan Arcega SL", "url": "https://www.buscacentro.es", "description": "..." },
  { "@context": "https://schema.org", "@type": "WebSite", "name": "BuscaCentro", "url": "https://www.buscacentro.es" },
  { "@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [ ...3 preguntas... ] }
]
```

### Validación

| Check | Organization | WebSite | FAQPage |
|---|---|---|---|
| `@context` https (no http) | ✅ | ✅ | ✅ |
| `@type` válido, no deprecado | ✅ | ✅ | ✅ (pero sin rich result desde may-2026, ver Hallazgo #5) |
| Propiedades requeridas | ✅ `name`, `url` | ✅ `name`, `url` | ✅ `mainEntity[].name/acceptedAnswer.text` |
| Sin texto placeholder | ✅ | ✅ | ✅ |
| URLs absolutas | ✅ | ✅ | — |
| FAQ visible coincide con JSON-LD | — | — | ✅ verificado, 3/3 preguntas coinciden literalmente con el HTML visible |

**Sintaxis**: válida. JSON parseable, sin errores.

### Gaps — Organization
- Falta `logo` (ImageObject) — recomendado por Google para Logo/knowledge-panel rich result y para que `publisher.logo` del blog (ver sección 5) pueda referenciarlo.
- Falta `sameAs` (redes sociales) — el modelo de datos ya tiene `CenterSocialLinks` para centros; conviene tener el equivalente a nivel Organization si BuscaCentro tiene perfiles sociales propios.
- Falta `contactPoint` (ej. email de contacto genérico) — útil para entity resolution.

### Gaps — WebSite
- Falta `potentialAction` de tipo `SearchAction` — si el sitio tiene buscador interno (hay `CenterFilters`/`SearchBox` en los componentes), esto habilita el Sitelinks Search Box y ayuda a que Google entienda la búsqueda interna del directorio.

### Severidad y recomendación

**Severidad: Media.** No hay errores, pero faltan piezas de alto ROI y bajo esfuerzo.

JSON-LD recomendado (reemplaza/añade a los 2 primeros nodos):

```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "BuscaCentro",
  "legalName": "Iyan Arcega SL",
  "url": "https://www.buscacentro.es",
  "description": "Directorio para comparar guarderías y escuelas infantiles en España por ciudad, zona y servicios.",
  "logo": "https://www.buscacentro.es/logo.png",
  "sameAs": []
}
```

```json
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "BuscaCentro",
  "url": "https://www.buscacentro.es",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://www.buscacentro.es/buscar?q={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
```
(Nota: `potentialAction` solo debe añadirse si existe una URL de búsqueda real con ese patrón de query param; si no existe, no inventarla — mejor omitir que poner una URL que no funciona.)

---

## 2. Landing de ciudad — `https://www.buscacentro.es/guarderias-en-madrid`

### Schema detectado
**Ninguno.** 0 bloques `<script type="application/ld+json">`. Verificado dos veces (vía `render_page.py --mode never` y vía `curl` directo, mismo tamaño de respuesta 149.525 bytes) para descartar error de fetch.

### Causa raíz (verificada en código)
```html
<meta name="robots" content="noindex, follow"/>
```
La página está en `noindex`. En `src/app/[slug]/page.tsx` (línea 122):

```tsx
{indexable ? (
  <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
) : null}
```

El JSON-LD (breadcrumb + FAQ, idéntico patrón al hub `/guarderias`) solo se inyecta si `indexable === true`. Esto es **correcto por diseño** — no tiene sentido anunciar structured data en una página que se le dice a Google que no indexe. El problema real es que `isSeoPageIndexableFromCenters()` (`src/lib/data/seo-pages.ts`) está devolviendo `false` para esta página en producción, pese a que la página muestra visiblemente **20 centros** — muy por encima del umbral `MIN_CENTERS_FOR_CITY_PAGE = 10` (`src/lib/constants.ts`). Verificado que la regla para páginas "puras" de ciudad (`filters: { citySlug: "madrid", centerType: "guarderia" }`, sin `service`/`ownership`) cuenta **todos** los centros de la ciudad (cualquier tipo), no solo guarderías, así que con 20 guarderías visibles el conteo total de Madrid debería superar 10 con margen.

Esto apunta a una discrepancia entre los datos usados en el build (`generateStaticParams`/`generateMetadata`, que llaman a `getCenters()` — posiblemente Supabase en producción) y lo que realmente se renderiza en la página (Server Component que sí trae 20 centros vía `getCentersByFilters`). Es decir: **la metadata (robots) y el listado de centros pueden estar leyendo de fuentes o momentos distintos**, o hay un problema de caché/ISR donde la metadata quedó congelada en un estado anterior con <10 centros.

**Esto NO es un hallazgo de schema per se, pero bloquea por completo la cobertura de structured data en la página más importante del sitio (la ciudad con más centros).** Se recomienda escalarlo como hallazgo de Indexación/Datos de alta prioridad al orquestador del audit, con este contexto técnico.

### Comparación con página hermana correcta: `/guarderias` (hub)
```json
[
  { "@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [...] },
  { "@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [...5 preguntas...] }
]
```
Esta sí es `index, follow` y ambos nodos son válidos, con `@context` propio en cada nodo (correcto).

### Gap adicional (aplica también a `/guarderias-en-madrid` una vez resuelto el noindex, y a `/guarderias`)
La página lista 20 centros con nombre, tipo, ubicación, servicios y URL de ficha (`Ver ficha`) — candidato perfecto para `ItemList`. Ni `/guarderias-en-madrid` ni `/guarderias` lo implementan.

### Severidad y recomendación

**Severidad: Crítica** (por la causa raíz de indexación que anula el schema) + **Alta** (por el `ItemList` faltante, aplicable a todas las landings de listado).

JSON-LD `ItemList` recomendado, a añadir junto a `BreadcrumbList`/`FAQPage` en `/guarderias-en-madrid` (y análogamente en `/guarderias`, `/escuelas-infantiles`, y el resto de landings `/[slug]`):

```json
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "Guarderías en Madrid",
  "numberOfItems": 20,
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "url": "https://www.buscacentro.es/centro/afuera-iii-b-madrid",
      "name": "AFUERA III B"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "url": "https://www.buscacentro.es/centro/alaria-aravaca-nursery-school-madrid",
      "name": "ALARIA ARAVACA NURSERY SCHOOL"
    }
  ]
}
```
(Generar dinámicamente `itemListElement` a partir del array `centers` ya disponible en el Server Component — mismos datos que ya se usan para renderizar `CenterFilters`. No añadir `image`/`description` extensos al `ListItem` — solo `url`, `name`, `position`, para mantenerlo ligero y evitar duplicar el `EducationalOrganization` completo que ya vive en la ficha.)

---

## 3. Ficha de centro — `https://www.buscacentro.es/centro/mudarra-madrid`

### Schema detectado
3 bloques independientes:

1. **`EducationalOrganization`**
```json
{
  "@context": "https://schema.org",
  "@type": "EducationalOrganization",
  "name": "MUDARRA",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Madrid",
    "addressCountry": "ES",
    "streetAddress": "de María Reiche, 29",
    "postalCode": "28055"
  },
  "telephone": "638899889",
  "email": "eei.mudarra.madrid@educa.madrid.org",
  "url": "http://www.educa.madrid.org/eei.mudarra.madrid"
}
```
2. **`FAQPage`** — 6 preguntas (horario ampliado, ubicación, edades, qué es, comedor, titularidad pública).
3. **`BreadcrumbList`** — Inicio → Escuelas infantiles → Madrid → MUDARRA (4 niveles, último sin `item`, correcto para el nodo actual).

### Validación

| Check | Resultado |
|---|---|
| `@context` https | ✅ en los 3 bloques |
| `@type` válido, no deprecado | ✅ `EducationalOrganization` es válido (subtipo de `Organization`), `FAQPage` válido pero sin rich result (ver abajo), `BreadcrumbList` válido |
| Propiedades requeridas mínimas | ✅ `name`, `address` presentes |
| Sin placeholders | ✅ |
| URLs absolutas | ⚠️ El `url` del centro (`http://www.educa.madrid.org/...`) es **http, no https** — es la web oficial del centro (fuera de nuestro control), no un problema de nuestro schema en sí, pero vale la pena anotarlo si algún día se normalizan URLs de terceros |
| Fechas ISO 8601 | N/A (no hay fechas en este bloque) |
| Coherencia con contenido visible | ✅ nombre, dirección, teléfono, email coinciden con el HTML visible |
| FAQ visible = FAQ JSON-LD | ✅ verificado íntegramente, 6/6 preguntas y respuestas coinciden literalmente, mismo orden |

**Sintaxis**: válida en los 3 bloques.

### GAP PRINCIPAL — el más importante de todo el audit

El `EducationalOrganization` actual es válido pero **mínimo**: solo `name`, `address`, `telephone`, `email`, `url`. La página visible, en cambio, expone muchos más datos estructurables que **no llegan al JSON-LD**:

| Dato visible en la página | ¿En modelo de datos? | ¿En JSON-LD actual? |
|---|---|---|
| Tipo de centro ("Escuela infantil pública") | ✅ `type` + `ownership` | ❌ |
| Rango de edad ("De 4 meses a 3 años") | ✅ `ageRange` | ❌ |
| Servicios (Comedor, Horario ampliado) | ✅ `services[]` | ❌ |
| Distrito/zona (Hortaleza) | ✅ `address.district` | ⚠️ parcial (solo `addressLocality: Madrid`, sin distrito) |
| Enlace a Google Maps | ✅ `address.latitude/longitude` (campo existe en tipo) | ❌ sin `geo` |
| Descripción del centro | ✅ `shortDescription`/`longDescription` | ❌ sin `description` |
| Fecha de última actualización ("3 de julio de 2026") | ✅ `updatedAt` | ❌ sin `dateModified` |

**Sobre el `@type` en sí:** `EducationalOrganization` es válido y semánticamente razonable (Google lo reconoce como subtipo de `Organization`), pero **no es un tipo de `LocalBusiness`**, por lo que no es candidato a rich results de negocio local (Local Pack / Maps / horarios / reviews de Google). Para eso Google necesita un tipo dentro del árbol `LocalBusiness` (p. ej. `ChildCare` — subtipo de `LocalBusiness`, es el tipo más específico y correcto para guarderías/escuelas infantiles de 0-3 años en la jerarquía de schema.org) o, como mínimo, declarar **ambos tipos a la vez** (`["EducationalOrganization", "ChildCare"]`, patrón de "type array" soportado por schema.org/JSON-LD) para cubrir tanto la semántica educativa como la de negocio local.

Con `ownership: "publico"`, el centro MUDARRA no tiene tarifa (no cobra matrícula pública), así que no hace falta forzar un `priceRange`; pero para centros privados/concertados (mayoría del listado de Madrid: AFUERA III B, ALARIA, etc.) sí conviene añadir `additionalType`/`priceRange` cuando el dato exista.

### Severidad y recomendación

**Severidad: Crítica.** Es la página con más volumen (fichas de centro = grueso del sitio) y la que más se beneficiaría de rich results locales (Maps, horario, posible AggregateRating/Review en el futuro cuando existan reseñas reales). Es además el hallazgo explícitamente señalado como prioritario en el encargo.

JSON-LD recomendado para `EducationalOrganization` (sustituye al actual, usando datos ya presentes en el modelo `Center`):

```json
{
  "@context": "https://schema.org",
  "@type": ["EducationalOrganization", "ChildCare"],
  "name": "MUDARRA",
  "description": "Escuela infantil pública en el distrito de Hortaleza, Madrid, que atiende el primer ciclo de Educación Infantil (0 a 3 años).",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "de María Reiche, 29",
    "addressLocality": "Madrid",
    "addressRegion": "Madrid",
    "postalCode": "28055",
    "addressCountry": "ES"
  },
  "telephone": "+34638899889",
  "email": "eei.mudarra.madrid@educa.madrid.org",
  "url": "https://www.buscacentro.es/centro/mudarra-madrid",
  "sameAs": ["http://www.educa.madrid.org/eei.mudarra.madrid"],
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 40.xxxxx,
    "longitude": -3.xxxxx
  },
  "areaServed": "Hortaleza, Madrid",
  "additionalType": "https://schema.org/Preschool",
  "dateModified": "2026-07-03"
}
```

Notas de implementación:
- **`geo`**: solo incluir si `address.latitude`/`address.longitude` están rellenos para ese centro (el campo existe en `CenterAddress` pero puede venir vacío para centros no geocodificados aún — no inventar coordenadas).
- **`url`**: cambiar de la web externa del centro (`educa.madrid.org`) a la **URL canónica de la ficha en BuscaCentro** (`https://www.buscacentro.es/centro/mudarra-madrid`), y mover la web oficial del centro a `sameAs`. Actualmente `url` apunta fuera del sitio, lo cual es incorrecto para el nodo `EducationalOrganization` que representa la ficha — el patrón estándar es que `url` sea la página donde vive la entidad (la propia ficha), y `sameAs` enlace a perfiles/webs externas relacionadas.
- **`telephone`**: normalizar a formato E.164 (`+34...`) — actualmente `"638899889"` sin prefijo de país, lo que Google puede no interpretar de forma fiable para click-to-call.
- **`openingHoursSpecification`**: el modelo tiene un campo `schedule?: string` libre (no estructurado). Si en el futuro se estructura como horas de apertura/cierre por día, añadir:
  ```json
  "openingHoursSpecification": [
    { "@type": "OpeningHoursSpecification", "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday"], "opens": "07:30", "closes": "17:00" }
  ]
  ```
  No inventar horarios — omitir esta propiedad hasta que el dato exista estructurado.
- **`hasOfferCatalog` / servicios**: los `services[]` (comedor, horario ampliado, etc.) pueden mapearse a `amenityFeature` (patrón usado en `LodgingBusiness`, también válido en general vía `additionalProperty`) o simplemente incorporarse a `description`. No hay una propiedad estándar 1:1 para "comedor escolar", así que la recomendación pragmática es mencionarlos en `description` (ya se hace) y opcionalmente:
  ```json
  "amenityFeature": [
    { "@type": "LocationFeatureSpecification", "name": "Comedor", "value": true },
    { "@type": "LocationFeatureSpecification", "name": "Horario ampliado", "value": true }
  ]
  ```

**Sobre `FAQPage` en fichas de centro**: severidad **Info**, no crítica. El markup es correcto y coincide con el contenido visible. Mantener — no aporta rich result SERP tras la retirada de mayo 2026, pero sigue siendo útil para citación por LLMs (regla del proyecto).

**Sobre `BreadcrumbList`**: correcto, sin cambios necesarios.

---

## 4. Hub — `https://www.buscacentro.es/guarderias`

### Schema detectado
Un único `<script>` con un array de 2 nodos, cada uno con su `@context` propio:
```json
[
  { "@context": "https://schema.org", "@type": "BreadcrumbList", "itemListElement": [ {"position":1,"name":"Inicio",...}, {"position":2,"name":"Guarderías",...} ] },
  { "@context": "https://schema.org", "@type": "FAQPage", "mainEntity": [ ...5 preguntas... ] }
]
```

### Validación
✅ Sintaxis válida. ✅ `@context` presente en ambos nodos del array (patrón correcto para JSON-LD multi-nodo sin `@graph`). ✅ `robots: index, follow`. No se verificó literal contra el HTML visible del hub (no se leyó el texto completo de `/guarderias`, solo se extrajo el JSON-LD), pero el patrón de FAQ es idéntico al usado en home y en la ficha, donde sí se verificó coincidencia exacta — se asume consistente dado el mismo componente `<FAQ>` reutilizado (`src/components/FAQ.tsx` referenciado en `src/app/[slug]/page.tsx` línea 216, mismo patrón usado por `/guarderias`).

### Gap
Misma oportunidad de `ItemList` que la landing de ciudad (sección 2) si `/guarderias` lista centros destacados o simplemente los tipos de landing disponibles. Si `/guarderias` es una página de categoría sin listado de centros individual, `ItemList` no aplica — no se pudo confirmar el listado completo en este pase; recomendar revisión rápida del componente de la página hub para decidir si aplica.

### Severidad y recomendación
**Severidad: Baja.** Todo correcto; única oportunidad es `ItemList` si hay listado de centros, siguiendo el mismo patrón de la sección 2.

---

## 5. Guía de blog — `https://www.buscacentro.es/blog/bono-infantil-valencia`

### Schema detectado
```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Bono Infantil en Valencia: así funciona la gratuidad del 0-3",
  "description": "Qué es el Bono Infantil de la Generalitat Valenciana, qué tramos de edad cubre, en qué centros se aplica y qué paga (y qué no) una familia en Valencia.",
  "datePublished": "2026-07-12",
  "dateModified": "2026-07-12",
  "url": "https://www.buscacentro.es/blog/bono-infantil-valencia",
  "author": { "@type": "Organization", "name": "BuscaCentro", "url": "https://www.buscacentro.es" },
  "publisher": { "@type": "Organization", "name": "BuscaCentro", "url": "https://www.buscacentro.es" }
}
```

### Validación

| Check | Resultado |
|---|---|
| `@context` https | ✅ |
| `@type` válido | ✅ `Article` es válido (nota: no se usa `BlogPosting`, pero `Article` es aceptado por Google para los mismos rich results; es una elección de tipo válida, no un error) |
| `headline` presente | ✅ (68 caracteres, dentro del límite recomendado de ~110) |
| `datePublished`/`dateModified` ISO 8601 | ✅ `2026-07-12` formato correcto |
| `author` | ✅ presente, tipo `Organization` (válido; podría ser `Person` si hubiera un autor con nombre, pero `Organization` es aceptable) |
| `publisher` | ⚠️ presente pero **sin `logo`** — Google requiere `publisher.logo` (`ImageObject`) para elegibilidad de rich results de Article |
| `image` | ❌ **ausente** — no hay ninguna imagen en toda la página (0 `<img>` tags detectados). Google considera `image` recomendado (no estrictamente obligatorio) para `Article`, pero sin él se pierde la miniatura en resultados enriquecidos y en Google Discover |
| URLs absolutas | ✅ |
| Sin placeholders | ✅ |

### Severidad y recomendación

**Severidad: Media.** El markup es sintácticamente correcto y sin errores duros, pero le falta `publisher.logo` (semi-requerido) e `image` (recomendado, y condicionado a que el blog empiece a llevar imágenes, lo cual es también una mejora de contenido más allá del schema).

JSON-LD corregido:
```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Bono Infantil en Valencia: así funciona la gratuidad del 0-3",
  "description": "Qué es el Bono Infantil de la Generalitat Valenciana, qué tramos de edad cubre, en qué centros se aplica y qué paga (y qué no) una familia en Valencia.",
  "datePublished": "2026-07-12",
  "dateModified": "2026-07-12",
  "url": "https://www.buscacentro.es/blog/bono-infantil-valencia",
  "image": "https://www.buscacentro.es/images/blog/bono-infantil-valencia.jpg",
  "author": {
    "@type": "Organization",
    "name": "BuscaCentro",
    "url": "https://www.buscacentro.es"
  },
  "publisher": {
    "@type": "Organization",
    "name": "BuscaCentro",
    "url": "https://www.buscacentro.es",
    "logo": {
      "@type": "ImageObject",
      "url": "https://www.buscacentro.es/logo.png"
    }
  }
}
```
No añadir `image` con URL inventada — solo incluir esta propiedad cuando exista una imagen real subida para el artículo. Mientras no haya imagen, `publisher.logo` sí puede añadirse ya (basta el logo del sitio, que es un asset fijo).

**No usar `HowTo`** aunque el contenido explique "cómo funciona" el bono — es contenido informativo, no procedimental paso a paso, y el rich result de `HowTo` está retirado desde septiembre 2023 de todos modos.

---

## 6. Página de ciudades — `https://www.buscacentro.es/ciudades`

### Schema detectado
```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "name": "Inicio", "item": "https://www.buscacentro.es/" },
    { "@type": "ListItem", "position": 2, "name": "Ciudades", "item": "https://www.buscacentro.es/ciudades" }
  ]
}
```

### Validación
✅ Sintaxis válida, `@context` correcto, sin placeholders, URLs absolutas.

### Gap
Si esta página lista las ciudades disponibles (Madrid, Valencia, Barcelona, etc. según el estado de expansión nacional visto en el repo), es candidata directa a `ItemList` (listado de ciudades con enlace a cada landing), igual que las landings de centros. No se inspeccionó el listado completo de ciudades en este pase, pero el patrón sería:

```json
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "Ciudades con centros disponibles en BuscaCentro",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "url": "https://www.buscacentro.es/guarderias-en-madrid", "name": "Madrid" },
    { "@type": "ListItem", "position": 2, "url": "https://www.buscacentro.es/guarderias-en-valencia", "name": "Valencia" }
  ]
}
```

### Severidad y recomendación
**Severidad: Baja.** Sin errores; oportunidad de `ItemList` si la página lista ciudades (recomendable confirmar en una pasada de UI antes de implementar).

---

## Tabla resumen de hallazgos

| # | Página | Hallazgo | Severidad | Acción |
|---|---|---|---|---|
| 1 | Ficha de centro | `EducationalOrganization` incompleto: faltan `geo`, `description`, `dateModified`, `sameAs`, `url` apunta fuera del sitio, tel sin prefijo país; falta tipo `ChildCare`/`LocalBusiness` para rich results de negocio local | **Crítica** | Ampliar JSON-LD según plantilla sección 3 |
| 2 | `/guarderias-en-madrid` | 0 JSON-LD por `noindex` inesperado pese a 20 centros visibles — probable desalineación entre datos de build/metadata y datos renderizados | **Crítica** (bloquea todo el schema de la página más importante) | Investigar `isSeoPageIndexableFromCenters` / fuente de datos de `getCenters()` en prod (fuera de alcance de este audit de schema, escalar a hallazgo de indexación) |
| 3 | Landings de listado (`/guarderias-en-madrid`, `/guarderias`, otras `/[slug]`) | Falta `ItemList` para los centros listados | **Alta** | Añadir `ItemList` según plantilla sección 2 |
| 4 | Blog | `Article.publisher` sin `logo`; sin `image` (no hay imágenes en el blog) | **Media** | Añadir `publisher.logo` ya; añadir `image` cuando existan imágenes en las guías |
| 5 | Home / Hub / Ficha | `FAQPage` presente y coincide con el contenido visible en los casos verificados | **Info** | Mantener (ayuda a GEO/IA), no aporta ya rich result SERP |
| 6 | Home | `Organization` sin `logo`/`sameAs`; `WebSite` sin `SearchAction` | **Media** | Añadir `logo`; añadir `SearchAction` solo si existe endpoint de búsqueda real |
| 7 | Ciudades | Sin errores; posible `ItemList` de ciudades | **Baja** | Confirmar si la página lista ciudades y añadir `ItemList` |

---

## Nota metodológica
Todas las páginas se sirven completamente renderizadas en el HTML crudo (Next.js App Router con SSG/ISR — cabecera `X-Nextjs-Prerender: 1`), por lo que no fue necesario Playwright (no instalado en este entorno: `ModuleNotFoundError: No module named 'playwright'`) para extraer el JSON-LD; `render_page.py --mode never` y `curl` directo dieron resultados idénticos, confirmando que no hay inyección client-side de schema en este sitio.
