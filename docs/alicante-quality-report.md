# Informe de calidad — Dataset Alicante (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Alicante
(capital), análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza,
Murcia, Sevilla y Palma. No se ha tocado ninguna de esas ciudades, el schema, el
código de la app ni Supabase. No se ha ejecutado SQL. No se ha activado
indexación real (esto es un dataset de trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Alicante capital) | 37 (5 públicos + 32 privados) |
| **Centros incluidos en el dataset final** | **37** |
| Centros excluidos (motivo documentado) | 0 |
| Fuentes primarias usadas | 2 principales: "Centres docents de la Comunitat Valenciana" (Generalitat Valenciana, portal dadesobertes.gva.es) y web oficial del Ayuntamiento de Alicante (Patronato Municipal de Educación Infantil) — más webs propias de 17 centros privados |

### Composición del dataset final (37)

| Grupo | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, titularidad Generalitat Valenciana (EI Benacantil, EI El Tossalet, EI Rayuela) | 3 | público | escuela-infantil |
| Público, titularidad municipal (Patronato Municipal de Educación Infantil, Ayuntamiento de Alicante: Els Xiquets, Siete Enanitos) | 2 | público | escuela-infantil |
| Privado, con al menos un servicio confirmado por web oficial propia | 17 | privado | guardería |
| Privado, sin servicio confirmado por fuente oficial | 15 | privado | guardería |

### Clasificación `type`: guardería vs. escuela infantil

Se aplicó el mismo criterio que en Madrid, Barcelona, Valencia, Zaragoza, Murcia,
Sevilla y Palma: titularidad pública o gestión institucional consolidada →
`escuela-infantil`; centros privados de gestión individual/empresarial →
`guarderia`. En Alicante esto coincide exactamente con la frontera público/
privado observada en la fuente oficial: los 5 centros públicos (3 de la
Generalitat + 2 municipales) son `escuela-infantil`; los 32 centros privados son
`guarderia`.

### Ownership

| Ownership | Cantidad | Criterio |
|---|---|---|
| Público | 5 | `regimen = "PÚB."` en la fuente oficial (3 de titularidad `GENERALITAT VALENCIANA` + 2 de titularidad `AJUNTAMENT D'ALACANT`) |
| Privado | 32 | `regimen = "PRIV."` en la fuente oficial |
| Concertado | 0 | Ningún registro `regimen = "PRIV. CONC."` apareció en el subconjunto filtrado de Alicante para primer ciclo de infantil. El valor `concertado` del enum `CenterOwnership` **no se ha usado para ningún centro** de este dataset, siguiendo el criterio estricto ya corregido en Sevilla: solo se usaría con fuente oficial que confirmara un concierto educativo real y formal para primer ciclo, no una simple adhesión a un programa de subvención — y en este caso ni siquiera hay indicio de adhesión a ningún programa, porque el propio registro no marcó ningún centro alicantino como `PRIV. CONC.` |

---

## 2. Resolución de centros excluidos

**Ningún centro fue excluido en este sprint.** Los 37 candidatos evaluados
superaron el umbral mínimo de verificación del proyecto: los 37 tienen teléfono
confirmado directamente en la fuente oficial de la Generalitat Valenciana (100%),
además de dirección, titularidad y coordenadas verificables en el 100% de los
casos.

El archivo `data/enrichment/alicante-centers-excluded.json` existe con la
estructura estándar del proyecto pero con `centers: []`, documentando que la
comprobación se realizó y no encontró candidatos por debajo del umbral mínimo.

---

## 3. Calidad de los datos (dataset final, 37 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 37 / 37 | **100%** |
| Email | 22 / 37 | 59.5% |
| Web | 27 / 37 | 73.0% |
| Coordenadas (lat/lng) | 37 / 37 | **100%** (de fuente oficial directa, sin incidencias de coordenadas erróneas detectadas en este subconjunto) |
| Servicios confirmados (`services` no vacío) | 21 / 37 | **56.8%** |
| `schedule` estructurado | 13 / 37 | 35.1% (los 5 públicos con horario confirmado + 8 privados con horario propio confirmado por web oficial) |
| `long_description` (único por centro) | 21 / 37 | 56.8% |
| FAQs (3-6 por centro) | 37 / 37 | 100% |
| `neighborhood_barrio` | 0 / 37 | 0% (no se localizó ninguna fuente oficial con distrito/barrio administrativo de Alicante aplicable centro a centro; ver limitación en sección 6) |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 27 | Centros con al menos un servicio confirmado, horario confirmado, o web oficial propia verificada |
| medium | 10 | Centros con solo los datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad), sin servicio/horario/web adicional confirmable |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

Siguiendo la lección documentada en `docs/checklist-calidad-nueva-ciudad.md`
sobre el incidente de plantilla única en Barcelona, para Alicante se diseñaron:

- **3 estructuras de frase distintas para `short_description`** en el grupo de
  los 5 centros públicos, rotando de forma determinista.
- **4 estructuras** para el grupo de 17 privados con servicio confirmado por web
  propia.
- **8 estructuras** para el grupo de 15 privados sin servicio confirmado.

Verificación automatizada tras la generación:

- **`short_description`: 37/37 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 37`).
- **`long_description`: 21/21 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 183 y 341 caracteres (dentro del rango
  180-450 exigido).
- Longitud de `long_description`: entre 424 y 1103 caracteres. Un centro (EI El
  Tossalet, público, con un único servicio confirmado —comedor— y sin horario
  propio distinto del general) queda en 424 caracteres, ligeramente por debajo
  del rango habitual de 600-1500 caracteres observado en otras ciudades; se ha
  mantenido así deliberadamente en vez de alargarlo con relleno genérico no
  verificado, conforme a la instrucción explícita de no rellenar
  `long_description` con contenido sin respaldo factual.
- Slugs: 37/37 únicos, sin colisiones de nombre (ningún caso de tipo "Arco Iris"
  de Sevilla en este dataset).

### Frases de apertura compartidas (control adicional de plantilla)

Se comprobaron aperturas de ≥8-9 palabras compartidas entre centros del mismo
grupo homogéneo. La plantilla base "[Nombre] es un centro privado de educación
infantil de..." (una de las 4 estructuras del grupo "privado con servicio" y una
de las 8 del grupo "privado sin servicio") se repite, como es esperable con
cualquier sistema de plantillas rotadas, para varios centros — pero el contenido
completo posterior a esa apertura (dirección, servicios citados, o ausencia de
ellos) es siempre distinto, y la verificación de unicidad del texto completo
(37/37) confirma que no hay duplicados reales.

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(0-36 meses, primer ciclo), titularidad, horario cuando está confirmado (13 de
37), servicios confirmados (comedor, bilingüe/inglés, horario ampliado, cuando
aplica) y vía de contacto. Cada ficha lleva entre 3 y 6 FAQs (núcleo fijo de 3:
ubicación, edades, titularidad; hasta 2 FAQs de servicio/horario cuando hay datos
confirmados; cierre de contacto y/o transparencia), respetando el límite máximo
de 6 indicado por el coordinador. Ninguna FAQ afirma un servicio, horario o
metodología no verificados.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se
generó `long_description` únicamente para:

- Los **5 centros públicos** (3 de titularidad Generalitat Valenciana + 2
  municipales de titularidad del Ayuntamiento de Alicante), con horario y/o
  servicios confirmados en fuente oficial.
- Los **16 centros privados** con al menos un servicio y/u horario confirmado
  por web propia (de los 17 con servicio confirmado, 16 tienen datos suficientes
  para long_description; Ciudad Infantil San Jorge también entra en este grupo).

Los **16 centros privados restantes** (15 sin ningún servicio confirmado + el
caso límite ya descrito), con datos limitados a nombre, dirección, teléfono/
email/web, titularidad y tipo según el registro oficial, **no llevan
`long_description`** — se consideró que no había datos suficientes para aportar
valor real más allá de lo ya cubierto en `short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable (`recommended_indexable`) | 21 / 37 | **56.8%** |
| No indexable (noindex, follow) | 16 / 37 | 43.2% |

Los 16 no indexables son exactamente los centros privados sin servicio
confirmado ni `long_description` (solo nombre, dirección, contacto y titularidad
según el registro oficial de la Generalitat Valenciana). Este porcentaje de
indexabilidad (56.8%) es sensiblemente más alto que el observado en Sevilla
(13.3%) o Murcia, gracias al volumen más manejable de centros privados en
Alicante capital (32, frente a 203 en Sevilla), que permitió verificar la web
propia de la mayoría dentro de un único sprint de investigación.

---

## 6. Riesgos y bloqueos conocidos

1. **16 de 32 centros privados (50%) sin servicio confirmado**: no se localizó
   web propia accesible y verificable, o la web encontrada devolvió error HTTP
   (503/403) o no permitió confirmar servicios concretos del enum con claridad
   suficiente durante esta investigación (casos concretos: Nido, Peter Pan, Kid's
   Garden, Vistahermosa Family School — este último con web que no resolvió DNS
   en el momento de la consulta pese a múltiples menciones de terceros sobre
   "inmersión en inglés" que no se han usado como fuente de verdad). No es un
   bloqueante para incluir el centro en el dataset (todos tienen al menos
   teléfono de fuente oficial), pero sí limita su indexabilidad automática. Es la
   principal oportunidad de enriquecimiento futuro del dataset de Alicante,
   idealmente mediante un segundo intento de acceso a esas webs o contacto
   directo.
2. **`neighborhood_barrio` no confirmado para ningún centro (0/37)**: no se
   localizó ninguna fuente oficial con distrito o barrio administrativo de
   Alicante aplicable centro a centro dentro del alcance de esta investigación
   (a diferencia de Sevilla, donde 17/218 centros tenían barriada mencionada
   explícitamente en la propia dirección oficial). Alicante tiene una división
   administrativa reconocible en el uso coloquial (Casco Antiguo/Centro,
   Ensanche-Diputación, Carolinas, Benalúa, Playa de San Juan, Albufereta,
   Garbinet, Ciudad de Asís-Florida-Portazgo, etc.), pero no se dispuso en este
   sprint de un callejero oficial verificable que permitiera asignar distrito por
   calle y número, por lo que **no se ha construido ningún mapeo aproximado por
   código postal** (los códigos postales de Alicante no corresponden 1:1 con
   barrios reconocibles).
3. **Discrepancia de dirección en 2 centros**: "Escuela Infantil Municipal Siete
   Enanitos" (número "18" en el registro de la Generalitat frente a "18-20-22" en
   la ficha del Ayuntamiento; se ha usado la versión municipal, más específica) y
   "Gran Via Pau I" (dirección "Calle Médico Antonio Arroyo, 2" en el registro
   oficial frente a "Plaza Juan Pablo II, 19" mencionada en la web del grupo
   Escuelas Infantiles Granvía; se ha mantenido la dirección del registro oficial
   por ser la fuente de mayor autoridad geográfica, documentando la discrepancia
   en `notes_internal`). Ninguna de las dos discrepancias afecta al municipio
   (ambas direcciones están dentro de Alicante capital), solo a la calle/número
   exactos.
4. **Ningún centro con `ownership = concertado`**: a diferencia de la corrección
   aplicada en Sevilla (donde inicialmente se había clasificado erróneamente
   centros adheridos a un programa de subvención como `concertado`), en Alicante
   el propio registro oficial de la Generalitat no marca ningún centro de primer
   ciclo como `PRIV. CONC.`, por lo que no se ha presentado ni siquiera la
   tentación de esa clasificación errónea — se documenta explícitamente para que
   quede claro que la ausencia de `concertado` en este dataset es un reflejo
   fiel de la fuente oficial, no un olvido.
5. **1 `long_description` por debajo del rango típico** (EI El Tossalet, 424
   caracteres) — ver detalle en sección 3. Es contenido factual real, no
   relleno; se mantiene así conforme a la instrucción de no generar relleno
   genérico.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-alicante.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/alicante-centers-raw.json` | Extracción sin procesar (37 filas del CSV oficial filtrado), antes de normalizar/enriquecer |
| 3 | `data/enrichment/alicante-centers.json` | Dataset final: 37 centros verificados y humanizados |
| 4 | `data/enrichment/alicante-centers-excluded.json` | 0 centros excluidos (estructura estándar, sin candidatos por debajo del umbral) |
| 5 | `data/import/alicante-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/Zaragoza/Murcia/Sevilla/Palma (37 filas) |
| 6 | `docs/alicante-quality-report.md` | Este informe |
| 7 | `docs/alicante-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-alicante-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-alicante-centers.sql` | DELETE explícito por lista de 37 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución
   manual por el propietario del proyecto, con paso a `status='published'` solo
   tras auditoría, igual que en Barcelona, Valencia, Zaragoza, Murcia, Sevilla y
   Palma.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 16
   centros privados sin servicio confirmado (en particular, reintentar el acceso
   a las webs de Nido, Peter Pan, Kid's Garden y Vistahermosa Family School, que
   fallaron por errores HTTP/DNS puntuales durante esta investigación, no por
   ausencia de web propia); resolver la discrepancia de dirección de "Gran Via
   Pau I" contactando directamente con el grupo Escuelas Infantiles Granvía;
   explorar si el Ayuntamiento de Alicante publica un callejero oficial que
   permita asignar `neighborhood_barrio`/`district` de forma verificable.
3. **Diseño de landings**: con 37 centros en total, hay masa suficiente para
   landings municipales generales y varias landings de servicio, pero no para
   landings de distrito/barrio en esta fase — ver detalle completo en
   `docs/alicante-seo-report.md`.
