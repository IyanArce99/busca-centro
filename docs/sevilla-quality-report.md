# Informe de calidad — Dataset Sevilla (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Sevilla,
análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza y Murcia. No se ha
tocado ninguna de esas cinco ciudades, el schema, el código de la app ni Supabase.
No se ha ejecutado SQL. No se ha activado indexación real (esto es un dataset de
trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Sevilla capital) | 218 (15 públicos + 203 privados) |
| **Centros incluidos en el dataset final** | **218** |
| Centros excluidos (motivo documentado) | 0 |
| Fuentes primarias usadas | 2 principales: "Centros de primer ciclo de educación infantil en Andalucía, con alumnado matriculado" (Junta de Andalucía, portal de datos abiertos) y Portal de Escolarización 0-3 años (Junta de Andalucía) — más webs propias de 7 cadenas privadas (14 sedes) |

### Composición del dataset final (218)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, red de titularidad de la Junta de Andalucía | 15 | público | escuela-infantil |
| Privado adherido al Programa de Ayuda a las Familias | 174 | privado | guardería |
| Privado no adherido | 29 | privado | guardería |

### Clasificación `type`: guardería vs. escuela infantil

Se aplicó el mismo criterio que en Madrid, Barcelona, Valencia, Zaragoza y Murcia:
titularidad pública o gestión institucional consolidada → `escuela-infantil`;
centros privados de gestión individual/familiar → `guarderia`. En Sevilla esto
coincide exactamente con la frontera público/privado observada en la fuente
oficial: los 15 centros de titularidad de la Junta de Andalucía son
`escuela-infantil`; los 203 centros privados (adheridos o no al Programa de Ayuda a
las Familias) son `guarderia`.

### Ownership

| Ownership | Cantidad | Criterio |
|---|---|---|
| Público | 15 | `D_TIPO = "Público"` en la fuente oficial (red de Escuelas Infantiles de titularidad de la Junta de Andalucía) |
| Privado | 174 | `D_TIPO = "Privado"` y `priv_adh_inf1 = "S"` (adherido al Programa de Ayuda a las Familias) |
| Privado | 29 | `D_TIPO = "Privado"` y `priv_noadh_inf1 = "S"` (no adherido, sin bonificación pública) |

**Corrección post-auditoría (2026-07-12)**: la versión inicial de este dataset
clasificaba los 174 centros adheridos al Programa de Ayuda a las Familias como
`ownership: concertado`. La auditoría de calidad rechazó esa clasificación
(incidencia S-1, severidad `high`) por tres motivos verificados: (1) el propio
`short_description`/`long_description`/FAQs de esas 174 fichas dice explícitamente
"titularidad privada", lo que contradice el badge "Concertada" que renderiza
`formatOwnership` (`src/lib/format.ts`) cuando `ownership = concertado`; (2)
Andalucía no tiene concierto educativo formal para el primer ciclo de infantil
(0-3 años) — la adhesión al Programa de Ayuda a las Familias es una **subvención a
la demanda**, no un concierto; (3) diverge del precedente ya aprobado e integrado
en Zaragoza y Murcia, donde todos los centros privados (subvencionados/adheridos a
redes públicas o no) se clasificaron uniformemente como `ownership: privado`, sin
usar nunca `concertado`. Los 174 registros se corrigieron a `ownership: privado`
en el JSON, el CSV y el SQL de inserción. El texto de `short_description`,
`long_description` y FAQs de esos centros **no se modificó** — ya describía
correctamente la titularidad privada y la adhesión al programa de subvención, y
sigue siendo el contenido que documenta esa adhesión de forma factual.

---

## 2. Resolución de centros excluidos

**Ningún centro fue excluido en este sprint.** Los 218 candidatos evaluados
superaron el umbral mínimo de verificación del proyecto: los 218 tienen al menos
teléfono o email confirmado directamente en la fuente oficial de la Junta de
Andalucía (214/218 con teléfono, 218/218 con email), además de dirección,
titularidad y coordenadas verificables en 217 de los 218 casos.

El archivo `data/enrichment/sevilla-centers-excluded.json` existe con la
estructura estándar del proyecto pero con `centers: []`, documentando que la
comprobación se realizó y no encontró candidatos por debajo del umbral mínimo.

---

## 3. Calidad de los datos (dataset final, 218 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 214 / 218 | 98.2% |
| Email | 218 / 218 | **100%** |
| Web | 14 / 218 | 6.4% |
| Coordenadas (lat/lng) | 217 / 218 | 99.5% (de fuente oficial directa; 1 centro con longitud errónea en la propia fuente se dejó sin coordenadas en vez de inventarlas — ver incidencia en `docs/data-sources-sevilla.md`) |
| Servicios confirmados (`services` no vacío) | 29 / 218 | **13.3%** |
| `schedule` estructurado | 19 / 218 | 8.7% (las 15 públicas con horario oficial homogéneo de la Junta de Andalucía + 4 privadas con horario propio confirmado por web oficial) |
| `long_description` (único por centro) | 29 / 218 | 13.3% |
| FAQs (5-6 por centro) | 218 / 218 | 100% |
| `neighborhood_barrio` | 17 / 218 | 7.8% (barriadas/urbanizaciones mencionadas explícitamente en la dirección oficial de la propia fuente, nunca inferidas por código postal) |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 29 | Los 15 centros públicos (horario y proceso de admisión confirmados en fuente oficial homogénea) + 14 centros privados con servicio confirmado por web propia |
| medium | 189 | Privados con solo los datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad, adhesión), sin servicios adicionales confirmables |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

Siguiendo la lección documentada en `docs/checklist-calidad-nueva-ciudad.md` sobre
el incidente de plantilla única en Barcelona, para Sevilla se diseñaron:

- **4 estructuras de frase distintas para `short_description`** en el grupo de las
  15 escuelas públicas, rotando de forma determinista por hash de nombre+dirección.
- **6 estructuras** para el grupo mayoritario de privados sin servicio confirmado
  (189 centros).
- **4 estructuras** para el grupo de privados con servicio confirmado por web
  propia (14 centros).

Verificación automatizada tras la generación:

- **`short_description`: 218/218 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 218`).
- **`long_description`: 29/29 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 211 y 371 caracteres, media 310 (dentro
  del rango 180-450 exigido).
- Longitud de `long_description`: entre 722 y 1214 caracteres (dentro del rango
  600-1500 exigido).
- Slugs: 218/218 únicos, incluyendo la resolución manual de una colisión real
  (dos centros distintos llamados "Arco Iris", con distinta dirección, teléfono y
  email, diferenciados como `arco-iris-los-principes-sevilla` y
  `arco-iris-azorin-sevilla`).

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(4-36 meses, según fuente oficial homogénea del primer ciclo andaluz), titularidad
y régimen de adhesión al Programa de Ayuda a las Familias, horario cuando está
confirmado (las 15 públicas + 4 privadas), servicios confirmados (comedor,
bilingüe/inglés, etc., cuando aplica) y vía de contacto. Todos los centros
incluyen una FAQ de transparencia ("¿Está verificada la información de esta
ficha?") salvo los que tienen `long_description`, donde ese contenido ya se cubre
de forma más extensa. Ninguna FAQ afirma un servicio, horario o metodología no
verificados.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **15 escuelas infantiles públicas** de titularidad de la Junta de Andalucía
  (fuente oficial homogénea y verificada: horario, comedor, proceso de admisión,
  marco de gratuidad 2025/26).
- Los **14 centros privados** con al menos un servicio confirmado por web propia
  (Gente Menuda ×4, CEI Chicle ×2, Bicho ×3, Kindergarden Jardilín ×2, Snoopy ×1,
  Arteduca Santa Clara ×1, 5ª Avenida Cartuja ×1).

Los **189 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono/email, titularidad y régimen de adhesión según el registro oficial, **no
llevan `long_description`** — se consideró que no había datos suficientes para
aportar valor real más allá de lo ya cubierto en `short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 29 / 218 | 13.3% |
| No indexable (noindex, follow) | 189 / 218 | 86.7% |

Los 189 no indexables son exactamente los centros privados sin servicio confirmado
ni `long_description` (solo nombre, dirección, contacto, titularidad y régimen de
adhesión según el registro oficial de la Junta de Andalucía). Este porcentaje es
más bajo que el observado en Zaragoza (54%) o Murcia, porque el volumen de centros
privados individuales en Sevilla capital (203, frente a 41 en Zaragoza) hace
inviable, dentro de un único sprint de investigación, verificar la web propia de
cada uno con el mismo rigor. Es un resultado honesto del propio gate de calidad
del proyecto, no un error: los 189 quedan crawlables e incluidos en el sitemap
como `noindex, follow` hasta que se complete su enriquecimiento en una fase
posterior, en vez de forzarlos a indexar con contenido insuficiente.

---

## 6. Riesgos y bloqueos conocidos

1. **Volumen alto de centros privados sin servicio confirmado (189 de 203, 93%)**:
   no se localizó web propia accesible y verificable para la inmensa mayoría de
   los centros privados individuales de Sevilla capital, o la web encontrada no
   confirmaba servicios concretos del enum con claridad suficiente. No es un
   bloqueante para incluir el centro en el dataset (todos tienen al menos email de
   fuente oficial, y 214/218 también teléfono), pero sí limita su indexabilidad
   automática. Es la mayor oportunidad de enriquecimiento futuro del dataset de
   Sevilla, idealmente mediante contacto telefónico/email directo o una segunda
   pasada de búsqueda dirigida centro a centro.
2. **1 registro con error de longitud en la propia fuente oficial** (`Snoopy`,
   código `41022735`, C/ Marqués de Paradas 29) — detectado por comparación con el
   rango de coordenadas del resto del municipio y documentado; se dejó sin
   coordenadas en vez de inventar o aproximar un valor. Recomendación:
   geocodificación manual verificable en una fase posterior.
3. **`neighborhood_barrio` solo confirmado para 17 de 218 centros** (7.8%), todos
   por mención explícita de barriada/urbanización en la propia dirección oficial
   de la fuente. **No existe `district` (los 11 distritos administrativos de
   Sevilla) para ningún centro del dataset** — un mapeo código postal → distrito
   no es 1:1 verificable en Sevilla (varios códigos postales cruzan más de un
   distrito) y se decidió no construir esa aproximación no verificable. Si en una
   fase posterior se dispone de una fuente cartográfica oficial (por ejemplo, el
   callejero municipal `sevilla.org/servicios/servicio-de-estadistica/callejero`,
   que permite consultar distrito por vía y número), podría completarse
   centro a centro.
4. **Todos los centros privados (adheridos o no al Programa de Ayuda a las
   Familias) llevan `ownership: privado`** — ver nota de corrección
   post-auditoría en la sección 1. Andalucía no tiene concierto educativo formal
   para el primer ciclo de infantil (0-3 años); la adhesión al Programa de Ayuda a
   las Familias es una subvención pública a la demanda, no un concierto, por lo
   que no justifica el valor `concertado` del enum `CenterOwnership`. El dato de
   adhesión sigue documentado de forma factual en `short_description`,
   `long_description` y FAQs de cada centro afectado, y en el campo interno
   `source_group` (`privado_adherido` / `privado_no_adherido`), solo que ya no se
   traduce al campo estructurado `ownership`.
5. **Servicios frecuentes mencionados en las webs verificadas pero no soportados
   por el enum cerrado `CenterService`**: varias webs de centros privados
   mencionan "gabinete psicopedagógico"/"servicio de pediatría" (Bicho), "huerto
   urbano" (Gente Menuda), o metodologías específicas (Montessori, enfoque
   finlandés, en Kindergarden Jardilín). Cuando existía un valor de enum
   suficientemente próximo y fielmente representativo (`orientacion-pedagogica`
   para gabinete psicopedagógico, `patio-exterior` para espacios al aire
   libre/huerto), se usó ese valor; cuando no había equivalencia razonable
   (servicio de pediatría, metodología pedagógica concreta como marca), no se
   forzó ningún valor del enum y esa información no estructurada se dejó fuera
   del dataset (no se ha inventado un servicio del enum para representarla).
6. **Grupo Snoopy: solo 1 de 4 candidatos con nombre "Snoopy" confirmado como
   perteneciente al grupo verificado**. El registro oficial de la Junta de
   Andalucía incluye 4 centros con nombre "Snoopy"/"Snoopy II"/"Snoopy 6"/"Snoopy
   8" en Sevilla capital, pero la web oficial de Grupo Snoopy (gruposnoopy.es)
   solo permitió confirmar de forma inequívoca la pertenencia de "Snoopy Centro"
   (Marqués de Paradas, 29) al grupo. Los otros tres quedan sin `services`
   confirmado, evitando la inferencia por similitud de nombre.
7. **Diferencia estructural real frente a Zaragoza y Murcia**: el Ayuntamiento de
   Sevilla no gestiona directamente una red municipal de escuelas infantiles de
   primer ciclo (a diferencia de Zaragoza o Murcia); la red pública de 0-3 años en
   Sevilla es de titularidad autonómica (Junta de Andalucía). Esto está
   documentado en `docs/data-sources-sevilla.md` para evitar cualquier confusión
   futura sobre "por qué Sevilla no tiene escuelas infantiles municipales" en el
   dataset.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-sevilla.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/sevilla-centers-raw.json` | Extracción sin procesar (218 filas), antes de deduplicar/normalizar |
| 3 | `data/enrichment/sevilla-centers.json` | Dataset final: 218 centros verificados y humanizados |
| 4 | `data/enrichment/sevilla-centers-excluded.json` | 0 centros excluidos (estructura estándar, sin candidatos por debajo del umbral) |
| 5 | `data/import/sevilla-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/Zaragoza/Murcia (218 filas) |
| 6 | `docs/sevilla-quality-report.md` | Este informe |
| 7 | `docs/sevilla-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-sevilla-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-sevilla-centers.sql` | DELETE explícito por lista de 218 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en Barcelona, Valencia, Zaragoza y Murcia.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 189
   centros privados sin servicio confirmado, idealmente mediante contacto
   telefónico/email directo (el 100% ya tiene email de fuente oficial) o una
   segunda pasada de búsqueda dirigida; geocodificar/verificar manualmente la
   coordenada del centro "Snoopy" (Marqués de Paradas); explorar el callejero
   oficial del Ayuntamiento de Sevilla para asignar `district` de forma
   verificable si se decide abordarlo en una fase posterior.
3. **Diseño de landings**: con 218 centros en total y una alta concentración de
   centros privados sin distrito confirmado, hay masa de sobra para landings
   municipales generales y varias landings de servicio, pero no para landings de
   distrito/barrio en esta fase — ver detalle completo en
   `docs/sevilla-seo-report.md`.
