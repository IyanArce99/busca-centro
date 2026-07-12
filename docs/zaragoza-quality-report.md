# Informe de calidad — Dataset Zaragoza (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Zaragoza,
análogo al realizado para Madrid, Barcelona y Valencia. No se ha tocado ninguna de
esas tres ciudades, el schema, el código de la app ni Supabase. No se ha ejecutado
SQL. No se ha activado indexación real (esto es un dataset de trabajo, no un
despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuentes oficiales, primer ciclo infantil 0-3 en Zaragoza capital) | 60 (18 públicos + 42 privados) |
| **Centros incluidos en el dataset final** | **59** |
| Centros excluidos (motivo documentado) | 1 |
| Fuentes primarias usadas | 3 principales: Directorio de Centros Educativos de Aragón / API GA_OD_Core (Gobierno de Aragón), Escuelas Infantiles Municipales (Ayuntamiento de Zaragoza), Red de Escuelas Infantiles del Gobierno de Aragón (aragon.es) — más webs propias de 10 centros privados y el BOE para el caso de Loreto |

### Composición del dataset final (59)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Escuela Infantil Municipal (Ayuntamiento de Zaragoza) | 13 | público | escuela-infantil |
| Escuela de Educación Infantil DGA (Gobierno de Aragón) | 4 | público | escuela-infantil |
| Escuela de Educación Infantil de acceso restringido (convenio Defensa-DGA, Base Aérea) | 1 | público | escuela-infantil |
| Centros privados (Registro de Centros Docentes del Gobierno de Aragón) | 41 | privado | guardería |

### Clasificación `type`: guardería vs. escuela infantil

Se aplicó el mismo criterio que en Madrid, Barcelona y Valencia: centros de
titularidad pública o gestión institucional consolidada → `escuela-infantil`;
centros privados de gestión individual/familiar sin oferta más allá del ciclo 0-3
→ `guarderia`. En Zaragoza esto coincide exactamente con la frontera
público/privado observada en las fuentes: las 18 escuelas públicas (13
municipales + 4 autonómicas + 1 de acceso restringido) son `escuela-infantil`; los
41 centros privados detectados son `guarderia`.

### Ownership

| Ownership | Cantidad |
|---|---|
| Privado | 41 |
| Público | 18 |
| Concertado | 0 |

No se asignó `ownership: concertado` a ningún centro. Aragón está implementando
durante 2026 un sistema de concierto para el primer ciclo de infantil (0-3 años),
pero ninguna fuente oficial consultada en esta investigación identifica, centro a
centro, cuáles tienen ya plaza concertada — asignarlo sin esa confirmación
individual habría sido una inferencia no verificada.

---

## 2. Resolución del centro excluido

| Centro | Motivo de exclusión |
|---|---|
| Duendecillos (Andrea Palladio, 2, Zaragoza) | Sin teléfono, sin email, sin web y sin servicio confirmado en ninguna fuente consultada. Solo constan nombre, dirección, tipo y coordenadas en el Directorio de Centros Educativos de Aragón, insuficiente para superar el umbral mínimo de verificación del proyecto (al menos un dato de sustancia: servicio, `long_description`, web, teléfono, email, horario o titularidad+etapa bien documentada). |

Este centro permanece documentado en `data/enrichment/zaragoza-centers-excluded.json`
con su motivo de exclusión explícito, pero no entra en el dataset final, en el CSV de
importación ni en el SQL de inserción.

---

## 3. Calidad de los datos (dataset final, 59 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 59 / 59 | 100% |
| Email | 42 / 59 | 71% |
| Web | 15 / 59 | 25% |
| Coordenadas (lat/lng) | 59 / 59 | **100%** (de fuente oficial directa o geocodificación verificable de la dirección real — nunca aproximadas al centro de la ciudad) |
| Servicios confirmados (`services` no vacío) | 31 / 59 | **52.5%** |
| `schedule` estructurado | 17 / 59 | 29% (las 13 municipales + las 4 DGA, con fuente oficial homogénea; el resto de centros privados no tiene horario estructurado confirmado en fuente primaria) |
| `long_description` (único por centro) | 32 / 59 | 54% |
| FAQs (3-6 por centro) | 59 / 59 | 100% |

### confidence_level

| Valor | Cantidad |
|---|---|
| high | 32 (los 18 públicos + 14 privados con servicios y/o web propia verificada) |
| medium | 27 (privados con solo datos de la fuente oficial de registro, sin servicios adicionales confirmables) |
| low / unknown | 0 (ninguno entra en el dataset final; el único candidato en esa situación fue excluido) |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

Siguiendo la lección documentada en `docs/checklist-calidad-nueva-ciudad.md` sobre el
incidente de plantilla única en las 106 Escola Bressol Municipal de Barcelona, para
Zaragoza se diseñaron **8 estructuras de frase distintas para `short_description`**
en el grupo homogéneo más numeroso (13 escuelas municipales), 4 para las escuelas
autonómicas, y 5-8 estructuras adicionales para los distintos subgrupos de centros
privados (con servicios confirmados / sin servicios confirmados / entidades sociales),
rotando de forma determinista por `slug` en vez de aplicar una única plantilla con
variables sustituidas.

Verificación automatizada tras la generación:

- **`short_description`: 59/59 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 59`).
- **`long_description`: 32/32 textualmente únicas** entre los centros que la tienen.
- Longitud de `short_description`: entre 284 y 415 caracteres (dentro del rango
  180-450 exigido).
- Longitud de `long_description`: entre 630 y 1316 caracteres (dentro del rango
  600-1500 exigido).
- Se comprobó la repetición de aperturas de 8 palabras entre centros: se detectó
  un único patrón compartido por 4 de las 13 escuelas municipales (misma
  plantilla rotativa aplicada por hash a 4 centros de un total de 8 plantillas
  disponibles para ese grupo) — el resto del texto diverge por dirección, barrio
  y contenido real de cada ficha, consistente con el criterio ya aceptado en el
  informe de auditoría de Barcelona para grupos homogéneos con la misma fuente
  institucional.

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(según el tipo de fuente — 4-36 meses para las municipales, 0-3 años para
autonómicas y privados), titularidad, horario cuando está confirmado, servicios
confirmados (comedor, bilingüe/inglés, horario ampliado/madrugadores, según
aplique) y vía de contacto. Ninguna FAQ afirma un servicio, horario o metodología
no verificados. El caso de La Piraña (traslado temporal a Parque Bruil durante el
curso 2025/26) se documenta con una FAQ dedicada en vez de omitirse.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **13 escuelas municipales** (fuente oficial homogénea y verificada: horario,
  comedor, proceso de admisión).
- Las **4 escuelas autonómicas DGA** (fuente oficial homogénea y verificada: horario,
  comedor, proceso de admisión distinto del municipal).
- La escuela de **Loreto** (caso singular, con fuente BOE que documenta su origen y
  acceso restringido).
- Los **14 centros privados** con al menos un servicio confirmado por web propia o una
  nota institucional relevante (entidad social/benéfica gestora).

Los **27 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono/email y tipo de centro según el registro oficial, **no llevan
`long_description`** — se consideró que no había datos suficientes para aportar valor
real más allá de lo ya cubierto en `short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` + `short_description`
+ (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 32 / 59 | 54% |
| No indexable (noindex, follow) | 27 / 59 | 46% |

Los 27 no indexables son exactamente los centros privados sin servicio confirmado ni
`long_description` (solo nombre, dirección, contacto y tipo de centro según el
registro oficial). Esto es un resultado honesto del propio gate de calidad del
proyecto, no un error: quedan crawlables e indexados en el sitemap como `noindex,
follow` hasta que se complete su enriquecimiento en una fase posterior, en vez de
forzarlos a indexar con contenido insuficiente.

---

## 6. Riesgos y bloqueos conocidos

1. **El Directorio de Centros Educativos de Aragón (API GA_OD_Core) no incluye 8 de
   los 18 centros públicos** (4 escuelas municipales + 4 escuelas autonómicas DGA)
   bajo ningún nombre reconocible, pese a estar activos y confirmados en las webs
   institucionales correspondientes. Se completaron con las fuentes 2 y 3
   (documentado en `docs/data-sources-zaragoza.md`), pero esto sugiere que la fuente
   autonómica de datos abiertos puede tener lagunas de actualización en otros
   subconjuntos no auditados en este sprint (p. ej. centros de otras provincias de
   Aragón, fuera del alcance de esta investigación).
2. **Un registro con error de geolocalización de la propia fuente oficial**
   (E.E.I. Villanueva de Sijena, etiquetado como `localidad="Zaragoza"` cuando
   corresponde a la provincia de Huesca) — detectado por verificación cruzada y
   excluido, no arrastrado al dataset.
3. **28 de los 41 centros privados (68%) no tienen `services` confirmado** — no se
   localizó web propia accesible y verificable, o la web encontrada no confirmaba
   servicios concretos del enum con claridad suficiente. No es un bloqueante para
   incluir el centro (todos tienen al menos teléfono de fuente oficial), pero sí
   limita su indexabilidad automática y es una oportunidad de enriquecimiento futuro
   mediante contacto directo o revisión individual adicional.
4. **`district`/`neighborhood_barrio` solo confirmado para las 18 escuelas públicas**
   (13 municipales, de fuente oficial directa; 4 DGA y Loreto, por geocodificación
   inversa contrastada con el nombre del barrio en OpenStreetMap). Los 41 centros
   privados no tienen distrito/barrio confirmado en ninguna fuente oficial consultada
   — no se ha inventado ni aproximado.
5. **`ownership: concertado` no asignado a ningún centro** por falta de una fuente
   estructurada que confirme, centro a centro, la situación de concierto de primer
   ciclo en Aragón (en implementación normativa durante 2026). Si en una fase
   posterior se dispone de esa fuente, algunos de los 41 `privado` actuales podrían
   reclasificarse.
6. **Un servicio frecuente en la investigación no soportado por el enum cerrado**:
   varios centros (Cu Cu-Tas Tas, y menciones de terceros sobre otros) destacan
   metodologías pedagógicas específicas (Montessori, Pikler, Waldorf, Pedagogía
   Sistémica) como seña de identidad. El enum `CenterService` no contempla
   "metodología pedagógica" como servicio — esta información, cuando estaba
   confirmada por fuente primaria, se incorporó como texto en `long_description`
   (campo `pedagogicalApproach` del schema quedaría disponible para una futura
   estructuración, no usado en este sprint por no ser parte del alcance pedido).

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-zaragoza.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/zaragoza-centers-raw.json` | Extracción sin procesar por fuente, antes de deduplicar/normalizar |
| 3 | `data/enrichment/zaragoza-centers.json` | Dataset final: 59 centros verificados y humanizados |
| 4 | `data/enrichment/zaragoza-centers-excluded.json` | 1 centro excluido, con motivo documentado |
| 5 | `data/import/zaragoza-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia (59 filas) |
| 6 | `docs/zaragoza-quality-report.md` | Este informe |
| 7 | `docs/zaragoza-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-zaragoza-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT DO UPDATE` |
| 9 | `data/migrations/rollback-zaragoza-centers.sql` | DELETE explícito por lista de slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en Barcelona y Valencia.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 28
   centros privados sin servicio confirmado, idealmente mediante contacto telefónico
   directo o localización de web propia adicional; confirmar situación de concierto
   0-3 centro a centro cuando la normativa aragonesa lo permita; geocodificar
   distrito/barrio de los 41 centros privados si se decide abordarlo (por
   geocodificación inversa contra los límites oficiales de distritos de Zaragoza).
3. **Diseño de landings**: con solo 18 centros públicos repartidos en 8 distritos (máx.
   3 por distrito) y 41 privados sin distrito confirmado, no hay masa suficiente por
   distrito para landings de barrio en esta fase — ver detalle en
   `docs/zaragoza-seo-report.md`.
