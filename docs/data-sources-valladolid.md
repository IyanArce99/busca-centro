# Fuentes de datos — Valladolid (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Valladolid capital. Sigue el mismo formato y nivel de rigor que
`docs/data-sources-granada.md`, `docs/data-sources-cordoba.md` y el resto de zonas ya
integradas.

**Ámbito exacto**: únicamente el municipio de Valladolid (capital). Se excluyen
explícitamente los demás municipios de la provincia de Valladolid (Laguna de Duero,
Arroyo de la Encomienda, Zaratán, Simancas, Cistérniga, Boecillo, etc.), aunque
aparecieran en fuentes provinciales o autonómicas de alcance más amplio. El filtro
aplicado sobre la fuente principal fue `refine.municipio=VALLADOLID`, un campo de
clasificación administrativa municipal exacta del propio dataset (no textual libre),
sin ambigüedad con la provincia homónima.

---

## Contexto normativo clave: gratuidad total del primer ciclo en Castilla y León

Castilla y León implantó la **gratuidad total** del primer ciclo de educación
infantil (0-3 años) desde el curso 2024-2025, tras un despliegue progresivo (2 a 3
años en 2022-2023, 1 a 2 años en 2023-2024, 0 a 1 años en 2024-2025). Desde entonces,
la Junta oferta plazas gratuitas a todos los niños desde 0 años en centros públicos,
municipales y en centros privados **adheridos al programa de gratuidad de las
enseñanzas de primer ciclo de educación infantil**. Este dato condiciona de forma
directa la clasificación `ownership` aplicada en este dataset (ver más abajo) y el
enfoque comercial recomendado en `docs/valladolid-seo-report.md`.

**El mecanismo de financiación de centros privados en Castilla y León es una
subvención directa a titulares de centros privados adheridos a la oferta gratuita de
plazas** (trámite "Subvención directa a titulares de Centros Privados adheridos a la
oferta gratuita de plazas de primer ciclo de educación infantil", Sede Electrónica de
la Junta de Castilla y León), regulada por la Orden EDU/95/2022, de 14 de febrero,
modificada por la Orden EDU/117/2023, de 26 de enero. **No es un concierto educativo
formal** en el sentido de la legislación orgánica de educación (LODE/LOMLOE) para el
primer ciclo de infantil — es un mecanismo de adhesión voluntaria a una oferta de
gratuidad financiada mediante subvención. Se ha aplicado el mismo criterio ya
validado en Andalucía (Sevilla, Málaga, Granada, Córdoba): `ownership: privado` para
todos los centros privados adheridos, nunca `ownership: concertado`, salvo evidencia
individual e inequívoca de concierto educativo formal para el primer ciclo concreto.

---

## Fuentes evaluadas

### 1. Directorio de Centros Docentes — Junta de Castilla y León (datos abiertos) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Directorio de Centros Docentes |
| **Organismo** | Junta de Castilla y León, a través del Portal de Análisis de Datos Abiertos (`analisis.datosabiertos.jcyl.es`), plataforma OpenDataSoft |
| **URL de exploración** | https://analisis.datosabiertos.jcyl.es/explore/dataset/directorio-de-centros-docentes/ |
| **URL de catálogo (datos.gob.es)** | https://datos.gob.es/en/catalogo/a07002862-directorio-de-centros-docentes1 |
| **API usada** | `https://analisis.datosabiertos.jcyl.es/api/records/1.0/search/?dataset=directorio-de-centros-docentes&refine.municipio=VALLADOLID&refine.denominacion_generica=...` (API OpenDataSoft v1, formato JSON) |
| **Formato** | JSON vía API REST, también disponible en CSV/GeoJSON desde el propio portal |
| **Licencia** | Reutilización libre conforme a las condiciones generales de datos abiertos de la Junta de Castilla y León |
| **Descarga automatizada** | Sí — API pública sin autenticación, con filtro exacto por campo estructurado `municipio` y `denominacion_generica` (parámetro `refine.*`, no búsqueda textual libre) |
| **Registros totales en el dataset (toda Castilla y León, todas las etapas)** | 1.741 filas (curso académico de referencia: 2025) |
| **Registros con `municipio=VALLADOLID`** | 188 filas (todas las etapas educativas, incluye colegios, institutos, FP, conservatorios, etc.) |
| **Registros con `municipio=VALLADOLID` y `denominacion_generica="ESCUELA DE EDUCACION INFANTIL"`** | 13 filas (todas `naturaleza=PÚBLICO`) |
| **Registros con `municipio=VALLADOLID` y `denominacion_generica="CENTRO PRIVADO DE EDUCACION INFANTIL"`** | 33 filas (todas `naturaleza=PRIVADO`) |

#### Campos disponibles (relevantes)

| Campo | Descripción |
|---|---|
| `codigo` | Código de centro del Registro de Centros Docentes (8 dígitos, empieza por `47` para la provincia de Valladolid) |
| `denominacion_generica` | Tipo de centro: `ESCUELA DE EDUCACION INFANTIL`, `CENTRO PRIVADO DE EDUCACION INFANTIL`, `CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA`, `COLEGIO DE EDUCACION INFANTIL Y PRIMARIA`, etc. |
| `denominacion_especifica` | Nombre propio del centro |
| `naturaleza` | Titularidad: `PÚBLICO` o `PRIVADO` |
| `concierto` | Indicador S/N de concierto educativo declarado en el registro |
| `via`, `nombre_de_la_via`, `numero`/`numero_ext` | Dirección postal desglosada |
| `c_postal` | Código postal |
| `municipio`, `localidad`, `provincia` | Clasificación administrativa |
| `telefono`, `correo_electronico`, `fax`, `web` | Datos de contacto (el correo suele ser el genérico `@educa.jcyl.es`, no el email de contacto propio del centro) |
| `coord_latitud`, `coord_longitud`, `localizacion` | Coordenadas WGS84 |
| `comedor` | Indicador S/N de servicio de comedor declarado en el registro |
| `jornada_continua`, `transporte`, `internado` | Otros indicadores S/N |

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente primaria oficial de la Junta de Castilla y León, con clasificación
  administrativa municipal exacta (campo estructurado, no texto libre).
- Cobertura del 100% de los centros de las categorías `ESCUELA DE EDUCACION
  INFANTIL` y `CENTRO PRIVADO DE EDUCACION INFANTIL` en Valladolid capital según el
  propio registro.
- Coordenadas presentes en 45 de 46 filas candidatas (97,8%); solo falta en "Happy
  Kids House" (ver incidencias).
- Teléfono presente en 44 de 46 filas (95,7%); ver incidencias para las 2 filas sin
  teléfono en el registro.
- **Limitación importante**: el campo `correo_electronico` de esta fuente es
  sistemáticamente el buzón institucional `{codigo}@educa.jcyl.es`, no el email de
  contacto real del centro. Se ha tratado como no fiable/no publicable como email de
  contacto y se ha usado únicamente el email confirmado en la web propia del centro
  cuando existía.

#### Hallazgo específico de Valladolid: la categoría "ESCUELA DE EDUCACION INFANTIL" mezcla dos redes públicas distintas

Las 13 filas con `denominacion_generica="ESCUELA DE EDUCACION INFANTIL"` y
`naturaleza=PÚBLICO` no son homogéneas: solo **2 de las 13** (Amanecer, La Cigüeña)
son de titularidad genuina de la **Junta de Castilla y León** (confirmado cruzando
con la fuente 2). Las **11 restantes** (La Cometa, El Globo, El Tobogán, Platero, El
Principito, Mafalda y Guille, Cascanueces, Fantasía, Campanilla, Caballito Blanco,
Cascabel) son las **Escuelas Infantiles Municipales (EIM) del Ayuntamiento de
Valladolid**, gestionadas mediante contrato de servicios adjudicado por el
Ayuntamiento (confirmado en fuente 3). Ambas son titularidad pública genuina, pero de
administraciones distintas (autonómica vs. municipal), un matiz relevante para el
contenido editorial de las landings (ver `docs/valladolid-seo-report.md`).

#### Hallazgo específico de Valladolid: categoría "CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA" descartada del alcance

Existe una tercera categoría con 33 filas en Valladolid capital,
`CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA`, con `concierto="S"` en
las 33 filas (colegios concertados de nombre religioso: Apostolado del Sagrado
Corazón, Compañía de María, La Inmaculada, Sagrado Corazón-Corazonistas, San Viator,
etc.). Se ha comprobado que esta categoría corresponde a colegios de segundo ciclo de
infantil (3-6 años), primaria y secundaria con concierto educativo formal en esas
etapas — **no son centros del primer ciclo de educación infantil (0-3 años)**, que es
el único alcance MVP de este proyecto. Se han **excluido en bloque** de la
investigación por no encajar en el alcance `guarderia`/`escuela-infantil` de primer
ciclo definido en `AGENTS.md`, sin evaluarlos individualmente uno a uno (no son un
listado de "primer ciclo" sino de colegios con concierto en etapas posteriores,
análogo a la categoría ya descartada en Granada por el mismo motivo estructural).

#### Incidencia de titularidad: "Casa de Niñas y Niños Pajarillos" y "Casa de Niñas y Niños Maestro Claudio López Serrano"

Estos dos centros (dentro de la categoría `CENTRO PRIVADO DE EDUCACION INFANTIL`,
`naturaleza=PRIVADO` según el registro vigente) están gestionados en la práctica
mediante un convenio entre el **Ayuntamiento de Valladolid** y la **Liga Española de
la Educación y la Cultura Popular** (entidad del tercer sector, sin ánimo de lucro).
Una noticia institucional del Ayuntamiento de Valladolid (2017-2018) describe estos
centros como de "titularidad pública municipal", con el Ayuntamiento aportando el
espacio y financiación, y la Liga gestionando operativamente el servicio. Sin
embargo, **el registro oficial de centros docentes vigente (curso 2025) los clasifica
como `naturaleza=PRIVADO`**, sin indicio de actualización posterior a `PÚBLICO`. Ante
esta discrepancia entre una fuente institucional antigua (convenio de 2017-2018) y el
registro oficial de centros docentes vigente, se ha aplicado el criterio conservador
de **usar la fuente oficial de registro actual** (`ownership: privado`) y documentar
la incidencia, sin reclasificar sin una fuente actual e inequívoca. Ver
`docs/valladolid-quality-report.md`, sección 1, para el detalle completo.

---

### 2. "Escuelas de Educación Infantil - Titularidad Junta Castilla y León" — Portal de Educación ⭐ A USAR (distinguir red autonómica de red municipal)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas de Educación Infantil - Titularidad JCyL (listado PDF) |
| **Organismo** | Consejería de Educación, Junta de Castilla y León |
| **URL** | https://www.educa.jcyl.es/es/admision-alumnado/admision-centros-imparten-primer-ciclo-educacion-infantil/listado-escuelas-infantiles-titularidad-jcyl |
| **Formato** | PDF (listado de las 29 escuelas infantiles de titularidad JCyL en toda Castilla y León, por provincia) |

#### Datos confirmados y usados

- Confirma que, de las 13 filas `ESCUELA DE EDUCACION INFANTIL` de Valladolid capital
  en la fuente 1, únicamente **Amanecer** y **La Cigüeña** son de titularidad genuina
  de la Junta de Castilla y León (con número de unidades y plazas totales por
  provincia, sin desglose de servicios por centro individual).
- Usado para diferenciar `source_group: publico_jcyl` (2 centros) de
  `source_group: publico_municipal` (11 centros) dentro del dataset.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del organismo titular de la red autonómica.
- **Limitación**: no incluye datos de contacto adicionales ni servicios
  complementarios por centro individual más allá de dirección y teléfono, ya
  presentes en la fuente 1.

---

### 3. Portal Web del Ayuntamiento de Valladolid — Escuelas Infantiles Municipales ⭐ A USAR (las 11 EIM municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles (Ayuntamiento de Valladolid) |
| **Organismo** | Ayuntamiento de Valladolid, Área de Educación y Cultura |
| **URL principal** | https://www.valladolid.es/es/temas/hacemos/escuelas-infantiles |
| **URL "Puertas Abiertas" (listado con barrio, dirección y teléfono)** | https://www.valladolid.es/es/temas/hacemos/escuelas-infantiles/puertas-abiertas-escuelas-infantiles-curso-2026-2027 |
| **URLs por centro (ficha individual)** | p. ej. https://www.valladolid.es/es/ayuntamiento/organizacion-administrativa/areas/area-educacion-cultura/utilidad/donde-estamos/escuela-infantil-cascabel |
| **Formato** | HTML institucional |

#### Datos confirmados y usados

- Confirmación de que las 11 escuelas (La Cometa, El Globo, El Tobogán, Platero, El
  Principito, Mafalda y Guille, Cascanueces, Fantasía, Campanilla, Caballito Blanco,
  Cascabel) son de **titularidad pública municipal** genuina, gestionadas mediante
  contrato de servicios adjudicado por el Ayuntamiento de Valladolid ("Adjudicado el
  contrato para la gestión de las 11 escuelas infantiles del Ayuntamiento de
  Valladolid").
- **Barrio** de cada una de las 11 escuelas, confirmado en la tabla oficial de
  "puertas abiertas" curso 2026-2027: La Cometa (Las Delicias), El Globo (Barrio
  España), El Tobogán (La Rubia), Platero (Arturo Eyries), El Principito (La
  Victoria), Mafalda y Guille (Parquesol), Cascanueces (Parque Alameda), Fantasía
  (Huerta del Rey), Campanilla (Villa del Prado), Caballito Blanco (Los
  Santos-Pilarica), Cascabel (Rondilla).
- **Servicios homogéneos confirmados para toda la red**: "Todas las escuelas cuentan
  con: Servicio de comedor. Servicio de madrugadores" (cita textual de la página
  oficial del Ayuntamiento). Se ha aplicado `servicio-madrugadores` a las 11 EIM y
  `comedor` a las que además tienen `comedor=S` en el registro oficial de centros
  docentes (10 de 11; Caballito Blanco tiene `comedor=N` en el registro de centros
  docentes, por lo que no se le ha asignado el servicio `comedor` pese a la
  declaración general de la web municipal, priorizando el dato específico por centro
  sobre la declaración genérica de la red).
- **Horario general**: "09:00-14:00h" con posibilidad de ampliación mediante
  madrugadores y tarde, según la propia web municipal.
- **Edades atendidas**: "desde los 4 meses hasta los 3 años".
- **Gratuidad**: "Las 11 escuelas se comprometen a ofrecer un servicio gratuito para
  todas las unidades de edades comprendidas entre 0 y 3 años" dentro de la oferta de
  gratuidad de la Junta de Castilla y León para el curso 2024-2025 y siguientes.
- Teléfono de Cascabel corregido puntualmente: el registro de centros docentes (fuente
  1) trae este campo vacío; se ha usado el teléfono publicado en la ficha oficial de
  "Puertas Abiertas" del Ayuntamiento (983 10 00 40).

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del titular real de las 11 escuelas (Ayuntamiento de
  Valladolid).
- Servicios homogéneos declarados explícitamente para toda la red, no inferidos.
- **Limitación**: no desglosa email de contacto por centro; no confirma servicios
  adicionales del enum más allá de comedor y madrugadores (p. ej. no hay evidencia
  oficial de horario-ampliado, bilingüe, psicomotricidad, música, etc. para estas 11
  escuelas, por lo que no se han añadido).

---

### 4. Listado de centros adheridos al programa de gratuidad de primer ciclo (curso 2026-2027) — Junta de Castilla y León ⭐ A USAR (confirma adhesión y descarta concierto)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Actualización del listado de escuelas infantiles y centros infantiles municipales y privados con unidades incluidas en el programa de gratuidad de las enseñanzas de primer ciclo de educación infantil (26 de mayo de 2026) |
| **Organismo** | Consejería de Educación, Junta de Castilla y León |
| **URL** | https://www.educa.jcyl.es/es/admision-alumnado/admision-centros-imparten-primer-ciclo-educacion-infantil/listado-centros-plazas-gratuitas-0-3-anos-curso-2026-2027 |
| **Formato** | 2 PDF: uno para centros JCyL/CEIP-CEO, otro para "municipales y privados" |

#### Datos confirmados y usados

- Confirma que, dentro del municipio de Valladolid, el listado de "Centros infantiles
  privados" adheridos a la oferta gratuita **coincide exactamente con los 33 centros
  privados de la fuente 1** (mismos nombres comerciales), y el listado de "Centros
  infantiles municipales" coincide con las 11 EIM de la fuente 3.
- **El listado nunca usa la categoría "concertados"** — únicamente distingue
  "Centros infantiles municipales" y "Centros infantiles privados" (además de "EEI
  JCyL" y "CEO-CEIP JCyL" en el listado de centros de titularidad autonómica). Esto
  refuerza que el mecanismo de financiación en Castilla y León es de adhesión a
  subvención, no de concierto educativo formal, para el tramo 0-3 años.
- Confirma que las 2 escuelas de titularidad JCyL de Valladolid (Amanecer, La
  Cigüeña) tienen unidades incluidas en el programa de gratuidad para el curso
  2026-2027.

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa y actualizada (26 de mayo de 2026).
- **Limitación**: es un listado de unidades por tramo de edad (0-1, 1-2, 2-3, etc.)
  para el proceso de admisión, no un directorio de contacto — se ha usado únicamente
  para confirmar la adhesión y descartar la hipótesis de concierto educativo, no como
  fuente de datos de contacto (esos proceden de la fuente 1).

---

### 5. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para un subconjunto de los 33 centros de titularidad privada, se localizó y consultó
la web oficial propia del centro (cuando existía, era accesible y se pudo confirmar
de forma inequívoca que correspondía al mismo centro del registro, por coincidencia
de nombre y dirección) para confirmar servicios concretos del enum `CenterService`.
Se verificaron con cita textual los siguientes centros, todos con sede confirmada
dentro de Valladolid capital:

| Centro | Web oficial | Servicios confirmados |
|---|---|---|
| El Despertador Infantil 2010 | eldespertadorinfantil.com | comedor/cocina propia, horario ampliado, patio exterior |
| Happy Kids House | happykidshouse.es | inglés, comedor, campamentos de verano |
| Kid's Garden 2 | kidsgarden.edu.es/valladolid | proyecto bilingüe (confirmado a nivel de red/grupo) |
| Kid's Garden 3 | kidsgarden.edu.es/valladolid | proyecto bilingüe (confirmado a nivel de red/grupo) |
| Trastes (Parquesol) | escuelainfantiltrastes.es | comedor, inglés, patio exterior |
| La Casa de los Niños | guarderialacasadelosninos.es | comedor, cocina propia, patio exterior, inglés |
| Mamá Kokeshi | mamakokeshi.com | comedor, cocina propia, inglés, horario ampliado, servicio de madrugadores, escuela de padres |
| Árbol Sabio | arbolsabio.com | cocina propia, inglés, campamentos de verano |
| Luna Mágica | guarderialunamagica.es | música, psicomotricidad, inglés |
| Santa Mónica | escuelainfantilsantamonica.com | comedor, cocina propia, campamentos de verano |

**Total de centros privados con servicios confirmados por web propia: 10 de 33
(≈ 30,3%)**, a los que se suman las 2 escuelas públicas JCyL (comedor confirmado por
registro oficial) y las 11 EIM municipales (comedor y/o madrugadores confirmados por
la web del Ayuntamiento) — **23 de 42 centros del dataset final (54,8%) con algún
servicio del enum `CenterService` confirmado**.

Para el resto de centros privados (23 de 33, incluidos los 4 excluidos del dataset
final) no se localizó una web propia accesible con suficiente detalle textual de
servicios concretos del enum, o directamente no se localizó web propia (mayoría de
casos con nombre no distintivo o gestión muy local sin presencia web propia
verificable). En esos casos `services` queda como array vacío (`[]`) — **no se ha
inventado ningún servicio por similitud con otros centros del mismo tipo o grupo**.

**Nota sobre "Kid's Garden 2" y "Kid's Garden 3"**: el proyecto bilingüe se confirma
en la web corporativa del grupo Kid's Garden a nivel de red (con profesorado nativo),
que enumera expresamente las tres sedes de Valladolid como parte del mismo proyecto
educativo. Se ha aplicado el servicio `bilingue` a las dos sedes localizadas con datos
de contacto suficientes (no se ha podido confirmar de forma independiente ningún otro
servicio del enum por sede individual, por lo que no se han añadido más).

---

## Fuentes evaluadas y descartadas para el uso principal

### Categoría "CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA" del Directorio de Centros Docentes — descartada del alcance MVP

Ver hallazgo detallado más arriba (fuente 1): son 33 colegios concertados con oferta
de segundo ciclo de infantil, primaria y secundaria, fuera del alcance MVP de primer
ciclo (0-3 años) definido en `AGENTS.md`. No se han evaluado individualmente.

### Buscador "Directorio de Centros de Castilla y León" (`directorio.educa.jcyl.es`)

Interfaz de consulta interactiva por provincia/localidad/titularidad, sin descarga
masiva estructurada. Se ha usado de forma puntual y manual para contrastar el nombre
y código de centro de algunos resultados de búsqueda web, nunca como fuente primaria
de extracción masiva.

### Fuentes NO usadas (recordatorio, igual que en el resto de zonas ya integradas)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, todoeduca.com, infoescuelas.com, guarderia.net, infoisinfo.es, buscocolegio.com, educateca.com, chiquiocio.com, cylex.es, einforma.com, empresite.eleconomista.es, pucelaconpeques.es, tusguarderias.com, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro o confirmar que un nombre comercial existe — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario, precio) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Nominatim/OpenStreetMap | Usado de forma puntual y documentada **únicamente** para geocodificar la dirección de un centro (Happy Kids House) sin coordenadas en la fuente oficial, a nivel de calle verificada, nunca aproximado al centro de la ciudad ni usado como fuente masiva |

---

## Incidencias de calidad de datos detectadas y corregidas

1. **"Cascabel" (código `47012193`)**: fila con `telefono` vacío en la fuente cruda
   (fuente 1). Se completó con el teléfono publicado en la ficha oficial de "Puertas
   Abiertas" del Ayuntamiento de Valladolid (fuente 3): 983 10 00 40.
2. **"Happy Kids House" (código `47012259`)**: fila sin `coord_latitud`/
   `coord_longitud` en la fuente cruda. Se geocodificó la calle (Isaac Quintero,
   Valladolid, barrio Vadillos, CP 47005) mediante Nominatim/OpenStreetMap, a nivel
   de vía (no de número exacto), y se ha marcado `coords_flagged: true` en el dataset
   de trabajo para dejar constancia de que la coordenada no procede directamente del
   registro oficial.
3. **Correo electrónico institucional no publicable como contacto**: el campo
   `correo_electronico` del Directorio de Centros Docentes es sistemáticamente
   `{codigo}@educa.jcyl.es` (buzón de gestión administrativa, no contacto del
   centro). Se ha dejado `contact.email` a `null` salvo en los 9 centros donde se
   confirmó un email de contacto propio en su web oficial.
4. **"Santa Catalina" (código `47004974`)**: único centro de la categoría
   `CENTRO PRIVADO DE EDUCACION INFANTIL` con `concierto="S"` en el registro oficial
   (el resto de las 32 filas de esa categoría tienen `concierto="N"`). No se ha
   localizado ninguna fuente oficial que confirme si ese concierto corresponde
   específicamente al primer ciclo de educación infantil (0-3 años) o a otra etapa
   distinta impartida por el mismo centro. Ante la duda, se ha excluido del dataset
   final por prudencia (ver `docs/valladolid-quality-report.md`, sección 1 y 2),
   siguiendo la instrucción explícita de no usar `ownership: concertado` sin
   verificación individual del marco normativo aplicable al primer ciclo.

---

## Proceso de construcción del dataset

1. Se consultó la API del Directorio de Centros Docentes filtrando por
   `refine.municipio=VALLADOLID` (188 filas, todas las etapas) y después por
   `refine.denominacion_generica` en `{"ESCUELA DE EDUCACION INFANTIL", "CENTRO
   PRIVADO DE EDUCACION INFANTIL"}` → 13 + 33 = 46 centros candidatos de primer
   ciclo de educación infantil.
2. Se descartó en bloque la categoría `CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA
   Y SECUNDARIA` (33 filas, todas con concierto="S", fuera del alcance MVP de primer
   ciclo).
3. Se cruzaron las 13 filas `ESCUELA DE EDUCACION INFANTIL` con el listado oficial de
   "Escuelas de Educación Infantil - Titularidad JCyL" (fuente 2): 2 de titularidad
   autonómica genuina (Amanecer, La Cigüeña), 11 de titularidad municipal (confirmadas
   además con la web del Ayuntamiento de Valladolid, fuente 3).
4. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos), por
   nombre exacto (0 coincidencias) y por dirección+código postal exacta (0
   coincidencias, salvo dos pares de centros del mismo grupo comercial en direcciones
   distintas — Kid's Garden 2/3 y Trastes/Trastes San Cristóbal — verificados
   individualmente como sedes distintas con código de centro propio, no duplicados).
5. Se verificó el rango de coordenadas de las 45 filas con coordenada en el registro
   (lat 41.48-41.67, lng -4.77 a -4.70): coherentes con el municipio, salvo la fila
   "El Despertador Infantil 2010" (lat 41.48283), que corresponde a una coordenada
   más al sur dentro del término municipal (zona de Valladolid capital hacia el
   límite con Zaratán/Cigales); se ha verificado que el código postal (47015) y el
   nombre de la vía (Plaza de Juan Pablo II) son consistentes con el municipio de
   Valladolid capital, sin indicios de error de geocodificación en la fuente oficial.
6. Se clasificó `ownership`: `publico` para las 13 filas de titularidad pública
   genuina (2 JCyL + 11 municipales); `privado` para las 33 filas de la categoría
   `CENTRO PRIVADO DE EDUCACION INFANTIL`, salvo Santa Catalina (excluida por
   concierto no verificado, ver incidencias). Ningún centro del dataset final usa
   `ownership: concertado`.
7. Se clasificó `type`: las 13 escuelas de titularidad pública → `escuela-infantil`;
   los 29 centros privados incluidos en el dataset final → `guarderia`.
8. Se aplicó el horario/servicios homogéneos de las 11 EIM municipales (fuente 3) y
   el servicio de comedor confirmado por registro oficial para las 2 escuelas JCyL.
9. Se localizó la web oficial propia de 10 centros privados individuales y se
   confirmaron servicios con cita textual; el resto (23 de 33) se dejó con
   `services: []` cuando no había confirmación textual suficiente.
10. Se excluyeron del dataset final 4 centros: 3 sin teléfono, email ni web
    confirmados en ninguna fuente (La Pequeña Luna 2, Pipo, El Majuelo) y 1 por dato
    de concierto no verificable para el primer ciclo (Santa Catalina). Ver
    `data/enrichment/valladolid-centers-excluded.json`.
11. Se generaron slugs únicos (42/42 verificados), `short_description` (215-331
    caracteres, con varias estructuras de frase rotando de forma determinística por
    hash del código de centro — verificado 42/42 textualmente únicas),
    `long_description` solo cuando había datos reales suficientes (23/42 centros:
    2 JCyL + 11 municipales + 10 privados con servicio confirmado por web propia), y
    FAQs personalizadas (5-6 por centro, basadas únicamente en datos confirmados).
12. Total de candidatos evaluados: 46 (13 públicos + 33 privados). De ellos, 42
    superaron el umbral mínimo de verificación del proyecto → **4 centros al archivo
    de excluidos** en este sprint. Ver `docs/valladolid-quality-report.md` para el
    detalle completo de calidad y limitaciones.
