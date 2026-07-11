# Fuentes de datos — Valencia (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de centros de educación infantil de primer ciclo (0-3 años) en el municipio de València. Sigue el mismo formato y nivel de rigor que `docs/data-sources-barcelona.md` y `docs/data-sources-madrid.md`.

---

## Fuentes evaluadas

### 1. Centres docents de la Comunitat Valenciana — Generalitat Valenciana (dadesobertes.gva.es) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Centres docents de la Comunitat Valenciana |
| **Organismo** | Conselleria d'Educació, Universitats i Ocupació — Generalitat Valenciana. Fuente: Registre de Centres Docents (creado por Decret 115/1990) |
| **URL catálogo** | https://dadesobertes.gva.es/va/dataset/edu-centros (también espejado en https://datos.gob.es/en/catalogo/a10002983-centros-docentes-de-la-comunitat-valenciana y en el European Data Portal) |
| **API/descarga** | **No es un dataset Socrata ni tiene API REST filtrable tipo SoQL** (a diferencia de Barcelona). Es un portal CKAN que publica un único fichero CSV descargable directamente por URL fija: `https://dadesobertes.gva.es/dataset/68eb1d94-76d3-4305-8507-e1aab7717d0e/resource/1aa53c3a-4639-41aa-ac85-d58254c428c0/download/centros-docentes-de-la-comunitat-valenciana.csv`. El propio CKAN sí expone metadatos del dataset en XML/JSON/TURTLE/RDF, pero **no los datos de centros en sí** — solo el CSV completo (todos los municipios y niveles educativos juntos, sin filtros de servidor). |
| **Formato** | CSV (separador `;`, codificación con acentos correctos, ~3.688 filas) |
| **Licencia** | Creative Commons Attribution (CC-BY) |
| **Descarga automatizada** | Sí, parcial — la URL del CSV es estable y descargable con `curl`/`fetch` sin autenticación ni user-agent especial (verificado). No hay filtrado por parámetros de query; hay que descargar el CSV completo (todos los ~3.688 centros de toda la Comunitat Valenciana, todos los niveles) y filtrar localmente por `localidad` y `denominacion_generica`. |
| **Actualización** | Semanal (confirmado en metadatos CKAN: "Setmanal" / weekly). Última actualización observada en la investigación: 27 de junio de 2026 |
| **Registros totales (dataset completo, toda la Comunitat Valenciana)** | 3.688 filas (todos los municipios, todos los niveles educativos: infantil, primaria, secundaria, FP, adultos, música, danza, idiomas, etc.) |
| **Registros en localidad = VALÈNCIA (ciudad)** | 484 centros de cualquier tipo |
| **Registros en VALÈNCIA con denominación genérica de primer ciclo/infantil** | 161 centros: 120 "Centro privado de educación infantil de primer ciclo" + 27 "Centro privado de educación infantil" + 11 "Escuela infantil de primer ciclo" (públicas) + 3 "Escuela infantil" (públicas) |
| **De esos 161, por régimen** | 139 "PRIV.", 8 "PRIV. CONC.", 14 "PÚB." |
| **De los 14 públicos, por titular** | 4 "GENERALITAT VALENCIANA" (EI Apóstol Santiago, EI Niño Jesús, EI 1er Cicle Centro Social El Grao, EI Les Rondalles) + **10 "AJUNTAMENT DE VALÈNCIA"** (ver fuente 2) |

#### Campos disponibles (columnas del CSV)

| Columna | Descripción |
|---|---|
| `codigo` | Código único del centro (Registre de Centres Docents), 8 dígitos, empieza por `46` para la provincia de Valencia |
| `denominacion_generica_es` / `denominacion_generica_val` | Tipo de centro en castellano/valenciano. **No existe una columna booleana tipo `einf1c` de Catalunya** — el flag de "primer ciclo" está codificado dentro del propio texto de la denominación genérica (p. ej. `"ESCUELA INFANTIL DE PRIMER CICLO"`, `"CENTRO PRIVADO DE EDUCACIÓN INFANTIL DE PRIMER CICLO"`), por lo que el filtrado debe hacerse por coincidencia de texto, no por un flag estructurado |
| `denominacion_especifica` / `denominacion` | Nombre propio del centro |
| `regimen` | `PÚB.` (público) / `PRIV.` (privado) / `PRIV. CONC.` (privado concertado) |
| `tipo_via`, `direccion`, `numero` | Dirección desglosada (tipo de vía, nombre, número) |
| `codigo_postal` | Código postal |
| `localidad` | Municipio (usar el valor exacto `"VALÈNCIA"`, sin acompañante `/VALENCIA`, a diferencia de `provincia`) |
| `provincia` | Provincia, con doble denominación `"VALENCIA/VALÈNCIA"` |
| `telefono` | Teléfono (presente en la gran mayoría de filas revisadas) |
| `fax` | Fax (mayormente vacío, campo heredado) |
| `longitud` / `latitud` | Coordenadas WGS84 en columnas separadas (no requieren conversión UTM) |
| `titular` | Titularidad detallada — permite distinguir `GENERALITAT VALENCIANA`, `AJUNTAMENT DE VALÈNCIA` (municipal) y entidades privadas (parroquias, fundaciones, cooperativas, personas físicas, sociedades mercantiles, etc.) — **columna clave para identificar los centros municipales** |
| `cif` | CIF de la entidad titular |
| `comarca` | Comarca (p. ej. "VALENCIA", "L'HORTA NORD") — **no es distrito ni barrio municipal**; es una unidad territorial más amplia que agrupa varios municipios. **No existe ninguna columna de distrito/barrio de la ciudad de Valencia en este dataset** (limitación importante, ver abajo) |
| `url_es` / `url_va` | Enlace a la ficha del centro en el Registre (`ceice.gva.es/web/centros-docentes/ficha-centro?codi=...`), no la web propia del centro |
| `fe_constitucion` | Fecha de alta en el registro (a menudo vacía para centros antiguos) |

**No incluye:** email, distrito/barrio municipal, flag de comedor/horario ampliado/idiomas, ni indicación de si el centro tiene plazas concertadas específicamente para primer ciclo (el concierto económico para 0-3 es infrecuente en la Comunitat Valenciana, similar a Catalunya).

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente primaria oficial de la Generalitat Valenciana, equivalente funcional del Directori de centres docents catalán y del dataset CAM de Madrid
- Cubre todos los centros autorizados con primer ciclo de infantil del municipio, públicos y privados, identificados por texto en `denominacion_generica`
- Incluye coordenadas WGS84 listas para usar, sin conversión
- Incluye teléfono en la mayoría de registros
- La columna `titular` permite aislar de forma fiable los 10 centros de titularidad `AJUNTAMENT DE VALÈNCIA` directamente desde esta fuente, sin depender de un cruce manual
- **Limitaciones (más marcadas que en Barcelona):**
  - **No hay API REST/Socrata filtrable** — solo un CSV único y completo (3.688 filas de toda la Comunitat Valenciana) que hay que descargar entero y filtrar localmente; no hay endpoint tipo `$where=nom_municipi=Valencia` como en Catalunya
  - **No hay flag booleano de primer ciclo** — el filtro depende de parsear texto libre en `denominacion_generica_es`/`val` (frágil ante posibles variaciones de redacción, aunque en la práctica los valores observados son consistentes)
  - **No hay columna de distrito ni barrio** de la ciudad de Valencia (Barcelona sí tenía `nom_dm` con los 10 distritos oficiales) — para asignar distrito/barrio habría que hacer geocodificación inversa manual a partir de `longitud`/`latitud`, o cruzar con capas GIS municipales aparte
  - **No incluye email** del centro
  - `url_es`/`url_va` apuntan a la ficha del registro, no a la web propia del centro
  - No indica servicios (comedor, horario ampliado, idiomas) ni proyecto educativo

---

### 2. Escoles Infantils Municipals de València — Regidoria d'Educació (Ajuntament de València) ⭐ A USAR (fuente para centros municipales, con matices)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escoles Infantils Municipals de la ciutat de València |
| **Organismo gestor** | **Regidoria d'Educació** del Ajuntament de València (regidora en el momento de la investigación: Rocío Gil Uncio). No existe un organismo autónomo/fundación independiente equivalente al IMEB de Barcelona — la gestión depende directamente de la concejalía. El portal web oficial de la concejalía es **educacio-valencia.es** (confirmado como dominio oficial: las fichas de centro individuales usan direcciones de correo `@valencia.es`, y la web `valencia.es` del Ayuntamiento enlaza a `educacio-valencia.es` como "Portal d'Educació") |
| **Modelo de gestión** | La Regidoria distingue entre escuelas de **gestión directa** (Pinedo, y los tres colegios municipales de primaria Benimaclet, Santiago Grisolía y Fernando de los Ríos, más el Conservatori Professional de Música José Iturbi) y escuelas de **gestión indirecta** (las 10 restantes, operadas por terceros bajo titularidad municipal). Esta distinción no está documentada con una fuente única y estructurada; se infiere de menciones sueltas en el propio portal y notas de prensa institucionales |
| **URL principal** | https://educacio-valencia.es/es/escuelas-infantiles/ (listado) y https://educacio-valencia.es/es/la-concejalia/ (información institucional) |
| **URL fichas individuales (ejemplos)** | https://educacio-valencia.es/es/escuela-infantil-municipal-de-pinedo/, https://educacio-valencia.es/es/escuela-infantil-municipal-solc/, https://educacio-valencia.es/es/escuela-infantil-municipal-mini-poli/ (una URL por centro) |
| **URL complementaria (directorio municipal "Infociudad")** | https://www.valencia.es (buscar `infociudad-escuela-infantil-municipal-[nombre]`), p. ej. https://www.valencia.es/-/infociudad-escuela-infantil-municipal-de-pinedo y https://www.valencia.es/-/infociudad-escuela-infantil-municipal-quatre-carreres — ficha estructurada por centro con dirección, teléfono(s) y email institucional |
| **Formato** | HTML — página de listado + una página propia por cada centro en `educacio-valencia.es`, más una ficha equivalente en el directorio "Infociudad" de `valencia.es`. **No se ha localizado ningún PDF, CSV ni listado descargable único** con todos los centros y sus datos de contacto en una sola fuente (a diferencia del PDF del IMEB de Barcelona) |
| **Descarga automatizada** | **No** — no existe API ni fichero descargable. Requiere **scraping manual/semi-manual**: visitar la página de listado para obtener los nombres/enlaces, y luego cada ficha individual (11 páginas en `educacio-valencia.es` y/o 11 páginas equivalentes en el directorio "Infociudad" de `valencia.es`) para extraer dirección, teléfono y email. El dominio `valencia.es` respondió con normalidad a herramientas de fetch en la investigación (sin bloqueo anti-bot detectado, a diferencia de `barcelona.cat`) |
| **Actualización** | Sin periodicidad publicada; páginas HTML institucionales mantenidas manualmente |
| **Registros** | 11 escoles infantils municipals en la ciudad de València (10 identificadas también como titular `AJUNTAMENT DE VALÈNCIA` en el CSV de la Generalitat bajo `localidad=VALÈNCIA`, más 1 adicional — "EI 1er Cicle Municipal de Pinedo" — que en el CSV de la Generalitat aparece con `localidad=PINEDO`, una pedanía/poblado marítimo dentro del término municipal de València) |
| **Nombres confirmados (cruce Generalitat + educacio-valencia.es + Infociudad)** | Pardalets, Gent Menuda, Solc, Quatre Carreres, Benicalap, Mini-Poli, Mestra Empar Navarro i Giner, Sant Pau, Diputada Clara Campoamor, Algirós, de Pinedo |

#### Campos disponibles (por ficha individual, combinando `educacio-valencia.es` + Infociudad)

| Campo | Descripción |
|---|---|
| Nombre | Nombre del centro tal como aparece en la ficha (ej. "Escuela Infantil Municipal de Pinedo") |
| Dirección | Calle, número, código postal (verificado en fichas de Infociudad) |
| Teléfono | Uno o dos números de contacto directo (verificado, ej. Quatre Carreres: 963013221 y 673855111) |
| Email | Institucional `@valencia.es` con patrón `ei[nombre]@valencia.es` (verificado: `eipinedo@valencia.es`, `eiquatrecarreres@valencia.es`) |
| Web | Enlace a la ficha propia en `educacio-valencia.es` |
| Servicio | Descripción de etapa: "Educación Infantil 1er ciclo (0-3 años)" |
| Distrito/barrio | **No se muestra en ninguna de las dos fuentes** (ni Infociudad ni el portal educativo) |
| Horario / comedor | No confirmado en las páginas revisadas; requeriría visitar cada ficha individualmente o contactar directamente, no se puede generalizar sin verificación por centro (a diferencia de Barcelona, donde el IMEB confirmó explícitamente en texto que el horario y el comedor con cocina propia son homogéneos para las 106 EBM) |

#### Calidad estimada: ⭐⭐⭐

- Fuente oficial directa (concejalía municipal), con teléfono y email verificables centro a centro
- El correo institucional `@valencia.es` y la coincidencia de nombres/direcciones con el CSV de la Generalitat dan alta confianza en la autenticidad de los 11 centros
- **Limitaciones (notablemente mayor esfuerzo que Barcelona):**
  - No existe un listado único descargable (ni PDF ni CSV) — hay que construirlo a mano visitando ~11-22 páginas HTML individuales (educacio-valencia.es + Infociudad), sin automatización de scraping ya realizada en esta investigación
  - No hay confirmación textual homogénea de horario o servicio de comedor aplicable a las 11 escuelas como conjunto (habría que verificarlo ficha a ficha, o vía solicitud de información/contacto directo)
  - La distinción gestión directa/indirecta no está en una fuente única estructurada, solo mencionada de forma dispersa
  - No hay columna de distrito/barrio en ninguna de las fuentes municipales tampoco

---

### 3. Centres educatius en València — Ajuntament de València (portal de datos abiertos municipal, CKAN) — EVALUADA, USO COMPLEMENTARIO LIMITADO

| Campo | Detalle |
|-------|---------|
| **Nombre** | Centres educatius en València / Centros Educativos en Valencia |
| **Organismo** | Ajuntament de València — portal "Dades Obertes" / "Plataforma VLCi" |
| **URL catálogo** | https://opendata.vlci.valencia.es/dataset/centros-educativos-en-valencia (grupo temático "Educación": https://opendata.vlci.valencia.es/group/educacion) |
| **API/descarga** | Portal CKAN. Ofrece descarga directa en **CSV, GeoJSON y Shapefile (SHP)** mediante URLs de recurso fijas (ej. `.../resource/9b95b4a2-.../download/centros-educativos-en-valencia.csv`). No se ha confirmado un endpoint de API CKAN (`/api/3/action/datastore_search`) activo y filtrable durante la investigación |
| **Formato** | CSV, GeoJSON, SHP |
| **Licencia** | Creative Commons Attribution 4.0 International (CC BY 4.0) |
| **Descarga automatizada** | Sí, parcial — URLs de descarga directa sin autenticación, pero sin filtrado por parámetros; hay que descargar el fichero completo (todos los niveles educativos del municipio) y filtrar localmente |
| **Actualización** | Última actualización observada: 9 de febrero de 2026. Periodicidad no especificada explícitamente en los metadatos revisados |
| **Registros** | No cuantificado con precisión en la investigación, pero de alcance equivalente al subconjunto "localidad=VALÈNCIA" del dataset de la Generalitat (mismo universo de centros del municipio) |
| **Relación con la fuente 1** | Es, en la práctica, **un subconjunto/espejo del mismo Registre de Centres Docents de la Generalitat, republicado por el Ayuntamiento con menos columnas** — no aporta datos nuevos sustanciales. Comparando cabeceras: `codcen;dlibre;dgenerica_;despecific;regimen;direccion;codpos;municipio_;provincia_;telef;fax;mail` más columnas geométricas (`Geo Point`, `Geo Shape`). Los nombres y tipos de centro observados en el muestreo (ej. "EI 1er CICLE MUNICIPAL MESTRA EMPAR NAVARRO I GINER", "CENTRE PRIV. ED. INF. 1er CICLE LA SENYERA") coinciden exactamente con los del dataset de la Generalitat |

#### Diferencias relevantes frente al dataset de la Generalitat (fuente 1)

| Campo | Presente en Ayuntamiento (fuente 3) | Presente en Generalitat (fuente 1) |
|---|---|---|
| Email (`mail`) | Sí (columna dedicada) | No |
| Titular/propietario | No visible en cabecera muestreada | Sí (`titular`) |
| Coordenadas | Sí, formato "Geo Point" combinado (requiere parseo) | Sí, columnas separadas `longitud`/`latitud` (más directo de usar) |
| Web del centro | No | Sí (`url_es`/`url_va`, aunque genérica del registro) |
| Distrito/barrio | No | No |

#### Calidad estimada: ⭐⭐⭐

- Fuente oficial municipal, formato abierto y descargable sin fricción (CSV/GeoJSON/SHP, CC-BY)
- Aporta el campo `mail` que no está en el dataset de la Generalitat — potencialmente útil como complemento puntual si se logra parsear con fiabilidad, aunque no se ha verificado en la investigación qué proporción de filas tiene este campo relleno
- **Limitaciones:** Es esencialmente redundante con la fuente 1 para el propósito de identificar centros con primer ciclo (mismos nombres, misma taxonomía de `denominacion_generica`); no aporta titularidad ni distrito; el formato de coordenadas combinado ("Geo Point") es menos cómodo que el de la Generalitat. Se recomienda usar como fuente de contraste/relleno de emails, no como fuente primaria de extracción

---

### 4. Otros datasets del portal de datos abiertos del Ayuntamiento de València (opendata.vlci.valencia.es) — EVALUADOS, NO USADOS

| Dataset | URL | Motivo de descarte |
|---|---|---|
| Equipaments Municipales | https://opendata.vlci.valencia.es/dataset/equipaments-municipales | Incluye "Centros educativos" como una de muchas categorías de equipamiento municipal (junto a bibliotecas, centros sociales, mercados, etc.), pero los campos disponibles son mínimos (nombre, identificador, código de calle, número de portal, teléfono) — sin tipo de centro, sin titularidad, sin flag de primer ciclo. Formatos vía geoportal (WFS/GeoJSON/SHZ/GML/WMS/KML/DWG/CSV) en `geoportal.valencia.es`, capa `SociedadBienestar/v_infociudad` |
| Àrees d'escolarització | https://opendata.vlci.valencia.es/dataset/arees-escolaritzacio | Delimitación de zonas/áreas de escolarización (polígonos GIS para adscripción de centros por zona), no un listado de centros en sí. Podría ser útil en una fase posterior para asignar distrito/barrio por geolocalización (cruce espacial punto-en-polígono), dado que ningún dataset de centros incluye directamente esa columna |
| Zones Jocs Infantils | https://opendata.vlci.valencia.es/dataset/zones-jocs-infantils-zona-juegos-infantiles | Parques infantiles, no centros educativos — descartado, no aplica |

---

### 5. Guia de Centres Docents (buscador web) — ceice.gva.es — EVALUADA, NO USADA COMO FUENTE DE DATOS MASIVA

| Campo | Detalle |
|-------|---------|
| **Nombre** | Guia de Centres Docents / Cerca de centres |
| **Organismo** | Conselleria d'Educació, Universitats i Ocupació — Generalitat Valenciana |
| **URL** | https://ceice.gva.es/va/web/centros-docentes/guia-de-centros-docentes |
| **Uso dado** | Buscador web interactivo (por nombre de centro o localidad) y visor cartográfico (mapa por distrito/etapa educativa) con ficha individual por centro en `ceice.gva.es/abc/i_guiadecentros/...` o `ceice.gva.es/web/centros-docentes/ficha-centro?codi=...`. Es la interfaz pública de consulta del mismo Registre de Centres Docents que alimenta el CSV de dades obertes (fuente 1). No se extrajeron registros masivos de aquí porque el CSV de dadesobertes.gva.es ya cubre el mismo universo de centros de forma estructurada y descargable en bloque, evitando tener que scrapear ~484 fichas HTML individuales de Valencia ciudad una a una |

---

## Fuentes NO usadas (recordatorio, igual que en Madrid y Barcelona)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping; instrucción explícita de no usar |
| Directorios privados (micole.net, agendadeisa.com, educoland.com, colesyguardes.es, infoguarderias, etc.) | No consultados como fuente primaria ni secundaria para la construcción del dataset — solo se usó un artículo de agendadeisa.com de forma puntual para triangular el número aproximado de escuelas municipales (11), pero sus datos de contacto/nombres no coinciden de forma fiable con la fuente oficial y **no deben usarse como fuente de datos**, solo como referencia de validación cruzada del recuento |
| Redes sociales de centros o de la concejalía (Facebook "EducacioVLC", Instagram "educaciovlc", YouTube) | No se usaron como fuente de datos estructurados; solo confirman la existencia y titularidad oficial del portal `educacio-valencia.es` |
| Webs propias de cada uno de los ~161 centros candidatos | No se visitó individualmente cada web por alcance de esta investigación; se usarán los datos estructurados de las fuentes 1-3 en la fase de construcción del dataset |

---

## Proceso de construcción del dataset

**Nota: esta sección es una plantilla/borrador. La construcción real del dataset (descarga, filtrado, clasificación, cruce y carga en `mock-centers.ts` o Supabase) es un paso posterior no ejecutado en esta investigación — aquí solo se documentan las fuentes y el enfoque previsto.**

1. Descargar el CSV completo de `dadesobertes.gva.es` (fuente 1, ~3.688 filas, toda la Comunitat Valenciana) y filtrar localmente por `localidad="VALÈNCIA"` (más, si se decide incluir la pedanía de Pinedo, `localidad="PINEDO"`).
2. Sobre ese subconjunto (~484 filas), filtrar por `denominacion_generica_es` en el conjunto `{"ESCUELA INFANTIL DE PRIMER CICLO", "CENTRO PRIVADO DE EDUCACIÓN INFANTIL DE PRIMER CICLO", "ESCUELA INFANTIL", "CENTRO PRIVADO DE EDUCACIÓN INFANTIL"}` → ~161 centros candidatos con primer ciclo 0-3 autorizado. Evaluar si conviene incluir también los centros con `"...INFANTIL Y PRIMARIA"` / `"...INFANTIL, PRIMARIA Y SECUNDARIA"` que puedan tener sección de primer ciclo (a validar caso a caso, ya que la denominación genérica en la Comunitat Valenciana no siempre distingue el primer ciclo dentro de un colegio con etapas superiores, a diferencia de Catalunya donde el flag `einf1c` es independiente de la etapa).
3. Clasificar los candidatos según `titular`:
   - **`AJUNTAMENT DE VALÈNCIA`** (10-11 filas) → cruzar por nombre normalizado con la fuente 2 (`educacio-valencia.es` + Infociudad) para completar email y verificar/corregir teléfono y dirección.
   - **`GENERALITAT VALENCIANA`** (públicos no municipales, ej. EI Apóstol Santiago, EI Niño Jesús, EI Les Rondalles, EI 1er Cicle Centro Social El Grao) → centros públicos de gestión autonómica directa, sin fuente de contacto adicional más allá del propio CSV (teléfono) y la ficha del registro (`url_es`).
   - **Privados / privados concertados** (~147 filas) → fuente de datos principal es directamente el CSV (nombre, dirección, teléfono, coordenadas); no se dispone de listado municipal complementario para estos.
4. Descargar el CSV de `opendata.vlci.valencia.es` (fuente 3) como fuente de contraste, principalmente para intentar rellenar el campo `email` (ausente en el CSV de la Generalitat) mediante cruce por `codigo`/`codcen` (mismo código de centro en ambas fuentes).
5. Para los 11 centros municipales, visitar manualmente las páginas de `educacio-valencia.es/es/escuela-infantil-municipal-[nombre]/` y/o las fichas "Infociudad" de `valencia.es` para extraer email institucional `@valencia.es`, teléfono(s) verificado(s) y dirección exacta — no hay forma de automatizar esta parte sin scraping HTML dedicado (no existe PDF ni CSV único, a diferencia del IMEB de Barcelona).
6. **Pendiente de resolver (limitación estructural, a diferencia de Barcelona/Madrid): no existe ninguna fuente oficial con distrito o barrio municipal de Valencia para estos centros.** Habría que decidir entre: (a) no ofrecer filtrado por distrito/barrio en el MVP de Valencia, (b) hacer geocodificación inversa manual/semi-automática de `longitud`/`latitud` contra los límites oficiales de los 19 distritos de Valencia (disponibles como capa GIS aparte, posiblemente en `opendata.vlci.valencia.es`, no confirmado en esta investigación), o (c) cruzar espacialmente con el dataset "Àrees d'escolarització" (fuente 4) si sus polígonos resultan utilizables para este fin.
7. Aplicar el mismo criterio de calidad/indexabilidad usado en Madrid y Barcelona (mínimo de datos básicos por centro: nombre, ciudad, tipo, dirección/zona, servicios y descripción) para decidir qué centros entran en el dataset final indexable y cuáles quedan en `pending_review`.
8. Generar `short_description`, `long_description`, FAQs y `recommended_indexable` exclusivamente a partir de los hechos confirmados en estas fuentes, sin inventar servicios, horarios, precios ni coordenadas no confirmadas — igual que en Barcelona, dado que aquí tampoco hay una confirmación textual homogénea de horario/comedor aplicable a todas las escuelas municipales como conjunto (habría que verificarlo centro a centro o marcarlo como no confirmado).

## Script de normalización

Al igual que en Barcelona, se recomienda formalizar este proceso en un script versionado si se decide ejecutarlo (p. ej. `scripts/normalize-valencia-data.ts`), que debería:
1. Descargar y parsear el CSV de `dadesobertes.gva.es` (sin API, fichero completo).
2. Filtrar por `localidad="VALÈNCIA"` (+ `"PINEDO"` si aplica) y por los valores de `denominacion_generica_es` listados en el paso 2 del proceso anterior.
3. Clasificar por `titular` en municipal / Generalitat / privado.
4. Cruzar con el CSV de `opendata.vlci.valencia.es` por código de centro para intentar recuperar el email.
5. Incorporar manualmente los datos de contacto de las 11 escuelas municipales obtenidos por scraping semi-manual de `educacio-valencia.es` / Infociudad (sin fuente única automatizable).
6. Generar slugs únicos, descripciones, FAQs y el cálculo de `recommended_indexable`, dejando explícitamente sin asignar el distrito/barrio hasta resolver el punto 6 del proceso anterior.
