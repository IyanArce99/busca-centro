# Informe de calidad — Dataset Valladolid (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Valladolid
capital, análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza, Murcia,
Sevilla, Palma, Málaga, Alicante, Las Palmas, Granada y Córdoba. No se ha tocado
ninguna de esas ciudades, el schema, el código de la app ni Supabase. No se ha
ejecutado SQL. No se ha activado indexación real (esto es un dataset de trabajo, no
un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Valladolid capital) | 46 (13 con `denominacion_generica="ESCUELA DE EDUCACION INFANTIL"` + 33 con `denominacion_generica="CENTRO PRIVADO DE EDUCACION INFANTIL"`) |
| **Centros incluidos en el dataset final** | **42** |
| Centros excluidos (motivo documentado) | 4 |
| Fuentes primarias usadas | 4 principales: Directorio de Centros Docentes (Junta de Castilla y León, portal de datos abiertos), listado "Escuelas de Educación Infantil - Titularidad JCyL", Portal Web del Ayuntamiento de Valladolid (Escuelas Infantiles Municipales) y listado oficial de centros adheridos al programa de gratuidad de primer ciclo curso 2026-2027 — más webs propias de 10 centros privados individuales |

### Composición del dataset final (42)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, red genuina de titularidad de la Junta de Castilla y León (EEI JCyL) | 2 | público | escuela-infantil |
| Público, red municipal (Escuelas Infantiles Municipales, Ayuntamiento de Valladolid) | 11 | público | escuela-infantil |
| Privado adherido al programa de gratuidad de primer ciclo | 29 | privado | guardería |

### Clasificación `ownership`: sin ningún caso de `concertado`, mismo criterio ya validado en Andalucía

Castilla y León no tiene concierto educativo formal para el primer ciclo de
educación infantil (0-3 años): el mecanismo de financiación de centros privados es
una **subvención directa a titulares de centros privados adheridos a la oferta
gratuita de plazas** (Orden EDU/95/2022 y normativa de desarrollo), confirmado
además por el propio listado oficial de centros con plazas gratuitas, que distingue
únicamente "Centros infantiles municipales" y "Centros infantiles privados", sin
ninguna categoría de "concertados". Se ha aplicado `ownership: privado` a los 29
centros privados incluidos en el dataset final, siguiendo el mismo criterio ya
validado en Sevilla, Málaga, Granada y Córdoba.

| Grupo | `naturaleza`/`concierto` en fuente cruda | Verificación realizada | `ownership` final |
|---|---|---|---|
| 2 escuelas (Amanecer, La Cigüeña) | PÚBLICO | Confirmadas como titularidad genuina de la Junta de Castilla y León en el listado oficial "Escuelas de Educación Infantil - Titularidad JCyL" | `publico` |
| 11 escuelas (La Cometa, El Globo, El Tobogán, Platero, El Principito, Mafalda y Guille, Cascanueces, Fantasía, Campanilla, Caballito Blanco, Cascabel) | PÚBLICO | Confirmadas como Escuelas Infantiles Municipales del Ayuntamiento de Valladolid, gestionadas mediante contrato de servicios municipal, en la web oficial del Ayuntamiento | `publico` |
| 29 centros privados incluidos | PRIVADO, `concierto="N"` en 28 de 29 | Confirmados como adheridos al programa de gratuidad de primer ciclo en el listado oficial correspondiente; ninguno con concierto educativo formal verificado para el tramo 0-3 | `privado` |
| 1 centro excluido (Santa Catalina) | PRIVADO, `concierto="S"` | Único caso con concierto declarado en el registro; sin verificación oficial de que ese concierto aplique al primer ciclo 0-3 (podría corresponder a otra etapa del mismo centro) | **excluido del dataset final** |

**A diferencia del hallazgo de riesgo original detectado en Sevilla (174 centros mal
etiquetados como concertados) o Málaga (4 centros privados mal etiquetados como
públicos), en Valladolid el registro oficial resultó internamente consistente**: las
13 filas `naturaleza=PÚBLICO` de la categoría escuela infantil son efectivamente de
titularidad pública genuina (autonómica o municipal), y solo 1 de las 33 filas
`naturaleza=PRIVADO` trae concierto declarado — se ha optado por excluirla en lugar de
asumir un `ownership: concertado` no verificado, siguiendo la regla estricta del
proyecto de no usar ese valor sin fuente oficial de concierto educativo formal
específico del primer ciclo.

### Incidencia de titularidad documentada (no reclasificada): dos centros con gestión mediante convenio Ayuntamiento-Liga Española de la Educación

"Casa de Niñas y Niños Pajarillos" y "Casa de Niñas y Niños Maestro Claudio López
Serrano" están gestionados en la práctica mediante convenio entre el Ayuntamiento de
Valladolid y la Liga Española de la Educación y la Cultura Popular; una fuente
institucional del Ayuntamiento (noticia de 2017-2018) los describe como de
"titularidad pública municipal". El registro oficial de centros docentes vigente
(curso 2025) los clasifica sin embargo como `naturaleza=PRIVADO`. Se ha aplicado el
criterio conservador de respetar la fuente oficial de registro más actual y
específica (`ownership: privado`), documentando la incidencia en ambos centros
(`notes_internal`) para una revisión posterior si aparece una fuente municipal
actualizada que confirme el cambio de titularidad. Ver
`docs/data-sources-valladolid.md`, fuente 1, para el detalle completo.

---

## 2. Resolución de centros excluidos

**4 centros del listado oficial fueron excluidos en este sprint**, documentados en
`data/enrichment/valladolid-centers-excluded.json`:

| Centro | Código | Motivo |
|---|---|---|
| La Pequeña Luna 2 | 47012144 | Sin teléfono, email ni web confirmados en fuente oficial ni en búsqueda de web propia |
| Pipo | 47012387 | Sin teléfono, email ni web confirmados en fuente oficial ni en búsqueda de web propia |
| El Majuelo | 47012041 | Sin teléfono, email ni web confirmados en fuente oficial ni en búsqueda de web propia |
| Santa Catalina | 47004974 | Único centro con concierto="S" en el registro oficial, sin verificación de que el concierto corresponda al primer ciclo 0-3 años (podría ser de otra etapa del mismo centro) |

Ninguno de los 4 se ha forzado dentro del dataset final "por si acaso", conforme a la
regla estricta del proyecto.

---

## 3. Calidad de los datos (dataset final, 42 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 42 / 42 | **100%** (tras 1 corrección puntual verificada en fuente oficial municipal: Cascabel) |
| Email de contacto propio | 9 / 42 | 21,4% (el resto de emails de la fuente cruda son buzones institucionales `@educa.jcyl.es`, no publicados como contacto) |
| Web propia (`contact.website`) | 14 / 42 | 33,3% |
| Coordenadas (lat/lng) | 42 / 42 | **100%** (41/42 de fuente oficial directa; 1/42 geocodificada por dirección verificable — Happy Kids House, ver incidencias) |
| Servicios confirmados (`services` no vacío) | 23 / 42 | **54,8%** |
| `schedule` estructurado | 11 / 42 | 26,2% (las 11 escuelas infantiles municipales, horario homogéneo oficial confirmado; las 2 EEI JCyL y los privados no tienen horario estructurado confirmado por centro individual) |
| `long_description` (único por centro) | 23 / 42 | 54,8% |
| FAQs (5-6 por centro) | 42 / 42 | 100% |
| `district` (barrio) | 11 / 42 | 26,2% (únicamente las 11 escuelas infantiles municipales, cuyo barrio se confirmó en la fuente oficial "Puertas Abiertas" del Ayuntamiento; no se ha inferido barrio para el resto de centros sin fuente cartográfica verificable) |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 23 | Centros con al menos un servicio confirmado por web propia (10 privados) + las 11 EIM municipales (servicios homogéneos confirmados por el Ayuntamiento) + las 2 escuelas JCyL (comedor confirmado por registro oficial) |
| medium | 19 | Resto: solo datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad, adhesión al programa de gratuidad), sin servicio adicional confirmable por web propia |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

- **6 estructuras de frase** para el grupo de privados sin servicio confirmado
  (mayoritario).
- **3 estructuras** para privados con servicio confirmado.
- **2 estructuras** para las 2 escuelas JCyL.
- **4 estructuras** para las 11 escuelas infantiles municipales, cada una con su
  nombre y barrio propios insertados en la plantilla.

Todas las plantillas rotan de forma determinista por hash del código de centro del
Registro de Centros Docentes, no por orden de aparición, para evitar sesgos de
agrupación visual.

Verificación automatizada tras la generación:

- **`short_description`: 42/42 textualmente únicas** (comparación exacta de
  conjunto, `len(set(...)) == 42`).
- **`long_description`: 23/23 textualmente únicas** entre los centros que la tienen.
- Longitud de `short_description`: entre 215 y 331 caracteres (dentro del rango
  180-450 exigido).
- Slugs: 42/42 únicos, sin colisiones de nombre que requirieran desambiguación
  manual (incluidas las sedes múltiples del mismo grupo: Kid's Garden 2/Kid's Garden
  3, Trastes/Trastes San Cristóbal).

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(4-36 meses, según fuente oficial homogénea del primer ciclo de Castilla y León),
titularidad y régimen de adhesión al programa de gratuidad (para privados) o marco
normativo aplicable (para públicos), horario cuando está confirmado (11 EIM
municipales), servicios confirmados cuando aplica y vía de contacto. Todos los
centros sin `long_description` incluyen una FAQ de transparencia ("¿Está verificada
la información de esta ficha?"). Ninguna FAQ afirma un servicio, horario o
metodología no verificados. Verificado automáticamente: 42/42 centros tienen entre 5
y 6 FAQs (ninguno por debajo de 3 ni por encima de 6).

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **2 escuelas infantiles** de titularidad genuina de la Junta de Castilla y
  León (Amanecer, La Cigüeña): marco normativo de gratuidad, comedor confirmado por
  registro oficial.
- Las **11 Escuelas Infantiles Municipales** del Ayuntamiento de Valladolid, con
  descripción específica sobre su titularidad municipal, barrio y servicios
  homogéneos (comedor y/o madrugadores) confirmados por la web oficial del
  Ayuntamiento.
- Los **10 centros privados** con al menos un servicio confirmado por web propia.

Los **19 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono, titularidad y régimen de adhesión al programa de gratuidad según el
registro oficial, **no llevan `long_description`** — se consideró que no había datos
suficientes para aportar valor real más allá de lo ya cubierto en
`short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 23 / 42 | 54,8% |
| No indexable (noindex, follow) | 19 / 42 | 45,2% |

Los 19 no indexables son exactamente los centros privados sin servicio confirmado ni
`long_description` (solo nombre, dirección, contacto, titularidad y régimen de
adhesión según el registro oficial de Castilla y León). Es un resultado honesto del
propio gate de calidad del proyecto: los 19 quedan crawlables e incluidos en el
sitemap como `noindex, follow` hasta que se complete su enriquecimiento en una fase
posterior, en vez de forzarlos a indexar con contenido insuficiente. Este ratio de
indexabilidad (54,8%) es comparable al de Granada (48,3%), gracias a una
investigación de servicios razonablemente exhaustiva por centro individual y a la
alta cobertura de servicios homogéneos confirmados en la red pública (13/13 centros
públicos con servicio confirmado por fuente oficial).

---

## 6. Riesgos y bloqueos conocidos

1. **Volumen de centros privados sin servicio confirmado (19 de 29 incluidos, 65,5%
   ; 23 de 33 candidatos totales)**: no se localizó web propia accesible y
   verificable con suficiente detalle textual para todos los centros privados
   individuales de Valladolid capital. Es la mayor oportunidad de enriquecimiento
   futuro del dataset.
2. **`district` solo poblado para las 11 escuelas infantiles municipales (11/42,
   26,2%)**: no existe un mapeo verificable dirección → barrio para el resto del
   dataset (Delicias, Parquesol, Rondilla, Pilarica, Covaresa, Pajarillos, etc.) sin
   una fuente cartográfica oficial adicional (callejero municipal de Valladolid). No
   se ha construido esa aproximación no verificable para el resto del dataset.
3. **Emails de contacto propios solo confirmados en 9/42 centros (21,4%)**: el email
   de la fuente oficial de registro es un buzón institucional genérico
   (`{codigo}@educa.jcyl.es`), no un dato de contacto real del centro, y se ha
   descartado sistemáticamente como email publicable.
4. **Santa Catalina excluido por prudencia, no por certeza de irregularidad**: es
   posible que el concierto declarado en el registro corresponda efectivamente a
   otra etapa educativa (segundo ciclo de infantil, primaria) impartida en el mismo
   edificio, y que el primer ciclo (0-3 años) sea en realidad un servicio no
   concertado como el resto de centros privados de Valladolid. Se recomienda una
   verificación específica en una fase posterior (contacto directo con el centro o
   consulta al Registro de Centros Docentes) antes de decidir si se incorpora al
   dataset.
5. **"Casa de Niñas y Niños Pajarillos" y "Casa de Niñas y Niños Maestro Claudio
   López Serrano" con posible desactualización de titularidad en el registro
   oficial**: una fuente institucional del Ayuntamiento (2017-2018) los describe
   como titularidad pública municipal gestionada mediante convenio con la Liga
   Española de la Educación, mientras que el registro de centros docentes vigente
   los clasifica como privados. Se ha mantenido la clasificación del registro
   vigente por prudencia, documentando la incidencia explícitamente para revisión
   futura.
6. **Coordenada de "Happy Kids House" geocodificada por dirección, no por fuente
   oficial directa**: el registro oficial no trae coordenadas para este centro; se
   ha usado geocodificación verificable de la calle (Nominatim/OpenStreetMap, nivel
   de vía, barrio Vadillos), marcada explícitamente con `coords_flagged: true` en el
   dataset de trabajo.
7. **Coordenada de "El Despertador Infantil 2010" en el extremo sur del término
   municipal** (lat 41.48283, cerca del límite con otros municipios): se ha
   verificado que el código postal (47015) y la vía (Plaza de Juan Pablo II) son
   consistentes con Valladolid capital según la propia fuente oficial, sin indicio
   de error, pero se deja constancia de la revisión por si una auditoría posterior
   detecta una discrepancia con el término municipal real.
8. **Categoría "CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA" (33
   colegios concertados) descartada en bloque sin evaluación individual**: son
   colegios de segundo ciclo de infantil/primaria/secundaria con concierto
   educativo formal en esas etapas, fuera del alcance MVP de primer ciclo (0-3
   años). No se ha comprobado individualmente si alguno de ellos oferta además
   primer ciclo de forma no reflejada en esta categoría del registro; se considera
   poco probable dado que el propio registro ya tiene una categoría separada y
   específica para primer ciclo (`CENTRO PRIVADO DE EDUCACION INFANTIL`).

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-valladolid.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/valladolid-centers-raw.json` | Extracción sin procesar (46 filas), antes de deduplicar/normalizar |
| 3 | `data/enrichment/valladolid-centers.json` | Dataset final: 42 centros verificados y humanizados |
| 4 | `data/enrichment/valladolid-centers-excluded.json` | 4 centros excluidos del listado oficial, con motivo documentado |
| 5 | `data/import/valladolid-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/.../Granada/Córdoba (42 filas) |
| 6 | `docs/valladolid-quality-report.md` | Este informe |
| 7 | `docs/valladolid-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-valladolid-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-valladolid-centers.sql` | DELETE explícito por lista de 42 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en el resto de zonas ya integradas.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 19
   centros privados incluidos sin servicio confirmado; explorar el callejero oficial
   del Ayuntamiento de Valladolid para asignar `district` de forma verificable al
   resto del dataset (más allá de las 11 EIM municipales); verificar de forma
   específica el alcance del concierto de "Santa Catalina" para decidir si se
   incorpora en una fase posterior; confirmar si "Casa de Niñas y Niños Pajarillos" y
   "Casa de Niñas y Niños Maestro Claudio López Serrano" tienen una titularidad
   actualizada a pública municipal en una fuente oficial más reciente.
3. **Diseño de landings**: con 42 centros en total, hay masa suficiente para
   landings municipales generales y varias landings de servicio, pero no para
   landings de barrio en esta fase — ver detalle completo en
   `docs/valladolid-seo-report.md`.
