# Informe de calidad — Dataset Córdoba (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Córdoba capital,
análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla,
Palma, Málaga y Alicante. No se ha tocado ninguna de esas ciudades, el schema, el
código de la app ni Supabase. No se ha ejecutado SQL. No se ha activado indexación
real (esto es un dataset de trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Córdoba capital) | 129 (13 con `D_TIPO=Público` en la fuente cruda + 116 con `D_TIPO=Privado`) |
| **Centros incluidos en el dataset final** | **129** |
| Centros excluidos (motivo documentado) | 0 |
| Fuentes primarias usadas | 2 principales: "Centros de primer ciclo de educación infantil en Andalucía, con alumnado matriculado" (Junta de Andalucía, portal de datos abiertos) y Portal de Escolarización 0-3 años (Junta de Andalucía) — más la web institucional de la ELA de Encinarejo, la página de centros de educación infantil del Ejército de Tierra/DIAPER (Ministerio de Defensa), y webs oficiales propias de 15 cadenas/centros (16 sedes) |

### Composición del dataset final (129)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Red genuina de titularidad de la Junta de Andalucía | 11 | público | escuela-infantil |
| Entidad Local Autónoma de Encinarejo | 1 | público | escuela-infantil |
| Ministerio de Defensa (gestión Kidsco) | 1 | público | escuela-infantil |
| Privado adherido al Programa de Ayuda a las Familias | 105 | privado | guardería |
| Privado no adherido | 11 | privado | guardería |

### Clasificación `ownership`: aplicando la lección de Sevilla/Málaga desde el origen, con un matiz nuevo propio de Córdoba

Siguiendo el criterio ya validado (Andalucía no tiene concierto educativo formal
para el primer ciclo de infantil), **ningún centro del dataset de Córdoba usa
`ownership: concertado`**.

A diferencia de Málaga, en Córdoba **no se ha detectado ningún caso de empresa
privada etiquetada como "Público" en la fuente cruda** que debiera reclasificarse a
`privado`. Sin embargo, Córdoba presenta un matiz distinto y propio: de las 13
filas con `D_TIPO="Público"`, solo 11 corresponden a la red genuina de la Junta de
Andalucía (confirmadas por email institucional `@juntadeandalucia.es`); las otras 2
son también titularidad pública, pero de administraciones distintas:

| Nombre | `D_TIPO` en fuente cruda | Evidencia de verificación | `ownership` final aplicado |
|---|---|---|---|
| 11 centros (Virgen del Carmen, Azahara, Parque Figueroa, Jesús Ledesma, Nuestra Señora de la Soledad, La Victoria, Los Reyes, Peter Pan, San José, San Rafael, Santuario) | Público | Email institucional `[código].edu@juntadeandalucia.es` | `publico` (red autonómica Junta de Andalucía) |
| Cigüeña Blanca | Público | Email `e.i.c.b.08@hotmail.com` (no institucional); confirmado en `encinarejo.es` que es la escuela infantil de la Entidad Local Autónoma de Encinarejo, núcleo de población perteneciente al municipio de Córdoba con competencias propias desde 1957 | `publico` (matiz: titularidad pública de la ELA, no de la Junta ni del Ayuntamiento — documentado explícitamente en `long_description` y FAQs) |
| Cerro Muriano | Público | Email `cerro.muriano@kidsco.es` (dominio de empresa gestora); confirmado que es una escuela infantil del Ministerio de Defensa en la Base Militar de Cerro Muriano, con gestión operativa delegada en Kidsco Balance S.L. mediante contrato público | `publico` (matiz: titularidad pública estatal con gestión operativa por empresa de servicios — documentado explícitamente, sin usar `concertado`) |

**Ninguno de los 129 centros usa `ownership: concertado`.** El detalle completo de
esta verificación está en `docs/data-sources-cordoba.md`, fuente 1.

---

## 2. Resolución de centros excluidos

**Ningún centro del listado oficial fue excluido en este sprint.** Los 129
candidatos evaluados superaron el umbral mínimo de verificación del proyecto: los
129 tienen al menos teléfono o email confirmado directamente en la fuente oficial
de la Junta de Andalucía (127/129 con teléfono, 129/129 con email), además de
dirección, titularidad y coordenadas verificables en el 100% de los casos.

El archivo `data/enrichment/cordoba-centers-excluded.json` existe con la estructura
estándar del proyecto pero con `centers: []`, documentando que la comprobación se
realizó y no encontró candidatos del listado oficial por debajo del umbral mínimo.

A diferencia de Málaga (donde se detectó un centro municipal mencionado en fuente
externa pero ausente del CSV oficial), en Córdoba no se ha detectado ningún centro
adicional mencionado en fuentes municipales o de prensa que estuviera ausente del
CSV oficial de la Junta de Andalucía y que reuniera datos suficientes para
constituir siquiera un "candidato" a evaluar.

---

## 3. Calidad de los datos (dataset final, 129 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 127 / 129 | 98,4% |
| Email | 129 / 129 | **100%** |
| Web | 16 / 129 | 12,4% |
| Coordenadas (lat/lng) | 129 / 129 | **100%** (de fuente oficial directa, sin incidencias de coordenadas erróneas detectadas, incluido el centro "Snoopy") |
| Servicios confirmados (`services` no vacío) | 16 / 129 | **12,4%** |
| `schedule` estructurado | 20 / 129 | 15,5% (las 11 escuelas públicas de la Junta con horario oficial homogéneo + 9 privadas con horario propio confirmado por web oficial: Jugando en Azahara, Garabatos, Garabatos 2, Snoopy, Educare Eduquere, El Puzzle, Playschool, Pinocho, Bética-Mudarra) |
| `long_description` (único por centro) | 29 / 129 | 22,5% |
| FAQs (4-10 por centro) | 129 / 129 | 100% |
| `district` / `neighborhood_barrio` | 0 / 129 | 0% (no se ha construido un mapeo código postal → distrito por no ser 1:1 verificable sin una fuente cartográfica oficial adicional, mismo criterio ya aplicado en Sevilla y Málaga) |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 16 | Centros con al menos un servicio confirmado por web propia |
| medium | 113 | Resto: solo datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad, adhesión/red), sin servicio adicional confirmable por web propia — incluye las 13 públicas (11 Junta + Encinarejo + Defensa), que tienen horario/normativa homogénea verificada pero no ficha individual propia con más detalle |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

- **4 estructuras** para el grupo de las 11 escuelas públicas de la Junta de
  Andalucía, rotando de forma determinista por hash del código de centro.
- **1 estructura específica** para Cigüeña Blanca (Encinarejo), caso singular de
  titularidad de Entidad Local Autónoma.
- **1 estructura específica** para Cerro Muriano (Ministerio de Defensa), caso
  singular de titularidad estatal con gestión Kidsco.
- **4 estructuras** para el grupo de privados con servicio confirmado por web
  propia (16 centros).
- **6 estructuras** para el grupo mayoritario de privados adheridos sin servicio
  confirmado (93 centros).
- **3 estructuras** para el grupo de privados no adheridos sin servicio confirmado
  (11 centros).

Verificación automatizada tras la generación:

- **`short_description`: 129/129 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 129`).
- **`long_description`: 29/29 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 186 y 372 caracteres (dentro del rango
  180-450 exigido).
- Slugs: 129/129 únicos, sin colisiones de nombre que requirieran desambiguación
  manual (se detectaron dos centros llamados "San José" —uno público de la Junta,
  código 14010415, y otro privado, código 14007003— y dos llamados "San Cayetano"
  /"San Cayetano II"; todos con slugs distintos por dirección/sufijo, sin
  ambigüedad).

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(4-36 meses, según fuente oficial homogénea del primer ciclo andaluz), titularidad
(diferenciando explícitamente red Junta / ELA Encinarejo / Defensa-Kidsco /
privado adherido / privado no adherido), horario cuando está confirmado, servicios
confirmados (comedor, bilingüe/inglés, horario ampliado, etc., cuando aplica) y vía
de contacto. Todos los centros sin `long_description` incluyen una FAQ de
transparencia ("¿Está verificada la información de esta ficha?"). Ninguna FAQ
afirma un servicio, horario o metodología no verificados.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **11 escuelas infantiles públicas** de titularidad de la Junta de Andalucía
  (fuente oficial homogénea y verificada: horario, comedor, proceso de admisión).
- **Cigüeña Blanca** (Entidad Local Autónoma de Encinarejo), con descripción
  específica sobre su régimen de titularidad singular.
- **Cerro Muriano** (Ministerio de Defensa), con descripción específica sobre su
  titularidad estatal y gestión operativa delegada.
- Los **16 centros privados** con al menos un servicio confirmado por web propia.

Los **100 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono/email, titularidad y régimen de adhesión según el registro oficial, **no
llevan `long_description`** — se consideró que no había datos suficientes para
aportar valor real más allá de lo ya cubierto en `short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 29 / 129 | 22,5% |
| No indexable (noindex, follow) | 100 / 129 | 77,5% |

Los 100 no indexables son exactamente los centros privados sin servicio confirmado
ni `long_description` (solo nombre, dirección, contacto, titularidad y régimen de
adhesión según el registro oficial de la Junta de Andalucía). Es un resultado
honesto del propio gate de calidad del proyecto: los 100 quedan crawlables e
incluidos en el sitemap como `noindex, follow` hasta que se complete su
enriquecimiento en una fase posterior, en vez de forzarlos a indexar con contenido
insuficiente.

---

## 6. Riesgos y bloqueos conocidos

1. **Volumen alto de centros privados sin servicio confirmado (100 de 116, 86%)**:
   no se localizó web propia accesible y verificable para la gran mayoría de los
   centros privados individuales de Córdoba capital, o la web encontrada no
   confirmaba servicios concretos del enum con claridad suficiente. No es un
   bloqueante para incluir el centro en el dataset (todos tienen al menos email de
   fuente oficial, y 127/129 también teléfono), pero sí limita su indexabilidad
   automática. Es la mayor oportunidad de enriquecimiento futuro del dataset de
   Córdoba.
2. **Heterogeneidad de titulares públicos dentro de `D_TIPO="Público"`**: a
   diferencia de Málaga (donde el problema era empresas privadas mal etiquetadas
   como públicas) y de Sevilla, en Córdoba el matiz es que las 13 filas públicas
   corresponden en realidad a **tres administraciones distintas** (Junta de
   Andalucía, Entidad Local Autónoma de Encinarejo, Ministerio de Defensa). Se ha
   documentado explícitamente en vez de tratarlas como una red homogénea. Este
   hallazgo es específico de Córdoba y debería tenerse en cuenta como
   comprobación estándar para futuras zonas de Andalucía con núcleos de población
   con estatuto administrativo especial (Entidades Locales Autónomas) o
   instalaciones militares dentro de su término municipal.
3. **`district` / `neighborhood_barrio` no extraído a campo estructurado (0/129)**:
   Córdoba capital tiene una identidad de distrito reconocible (Centro, Sur,
   Norte-Sierra, Poniente-Guadalquivir, Levante, Poniente Sur, Periurbano Este,
   Periurbano Oeste-Sierra), pero un mapeo código postal → distrito no es 1:1
   verificable sin una fuente cartográfica oficial adicional (el callejero
   municipal de Córdoba), y no se ha construido esa aproximación no verificable.
   Ver informe SEO para el impacto de esta brecha en las landings de distrito.
4. **Cadenas con varias sedes sin servicio diferenciado confirmado para todas**:
   en cadenas como Manolo Álvaro (3 sedes, solo 1 con servicio confirmado), El
   Puzzle (2 sedes, solo 1 con servicio confirmado) y Happy Children (2 sedes,
   solo 1 con servicio confirmado), no se ha extrapolado el servicio confirmado de
   una sede a las demás sin evidencia explícita y diferenciada, aunque compartan
   marca y en algunos casos teléfono. Esto es una decisión conservadora que puede
   estar infravalorando servicios reales de esas sedes hermanas.
5. **Servicios mencionados en las webs verificadas pero no soportados por el enum
   cerrado `CenterService`**: varias webs mencionan atención temprana/estimulación
   temprana (Playschool, Educare Eduquere), sistemas de agenda digital (Snoopy,
   Jugando en Azahara), o el nombre comercial "Montessori" (4 centros del listado:
   Montessori Dream y otros sin verificación individual en profundidad). No se ha
   forzado ningún valor del enum para representar estos datos no equivalentes; se
   ha dejado esa información no estructurada fuera del dataset.
6. **Centros con nombre "Montessori" no investigados individualmente en
   profundidad más allá de Montessori Dream** (que tampoco aportó servicios
   confirmables del enum) — quedan con `services: []` salvo verificación futura,
   para no asumir por el nombre comercial que aplican realmente la pedagogía
   Montessori sin confirmación en fuente propia.
7. **Ayuntamiento de Córdoba sin listado propio descargable de escuelas
   municipales**: a diferencia de Zaragoza o Murcia, no se ha localizado un PDF o
   listado oficial equivalente en `cordoba.es`; toda la red pública identificada
   procede de la fuente 1 (Junta de Andalucía, ELA de Encinarejo y Ministerio de
   Defensa). Si en el futuro se localiza una fuente municipal propia, debería
   contrastarse contra el CSV oficial antes de incorporar cualquier centro nuevo.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-cordoba.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/cordoba-centers-raw.json` | Extracción sin procesar (129 filas), antes de deduplicar/normalizar |
| 3 | `data/enrichment/cordoba-centers.json` | Dataset final: 129 centros verificados y humanizados |
| 4 | `data/enrichment/cordoba-centers-excluded.json` | 0 centros excluidos del listado oficial (estructura estándar) |
| 5 | `data/import/cordoba-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/Zaragoza/Murcia/Sevilla/Málaga (129 filas) |
| 6 | `docs/cordoba-quality-report.md` | Este informe |
| 7 | `docs/cordoba-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-cordoba-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-cordoba-centers.sql` | DELETE explícito por lista de 129 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en el resto de zonas ya integradas.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 100
   centros privados sin servicio confirmado, en particular las sedes hermanas de
   cadenas ya parcialmente verificadas (Manolo Álvaro I/II, El Puzzle II, Happy
   Children 1); explorar el callejero oficial del Ayuntamiento de Córdoba para
   asignar `district` de forma verificable; contactar con la Delegación
   Territorial de Desarrollo Educativo y Formación Profesional en Córdoba para
   confirmar si existe algún centro municipal adicional no recogido en el CSV
   oficial.
3. **Diseño de landings**: con 129 centros en total, hay masa suficiente para
   landings municipales generales y varias landings de servicio, pero no para
   landings de distrito/barrio en esta fase — ver detalle completo en
   `docs/cordoba-seo-report.md`.
