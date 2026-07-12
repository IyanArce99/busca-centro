# Fuentes de datos — Salamanca (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Salamanca capital. Sigue el mismo formato y nivel de rigor que
`docs/data-sources-valladolid.md`, `docs/data-sources-granada.md` y el resto de zonas
ya integradas.

**Ámbito exacto**: únicamente el municipio de Salamanca (capital). Se excluyen
explícitamente los demás municipios de la provincia de Salamanca (Santa Marta de
Tormes, Carbajosa de la Sagrada, Villamayor, Cabrerizos, Aldeatejada, Doñinos de
Salamanca, Castellanos de Moriscos, etc.), aunque aparecieran en fuentes
provinciales o autonómicas de alcance más amplio. El filtro aplicado sobre la fuente
principal fue `refine.municipio=SALAMANCA`, un campo de clasificación administrativa
municipal exacta del propio dataset (no textual libre), sin ambigüedad con la
provincia homónima.

---

## Contexto normativo clave: gratuidad total del primer ciclo en Castilla y León (mismo marco que Valladolid)

Castilla y León implantó la **gratuidad total** del primer ciclo de educación
infantil (0-3 años) desde el curso 2024-2025. Desde entonces, la Junta oferta plazas
gratuitas a todos los niños desde 0 años en centros públicos, municipales y en
centros privados **adheridos al programa de gratuidad de las enseñanzas de primer
ciclo de educación infantil**. El mecanismo de financiación de centros privados es
una **subvención directa a titulares de centros privados adheridos a la oferta
gratuita de plazas** (Orden EDU/95/2022, de 14 de febrero, modificada por la Orden
EDU/117/2023, de 26 de enero), **no un concierto educativo formal** en el sentido de
la legislación orgánica de educación para el primer ciclo de infantil. Se ha aplicado
el mismo criterio ya validado en Valladolid, Andalucía y el resto de zonas
integradas: `ownership: privado` para todos los centros privados adheridos, nunca
`ownership: concertado`, salvo evidencia individual e inequívoca de concierto
educativo formal para el primer ciclo concreto (ver incidencia "El Globo Rojo" más
abajo).

**Contexto de negocio**: en Salamanca capital había 1.852 plazas gratuitas
registradas para el curso 2025-26 (411 en las 4 escuelas infantiles municipales, el
resto en centros públicos autonómicos y privados adheridos). La gratuidad total ya
está consumada y consolidada, no en despliegue. Salamanca tiene además competencia
SEO local relativamente organizada (agregadores con rankings anuales, prensa local
publicando "mejores guarderías"), por lo que el enfoque comercial de este proyecto se
orienta a diferenciación por servicio (bilingüe/inglés, horario ampliado,
metodología), no a comparación de precio. Ver `docs/salamanca-seo-report.md`.

---

## Fuentes evaluadas

### 1. Directorio de Centros Docentes — Junta de Castilla y León (datos abiertos) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Directorio de Centros Docentes |
| **Organismo** | Junta de Castilla y León, a través del Portal de Análisis de Datos Abiertos (`analisis.datosabiertos.jcyl.es`), plataforma OpenDataSoft |
| **URL de exploración** | https://analisis.datosabiertos.jcyl.es/explore/dataset/directorio-de-centros-docentes/ |
| **URL de catálogo (datos.gob.es)** | https://datos.gob.es/en/catalogo/a07002862-directorio-de-centros-docentes1 |
| **API usada** | `https://analisis.datosabiertos.jcyl.es/api/records/1.0/search/?dataset=directorio-de-centros-docentes&refine.municipio=SALAMANCA&refine.denominacion_generica=...` (API OpenDataSoft v1, formato JSON) |
| **Formato** | JSON vía API REST, también disponible en CSV/GeoJSON desde el propio portal |
| **Licencia** | Reutilización libre conforme a las condiciones generales de datos abiertos de la Junta de Castilla y León |
| **Descarga automatizada** | Sí — API pública sin autenticación, con filtro exacto por campo estructurado `municipio` y `denominacion_generica` (parámetro `refine.*`, no búsqueda textual libre) |
| **Registros con `municipio=SALAMANCA` (todas las etapas)** | 94 filas |
| **Registros con `denominacion_generica="ESCUELA DE EDUCACION INFANTIL"`** | 7 filas (todas `naturaleza=PÚBLICO`) |
| **Registros con `denominacion_generica="CENTRO PRIVADO DE EDUCACION INFANTIL"`** | 10 filas (todas `naturaleza=PRIVADO`) |
| **Registros con `denominacion_generica="CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA"`** | 22 filas — descartadas en bloque, ver más abajo |

#### Campos disponibles (relevantes)

| Campo | Descripción |
|---|---|
| `codigo` | Código de centro del Registro de Centros Docentes (8 dígitos, empieza por `37` para la provincia de Salamanca) |
| `denominacion_generica` | Tipo de centro |
| `denominacion_especifica` | Nombre propio del centro |
| `naturaleza` | Titularidad: `PÚBLICO` o `PRIVADO` |
| `concierto` | Indicador S/N de concierto educativo declarado en el registro |
| `via`, `nombre_de_la_via`, `numero` | Dirección postal desglosada |
| `c_postal` | Código postal |
| `municipio`, `localidad`, `provincia` | Clasificación administrativa |
| `telefono`, `correo_electronico`, `web` | Datos de contacto (el correo es sistemáticamente el buzón genérico `{codigo}@educa.jcyl.es`, no el email de contacto propio del centro) |
| `coord_latitud`, `coord_longitud` | Coordenadas WGS84 |
| `comedor` | Indicador S/N de servicio de comedor declarado en el registro |

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente primaria oficial de la Junta de Castilla y León, con clasificación
  administrativa municipal exacta (campo estructurado, no texto libre).
- Cobertura del 100% de los centros de las categorías `ESCUELA DE EDUCACION
  INFANTIL` y `CENTRO PRIVADO DE EDUCACION INFANTIL` en Salamanca capital según el
  propio registro.
- Coordenadas presentes en 17 de 17 filas candidatas (100%).
- Teléfono presente en 15 de 17 filas (88,2%); 2 filas sin teléfono en el registro
  (Mumakids, Aula Pimentón Maestro Ávila) — ver incidencias.
- **Limitación importante**: el campo `correo_electronico` de esta fuente es
  sistemáticamente el buzón institucional `{codigo}@educa.jcyl.es`, no el email de
  contacto real del centro. Se ha tratado como no fiable/no publicable como email de
  contacto y se ha usado únicamente el email confirmado en la web propia del centro
  cuando existía.

#### Hallazgo: la categoría "ESCUELA DE EDUCACION INFANTIL" mezcla dos redes públicas distintas (mismo patrón que Valladolid)

Las 7 filas con `denominacion_generica="ESCUELA DE EDUCACION INFANTIL"` y
`naturaleza=PÚBLICO` no son homogéneas: solo **3 de las 7** (Lazarillo de Tormes, San
Bernardo, Virgen de la Vega) son de titularidad genuina de la **Junta de Castilla y
León** (confirmado cruzando con la fuente 2, listado oficial PDF). Las **4 restantes**
(Los Pizarrales, El Rollo, Garrido, El Zurguén) son las **Escuelas Infantiles
Municipales (EIM) del Ayuntamiento de Salamanca** (411 plazas totales para el curso
2025-2026, confirmado en fuente 3). Ambas son titularidad pública genuina, pero de
administraciones distintas (autonómica vs. municipal).

#### Hallazgo: categoría "CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA" descartada del alcance

22 filas en Salamanca capital pertenecen a esta categoría (colegios concertados de
nombre religioso: Calasanz, Marista Champagnat, Salesiano San José, San Agustín, San
Estanislao de Kostka, San Juan Bosco, Santísima Trinidad, etc.). Se ha comprobado que
esta categoría corresponde a colegios de segundo ciclo de infantil (3-6 años),
primaria y secundaria con concierto educativo formal en esas etapas — **no son
centros del primer ciclo de educación infantil (0-3 años)** en el sentido del
registro de esta categoría específica. Confirmado además cruzando con la fuente 4
(listado de gratuidad): varios de estos mismos nombres (Bambi, Calasanz, Coco Miel,
La Milagrosa, María Auxiliadora, Marista Champagnat, Montessori, Sagrado Corazón,
Salesiano San José, San Agustín, San Estanislao de Kostka, San José, San Juan Bosco,
Santísima Trinidad) aparecen en el listado de centros con unidades de primer ciclo
gratuitas — es decir, **estos colegios sí ofertan aulas de primer ciclo (0-3),
gestionadas dentro del mismo centro concertado en 3-6/primaria/secundaria**, pero no
tienen código de registro propio y diferenciado como centro de primer ciclo en el
Directorio de Centros Docentes bajo `denominacion_generica="CENTRO PRIVADO DE
EDUCACION INFANTIL"`. Se han **excluido en bloque** de la investigación, siguiendo el
mismo criterio estructural ya aplicado en Valladolid y Granada: sin un código de
centro propio y verificable de primer ciclo en el registro oficial, no se puede
construir una ficha individual fiable (dirección, teléfono, coordenadas específicas
del aula 0-3 frente al colegio completo).

**Excepción diferenciada: "Aula Pimentón Maestro Ávila"**. A diferencia del resto de
esta lista, el aula de primer ciclo del Colegio Maestro Ávila (Fundación EDUCERE) SÍ
tiene código de registro propio y diferenciado (`37014102`) dentro de la categoría
`CENTRO PRIVADO DE EDUCACION INFANTIL` (no en la categoría de colegios concertados),
con `naturaleza=PRIVADO` y `concierto=N` para ese código específico de primer ciclo.
Se ha incluido en el dataset final con `ownership: privado` (nunca `concertado`),
documentando que el colegio matriz sí es concertado en 3-6/primaria/secundaria, pero
el concierto no aplica al código de registro del primer ciclo. Ver incidencia
detallada en `docs/salamanca-quality-report.md`.

---

### 2. "Escuelas de Educación Infantil - Titularidad Junta Castilla y León" — Portal de Educación ⭐ A USAR (distinguir red autonómica de red municipal)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas de Educación Infantil - Titularidad JCyL (listado PDF) |
| **Organismo** | Consejería de Educación, Junta de Castilla y León |
| **URL** | https://www.educa.jcyl.es/es/admision-alumnado/admision-centros-imparten-primer-ciclo-educacion-infantil/listado-escuelas-infantiles-titularidad-jcyl |
| **Formato** | PDF (listado de escuelas de educación infantil de titularidad JCyL en toda Castilla y León, por provincia, con unidades y plazas totales) |

#### Datos confirmados y usados

- Confirma que, de las 7 filas `ESCUELA DE EDUCACION INFANTIL` de Salamanca capital
  en la fuente 1, únicamente **Lazarillo de Tormes** (5 unidades, 74 plazas),
  **San Bernardo** (3 unidades, 41 plazas) y **Virgen de la Vega** (3 unidades, 39
  plazas) son de titularidad genuina de la Junta de Castilla y León.
- Usado para diferenciar `source_group: publico_jcyl` (3 centros) de
  `source_group: publico_municipal` (4 centros) dentro del dataset.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del organismo titular de la red autonómica.
- **Limitación**: no incluye datos de contacto adicionales ni servicios
  complementarios por centro individual más allá de dirección y teléfono, ya
  presentes en la fuente 1.

---

### 3. Portal Web del Ayuntamiento de Salamanca / Fundación Salamanca Ciudad de Cultura y de Saberes — Escuelas Infantiles Municipales ⭐ A USAR (las 4 EIM municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles Municipales de Salamanca |
| **Organismo** | Ayuntamiento de Salamanca / Fundación Salamanca Ciudad de Cultura y de Saberes |
| **URL principal** | https://www.ciudaddesaberes.es/html/es/EIM/ |
| **URL proceso de admisión** | https://www.ciudaddesaberes.es/html/es/eimadmision/ |
| **URL portal Ayuntamiento** | https://www.aytosalamanca.es/en/w/escuelas-infantiles-municipales |
| **Formato** | HTML institucional |

#### Datos confirmados y usados

- Confirmación de que las 4 escuelas (Los Pizarrales, El Rollo, Garrido, El Zurguén)
  son de **titularidad pública municipal** genuina, gestionadas por la Fundación
  Salamanca Ciudad de Cultura y de Saberes / Ayuntamiento de Salamanca.
- **Plazas por escuela**: Los Pizarrales (135 plazas), El Rollo (94 plazas), Garrido
  (88 plazas), El Zurguén (94 plazas) — total 411 plazas, curso 2025-2026.
- **Barrio** de cada una de las 4 escuelas: el propio nombre de la escuela coincide
  con el nombre del barrio en el que se ubica (Los Pizarrales, El Rollo/Rollo-Puente
  Ladrillo, El Zurguén), confirmado además con fuentes cualitativas de prensa local
  sobre la delimitación de esos barrios; Garrido es igualmente nombre de barrio
  confirmado (el mayor de Salamanca por población, cerca de 40.000 habitantes).
- **Edades atendidas**: "desde los 4 meses hasta los 3 años", niños empadronados en
  Salamanca.
- **Horario**: "Septiembre: 9:00-14:00h (con opción de comedor). Octubre-Mayo:
  9:00-14:00h, con servicio madrugadores (7:30/8:30-9:00) y tardones
  (15:30-17:00). Junio-Julio: 9:00-14:00h con madrugadores." Restricción: el niño no
  puede permanecer más de 8 horas en la escuela.
- **Servicios homogéneos confirmados para toda la red**: servicio de comedor
  ("voluntario", cocina propia, menús adaptados por edad) y servicio de madrugadores
  con posibilidad de horario ampliado (tardones) según demanda mínima. Se ha aplicado
  `comedor` y `servicio-madrugadores` a las 4 EIM, cruzando además con el campo
  `comedor=S` del registro oficial de centros docentes (fuente 1) para las 4.
- **Gratuidad**: las 411 plazas de las 4 escuelas infantiles municipales de Salamanca
  forman parte del programa de gratuidad de la Junta de Castilla y León para el
  primer ciclo de educación infantil (0-3 años), confirmado por prensa institucional
  y por la presencia de las 4 escuelas en el listado oficial de centros con unidades
  gratuitas curso 2026-2027 (fuente 4).

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del titular real de las 4 escuelas (Ayuntamiento de
  Salamanca / Fundación Ciudad de Saberes).
- Servicios homogéneos declarados explícitamente para toda la red, no inferidos.
- **Limitación**: no desglosa email de contacto por centro; no confirma servicios
  adicionales del enum más allá de comedor y madrugadores (no hay evidencia oficial
  de horario-ampliado más allá de "tardones" con demanda mínima, bilingüe,
  psicomotricidad, música, etc. para estas 4 escuelas, por lo que no se han añadido
  servicios adicionales del enum).
- **Nota de incidencia**: una página secundaria del propio Ayuntamiento
  (`aytosalamanca.gob.es`, catálogo de trámites, posiblemente desactualizada)
  menciona un "pago mensual del tributo municipal" con exenciones, contradiciendo la
  gratuidad total ya confirmada por fuentes más recientes y específicas del curso
  2025-2026/2026-2027. Se ha priorizado la fuente más reciente y específica (fuente 3
  principal + fuente 4) sobre la página de trámites, que parece no reflejar todavía
  la gratuidad total vigente desde el curso 2024-2025. Ver incidencia documentada en
  `docs/salamanca-quality-report.md`.

---

### 4. Listado de centros adheridos al programa de gratuidad de primer ciclo (curso 2026-2027) — Junta de Castilla y León ⭐ A USAR (confirma adhesión y descarta concierto)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Actualización del listado de escuelas infantiles y centros infantiles municipales y privados con unidades incluidas en el programa de gratuidad de las enseñanzas de primer ciclo de educación infantil (26 de mayo de 2026) |
| **Organismo** | Consejería de Educación, Junta de Castilla y León |
| **URL** | https://www.educa.jcyl.es/es/admision-alumnado/admision-centros-imparten-primer-ciclo-educacion-infantil/listado-centros-plazas-gratuitas-0-3-anos-curso-2026-2027 |
| **Formato** | 2 PDF: uno para centros JCyL/CEIP-CEO, otro para "municipales y privados" (22 páginas, financiado con fondos Next Generation EU) |

#### Datos confirmados y usados

- Confirma que, dentro del municipio de Salamanca, el listado de "Centros infantiles
  municipales" coincide con las 4 EIM (El Rollo, El Zurguén, Garrido, Los
  Pizarrales), y que el listado de "Centros infantiles privados" incluye los 10
  centros de la fuente 1 (con la excepción documentada de "El Globo Rojo II", que no
  aparece en este listado 2026-2027 pese a tener código de registro válido — ver
  incidencia) más 14 colegios concertados de infantil/primaria/secundaria con aula
  de primer ciclo (Bambi, Calasanz, Coco Miel, La Milagrosa, María Auxiliadora,
  Marista Champagnat, Montessori, Sagrado Corazón, Salesiano San José, San Agustín,
  San Estanislao de Kostka, San José, San Juan Bosco, Santísima Trinidad),
  descartados del dataset final por no tener código de registro propio de primer
  ciclo verificable (ver fuente 1).
- **El listado nunca usa la categoría "concertados"** — únicamente distingue
  "Centros infantiles municipales" y "Centros infantiles privados" (además de "EEI
  JCyL" en el listado de centros de titularidad autonómica). Esto refuerza que el
  mecanismo de financiación en Castilla y León es de adhesión a subvención, no de
  concierto educativo formal, para el tramo 0-3.
- Confirma que las 3 escuelas de titularidad JCyL de Salamanca (Lazarillo de Tormes,
  San Bernardo, Virgen de la Vega) tienen unidades incluidas en el programa de
  gratuidad para el curso 2026-2027 (aparecen en el PDF de centros JCyL, no
  extraído íntegramente en este sprint por no ser necesario para el dato ya
  confirmado por la fuente 2).

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa y actualizada (26 de mayo de 2026).
- **Limitación**: es un listado de unidades por tramo de edad (0-1, 1-2, 2-3, etc.)
  para el proceso de admisión, no un directorio de contacto — se ha usado únicamente
  para confirmar la adhesión y descartar la hipótesis de concierto educativo, no como
  fuente de datos de contacto (esos proceden de la fuente 1 o de webs propias).

---

### 5. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para un subconjunto de los 10 centros privados con código de registro de primer
ciclo, se localizó y consultó la web oficial propia del centro (cuando existía, era
accesible y se pudo confirmar de forma inequívoca que correspondía al mismo centro
del registro, por coincidencia de nombre y dirección) para confirmar servicios
concretos del enum `CenterService`. Se verificaron con cita textual los siguientes
centros, todos con sede confirmada dentro de Salamanca capital:

| Centro | Web oficial | Servicios confirmados |
|---|---|---|
| PSN Bicos | psnbicos.es | comedor/cocina propia, horario ampliado, bilingüe, patio exterior |
| Chispitinas | chispitinas.com | comedor, horario ampliado, psicomotricidad, escuela de padres |
| Educa Babys | educababys.com | comedor, inglés, psicomotricidad, música, horario ampliado |
| Tebeo | centroeducacioninfantiltebeo.es | comedor/cocina propia, horario ampliado, servicio de madrugadores |
| Mumakids | centroinfantilmumakids.es | patio exterior, escuela de padres |
| Aula Pimentón Maestro Ávila | maestroavila.com / fundacioneducere.es | comedor, horario ampliado, servicio de madrugadores, psicomotricidad, música |

**Total de centros privados incluidos en el dataset final con servicios confirmados
por web propia: 6 de 8 (75%)** (El Tren y Mi Mamá Me Mima quedan con `services: []`
por falta de cita textual suficiente pese a tener contacto propio verificado), a los
que se suman las 3 escuelas públicas JCyL (comedor confirmado por registro oficial)
y las 4 EIM municipales (comedor y servicio de madrugadores confirmados por la web
del Ayuntamiento/Fundación Ciudad de Saberes) — **13 de 15 centros del dataset final
(86,7%) con algún servicio del enum `CenterService` confirmado**.

Para el resto de centros privados incluidos en el dataset final sin servicio
confirmado (Mi Mamá Me Mima, El Tren) no se localizó, en el momento de la
investigación, una cita textual suficientemente específica y verificable de un
servicio concreto del enum cerrado en su web propia o presencia online — aunque sí
se confirmaron datos de contacto sólidos (web, email y/o teléfono propios) que
permiten mantenerlos en el dataset final. En esos casos `services` queda como array
vacío (`[]`) — **no se ha inventado ningún servicio por similitud con otros centros
del mismo tipo o grupo**.

---

## Fuentes evaluadas y descartadas para el uso principal

### Categoría "CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA Y SECUNDARIA" del Directorio de Centros Docentes — descartada del alcance MVP

Ver hallazgo detallado más arriba (fuente 1): son 22 colegios concertados con oferta
de segundo ciclo de infantil, primaria y secundaria, sin código de registro propio y
diferenciado de primer ciclo, fuera del alcance MVP de primer ciclo (0-3 años)
definido en `AGENTS.md` de forma verificable individualmente. No se han evaluado
individualmente como fichas propias.

### Buscador "Directorio de Centros de Castilla y León" (`directorio.educa.jcyl.es`)

Interfaz de consulta interactiva por provincia/localidad/titularidad, sin descarga
masiva estructurada. Se ha usado de forma puntual y manual para contrastar el nombre
y código de centro de algunos resultados de búsqueda web (y para confirmar la
ausencia de "Coco Miel" como centro de primer ciclo con código propio), nunca como
fuente primaria de extracción masiva.

### Fuentes NO usadas (recordatorio, igual que en el resto de zonas ya integradas)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, todoeduca.com, infoescuelas.com, guarderia.net, infoisinfo.es, buscocolegio.com, educateca.com, colesyguardes.es, noticiassalamanca.com como fuente de datos estructurados, cylex.es, einforma.com, empresite.eleconomista.es, colegiosconcertados.es, infoguarderias.com, tuguarde.es, ensalamanca.com, qdq.com, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro o confirmar que un nombre comercial existe — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario, precio) ni se ha copiado su texto |
| Salamancahoy, La Gaceta de Salamanca, Tribuna de Salamanca, SalamancaTV al Día, Salamanca24horas | Usados exclusivamente para contexto cualitativo (número de plazas gratuitas agregadas, delimitación de barrios), nunca como fuente de un dato estructurado de un centro individual (teléfono, dirección, servicio) |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Instagram / Facebook de centros | Consultados puntualmente para El Tren (ASDECOBA) sin obtener datos suficientes de servicios verificables; no usados como fuente de contenido |

---

## Incidencias de calidad de datos detectadas y corregidas

1. **"Mumakids" (código `37014011`) y "Aula Pimentón Maestro Ávila" (código
   `37014102`)**: filas con `telefono` vacío en la fuente cruda (fuente 1). Se
   completaron con el teléfono publicado en la web oficial propia de cada centro
   (Mumakids: 691 329 455; Aula Pimentón Maestro Ávila: 923 214 200, teléfono
   general del Colegio Maestro Ávila).
2. **Correo electrónico institucional no publicable como contacto**: el campo
   `correo_electronico` del Directorio de Centros Docentes es sistemáticamente
   `{codigo}@educa.jcyl.es` (buzón de gestión administrativa, no contacto del
   centro). Se ha dejado `contact.email` a `null` salvo en los centros donde se
   confirmó un email de contacto propio en su web oficial.
3. **"El Globo Rojo" (código `37010170`)**: único centro de la categoría `CENTRO
   PRIVADO DE EDUCACION INFANTIL` en Salamanca capital con `concierto="S"` en el
   registro oficial (el resto de las 9 filas de esa categoría tienen
   `concierto="N"`). El centro también declara en su propia web ser "contratado por
   la Consejería de Educación para ages 3-6" (segundo ciclo de infantil), pero
   "autorizado" (no necesariamente concertado) para el tramo 0-3. Al igual que en el
   caso análogo de "Santa Catalina" en Valladolid, no se ha localizado ninguna
   fuente oficial que confirme de forma inequívoca que el concierto declarado en el
   registro corresponda específicamente al primer ciclo de educación infantil (0-3
   años) frente al segundo ciclo (3-6 años) impartido por el mismo centro. Ante la
   duda, se ha excluido del dataset final por prudencia (ver
   `docs/salamanca-quality-report.md`, sección 1 y 2), siguiendo la instrucción
   explícita de no usar `ownership: concertado` sin verificación individual del
   marco normativo aplicable al primer ciclo, y de no forzar un centro dudoso dentro
   del dataset final.
4. **"El Globo Rojo II" (código `37014126`)**: tiene código de registro válido en el
   Directorio de Centros Docentes (`naturaleza=PRIVADO`, `concierto=N`,
   `comedor=N`), pero **no aparece** en el listado oficial de centros con unidades
   incluidas en el programa de gratuidad curso 2026-2027 (fuente 4), a diferencia
   del resto de centros privados del dataset. No se ha localizado tampoco una web
   propia independiente (comparte titularidad de marca con "El Globo Rojo", pero sin
   web ni redes propias diferenciadas localizadas). Se ha excluido del dataset final
   por falta de datos de contacto verificables más allá del teléfono del registro
   (compartido textualmente con "El Globo Rojo", código distinto) y por la
   incertidumbre sobre su situación de adhesión a la oferta gratuita vigente. Ver
   `data/enrichment/salamanca-centers-excluded.json`.
5. **"Coco Miel"**: aparece con nombre propio en el listado oficial de centros con
   plazas gratuitas curso 2026-2027 (fuente 4), con web corporativa propia activa
   (grupococomiel.com, C/ Cuesta de San Blas, 14, 37002 Salamanca) y servicios
   descritos (comedor, horario ampliado, campamentos). Sin embargo, **no se ha
   localizado ningún código de centro en el Directorio de Centros Docentes (fuente
   1) bajo ese nombre ni en esa dirección** — la búsqueda directa en el directorio
   interactivo oficial (`directorio.educa.jcyl.es`) para "Coco Miel" devuelve 0
   resultados. Ante la imposibilidad de verificar un código de registro oficial de
   primer ciclo para este centro (podría tratarse de un centro de reciente
   incorporación al programa de gratuidad sin actualización aún en el Directorio de
   Centros Docentes, o de una discrepancia de nomenclatura no resoluble sin contacto
   directo), se ha excluido del dataset final por prudencia, documentando la
   incidencia para una fase de enriquecimiento posterior. Ver
   `data/enrichment/salamanca-centers-excluded.json`.

---

## Proceso de construcción del dataset

1. Se consultó la API del Directorio de Centros Docentes filtrando por
   `refine.municipio=SALAMANCA` (94 filas, todas las etapas) y después por
   `refine.denominacion_generica` en `{"ESCUELA DE EDUCACION INFANTIL", "CENTRO
   PRIVADO DE EDUCACION INFANTIL"}` → 7 + 10 = 17 centros candidatos de primer
   ciclo de educación infantil.
2. Se descartó en bloque la categoría `CENTRO PRIVADO DE EDUCACION INFANTIL PRIMARIA
   Y SECUNDARIA` (22 filas, colegios concertados de segundo ciclo/primaria/
   secundaria sin código propio de primer ciclo verificable, fuera del alcance MVP),
   salvo "Aula Pimentón Maestro Ávila" que sí tiene código propio de primer ciclo en
   la categoría correcta.
3. Se cruzaron las 7 filas `ESCUELA DE EDUCACION INFANTIL` con el listado oficial de
   "Escuelas de Educación Infantil - Titularidad JCyL" (fuente 2): 3 de titularidad
   autonómica genuina (Lazarillo de Tormes, San Bernardo, Virgen de la Vega), 4 de
   titularidad municipal (confirmadas además con la web oficial del Ayuntamiento de
   Salamanca / Fundación Ciudad de Saberes, fuente 3).
4. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos), por
   nombre exacto (0 coincidencias) y por dirección+código postal exacta (0
   coincidencias). "El Globo Rojo" y "El Globo Rojo II" son sedes/entidades distintas
   con código de centro propio cada una, en direcciones distintas dentro del mismo
   entorno urbano (Los Hidalgos 14 y 18).
5. Se verificó el rango de coordenadas de las 17 filas con coordenada en el registro
   (lat 40.94-40.98, lng -5.71 a -5.63): coherentes con el municipio de Salamanca
   capital, sin indicios de error de geocodificación.
6. Se clasificó `ownership`: `publico` para las 7 filas de titularidad pública
   genuina (3 JCyL + 4 municipales); `privado` para 9 de las 10 filas de la
   categoría `CENTRO PRIVADO DE EDUCACION INFANTIL` (todas salvo "El Globo Rojo",
   excluida por concierto no verificado) más "Aula Pimentón Maestro Ávila" (código
   propio de primer ciclo con `concierto=N`). Ningún centro del dataset final usa
   `ownership: concertado`.
7. Se clasificó `type`: las 7 escuelas de titularidad pública → `escuela-infantil`;
   los centros privados incluidos en el dataset final → `guarderia`.
8. Se aplicó el horario/servicios homogéneos de las 4 EIM municipales (fuente 3) y
   el servicio de comedor confirmado por registro oficial para las 3 escuelas JCyL
   (`comedor=S` en las 3).
9. Se localizó la web oficial propia de 7 de los 9 centros privados individuales
   incluidos y se confirmaron servicios con cita textual; el resto (2 de 9: Mi Mamá
   Me Mima, El Tren) se dejó con `services: []` cuando no había confirmación
   textual suficiente y verificable de un servicio concreto del enum cerrado.
10. Se excluyeron del dataset final 3 centros: "El Globo Rojo" (concierto no
    verificado para el tramo 0-3), "El Globo Rojo II" (sin adhesión confirmada a la
    gratuidad 2026-2027 ni web propia con datos de contacto suficientes) y "Coco
    Miel" (sin código de registro verificable en el Directorio de Centros Docentes
    pese a aparecer en el listado de gratuidad). Ver
    `data/enrichment/salamanca-centers-excluded.json`.
11. Se generaron slugs únicos (15/15 verificados), `short_description` (rango
    200-360 caracteres, con varias estructuras de frase rotando de forma
    determinística por hash del código de centro — verificado 15/15 textualmente
    únicas), `long_description` solo cuando había datos reales suficientes (13/15
    centros: 3 JCyL + 4 municipales + 6 privados con servicio confirmado por web
    propia), y FAQs personalizadas (5-6 por centro, basadas únicamente en datos
    confirmados).
12. Total de candidatos evaluados: 17 (7 públicos + 10 privados) más 1 candidato
    adicional detectado solo en el listado de gratuidad ("Coco Miel", sin código de
    registro verificable) = 18 candidatos evaluados en total. De ellos, 15
    superaron el umbral mínimo de verificación del proyecto → **3 centros al
    archivo de excluidos** en este sprint (El Globo Rojo, El Globo Rojo II, Coco
    Miel). Ver `docs/salamanca-quality-report.md` para el detalle completo de
    calidad, limitaciones y la relación final de dataset.
