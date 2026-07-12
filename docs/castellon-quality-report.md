# Informe de calidad — Dataset Castelló de la Plana (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Castelló de la
Plana (capital), análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza,
Murcia, Sevilla, Palma, Alicante, Málaga, Las Palmas, Córdoba y Granada. No se ha
tocado ninguna de esas ciudades, el schema, el código de la app ni Supabase. No se
ha ejecutado SQL. No se ha activado indexación real (esto es un dataset de
trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Castelló de la Plana capital, incluyendo el distrito de El Grao) | 27 (6 públicos + 21 privados) |
| **Centros incluidos en el dataset final** | **27** |
| Centros excluidos (motivo documentado) | 0 |
| Fuentes primarias usadas | 3 principales: "Centres docents de la Comunitat Valenciana" (Generalitat Valenciana, portal dadesobertes.gva.es), webs oficiales de 3 de las 4 escuelas infantiles municipales (gestionadas por concesión, EULEN Servicios Sociosanitarios), webs oficiales `portal.edu.gva.es` de los 2 centros de titularidad Generalitat — más webs propias de 15 titulares privados |

### Composición del dataset final (27)

| Grupo | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, titularidad Generalitat Valenciana (EI Nuestra Señora de Lourdes, EI Mar de Somnis) | 2 | público | escuela-infantil |
| Público, titularidad municipal (Ajuntament de Castelló de la Plana, gestión por concesión a EULEN: Chupetes, Biberons, Peücs, Los Duendes) | 4 | público | escuela-infantil |
| Privado, con al menos un servicio confirmado por web oficial propia | 15 | privado | guardería |
| Privado, sin servicio confirmado por fuente oficial | 6 | privado | guardería |

Nota: el recuento de "15 privados con servicio" se refiere a titulares/sedes con
servicio confirmado sobre el total de 21 registros privados (contando cada sede
del mismo grupo empresarial como registro independiente, tal como exige la fuente
oficial y el propio dataset final).

### Clasificación `type`: guardería vs. escuela infantil

Se aplicó el mismo criterio que en el resto de zonas ya integradas: titularidad
pública o gestión institucional consolidada (incluida la gestión por concesión de
servicio público, como en las 4 escuelas municipales de Castelló) → `escuela-
infantil`; centros privados de gestión individual/empresarial → `guarderia`. En
Castelló de la Plana esto coincide exactamente con la frontera público/privado
observada en la fuente oficial: los 6 centros públicos son `escuela-infantil`;
los 21 centros privados son `guarderia`.

### Ownership

| Ownership | Cantidad | Criterio |
|---|---|---|
| Público | 6 | `regimen = "PÚB."` en la fuente oficial (2 de titularidad `GENERALITAT VALENCIANA` + 4 de titularidad `AJUNTAMENT DE CASTELLÓ DE LA PLANA`) |
| Privado | 21 | `regimen = "PRIV."` en la fuente oficial |
| Concertado | 0 | Ningún registro `regimen = "PRIV. CONC."` apareció en el subconjunto filtrado de Castelló de la Plana para primer ciclo de infantil. El valor `concertado` del enum `CenterOwnership` **no se ha usado para ningún centro** de este dataset, siguiendo el criterio estricto ya aplicado en Sevilla, Valencia y Alicante: solo se usaría con fuente oficial que confirmara un concierto educativo real y formal para primer ciclo, no una simple adhesión a un programa de subvención (Bono Infantil) — y aquí, igual que en Alicante, el propio registro no marca ningún centro de Castelló como `PRIV. CONC.` |

---

## 2. Resolución de centros excluidos

**Ningún centro fue excluido en este sprint.** Los 27 candidatos evaluados
superaron el umbral mínimo de verificación del proyecto: los 27 tienen teléfono
confirmado directamente en la fuente oficial de la Generalitat Valenciana (100%),
además de dirección, titularidad y coordenadas verificables en el 100% de los
casos.

El archivo `data/enrichment/castellon-centers-excluded.json` existe con la
estructura estándar del proyecto pero con `centers: []`, documentando que la
comprobación se realizó y no encontró candidatos por debajo del umbral mínimo.

---

## 3. Calidad de los datos (dataset final, 27 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 27 / 27 | **100%** |
| Email | 16 / 27 | 59.3% |
| Web | 19 / 27 | 70.4% |
| Coordenadas (lat/lng) | 27 / 27 | **100%** (de fuente oficial directa) |
| Servicios confirmados (`services` no vacío) | 19 / 27 | **70.4%** |
| `schedule` estructurado | 14 / 27 | 51.9% |
| `long_description` (único por centro) | 20 / 27 | 74.1% |
| FAQs (5-6 por centro) | 27 / 27 | 100% |
| `district`/`neighborhood_barrio` | 1 / 27 (solo El Grao) | 3.7% |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 19 | Centros con al menos un servicio confirmado, horario confirmado, o web oficial propia verificada |
| medium | 8 | Centros con solo los datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad), sin servicio/horario/web adicional confirmable |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

Siguiendo la lección documentada en `docs/checklist-calidad-nueva-ciudad.md`
sobre el incidente de plantilla única en Barcelona, para Castelló de la Plana se
diseñaron:

- **3 estructuras de frase** para el grupo de 2 centros públicos de titularidad
  Generalitat (más el caso de "Los Duendes", que comparte el mismo pool por no
  tener email `@eulen.com`).
- **4 estructuras** para el grupo de 3 escuelas municipales gestionadas por
  EULEN con web propia (Chupetes, Biberons, Peücs).
- **8 estructuras** para el grupo de privados con servicio confirmado.
- **8 estructuras** para el grupo de privados sin servicio confirmado.

Verificación automatizada tras la generación (script de validación ejecutado
sobre el JSON final):

- **`short_description`: 27/27 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 27`).
- **`long_description`: 20/20 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 210 y 356 caracteres (dentro del rango
  180-450 exigido).
- Longitud de `long_description`: entre 384 y 974 caracteres. Un centro (L'Om,
  privado, con un único dato adicional confirmado —enfoque pedagógico— y sin
  servicios/horario confirmados) queda en 384 caracteres, ligeramente por debajo
  del rango habitual de 600-1500 caracteres observado en otras ciudades; se ha
  mantenido así deliberadamente en vez de alargarlo con relleno genérico no
  verificado, siguiendo el mismo criterio ya aplicado en Alicante (caso EI El
  Tossalet, 424 caracteres).
- Slugs: 27/27 únicos, sin colisiones de nombre.
- No se detectaron aperturas de ≥8 palabras compartidas entre `short_description`
  de centros distintos (cada frase arranca con el nombre propio y único del
  centro).

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(0-36 meses, primer ciclo), titularidad, horario cuando está confirmado (14 de
27), servicio destacado confirmado (comedor/cocina propia, bilingüe/inglés u
horario ampliado, según disponibilidad, con prioridad fija para evitar exceder el
presupuesto de FAQs) y vía de contacto. Cada ficha lleva entre 5 y 6 FAQs (núcleo
fijo de 3: ubicación, edades, titularidad; 1 FAQ de horario si está confirmado; 1
FAQ de servicio destacado si hay datos confirmados; cierre de contacto y
transparencia), respetando el límite máximo de 6 indicado por el coordinador.
Ninguna FAQ afirma un servicio, horario o metodología no verificados.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se
generó `long_description` para **20 centros** con al menos uno de estos datos
reales confirmados: servicio(s) concreto(s) del enum, horario propio, o enfoque
pedagógico declarado en fuente oficial propia. (Nota post-auditoría, incidencia
C1: IEP Bebés ya contaba con `long_description` en la entrega original —lo que
se corrigió no fue su presencia, sino que el texto afirmaba una verificación en
"su web oficial" sin que esa fuente estuviera registrada en el dataset; ahora
cuenta con la fuente real en `source_urls_secondary` y el texto reescrito en
consecuencia — ver punto 5 de la sección 6.)

Los **7 centros restantes** (Escuela Infantil Municipal Los Duendes, Mikole, La
Papallona Menuda, La Marieta, Sirius, Primers Passos Censal II y Conta'm un
Conte), con datos limitados a nombre, dirección, teléfono/email, titularidad y
tipo según el registro oficial, **no llevan `long_description`** — se consideró
que no había datos suficientes para aportar valor real más allá de lo ya
cubierto en `short_description` y las FAQs.

Detalle de los 7 centros sin `long_description`: Escuela Infantil Municipal Los
Duendes, Mikole, La Papallona Menuda, La Marieta, Sirius, Primers Passos Censal
II y Conta'm un Conte.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable (`recommended_indexable`) | 20 / 27 | **74.1%** |
| No indexable (noindex, follow) | 7 / 27 | 25.9% |

Los 7 no indexables son exactamente los 7 centros sin servicio confirmado ni
`long_description` (solo nombre, dirección, contacto y titularidad según el
registro oficial de la Generalitat Valenciana o del Ajuntament). Este porcentaje
de indexabilidad (74.1%) es el más alto observado hasta ahora entre las zonas de
la Comunitat Valenciana investigadas (56.8% en Alicante), gracias al volumen muy
manejable de centros privados en Castelló de la Plana (21) y a la calidad de las
webs propias localizadas.

---

## 6. Riesgos y bloqueos conocidos

1. **Bloqueo de acceso al dominio `castello.es`**: todas las peticiones directas
   al portal institucional del Ayuntamiento de Castelló de la Plana devolvieron
   error de conexión durante esta investigación (tanto por herramienta de fetch
   como por petición HTTP directa), sin poder determinar si se trata de un
   bloqueo anti-bot, caída puntual del servidor o restricción de red del
   entorno. No impidió completar el dataset (las webs propias de las escuelas
   municipales y la fuente de la Generalitat cubrieron el universo necesario),
   pero es una vía de verificación pendiente para una fase futura — en
   particular para intentar confirmar más datos de "Los Duendes" y localizar un
   posible callejero oficial con distrito/barrio.
2. **7 de 27 centros (26%) sin servicio confirmado ni `long_description`**: no
   se localizó web propia accesible y verificable, o la web encontrada no tuvo
   contenido citable con precisión suficiente. Es la principal oportunidad de
   enriquecimiento futuro del dataset de Castelló de la Plana.
3. **`district`/`neighborhood_barrio` confirmado solo para 1/27 centros (El
   Grao)**: no se localizó ninguna fuente oficial con distrito o barrio
   administrativo de Castelló de la Plana aplicable centro a centro dentro del
   alcance de esta investigación, salvo el caso de El Grao, que aparece con
   `localidad` propia y diferenciada en la propia fuente oficial de la
   Generalitat. El resto de la ciudad tiene una división administrativa
   reconocible (distritos norte, sur, este, oeste, centro), pero no se dispuso
   de un callejero oficial verificable centro a centro.
4. **Ningún centro con `ownership = concertado`**: mismo resultado que en
   Alicante — el propio registro oficial de la Generalitat no marca ningún
   centro de primer ciclo de Castelló como `PRIV. CONC.`, por lo que no se ha
   presentado ni siquiera la tentación de esa clasificación errónea.
5. **IEP Bebés — servicio bilingüe, corregido tras auditoría (incidencia
   C1)**: en la investigación inicial, la web propia del centro bajo el dominio
   antiguo (`iepenglish.es`) no respondió de forma estable (fallo DNS), y el
   servicio bilingüe/inglés se asignó por consistencia del nombre comercial sin
   fuente citada — una afirmación de fuente inexistente en contenido indexable,
   señalada como incidencia `high` en auditoría. Corrección aplicada: se
   localizó la web oficial actual del centro (International English School
   Castellón, grupo Dukes Education, tras migración de dominio) en
   `https://international-english-school-castellon.dukeseducation.es/proyecto-educativo/early-years/`,
   registrada en `source_urls_secondary`. Esa página confirma un proyecto
   bilingüe con exposición diaria a profesorado en inglés y en español desde la
   etapa de 1-2 años ("Baby Bears"), no una inmersión total en inglés, y
   confirma la dirección ya registrada (Ronda Circunvalación 348, Castelló). El
   servicio del enum (`bilingue`, `ingles`) no cambia porque el dato ya era
   correcto; lo que se corrigió fue la fuente citada. De forma deliberadamente
   conservadora, no se han añadido más servicios (cocina propia, horario
   concreto) sin cita textual directa verificada de la fuente primaria.
6. **Discrepancia de dirección en Escuela Infantil Municipal Peücs**: la web
   oficial del centro indica "C/ José Mª Mulet Ortiz, 10", mientras que el
   registro oficial de la Generalitat indica "s/n". Se ha usado la versión de la
   web oficial del propio centro, más específica, documentando la discrepancia
   en `notes_internal`.
7. **Riesgo de confusión de municipio homónimo, verificado y descartado**: el
   valor de `localidad` "CASTELLÓ" (sin "DE LA PLANA") corresponde a un
   municipio distinto en la provincia de Valencia (CP 46270). Se verificó y
   excluyó explícitamente del filtro antes de construir el dataset — ver detalle
   en `docs/data-sources-castellon.md`.
8. **1 `long_description` por debajo del rango típico** (L'Om, 384 caracteres)
   — ver detalle en sección 3. Es contenido factual real, no relleno; se
   mantiene así conforme a la instrucción de no generar relleno genérico.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-castellon.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/castellon-centers-raw.json` | Extracción sin procesar (27 filas del CSV oficial filtrado), antes de normalizar/enriquecer |
| 3 | `data/enrichment/castellon-centers.json` | Dataset final: 27 centros verificados y humanizados |
| 4 | `data/enrichment/castellon-centers-excluded.json` | 0 centros excluidos (estructura estándar, sin candidatos por debajo del umbral) |
| 5 | `data/import/castellon-centers.csv` | CSV con las mismas columnas que el resto de zonas ya integradas (27 filas) |
| 6 | `docs/castellon-quality-report.md` | Este informe |
| 7 | `docs/castellon-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-castellon-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-castellon-centers.sql` | DELETE explícito por lista de 27 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución
   manual por el propietario del proyecto, con paso a `status='published'` solo
   tras auditoría, igual que en el resto de zonas ya integradas.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 7
   centros sin servicio confirmado (en particular, reintentar el acceso a
   `castello.es` cuando el bloqueo de red se resuelva, y contactar directamente
   con "Los Duendes", Mikole, La Papallona Menuda, La Marieta, Sirius, Primers
   Passos Censal II y Conta'm un Conte). El dato de IEP Bebés ya quedó
   confirmado con fuente oficial verificable (ver sección 6 punto 5); no
   requiere seguimiento adicional salvo revisar si el centro consolida su
   naming comercial bajo "International English School Castellón".
3. **Diseño de landings**: con 27 centros en total, hay masa suficiente para
   landings municipales generales y varias landings de servicio — ver detalle
   completo en `docs/castellon-seo-report.md`.
