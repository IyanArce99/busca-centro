# Informe de calidad — Dataset Las Palmas de Gran Canaria (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Las Palmas de
Gran Canaria (capital), análogo al realizado para Madrid, Barcelona, Valencia,
Zaragoza, Murcia, Sevilla, Palma, Málaga y Alicante. No se ha tocado ninguna de
esas ciudades, el schema, el código de la app ni Supabase. No se ha ejecutado
SQL. No se ha activado indexación real (esto es un dataset de trabajo, no un
despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil en Las Palmas de Gran Canaria) | 40 (14 EEI públicas + 26 CPEI privados) |
| Excluidos por quedar fuera del alcance MVP / acceso público general | 3 |
| **Centros incluidos en el dataset final** | **37** |
| Fuentes primarias usadas | 2 principales: "Directorio de centros educativos de Canarias" (Consejería de Educación, Formación Profesional, Actividad Física y Deportes, Gobierno de Canarias, portal datos.canarias.es) y web oficial del Ayuntamiento de Las Palmas de Gran Canaria (Escuelas Infantiles Municipales, gestión TRASA) — más webs propias/canal propio de 13 centros privados |

### Composición del dataset final (37)

| Grupo | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, titularidad municipal (Escuelas Infantiles Municipales, Ayuntamiento de Las Palmas de Gran Canaria, gestión TRASA) | 11 | público | escuela-infantil |
| Privado, con al menos un servicio confirmado por fuente propia | 13 | privado | guardería |
| Privado, sin servicio confirmado por fuente oficial | 13 | privado | guardería |

### Clasificación `type`: guardería vs. escuela infantil

Se aplicó el mismo criterio que en Madrid, Barcelona, Valencia, Zaragoza,
Murcia, Sevilla, Palma, Málaga y Alicante: titularidad pública o gestión
institucional consolidada en red → `escuela-infantil`; centros privados de
gestión individual/empresarial → `guarderia`. En Las Palmas de Gran Canaria esto
coincide exactamente con la frontera público/privado observada en la fuente
oficial: las 11 escuelas municipales son `escuela-infantil`; los 26 centros
privados son `guarderia`.

### Ownership

| Ownership | Cantidad | Criterio |
|---|---|---|
| Público | 11 | Titularidad "Administración Local" en la fuente oficial (Escuelas Infantiles Municipales, gestión TRASA, Ayuntamiento de Las Palmas de Gran Canaria) |
| Privado | 26 | `DesEtapaCentro = "CPEI"` (Centro Privado de Educación Infantil) en la fuente oficial |
| Concertado | 0 | La columna `Concierto` del CSV oficial aparece vacía en los 37 registros finales. Además, se verificó explícitamente en 2 casos (Marpe Infantil, dentro del Colegio Marpe Altavista; Los Jaimitos, dentro del Colegio Jaime Balmes) que, aunque el colegio en conjunto tiene concierto para Primaria/Secundaria (y en el caso de Jaime Balmes, también segundo ciclo de infantil gratuito), el **primer ciclo de infantil (0-3 años) queda explícitamente fuera de ese concierto** según la propia web de cada centro, y se gestiona como plaza privada. El valor `concertado` del enum `CenterOwnership` **no se ha usado para ningún centro** de este dataset, siguiendo el criterio estricto ya corregido en Sevilla y aplicado también en Alicante: solo se usaría con fuente oficial que confirmara un concierto educativo real y formal para primer ciclo, no una adhesión a un programa de subvención a la demanda (el "Bono Infantil" canario, ver `docs/data-sources-las-palmas.md`) |

---

## 2. Resolución de centros excluidos (3)

| Centro | Código RC | Motivo |
|---|---|---|
| EEI Almirante Antequera | 35006266 | Verificado en su propio blog educativo oficial: imparte exclusivamente segundo ciclo de infantil (3-6 años), sin primer ciclo. Fuera del alcance MVP del proyecto (solo primer ciclo 0-3 años) |
| EEI Grumete | 35014330 | Titularidad "Otros Ministerios" (Ministerio de Defensa / Armada). Acceso exclusivo para hijos de personal militar destinado en unidades de la Armada en Las Palmas; no es un servicio de matrícula ordinaria abierta a cualquier familia |
| EEI Aridamán (D.G. Protección del Menor) | 35900093 | Titularidad "Otras Consejerías" (Dirección General de Protección a la Infancia y la Familia). Plazas asignadas por criterios de protección social/vulnerabilidad (Orden de 20/09/1994), no por matrícula ordinaria abierta |

Detalle completo, con fuente verificada para cada exclusión, en
`data/enrichment/las-palmas-centers-excluded.json`.

---

## 3. Calidad de los datos (dataset final, 37 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 37 / 37 | **100%** |
| Email | 37 / 37 | **100%** |
| Web | 17 / 37 | 45.9% |
| Coordenadas (lat/lng) | 37 / 37 | **100%** (de fuente oficial directa, sin incidencias detectadas) |
| Servicios confirmados (`services` no vacío) | 25 / 37 | **67.6%** |
| `schedule` estructurado | 17 / 37 | 45.9% (los 11 municipales con horario homogéneo confirmado + 6 privados con horario propio confirmado) |
| `long_description` (único por centro) | 25 / 37 | 67.6% |
| FAQs (3-6 por centro) | 37 / 37 | 100% |
| `neighborhood_barrio` | 11 / 37 | 29.7% (solo las 11 escuelas municipales, cuyo barrio se menciona de forma explícita en la web del Ayuntamiento; no se localizó fuente equivalente para los 26 centros privados) |
| `district` (distrito administrativo formal) | 0 / 37 | 0% (no se localizó un callejero oficial que permitiera asignar con certeza uno de los 5 distritos municipales por calle/número; ver limitación en sección 6) |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 25 | Centros con al menos un servicio confirmado, horario confirmado, u horario+comedor homogéneo de fuente municipal directa |
| medium | 12 | Centros con solo los datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad, coordenadas), sin servicio/horario adicional confirmable |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

Siguiendo la lección documentada en `docs/checklist-calidad-nueva-ciudad.md`
sobre el incidente de plantilla única en Barcelona, para Las Palmas de Gran
Canaria se diseñaron:

- **3 estructuras de frase distintas para `short_description`** en el grupo de
  las 11 escuelas municipales, rotando de forma determinista.
- **4 estructuras** para el grupo de 13 privados con servicio confirmado por
  fuente propia.
- **8 estructuras** para el grupo de 13 privados sin servicio confirmado.

Verificación automatizada tras la generación:

- **`short_description`: 37/37 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 37`).
- **`long_description`: 25/25 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 190 y 348 caracteres (dentro del rango
  180-450 exigido; se añadió una cláusula final de refuerzo a 3 centros cuya
  plantilla base quedaba justo por debajo de 180 caracteres, sin afectar a la
  unicidad del conjunto).
- Longitud de `long_description`: entre 567 y 1177 caracteres, todo contenido
  factual verificado, sin relleno genérico.
- Slugs: 37/37 únicos, sin colisiones de nombre.
- Comprobación de aperturas de ≥8 palabras compartidas entre centros del mismo
  grupo homogéneo: 0 coincidencias detectadas (cada apertura de frase es
  distinta palabra por palabra en las primeras 8 palabras, incluso dentro del
  mismo grupo de plantilla).

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(0-36 meses, primer ciclo), titularidad, horario cuando está confirmado (17 de
37), servicios confirmados (comedor, bilingüe/inglés, cuando aplica) y vía de
contacto. Cada ficha lleva entre 3 y 6 FAQs (núcleo fijo de 3: ubicación,
edades, titularidad; FAQs adicionales de horario/servicio cuando hay datos
confirmados; cierre de contacto y/o transparencia), respetando el límite máximo
de 6 indicado por el coordinador. Ninguna FAQ afirma un servicio, horario o
metodología no verificados.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se
generó `long_description` únicamente para:

- Las **11 escuelas infantiles municipales**, con horario homogéneo y comedor
  confirmados en fuente oficial directa del Ayuntamiento.
- **14 de los 26 centros privados**: los 13 con al menos un servicio confirmado
  por fuente propia, más 1 caso adicional con horario propio confirmado sin
  servicios adicionales del enum citables con precisión suficiente.

Los **12 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono/email, titularidad y tipo según el registro oficial, **no llevan
`long_description`** — se consideró que no había datos suficientes para aportar
valor real más allá de lo ya cubierto en `short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable (`recommended_indexable`) | 25 / 37 | **67.6%** |
| No indexable (noindex, follow) | 12 / 37 | 32.4% |

Los 12 no indexables son exactamente los centros privados sin servicio
confirmado ni `long_description` (solo nombre, dirección, contacto y titularidad
según el registro oficial de la Consejería de Educación de Canarias). Este
porcentaje de indexabilidad (67.6%) es similar al de Alicante (56.8%) y
sensiblemente más alto que el de Sevilla (13.3%) o Murcia, gracias al volumen
manejable de centros privados en Las Palmas de Gran Canaria (26), que permitió
intentar verificar la web propia de la mayoría dentro de un único sprint de
investigación.

---

## 6. Riesgos y bloqueos conocidos

1. **13 de 26 centros privados (50%) sin servicio confirmado**: no se localizó
   web propia accesible y verificable, o la web encontrada devolvió error de
   conexión/DNS (varios dominios de hosting compartido en la misma IP no
   respondieron durante esta investigación: La Gallina Turuleta, El Barquito),
   o los resultados de búsqueda no permitieron confirmar contenido citable con
   precisión suficiente (First Steps, Domingo Alonso, La Piruleta, El Patio de
   mi Casa en sus 2 sedes, Little Star, Mafalda, La Blanca Paloma, El Arbolito,
   Mis Peques). No es un bloqueante para incluir el centro en el dataset (todos
   tienen al menos teléfono y email de fuente oficial), pero sí limita su
   indexabilidad automática. Es la principal oportunidad de enriquecimiento
   futuro del dataset de Las Palmas de Gran Canaria.
2. **`neighborhood_barrio` confirmado solo para las 11 escuelas municipales
   (29.7% del total)**: la web del Ayuntamiento menciona el barrio de cada
   escuela municipal de forma explícita, pero no se localizó una fuente
   equivalente y verificable para asignar barrio a los 26 centros privados
   dentro del alcance de este sprint.
3. **`district` (distrito administrativo formal) no confirmado para ningún
   centro (0/37)**: Las Palmas de Gran Canaria se divide en 5 distritos
   municipales (Vegueta-Cono Sur-Tafira, Centro Ciudad, Isleta-Puerto-Guanarteme,
   Ciudad Alta, Tamaraceite-San Lorenzo-Tenoya), pero no se dispuso en este
   sprint de un callejero oficial verificable que permitiera asignar distrito
   por calle y número con certeza, por lo que se ha dejado `district: null` en
   las 37 fichas, evitando inferencia por proximidad o código postal.
4. **3 candidatos con nombre comercial distinto al del registro oficial**:
   "El Patio de mi Casa de Guanarteme" (código 35014561) opera comercialmente
   como "El Barquito" (misma dirección y teléfono verificados); "Little Star
   Escuela Infantil" (código 35015048) aparece también como "El Patito Feo" en
   redes propias del centro (mismo email y dirección); "Mis Peques" (código
   35015553) tiene una web de terceros vinculada a un nombre distinto
   ("escuelamaternalinfantildrsanchez.es") que no se pudo verificar como propia
   del centro con certeza suficiente, por lo que no se ha usado esa web como
   fuente. Estas discrepancias se documentan en `notes_internal` de cada ficha
   cuando aplica.
5. **Ningún centro con `ownership = concertado`**: a diferencia de la corrección
   aplicada en Sevilla (donde inicialmente se había clasificado erróneamente
   centros adheridos a un programa de subvención como `concertado`), en Las
   Palmas de Gran Canaria se verificó explícitamente en 2 casos (Marpe Infantil,
   Los Jaimitos) que el primer ciclo de infantil queda fuera del concierto que sí
   tiene el resto del colegio para etapas posteriores. Se documenta
   explícitamente para que quede claro que la ausencia de `concertado` en este
   dataset es un reflejo fiel de la fuente oficial y de la verificación
   individual, no un olvido. Ver también la sección específica sobre el "Bono
   Infantil" canario en `docs/data-sources-las-palmas.md`.
6. **1 web propia (Nueva Atlántida) con contenido publicitario ajeno inyectado**:
   se detectó contenido no relacionado (referencias a casinos online en varios
   idiomas) en parte del sitio durante la consulta, señal de posible compromiso
   del dominio. Se han usado únicamente los datos de contacto y el servicio de
   comedor casero mencionados en el bloque de contenido propio del centro,
   evitando citar cualquier otro contenido de esa página.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-las-palmas.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/las-palmas-centers-raw.json` | Extracción sin procesar (40 filas del CSV oficial filtrado), antes de normalizar/enriquecer |
| 3 | `data/enrichment/las-palmas-centers.json` | Dataset final: 37 centros verificados y humanizados |
| 4 | `data/enrichment/las-palmas-centers-excluded.json` | 3 centros excluidos, con motivo documentado |
| 5 | `data/import/las-palmas-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/Zaragoza/Murcia/Sevilla/Palma/Málaga/Alicante (37 filas) |
| 6 | `docs/las-palmas-quality-report.md` | Este informe |
| 7 | `docs/las-palmas-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-las-palmas-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-las-palmas-centers.sql` | DELETE explícito por lista de 37 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución
   manual por el propietario del proyecto, con paso a `status='published'` solo
   tras auditoría, igual que en Barcelona, Valencia, Zaragoza, Murcia, Sevilla,
   Palma, Málaga y Alicante.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 13
   centros privados sin servicio confirmado (en particular, reintentar el acceso
   a las webs que fallaron por errores de conexión/DNS puntuales durante esta
   investigación, no por ausencia de web propia); explorar si el Ayuntamiento de
   Las Palmas de Gran Canaria o el Cabildo de Gran Canaria publican un callejero
   oficial que permita asignar `district`/`neighborhood_barrio` de forma
   verificable para los 26 centros privados.
3. **Diseño de landings**: con 37 centros en total, hay masa suficiente para
   landings municipales generales y alguna landing de servicio, pero no para
   landings de distrito/barrio en esta fase — ver detalle completo en
   `docs/las-palmas-seo-report.md`.
