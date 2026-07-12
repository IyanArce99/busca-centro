# Informe de calidad — Dataset Salamanca (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Salamanca
capital, análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza, Murcia,
Sevilla, Palma, Málaga, Alicante, Las Palmas, Córdoba, Granada, Valladolid, Jerez de
la Frontera y Castellón de la Plana. No se ha tocado ninguna de esas ciudades, el
schema, el código de la app ni Supabase. No se ha ejecutado SQL. No se ha activado
indexación real (esto es un dataset de trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Salamanca capital) | 17 (7 con `denominacion_generica="ESCUELA DE EDUCACION INFANTIL"` + 10 con `denominacion_generica="CENTRO PRIVADO DE EDUCACION INFANTIL"`), más 1 candidato adicional detectado únicamente en el listado de gratuidad ("Coco Miel", sin código de registro verificable) = 18 candidatos totales evaluados |
| **Centros incluidos en el dataset final** | **15** |
| Centros excluidos (motivo documentado) | 3 |
| Fuentes primarias usadas | 4 principales: Directorio de Centros Docentes (Junta de Castilla y León, portal de datos abiertos), listado "Escuelas de Educación Infantil - Titularidad JCyL", web oficial de las Escuelas Infantiles Municipales de Salamanca (Fundación Salamanca Ciudad de Cultura y de Saberes / Ayuntamiento de Salamanca) y listado oficial de centros adheridos al programa de gratuidad de primer ciclo curso 2026-2027 — más webs propias de 7 centros privados individuales |

### Composición del dataset final (15)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, red genuina de titularidad de la Junta de Castilla y León (EEI JCyL) | 3 | público | escuela-infantil |
| Público, red municipal (Escuelas Infantiles Municipales, Ayuntamiento de Salamanca / Fundación Ciudad de Saberes) | 4 | público | escuela-infantil |
| Privado adherido al programa de gratuidad de primer ciclo | 8 | privado | guardería |

### Clasificación `ownership`: sin ningún caso de `concertado`, mismo criterio ya validado en Valladolid y Andalucía

Castilla y León no tiene concierto educativo formal para el primer ciclo de
educación infantil (0-3 años): el mecanismo de financiación de centros privados es
una **subvención directa a titulares de centros privados adheridos a la oferta
gratuita de plazas** (Orden EDU/95/2022 y normativa de desarrollo), confirmado
además por el propio listado oficial de centros con plazas gratuitas, que distingue
únicamente "Centros infantiles municipales" y "Centros infantiles privados", sin
ninguna categoría de "concertados". Se ha aplicado `ownership: privado` a los 8
centros privados incluidos en el dataset final.

| Grupo | `naturaleza`/`concierto` en fuente cruda | Verificación realizada | `ownership` final |
|---|---|---|---|
| 3 escuelas (Lazarillo de Tormes, San Bernardo, Virgen de la Vega) | PÚBLICO | Confirmadas como titularidad genuina de la Junta de Castilla y León en el listado oficial "Escuelas de Educación Infantil - Titularidad JCyL" | `publico` |
| 4 escuelas (Los Pizarrales, El Rollo, Garrido, El Zurguén) | PÚBLICO | Confirmadas como Escuelas Infantiles Municipales del Ayuntamiento de Salamanca (411 plazas, gestión de la Fundación Salamanca Ciudad de Cultura y de Saberes) en la web oficial de la red municipal | `publico` |
| 8 centros privados incluidos | PRIVADO, `concierto="N"` en 8 de 8 | Confirmados como adheridos al programa de gratuidad de primer ciclo en el listado oficial correspondiente; ninguno con concierto educativo formal verificado para el tramo 0-3 | `privado` |
| 1 centro excluido (El Globo Rojo) | PRIVADO, `concierto="S"` | Único caso con concierto declarado en el registro; sin verificación oficial de que ese concierto aplique al primer ciclo 0-3 (el propio centro se describe "contratado" para el segundo ciclo 3-6 en su web) | **excluido del dataset final** |

**Igual que en Valladolid, el registro oficial de Salamanca resultó internamente
consistente**: las 7 filas `naturaleza=PÚBLICO` de la categoría escuela infantil son
efectivamente de titularidad pública genuina (autonómica o municipal), y solo 1 de
las 10 filas `naturaleza=PRIVADO` trae concierto declarado — se ha optado por
excluirla en lugar de asumir un `ownership: concertado` no verificado.

### Caso singular de Salamanca: "Aula Pimentón Maestro Ávila" (aula 0-3 de colegio concertado en etapas posteriores)

A diferencia de Valladolid, el registro de Salamanca incluye un centro privado de
primer ciclo con código de registro propio (`37014102`, `concierto=N`) que
corresponde al aula 0-3 de un colegio (Maestro Ávila, Fundación EDUCERE) que **sí**
es concertado en segundo ciclo de infantil, primaria y secundaria (etapas con código
de registro distinto). Se ha mantenido `ownership: privado` para el código
específico del primer ciclo, siguiendo el criterio de usar el dato del código de
registro individual del tramo 0-3, no el del colegio matriz. `confidence_level` se
ha fijado en `medium` para este centro porque los datos de servicios proceden de
fuentes institucionales generales del colegio, no de una página específica del aula
de primer ciclo con detalle exhaustivo por servicio.

### Caso singular de Salamanca: 14 colegios concertados con aula de primer ciclo, descartados en bloque

El listado oficial de gratuidad 2026-2027 muestra que, además de los 10 centros con
código propio en la categoría `CENTRO PRIVADO DE EDUCACION INFANTIL`, otros **14
colegios concertados** de Salamanca capital (Bambi, Calasanz, La Milagrosa, María
Auxiliadora, Marista Champagnat, Montessori, Sagrado Corazón, Salesiano San José, San
Agustín, San Estanislao de Kostka, San José, San Juan Bosco, Santísima Trinidad, y
"Coco Miel") ofertan también aulas de primer ciclo gratuitas. Estos 14 no tienen
código de registro propio y diferenciado de primer ciclo en el Directorio de Centros
Docentes (aparecen en la categoría `CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y
SECUNDARIA`, sin desglose de aula 0-3, o —en el caso de Coco Miel— sin ningún código
localizable). Se han descartado en bloque de este sprint por no poder construir una
ficha individual fiable (dirección, teléfono, coordenadas específicas del aula 0-3
frente al colegio completo), siguiendo el mismo criterio estructural aplicado en
Valladolid y Granada. Es la principal oportunidad de enriquecimiento futuro de este
dataset (ver sección 6).

---

## 2. Resolución de centros excluidos

**3 centros/candidatos fueron excluidos en este sprint**, documentados en
`data/enrichment/salamanca-centers-excluded.json`:

| Centro | Código | Motivo |
|---|---|---|
| El Globo Rojo | 37010170 | Único centro con concierto="S" en el registro oficial, sin verificación de que el concierto corresponda al primer ciclo 0-3 años (podría ser del segundo ciclo, 3-6 años, del mismo centro) |
| El Globo Rojo II | 37014126 | Código de registro válido, pero no aparece en el listado oficial de gratuidad 2026-2027 y no se localizó web propia ni datos de contacto adicionales verificables |
| Coco Miel | Sin código localizable | Aparece en el listado de gratuidad y tiene web corporativa propia, pero no se ha localizado ningún código de centro en el Directorio de Centros Docentes bajo ese nombre (0 resultados en el directorio interactivo oficial) |

Ninguno de los 3 se ha forzado dentro del dataset final "por si acaso", conforme a la
regla estricta del proyecto.

---

## 3. Calidad de los datos (dataset final, 15 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 15 / 15 | **100%** (tras 2 correcciones puntuales verificadas en web oficial propia: Mumakids, Aula Pimentón Maestro Ávila) |
| Email de contacto propio | 6 / 15 | 40% (el resto de emails de la fuente cruda son buzones institucionales `@educa.jcyl.es`, no publicados como contacto) |
| Web propia (`contact.website`) | 9 / 15 | 60% |
| Coordenadas (lat/lng) | 15 / 15 | **100%** (todas de fuente oficial directa, sin geocodificación externa necesaria) |
| Servicios confirmados (`services` no vacío) | 13 / 15 | **86,7%** |
| `schedule` estructurado | 9 / 15 | 60% (las 4 escuelas infantiles municipales con horario homogéneo oficial confirmado, más 5 centros privados con horario propio confirmado en su web) |
| `long_description` (único por centro) | 13 / 15 | 86,7% |
| FAQs (5-6 por centro) | 15 / 15 | 100% |
| `district` (barrio) | 4 / 15 | 26,7% (únicamente las 4 escuelas infantiles municipales, cuyo barrio coincide con su propio nombre y se ha confirmado con fuentes cualitativas sobre la delimitación de esos barrios; no se ha inferido barrio para el resto del dataset sin fuente cartográfica verificable) |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 12 | Centros con al menos un servicio confirmado por web propia (6 privados) + las 4 EIM municipales (servicios homogéneos confirmados por la web oficial de la red) + las 3 escuelas JCyL (comedor confirmado por registro oficial) menos Aula Pimentón (ver medium) |
| medium | 3 | Aula Pimentón Maestro Ávila (fuente institucional general, no página específica del aula), Mi Mamá Me Mima y El Tren (sin servicio del enum confirmado, pero con contacto propio verificado: web/email/teléfono) |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

Verificación automatizada tras la generación (script Node ejecutado sobre el JSON
final):

- **`short_description`: 15/15 textualmente únicas** (`new Set(...).size === 15`).
- **`long_description`: 13/13 textualmente únicas** entre los centros que la tienen.
- Longitud de `short_description`: entre 218 y 308 caracteres (dentro del rango
  180-450 exigido).
- Slugs: 15/15 únicos.
- 0 servicios fuera del enum cerrado `CenterService` (verificado programáticamente
  contra la lista de 15 valores válidos de `src/types/center.ts`).
- 0 valores `ownership` distintos de `publico`/`privado` (ningún `concertado`).

Estructuras de frase usadas (mínimo 6-8 exigido por el checklist de calidad, ver
`docs/checklist-calidad-nueva-ciudad.md`): 3 estructuras distintas para las 3
escuelas JCyL (cada una con su propio dato de unidades/plazas), 4 estructuras
distintas para las 4 EIM municipales (cada una con su propio barrio y número de
plazas insertado, sin plantilla compartida literal), y 8 estructuras distintas para
los 8 centros privados (variando apertura, orden de datos y foco según los servicios
confirmados de cada uno). No hay dos centros del mismo grupo homogéneo con la misma
frase de apertura de más de 8-9 palabras.

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(según fuente oficial homogénea del primer ciclo de Castilla y León, o el rango
específico declarado en la propia web del centro cuando difiere, p. ej. Educa Babys
desde los 3 meses o Mumakids desde 1 año), titularidad y régimen de adhesión al
programa de gratuidad (para privados) o marco normativo aplicable (para públicos),
horario cuando está confirmado, servicios confirmados cuando aplica y vía de
contacto. Los centros sin `long_description` (Mi Mamá Me Mima, El Tren) incluyen una
FAQ de transparencia ("¿Está verificada la información de esta ficha?"). Ninguna FAQ
afirma un servicio, horario o metodología no verificados. Verificado
automáticamente: 15/15 centros tienen entre 5 y 6 FAQs.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **3 escuelas infantiles** de titularidad genuina de la Junta de Castilla y
  León (Lazarillo de Tormes, San Bernardo, Virgen de la Vega): marco normativo de
  gratuidad, número de unidades/plazas según el listado oficial, comedor confirmado
  por registro oficial.
- Las **4 Escuelas Infantiles Municipales** del Ayuntamiento de Salamanca, con
  descripción específica sobre su titularidad municipal, barrio, plazas y servicios
  homogéneos (comedor y madrugadores) confirmados por la web oficial de la red.
- Los **6 centros privados** con al menos un servicio confirmado por web propia
  (PSN Bicos, Chispitinas, Educa Babys, Tebeo, Aula Pimentón Maestro Ávila,
  Mumakids).

Los **2 centros privados restantes** (Mi Mamá Me Mima, El Tren), con datos limitados
a nombre, dirección, contacto (teléfono, email, y en un caso web), titularidad y
régimen de adhesión al programa de gratuidad según el registro oficial, **no llevan
`long_description`** — se consideró que no había datos suficientes para aportar
valor real más allá de lo ya cubierto en `short_description` y las FAQs. Ambos siguen
en el dataset final porque cumplen el umbral mínimo del proyecto (contacto propio
verificado: web, email y/o teléfono confirmados en fuente propia), pero quedan con
`recommended_indexable: false` hasta que se complete su enriquecimiento de servicios.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 13 / 15 | 86,7% |
| No indexable (noindex, follow) | 2 / 15 | 13,3% |

Los 2 no indexables (Mi Mamá Me Mima, El Tren) son exactamente los centros privados
sin servicio confirmado ni `long_description` (solo nombre, dirección, contacto,
titularidad y régimen de adhesión según el registro oficial de Castilla y León). Es
un resultado honesto del propio gate de calidad del proyecto: quedan crawlables e
incluidos en el sitemap como `noindex, follow` hasta que se complete su
enriquecimiento en una fase posterior. Este ratio de indexabilidad (86,7%) es
notablemente más alto que el de Valladolid (54,8%) gracias al tamaño reducido del
dataset (15 centros frente a 42) y a una cobertura de servicios por web propia
proporcionalmente mayor (6 de 8 centros privados incluidos, 75%, frente al 34,5% de
Valladolid), en parte porque Salamanca tiene menos centros privados de primer ciclo
con código propio en el registro que Valladolid.

---

## 6. Riesgos y bloqueos conocidos

1. **14 colegios concertados con aula de primer ciclo gratuita, descartados en
   bloque sin ficha individual**: Bambi, Calasanz, La Milagrosa, María Auxiliadora,
   Marista Champagnat, Montessori, Sagrado Corazón, Salesiano San José, San Agustín,
   San Estanislao de Kostka, San José, San Juan Bosco, Santísima Trinidad y Coco
   Miel ofertan primer ciclo gratuito según el listado oficial de gratuidad
   2026-2027, pero no tienen código de registro propio y diferenciado de primer
   ciclo en el Directorio de Centros Docentes que permita construir una ficha
   individual fiable (dirección exacta del aula 0-3, teléfono, coordenadas). Es la
   mayor oportunidad de enriquecimiento futuro del dataset — requeriría contacto
   directo con cada colegio o localización de una fuente oficial adicional que
   desglose el aula de primer ciclo de forma independiente.
2. **"El Globo Rojo" excluido por prudencia, no por certeza de irregularidad**: es
   posible que el concierto declarado en el registro corresponda efectivamente al
   segundo ciclo de infantil (3-6 años) impartido en el mismo centro, y que el
   primer ciclo (0-3 años) sea en realidad un servicio no concertado como el resto
   de centros privados de Salamanca. Se recomienda una verificación específica en
   una fase posterior (contacto directo con el centro o consulta al Registro de
   Centros Docentes) antes de decidir si se incorpora al dataset.
3. **"Coco Miel" sin código de registro verificable pese a aparecer en el listado
   oficial de gratuidad**: podría tratarse de un centro de reciente incorporación al
   programa sin actualización aún en el Directorio de Centros Docentes, o de una
   discrepancia de nomenclatura/dirección no resoluble sin contacto directo con la
   Dirección Provincial de Educación de Salamanca. Se recomienda revisar en una
   próxima actualización del Directorio de Centros Docentes.
4. **`district` solo poblado para las 4 EIM municipales (4/15, 26,7%)**: no existe
   un mapeo verificable dirección → barrio para el resto del dataset (Centro, San
   Bernardo, Vidal, Garrido Norte/Sur, Capuchinos, Chinchibarra, etc., de los 44
   barrios reconocidos de Salamanca) sin una fuente cartográfica oficial adicional
   (callejero municipal de Salamanca). No se ha construido esa aproximación no
   verificable para el resto del dataset.
5. **Emails de contacto propios solo confirmados en 6/15 centros (40%)**: el email
   de la fuente oficial de registro es un buzón institucional genérico
   (`{codigo}@educa.jcyl.es`), no un dato de contacto real del centro, y se ha
   descartado sistemáticamente como email publicable.
6. **Aula Pimentón Maestro Ávila con datos de servicios de fuente institucional
   general del colegio, no de una página específica del aula 0-3**: se ha fijado
   `confidence_level: medium` en lugar de `high` por esta limitación, aunque el
   centro sí supera el umbral mínimo de verificación del proyecto.
7. **"El Globo Rojo II" con posible confusión de marca/nombre**: comparte
   titularidad de marca con "El Globo Rojo" (dirección muy próxima, Los Hidalgos 14
   y 18) pero con código de registro propio y distinto; no se ha podido confirmar si
   se trata de una ampliación de plazas del mismo proyecto educativo o de un centro
   operativamente independiente. Se ha tratado como candidato aparte y finalmente
   excluido por falta de datos de contacto propios verificables.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-salamanca.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/salamanca-centers-raw.json` | Extracción sin procesar (17 filas candidatas + contexto de fuentes complementarias), antes de deduplicar/normalizar |
| 3 | `data/enrichment/salamanca-centers.json` | Dataset final: 15 centros verificados y humanizados |
| 4 | `data/enrichment/salamanca-centers-excluded.json` | 3 centros/candidatos excluidos, con motivo documentado |
| 5 | `data/import/salamanca-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/.../Valladolid (15 filas) |
| 6 | `docs/salamanca-quality-report.md` | Este informe |
| 7 | `docs/salamanca-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-salamanca-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-salamanca-centers.sql` | DELETE explícito por lista de 15 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en el resto de zonas ya integradas.
2. **Enriquecimiento futuro** (no bloqueante): contactar o investigar
   individualmente los 14 colegios concertados con aula de primer ciclo gratuita
   detectados en el listado oficial de gratuidad para construir fichas propias
   verificables si se localiza un código de registro o fuente de contacto
   diferenciada; completar `services` para Mi Mamá Me Mima y El Tren; verificar de
   forma específica el alcance del concierto de "El Globo Rojo" para decidir si se
   incorpora en una fase posterior; resolver la incidencia de "Coco Miel"; explorar
   el callejero oficial del Ayuntamiento de Salamanca para asignar `district` de
   forma verificable al resto del dataset (más allá de las 4 EIM municipales),
   priorizando el barrio de Garrido por ser el más poblado (cerca de 40.000
   habitantes, 15% de la población de la ciudad).
3. **Diseño de landings**: con 15 centros en total, hay masa suficiente para
   landings municipales generales, pero el volumen de landings de servicio y de
   barrio es más limitado que en Valladolid — ver detalle completo en
   `docs/salamanca-seo-report.md`.
