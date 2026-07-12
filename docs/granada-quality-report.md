# Informe de calidad — Dataset Granada (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Granada capital,
análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla,
Palma, Málaga y Alicante. No se ha tocado ninguna de esas ciudades, el schema, el
código de la app ni Supabase. No se ha ejecutado SQL. No se ha activado indexación
real (esto es un dataset de trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Granada capital) | 60 (14 con `D_TIPO=Público` en la fuente cruda + 46 con `D_TIPO=Privado`) |
| **Centros incluidos en el dataset final** | **60** |
| Centros excluidos (motivo documentado) | 0 |
| Fuentes primarias usadas | 3 principales: "Centros de primer ciclo de educación infantil en Andalucía, con alumnado matriculado" (Junta de Andalucía, portal de datos abiertos), Portal de Escolarización 0-3 años (Junta de Andalucía) y Fundación Pública Local GranadaEduca (Ayuntamiento de Granada) — más webs propias de 15 centros privados individuales |

### Composición del dataset final (60)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, red genuina de titularidad de la Junta de Andalucía | 10 | público | escuela-infantil |
| Público, red municipal (Fundación Pública Local GranadaEduca) | 4 | público | escuela-infantil |
| Privado adherido al Programa de Ayuda a las Familias | 33 | privado | guardería |
| Privado no adherido | 13 | privado | guardería |

### Clasificación `ownership`: hallazgo específico de Granada, distinto del patrón de riesgo de Sevilla/Málaga

La instrucción de partida de este sprint alertaba sobre el riesgo detectado en
Sevilla (174 centros privados adheridos al Programa de Ayuda a las Familias
clasificados incorrectamente como `concertado`) y en Málaga (4 centros privados con
`D_TIPO="Público"` en la fuente cruda que en realidad eran empresas privadas
subvencionadas). Se aplicó el mismo nivel de rigor en Granada, verificando
individualmente las 14 filas con `D_TIPO="Público"`:

| Grupo | `D_TIPO` en fuente cruda | `D_DENOMINA` | Verificación realizada | `ownership` final |
|---|---|---|---|---|
| 10 escuelas (Almanjáyar, Cristo de la Yedra, Portal de Belén, El Príncipe, Santo Domingo, Virgen del Carmen, Virgen de Loreto, Virgen Inmaculada, Los Mondragones, Juan Latino) | Público | Escuela Infantil | Nombres sin marca comercial, `pub_adh_inf1`/`pub_noadh_inf1` marcado, horario homogéneo confirmado en fuente institucional de la Junta | `publico` (red autonómica genuina) |
| 4 escuelas (Arlequín, Belén, Duende, Luna) | Público | **Centro de Convenio** | Verificadas individualmente en `fundaciongranadaeduca.org`: son las 4 Escuelas Infantiles Municipales del Ayuntamiento de Granada, gestionadas por la Fundación Pública Local GranadaEduca (entidad pública municipal). Contacto (teléfono/email) coincide al 100% entre ambas fuentes | `publico` (red municipal genuina) |

**A diferencia de Málaga, ninguna de las 14 filas `D_TIPO="Público"` de Granada
resultó ser una empresa privada mal etiquetada.** Las 4 filas "Centro de Convenio"
son un patrón distinto al de Novaschool/5 Chupetes en Málaga: no son empresas
privadas con financiación pública parcial, sino escuelas de titularidad **pública
municipal genuina** que colaboran con la Junta de Andalucía mediante convenio (de
ahí la etiqueta administrativa), verificado de forma independiente en la web
institucional de su titular real (Ayuntamiento de Granada / Fundación Pública Local
GranadaEduca), no solo en la fuente autonómica.

**Ninguno de los 60 centros usa `ownership: concertado`.** Andalucía no tiene
concierto educativo formal para el primer ciclo de infantil (0-3 años). Cuatro
centros privados de este dataset (La Asunción, San Isidoro, Monaita/Mulhacén,
Nazaret) tienen concierto educativo verificado en fuentes de terceros, pero
**únicamente para etapas posteriores** (Primaria/Secundaria/Bachillerato), fuera
del alcance MVP de este proyecto. La fuente oficial específica de primer ciclo
(0-3 años) los clasifica de forma inequívoca como `Privado`, con
`priv_noadh_inf1="S"` en los cuatro casos (no adheridos al Programa de Ayuda a las
Familias para el tramo 0-3). Se ha respetado esa clasificación oficial específica
de la etapa 0-3, sin mezclar el régimen de financiación de otras etapas educativas.
El detalle completo está en `docs/data-sources-granada.md`, fuente 1 y fuente 4.

---

## 2. Resolución de centros excluidos

**Ningún centro del listado oficial fue excluido en este sprint.** Los 60
candidatos evaluados superaron el umbral mínimo de verificación del proyecto: los
60 tienen teléfono y email confirmados (100%, tras dos correcciones puntuales
documentadas y verificadas en fuente propia — ver `docs/data-sources-granada.md`,
sección de incidencias), además de dirección, titularidad y coordenadas
verificables en el 100% de los casos.

El archivo `data/enrichment/granada-centers-excluded.json` existe con la estructura
estándar del proyecto pero con `centers: []`, documentando que la comprobación se
realizó y no encontró candidatos del listado oficial por debajo del umbral mínimo.

---

## 3. Calidad de los datos (dataset final, 60 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 60 / 60 | **100%** (tras 1 corrección puntual verificada en web propia: Pulpitos) |
| Email | 60 / 60 | **100%** (tras 1 corrección puntual verificada en web propia: Sueña by Nerea Bedmar) |
| Web propia (`contact.website`) | 15 / 60 | 25.0% |
| Coordenadas (lat/lng) | 60 / 60 | **100%** (de fuente oficial directa, sin incidencias de coordenadas erróneas detectadas) |
| Servicios confirmados (`services` no vacío) | 19 / 60 | **31.7%** |
| `schedule` estructurado | 14 / 60 | 23.3% (10 escuelas Junta de Andalucía con horario homogéneo oficial + 4 EIM municipales GranadaEduca con horario propio confirmado) |
| `long_description` (único por centro) | 29 / 60 | 48.3% |
| FAQs (5-6 por centro) | 60 / 60 | 100% |
| `district` | 4 / 60 | 6.7% (únicamente las 4 EIM municipales, cuyo distrito/barrio se confirmó en fuente oficial propia de GranadaEduca; no se ha inferido distrito para el resto de centros sin fuente cartográfica verificable) |
| `neighborhood_barrio` | 0 / 60 | 0% (no se detectaron menciones sistemáticas de barriada dentro del campo `street` de la fuente oficial, a diferencia de Sevilla/Málaga) |

**Corrección post-generación (incidencia G1, aplicada):** el campo `Correo_e` de la
fuente oficial trae en un caso (La Asunción) dos direcciones concatenadas con
espacios y guion (`secretaria@asunciongranada.es      -      asuncion@asunciongranada.es`).
Se ha conservado únicamente el primer correo válido tras `trim`, sin modificar
ningún otro campo.

**Corrección post-generación (incidencia G2, aplicada):** 2 filas con teléfono o
email vacío en la fuente cruda (Sueña by Nerea Bedmar sin email; Pulpitos sin
teléfono). Se completaron con el dato equivalente verificado en la web propia de
cada centro, documentado explícitamente en `docs/data-sources-granada.md`. No se ha
inventado ningún dato: ambos valores están verificados en fuente primaria propia
del centro.

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 29 | Centros con al menos un servicio confirmado por web propia (15 privados) + las 4 EIM municipales (servicios confirmados por GranadaEduca) + las 10 escuelas Junta de Andalucía (horario homogéneo oficial verificado) |
| medium | 31 | Resto: solo datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad, adhesión), sin servicio adicional confirmable por web propia |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

- **6 estructuras de frase** para el grupo de privados adheridos sin servicio
  confirmado (mayoritario).
- **4 estructuras** para el grupo de privados no adheridos sin servicio
  confirmado.
- **3 estructuras** para privados adheridos con servicio confirmado.
- **2 estructuras** para privados no adheridos con servicio confirmado.
- **4 estructuras** para las 10 escuelas públicas de la red Junta de Andalucía.
- **4 descripciones específicas** (no plantilla, redactadas a medida citando el
  nombre propio de cada escuela) para las 4 EIM municipales de GranadaEduca.

Todas las plantillas rotan de forma determinista por hash del código de centro del
Registro de Centros Docentes, no por orden de aparición, para evitar sesgos de
agrupación visual.

Verificación automatizada tras la generación:

- **`short_description`: 60/60 textualmente únicas** (comparación exacta de
  conjunto, `len(set(...)) == 60`).
- **`long_description`: 29/29 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 259 y 368 caracteres (dentro del rango
  180-450 exigido).
- Longitud de `long_description`: entre 646 y 1497 caracteres (dentro del rango
  aproximado 600-1500 ya usado en zonas anteriores).
- Slugs: 60/60 únicos, sin colisiones de nombre que requirieran desambiguación
  manual.

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(4-36 meses, según fuente oficial homogénea del primer ciclo andaluz), titularidad
y régimen de adhesión al Programa de Ayuda a las Familias (para privados) o marco
normativo aplicable (para públicos), horario cuando está confirmado (10 escuelas
Junta + 4 EIM municipales), servicios confirmados cuando aplica y vía de contacto.
Para mantener el número de FAQs dentro del rango 3-6 exigido por el proyecto, los
centros con 3 o más servicios confirmados consolidan sus servicios en una única
pregunta ("¿Qué servicios ofrece este centro?") en vez de una FAQ por servicio;
los centros con 1-2 servicios mantienen una FAQ específica por servicio. Todos los
centros sin `long_description` incluyen una FAQ de transparencia ("¿Está
verificada la información de esta ficha?"). Ninguna FAQ afirma un servicio,
horario o metodología no verificados. Verificado automáticamente: 60/60 centros
tienen entre 5 y 6 FAQs (ninguno por debajo de 3 ni por encima de 6).

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **10 escuelas infantiles públicas** de titularidad de la Junta de Andalucía
  (fuente oficial homogénea y verificada: horario, comedor, proceso de admisión,
  marco de gratuidad progresiva del Decreto 76/2025).
- Las **4 Escuelas Infantiles Municipales** de GranadaEduca (Arlequín, Belén,
  Duende, Luna), con descripción específica sobre su titularidad municipal,
  ubicación por distrito/barrio y servicios confirmados por la propia Fundación.
- Los **15 centros privados** con al menos un servicio confirmado por web propia.

Los **31 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono/email, titularidad y régimen de adhesión según el registro oficial, **no
llevan `long_description`** — se consideró que no había datos suficientes para
aportar valor real más allá de lo ya cubierto en `short_description` y las FAQs.

**Nota específica sobre el alcance MVP en las 4 EIM municipales**: estas escuelas
atienden oficialmente de 4 meses a 6 años (primer y segundo ciclo en el mismo
centro). Siguiendo estrictamente el alcance MVP del proyecto (únicamente
`guarderia` y `escuela-infantil` de primer ciclo, 0-3 años), se ha fijado
`age_range` en 4-36 meses para las 4 EIM y se ha dejado constancia explícita en
`long_description` y FAQs de que también cuentan con aulas de 3-6 años fuera del
alcance de esta ficha, evitando que el contenido genere una expectativa incorrecta
sobre lo que cubre este directorio.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 29 / 60 | 48.3% |
| No indexable (noindex, follow) | 31 / 60 | 51.7% |

Los 31 no indexables son exactamente los centros privados sin servicio confirmado
ni `long_description` (solo nombre, dirección, contacto, titularidad y régimen de
adhesión según el registro oficial de la Junta de Andalucía). Es un resultado
honesto del propio gate de calidad del proyecto: los 31 quedan crawlables e
incluidos en el sitemap como `noindex, follow` hasta que se complete su
enriquecimiento en una fase posterior, en vez de forzarlos a indexar con contenido
insuficiente. Este ratio de indexabilidad (48.3%) es notablemente mejor que el de
Málaga (16.4%), gracias a una investigación de servicios más exhaustiva por centro
individual en este sprint.

---

## 6. Riesgos y bloqueos conocidos

1. **Volumen de centros privados sin servicio confirmado (31 de 46, 67%)**: no se
   localizó web propia accesible y verificable con suficiente detalle textual para
   todos los centros privados individuales de Granada capital. Es la mayor
   oportunidad de enriquecimiento futuro del dataset.
2. **`district` solo poblado para las 4 EIM municipales (4/60, 6.7%)**: no existe
   un mapeo verificable código postal → distrito para el resto de centros
   (Albaicín, Centro, Genil, Zaidín, Ronda, Beiro, Norte, Chana) sin una fuente
   cartográfica oficial adicional (callejero municipal de Granada). No se ha
   construido esa aproximación no verificable para el resto del dataset.
3. **Alcance 0-6 años de las 4 EIM municipales frente al MVP 0-3 del proyecto**:
   documentado explícitamente en `long_description` y FAQs de cada una de las 4
   escuelas, para no generar una expectativa de servicio de segundo ciclo (3-6
   años) que este directorio no cubre en su fase actual.
4. **Cuatro centros privados con concierto en otras etapas educativas (La
   Asunción, San Isidoro, Monaita/Mulhacén, Nazaret)**: se ha verificado con
   cuidado que ese concierto no aplica al tramo 0-3 años (fuente oficial
   específica de primer ciclo los marca como Privado, no adherido). Riesgo de
   confusión documentado explícitamente para evitar que una futura revisión
   reclasifique estos centros como `concertado` basándose en fuentes de terceros
   que describen sus etapas de Primaria/Secundaria, no su primer ciclo de
   infantil.
5. **Dominio `centroinfantilsuena.com` no resoluble directamente desde esta
   investigación** (posible caída temporal o bloqueo de red): el email de
   contacto de "Sueña by Nerea Bedmar" se ha verificado mediante resultados de
   búsqueda que citan directamente el contenido de contacto del propio sitio, no
   mediante acceso directo. Se recomienda una verificación adicional puntual en
   una fase posterior si el dominio vuelve a estar accesible.
6. **Servicios frecuentes mencionados en las webs verificadas pero no soportados
   por el enum cerrado `CenterService`**: varias webs mencionan sistemas de
   videovigilancia/webcam (La Guarde), servicios de logopedia/atención temprana
   (Érase una vez, Santa Rosalía), o "escuela de padres" mencionada solo en un
   snippet indirecto sin confirmación textual directa en la propia web (Bola de
   Oro). No se ha forzado ningún valor del enum para representar estos datos no
   equivalentes o insuficientemente confirmados.
7. **"Garabatos" y "Garabatos de Arabial"**: se detectó una web con el mismo
   nombre comercial pero domicilio en Huelva capital, no en Granada. Se descartó
   explícitamente como fuente para ambos centros de Granada, siguiendo el mismo
   criterio de precaución ya aplicado en Málaga con el caso "Garabato"/"El
   Garabato" de Alhaurín de la Torre — no se asignan servicios por similitud de
   nombre sin confirmación de dirección exacta.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-granada.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/granada-centers-raw.json` | Extracción sin procesar (60 filas), antes de deduplicar/normalizar |
| 3 | `data/enrichment/granada-centers.json` | Dataset final: 60 centros verificados y humanizados |
| 4 | `data/enrichment/granada-centers-excluded.json` | 0 centros excluidos del listado oficial (estructura estándar) |
| 5 | `data/import/granada-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/Zaragoza/Murcia/Sevilla/Málaga (60 filas) |
| 6 | `docs/granada-quality-report.md` | Este informe |
| 7 | `docs/granada-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-granada-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-granada-centers.sql` | DELETE explícito por lista de 60 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en el resto de zonas ya integradas.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 31
   centros privados sin servicio confirmado; explorar el callejero oficial del
   Ayuntamiento de Granada para asignar `district` de forma verificable al resto
   del dataset (más allá de las 4 EIM municipales); verificar de nuevo el dominio
   de "Sueña by Nerea Bedmar" si vuelve a estar accesible.
3. **Diseño de landings**: con 60 centros en total, hay masa suficiente para
   landings municipales generales y varias landings de servicio, pero no para
   landings de distrito/barrio en esta fase — ver detalle completo en
   `docs/granada-seo-report.md`.
