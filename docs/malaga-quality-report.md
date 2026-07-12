# Informe de calidad — Dataset Málaga (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Málaga capital,
análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla y
Palma. No se ha tocado ninguna de esas ciudades, el schema, el código de la app ni
Supabase. No se ha ejecutado SQL. No se ha activado indexación real (esto es un
dataset de trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Málaga capital) | 152 (10 con `D_TIPO=Público` en la fuente cruda + 142 con `D_TIPO=Privado`) |
| **Centros incluidos en el dataset final** | **152** |
| Centros excluidos (motivo documentado) | 0 (con una pista de enriquecimiento pendiente no incluida, ver sección 6) |
| Fuentes primarias usadas | 2 principales: "Centros de primer ciclo de educación infantil en Andalucía, con alumnado matriculado" (Junta de Andalucía, portal de datos abiertos) y Portal de Escolarización 0-3 años (Junta de Andalucía) — más webs propias de 8 cadenas/centros (20 sedes) y la web institucional de la Universidad de Málaga |

### Composición del dataset final (152)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, red genuina de titularidad de la Junta de Andalucía | 5 | público | escuela-infantil |
| Público, titularidad de la Universidad de Málaga | 1 | público | escuela-infantil |
| Privado adherido al Programa de Ayuda a las Familias | 135 | privado | guardería |
| Privado no adherido | 11 | privado | guardería |

### Clasificación `ownership`: la corrección clave de este sprint (aplicando la lección de Sevilla desde el origen)

A diferencia de Sevilla, donde la corrección de `ownership: concertado` a
`ownership: privado` se hizo **después** de una auditoría, en Málaga se aplicó
**desde el inicio de la investigación** el criterio ya validado: Andalucía no tiene
concierto educativo formal para el primer ciclo de infantil (0-3 años), así que
**ningún centro del dataset usa `ownership: concertado`**.

Además, Málaga presentó un matiz adicional no visto en Sevilla: de las 10 filas con
`D_TIPO="Público"` en la fuente oficial cruda, solo 6 correspondían a titularidad
pública genuina tras verificación individual en web propia:

| Nombre | `D_TIPO` en fuente cruda | Verificación en web propia | `ownership` final aplicado |
|---|---|---|---|
| La Palma, Los Asperones, Reyes Magos, San José, Santo Ángel | Público | Sin marca comercial, nombres de barriada, sin web comercial — coherente con red genuina de la Junta de Andalucía | `publico` |
| Francisca Luque | Público | Web oficial en `uma.es`: escuela infantil de titularidad de la Universidad de Málaga, acceso restringido a la comunidad universitaria | `publico` (matiz: titularidad pública universitaria, no red Junta/municipal — documentado explícitamente en `long_description` y FAQs de este centro) |
| Novaschool Málaga Centro, Novaschool Baby Sunland | Público | Web oficial propia describe el centro como "adherido al Programa de Ayudas a las Familias"; es el Grupo Educativo Novaschool, empresa privada | Reclasificado a `privado` |
| 5 Chupetes Guadalhorce, 5 Chupetes Simón Bolívar | Público | Web oficial y prensa confirman "subvencionada por la Junta de Andalucía"; convenio de financiación de puestos escolares con el Ayuntamiento; empresa privada (S.L.) | Reclasificado a `privado` |

**Ninguno de los 152 centros usa `ownership: concertado`.** El detalle completo de
esta verificación está en `docs/data-sources-malaga.md`, fuente 1.

---

## 2. Resolución de centros excluidos

**Ningún centro del listado oficial fue excluido en este sprint.** Los 152
candidatos evaluados superaron el umbral mínimo de verificación del proyecto: los
152 tienen al menos teléfono o email confirmado directamente en la fuente oficial
de la Junta de Andalucía (149/152 con teléfono, 152/152 con email), además de
dirección, titularidad y coordenadas verificables en el 100% de los casos.

El archivo `data/enrichment/malaga-centers-excluded.json` existe con la estructura
estándar del proyecto pero con `centers: []`, documentando que la comprobación se
realizó y no encontró candidatos del listado oficial por debajo del umbral mínimo.

**Nota distinta de "0 excluidos"**: se detectó un centro mencionado en fuente
municipal (Ayuntamiento de Málaga) — "Escuela Municipal Infantil Colores de
Málaga", C/ Chaves 5, 61 plazas 0-3 años — que **no aparece en absoluto** en la
fuente oficial principal de la Junta de Andalucía (el CSV filtrado por
`D_MUNICIPIO="Málaga"`), pese a búsqueda específica por nombre y dirección. No se
ha podido obtener su código de centro del Registro de Centros Docentes ni un
teléfono/email de fuente primaria propia con el mismo nivel de verificación que el
resto del dataset. Como no llegó a constituir un "candidato" con datos mínimos
verificables (ni siquiera contacto), **no se ha forzado su inclusión ni en el
dataset final ni en el archivo de excluidos con un registro incompleto** — queda
documentado como bloqueo/pista de enriquecimiento en `docs/data-sources-malaga.md`
(fuente 3) y en la sección 6 de este informe.

---

## 3. Calidad de los datos (dataset final, 152 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 149 / 152 | 98.0% |
| Email | 152 / 152 | **100%** |
| Web | 20 / 152 | 13.2% |
| Coordenadas (lat/lng) | 152 / 152 | **100%** (de fuente oficial directa, sin incidencias de coordenadas erróneas detectadas) |
| Servicios confirmados (`services` no vacío) | 20 / 152 | **13.2%** |
| `schedule` estructurado | 7 / 152 | 4.6% (las 5 escuelas públicas de la Junta con horario oficial homogéneo + 2 privadas — Novaschool Málaga Centro y Baby Sunland — con horario propio confirmado por web oficial) |
| `long_description` (único por centro) | 25 / 152 | 16.4% |
| FAQs (5-6 por centro) | 152 / 152 | 100% |
| `neighborhood_barrio` | 0 / 152 | 0% (a diferencia de Sevilla, en la dirección oficial de los centros de Málaga no aparecen menciones explícitas y sistemáticas de barriada/urbanización que permitieran extraerlo sin inferencia; solo aparecen referencias puntuales dentro del propio `street`, p. ej. "Bda. La Palma", "Bda. El Palo", "Urb. San José", que se han dejado en el campo de dirección tal cual venían en la fuente, no separadas a un campo estructurado distinto para evitar una segmentación no verificable centro a centro) |

**Corrección post-auditoría (incidencia M1, aplicada):** el campo `Correo_e` de la
fuente oficial de la Junta de Andalucía trae en ocasiones varias direcciones
concatenadas con `;`, `/` o espacios irregulares. 11 centros del dataset habían
heredado ese formato sin depurar en `email` (uno de ellos, además, con un email
truncado e inválido). Se ha corregido para conservar únicamente el primer correo
válido de cada centro (con `trim`), sin modificar ningún otro campo. Caso especial:
`maypi-malaga` tenía el email `pilarsiruela@hotmail.c` truncado; se ha sustituido
por `maypi.s.l.1@gmail.com`, verificado de forma independiente. La cifra de
cobertura de email (152/152, 100%) no varía; solo cambia el formato del valor
almacenado. Centros afectados: montessori-puerto-malaga, santa-teresa-malaga,
pequeno-avion-malaga, la-palma-malaga, la-torreta-malaga, gibralfaro-malaga,
maypi-malaga, novaschool-malaga-centro-malaga, nazaret-malaga,
don-pablito-v-malaga, pemolo-malaga.

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 20 | Centros con al menos un servicio confirmado por web propia (5 escuelas públicas Junta quedan en `medium`, ver nota) |
| medium | 132 | Resto: solo datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad, adhesión), sin servicio adicional confirmable por web propia |
| low / unknown | 0 | Ninguno entra en el dataset final |

Nota: las 5 escuelas públicas de la red Junta de Andalucía tienen `confidence_level:
medium` porque no se localizó una web propia individual por centro (comparten
horario oficial homogéneo verificado en fuente institucional, pero no una ficha
propia con más detalle) — es una decisión conservadora, no una carencia de dato
básico.

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

- **6 estructuras de frase distintas** para el grupo mayoritario de privados sin
  servicio confirmado (127 centros), rotando de forma determinista por hash del
  código de centro.
- **4 estructuras** para el grupo de privados con servicio confirmado por web
  propia (19 centros, todas menos Francisca Luque que tiene descripción propia
  específica por ser un caso singular).
- **4 estructuras** para el grupo de las 5 escuelas públicas de la Junta de
  Andalucía.
- **1 descripción específica** (no plantilla, redactada a medida) para Francisca
  Luque, único centro de titularidad universitaria del dataset.

Verificación automatizada tras la generación:

- **`short_description`: 152/152 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 152`).
- **`long_description`: 25/25 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 180 y 402 caracteres (dentro del rango
  180-450 exigido; un caso límite —"Piruleta"— quedó en 160 caracteres con la
  plantilla base y se completó con una frase de cierre factual adicional para
  cumplir el mínimo, sin añadir ningún dato no verificado).
- Longitud de `long_description`: entre 698 y 1012 caracteres (dentro del rango
  600-1500 exigido).
- Slugs: 152/152 únicos, sin colisiones de nombre que requirieran desambiguación
  manual (a diferencia del caso "Arco Iris" en Sevilla).

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(4-36 meses, según fuente oficial homogénea del primer ciclo andaluz), titularidad
y régimen de adhesión al Programa de Ayuda a las Familias, horario cuando está
confirmado (las 5 escuelas públicas Junta + 2 privadas Novaschool), servicios
confirmados (comedor, bilingüe/inglés, horario ampliado, etc., cuando aplica) y vía
de contacto. Todos los centros sin `long_description` incluyen una FAQ de
transparencia ("¿Está verificada la información de esta ficha?"). Ninguna FAQ
afirma un servicio, horario o metodología no verificados.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **5 escuelas infantiles públicas** de titularidad de la Junta de Andalucía
  (fuente oficial homogénea y verificada: horario, comedor, proceso de admisión).
- **Francisca Luque** (Universidad de Málaga), con descripción específica sobre su
  régimen de acceso restringido a la comunidad universitaria y servicios
  confirmados por su propia web.
- Los **19 centros privados restantes** con al menos un servicio confirmado por
  web propia (Novaschool ×2, Don Pablito ×6, 5 Chupetes ×2, Pipiolines ×4, Pequeño
  Picasso ×3, Piruleta ×1, Institución Miramar ×1).

Los **127 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono/email, titularidad y régimen de adhesión según el registro oficial, **no
llevan `long_description`** — se consideró que no había datos suficientes para
aportar valor real más allá de lo ya cubierto en `short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 25 / 152 | 16.4% |
| No indexable (noindex, follow) | 127 / 152 | 83.6% |

Los 127 no indexables son exactamente los centros privados sin servicio confirmado
ni `long_description` (solo nombre, dirección, contacto, titularidad y régimen de
adhesión según el registro oficial de la Junta de Andalucía). Es un resultado
honesto del propio gate de calidad del proyecto: los 127 quedan crawlables e
incluidos en el sitemap como `noindex, follow` hasta que se complete su
enriquecimiento en una fase posterior, en vez de forzarlos a indexar con contenido
insuficiente.

---

## 6. Riesgos y bloqueos conocidos

1. **Volumen alto de centros privados sin servicio confirmado (127 de 146, 87%)**:
   no se localizó web propia accesible y verificable para la gran mayoría de los
   centros privados individuales de Málaga capital, o la web encontrada no
   confirmaba servicios concretos del enum con claridad suficiente. No es un
   bloqueante para incluir el centro en el dataset (todos tienen al menos email de
   fuente oficial, y 149/152 también teléfono), pero sí limita su indexabilidad
   automática. Es la mayor oportunidad de enriquecimiento futuro del dataset de
   Málaga.
2. **"Escuela Municipal Infantil Colores de Málaga" no incluida** (ver sección 2):
   fuente municipal la menciona (C/ Chaves 5, 61 plazas 0-3 años, "coordinada con
   la Junta de Andalucía"), pero no aparece en el CSV oficial de la Junta filtrado
   por municipio, y no se localizó código de centro ni contacto directo verificable
   en fuente primaria. Recomendación: en una fase posterior, contactar
   directamente con el Área de Educación del Ayuntamiento de Málaga
   (`educacion.malaga.eu`) para obtener el código de centro oficial y datos de
   contacto verificables antes de incorporarlo.
3. **`D_TIPO="Público"` de la fuente oficial no es fiable sin verificación
   individual**: 4 de las 10 filas marcadas como públicas en la fuente cruda eran
   en realidad centros privados (Novaschool ×2, 5 Chupetes ×2) con financiación
   pública parcial. Se verificó cada una individualmente antes de aplicar
   `ownership`, en vez de asumir el valor de la columna sin contraste — ver detalle
   completo en `docs/data-sources-malaga.md`, fuente 1. Este hallazgo es
   específico de Málaga (no se detectó el mismo patrón en la verificación de
   Sevilla) y debería tenerse en cuenta como comprobación estándar para futuras
   zonas de Andalucía.
4. **`neighborhood_barrio` no extraído a campo estructurado (0/152)**: a
   diferencia de Sevilla (17/218 con barriada extraída), en Málaga las menciones de
   barriada en la dirección oficial son más escasas y menos sistemáticas
   ("Bda. La Palma", "Bda. El Palo", "Urb. San José", "Bda. Puerto Sol"). Se
   decidió no extraerlas a un campo separado para evitar una segmentación
   heterogénea y parcialmente arbitraria; quedan visibles tal cual dentro del
   campo `street`, que sí es un dato literal de la fuente oficial.
5. **No existe `district` (los 10 distritos administrativos de Málaga: Centro,
   Este, Ciudad Jardín, Bailén-Miraflores, Palma-Palmilla, Cruz de Humilladero,
   Carretera de Cádiz, Churriana, Campanillas, Puerto de la Torre) para ningún
   centro del dataset** — un mapeo código postal → distrito no es 1:1 verificable
   sin una fuente cartográfica oficial adicional (el callejero municipal de
   Málaga), y no se ha construido esa aproximación no verificable. Ver informe SEO
   para el impacto de esta brecha en las landings de distrito.
6. **Servicios frecuentes mencionados en las webs verificadas pero no soportados
   por el enum cerrado `CenterService`**: varias webs mencionan sistemas de
   videovigilancia/webcam (Institución Miramar, Pequeño Picasso), metodología
   Montessori como marca (varios centros llamados "Montessori I/II/Málaga/Puerto"
   en el listado, sin verificación de que apliquen realmente el método, solo el
   nombre comercial), o servicios de "atención temprana" (Pipiolines). No se ha
   forzado ningún valor del enum para representar estos datos no equivalentes; se
   ha dejado esa información no estructurada fuera del dataset.
7. **Pequeño Picasso usa la palabra "concertado" en su propio marketing**: se
   verificó explícitamente que también se autodescribe como "adherido al programa
   de ayudas de la Junta de Andalucía" en otra sección de su misma web, y se ha
   aplicado el criterio técnico correcto (`ownership: privado`), no el término de
   marketing del propio centro. Ver `docs/data-sources-malaga.md`, fuente 4.
8. **Centros con nombre "Montessori" (4 en el listado: Montessori I, Montessori
   II, Montessori Málaga, Montessori Puerto) no se investigaron individualmente en
   profundidad** por volumen y tiempo de sprint — quedan con `services: []` salvo
   verificación futura, para no asumir por el nombre comercial que aplican
   realmente la pedagogía Montessori sin confirmación en fuente propia.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-malaga.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/malaga-centers-raw.json` | Extracción sin procesar (152 filas), antes de deduplicar/normalizar |
| 3 | `data/enrichment/malaga-centers.json` | Dataset final: 152 centros verificados y humanizados |
| 4 | `data/enrichment/malaga-centers-excluded.json` | 0 centros excluidos del listado oficial (estructura estándar) |
| 5 | `data/import/malaga-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/Zaragoza/Murcia/Sevilla (152 filas) |
| 6 | `docs/malaga-quality-report.md` | Este informe |
| 7 | `docs/malaga-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-malaga-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-malaga-centers.sql` | DELETE explícito por lista de 152 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en el resto de zonas ya integradas.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 127
   centros privados sin servicio confirmado; investigar y, si procede, incorporar
   la "Escuela Municipal Infantil Colores de Málaga" con código de centro y
   contacto verificado; explorar el callejero oficial del Ayuntamiento de Málaga
   para asignar `district` de forma verificable.
3. **Diseño de landings**: con 152 centros en total, hay masa suficiente para
   landings municipales generales y varias landings de servicio, pero no para
   landings de distrito/barrio en esta fase — ver detalle completo en
   `docs/malaga-seo-report.md`.
