# Fuentes de datos — Murcia (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de centros de educación infantil de primer ciclo (0-3 años) en el **municipio de Murcia** (término municipal completo, que incluye la capital y sus pedanías: Puente Tocinos, Cabezo de Torres, Churra, Espinardo, Beniaján, Algezares, La Alberca, El Palmar, Sangonera la Verde, Torreagüera, etc.). No incluye otros municipios de la Región de Murcia (Cartagena, Molina de Segura, Alcantarilla, etc.), que son entidades administrativas independientes. Sigue el mismo formato y nivel de rigor que `docs/data-sources-barcelona.md` y `docs/data-sources-valencia.md`.

---

## Fuentes evaluadas

### 1. Sedes de los Centros Educativos de la Región de Murcia — CARM / mapaescolar-api ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Sedes de los Centros Educativos de la Región de Murcia |
| **Organismo** | Comunidad Autónoma de la Región de Murcia (CARM), Consejería de Educación, Formación Profesional y Empleo. Alimenta la herramienta pública "Mapa Escolar" (`mapaescolar.murciaeduca.es`), presentada oficialmente por la Consejería como mapa interactivo con información de los centros educativos de la región |
| **URL catálogo (portal de datos abiertos)** | https://datosabiertos.regiondemurcia.es/carm/catalogo/educacion/sedes-de-los-centros-educativos-de-la-region-de-murcia |
| **API/descarga** | API JSON pública, sin autenticación: `https://mapaescolar.murciaeduca.es/mapaescolar-api/api/centros`. Devuelve un array JSON con **todos** los centros educativos (de todos los niveles) de toda la Región de Murcia en una sola respuesta (verificado: 893 registros en el momento de la investigación) |
| **Formato** | JSON (un único endpoint, sin paginación ni filtros de query documentados; hay que descargar todo y filtrar localmente, igual que el CSV de Valencia) |
| **Licencia** | Remite al aviso legal del portal de datos abiertos: https://datosabiertos.regiondemurcia.es/avisolegal |
| **Descarga automatizada** | Sí — confirmado con `curl` sin autenticación ni cabeceras especiales (HTTP 200, ~931 KB) |
| **Actualización** | Anual, según metadatos del catálogo (última actualización observada: 31/10/2025) |
| **Registros totales (Región de Murcia completa, todos los niveles)** | 893 centros |
| **Registros en `muncen="MURCIA"` (término municipal, todos los niveles)** | 279 centros |
| **Registros en `muncen="MURCIA"` con `tipo` de primer ciclo de infantil** | **52 centros**: 38 "Centro Privado de Educación Infantil" + 14 "Escuela de Educación Infantil" (de los cuales 7 son Escuelas Infantiles Municipales del Ayuntamiento de Murcia y 7 son escuelas públicas de titularidad autonómica) |

#### Campos disponibles (columnas del JSON, por centro)

| Campo | Descripción |
|---|---|
| `codcen` | Código único de centro (8 dígitos, empieza por `30` para la provincia de Murcia) |
| `dencen` | Nombre propio del centro |
| `denCorta` / `denLarga` | Denominación corta / larga del tipo de centro (p. ej. "EMEI" / "Escuela Municipal de Educación Infantil") |
| `tipo` | Categoría general del centro. **No existe un flag booleano de "primer ciclo" independiente**: el filtro de primer ciclo (0-3) se hace por el valor exacto de `tipo` (`"Escuela de Educación Infantil"` o `"Centro Privado de Educación Infantil"`), igual que en Valencia se filtra por texto de `denominacion_generica`. Los `Colegio Público` y `Centro Privado con varias Enseñanzas` que tienen el flag `infantil="S"` corresponden a infantil de 3-6 años (segundo ciclo) dentro de un colegio, no a primer ciclo — se excluyeron sistemáticamente (158 registros descartados por esta vía en el municipio de Murcia) |
| `titularidad` | `P` (pública) / `N` (privada, "no pública"). **No distingue concierto económico**: no se ha detectado ninguna columna equivalente a `regimen="PRIV. CONC."` de Valencia; en la práctica, el primer ciclo de infantil en la Región de Murcia no tiene aulas concertadas específicas conocidas en esta muestra |
| `domcen` | Dirección (calle, número); en pedanías pequeñas a veces solo indica el nombre de la pedanía sin calle (p. ej. "GEA Y TRUYOLS") |
| `loccen` | Localidad/pedanía específica dentro del término municipal (p. ej. "PUENTE TOCINOS", "EL PALMAR (LUGAR DE DON JUAN)") — **clave para diferenciar capital vs. pedanías** |
| `muncen` | Municipio (término municipal completo). **Es el campo correcto para filtrar "municipio de Murcia"**, no `loccen` (que es más granular y varía por pedanía) |
| `cpcen` | Código postal |
| `telcen` / `telcen2` | Teléfono(s) de contacto |
| `email` | Correo electrónico institucional (mayoritariamente presente; en centros públicos sigue el patrón `[codcen]@murciaeduca.es`) |
| `web` | Enlace genérico `www.murciaeduca.es/[codcen]`, no la web propia del centro (equivalente funcional al `url_es` del registro valenciano — es la ficha del registro, no el sitio del centro) |
| `geo-referencia.lat` / `geo-referencia.lon` | Coordenadas WGS84 en formato objeto anidado, listas para usar sin conversión |
| `infantil`, `primaria`, `secundaria`, etc. | Flags booleanos S/N de etapas educativas ofertadas — **no distinguen primer/segundo ciclo dentro de infantil** |
| `comedor`, `transporte`, `desayuno`, `aulaMatinal`, `bilingue_ingles`, `bilingue_frances`, `plurilingue` | Flags de servicios, **pero se observó que están sistemáticamente vacíos o en "N" para los 52 centros de primer ciclo de Murcia** (los flags de servicios de este dataset parecen pensados para colegios/institutos, no para escuelas infantiles/guarderías; no se han usado como fuente de servicios por no ser fiables para este tipo de centro — verificado servicio a servicio, ver más abajo) |

**No incluye de forma fiable:** servicios reales del centro (comedor, horario ampliado, idiomas) para centros de primer ciclo — los flags existen en el esquema pero no se observaron con valor `S` en ninguno de los 52 centros filtrados, así que **no se han usado como fuente de servicios**. Tampoco incluye distrito/barrio formal de la capital, precio, plazas ni metodología pedagógica.

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente primaria oficial de la Comunidad Autónoma de la Región de Murcia, equivalente funcional al Directori de centres docents catalán, al dataset CAM de Madrid y al Registre de Centres Docents de la Generalitat Valenciana
- Cubre todos los centros autorizados de primer ciclo de infantil del municipio (capital y pedanías), públicos y privados
- Incluye coordenadas WGS84 listas para usar
- Incluye teléfono en 51 de 52 registros y email en 49 de 52
- El campo `titularidad` permite distinguir de forma fiable centros públicos (14, incluidas las 7 EMEI municipales) de privados (38)
- **Limitaciones:**
  - No hay filtro de servidor (`$where`/SoQL): hay que descargar el JSON completo (893 registros de toda la región) y filtrar localmente por `muncen` y `tipo`
  - Los flags de servicios (`comedor`, `bilingue_ingles`, etc.) no son fiables para centros de primer ciclo — no se han usado como fuente de datos de servicios
  - `web` apunta a una ficha genérica del registro (`murciaeduca.es/[codcen]`), no a la web propia del centro — para verificar servicios reales hubo que localizar y consultar individualmente la web oficial de cada centro que la tuviera
  - No hay columna de distrito/barrio formal de la ciudad de Murcia
  - No distingue régimen concertado (solo público/privado)
  - No indica edad mínima exacta por centro (se asume el rango estándar de primer ciclo, 0-3 años, salvo en las EMEI municipales donde el propio Ayuntamiento confirma 4 meses como edad mínima real)

---

### 2. Escuelas Infantiles Municipales de Murcia — Ayuntamiento de Murcia (Patronato de Escuelas Infantiles) ⭐ A USAR (para los 7 centros municipales, como complemento del punto 1)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles Municipales del Ayuntamiento de Murcia |
| **Organismo gestor** | Patronato de Escuelas Infantiles, Ayuntamiento de Murcia. Sede: C/ Amberes, 3, 30003 Murcia. Tel. 968 35 86 00. Email: escuelasinfantiles@ayto-murcia.es |
| **URL principal usada como fuente** | https://www.informajoven.org/info/educacion/B_9_2.asp (portal informativo oficial del Ayuntamiento de Murcia dirigido a jóvenes/familias, con listado y datos de contacto de las 7 escuelas) |
| **URL complementaria** | https://sede.murcia.es/ficha-procedimiento/6242 (procedimiento de solicitud de plaza) y notas de prensa oficiales en `web.murcia.es` sobre plazas, horario y aulas nido |
| **Formato** | HTML — página de listado con datos de contacto de las 7 escuelas |
| **Descarga automatizada** | No — datos incorporados manualmente tras lectura de la página, cruzados por nombre/dirección/teléfono con los 7 registros de titularidad `P` y tipo "Escuela Municipal de Educación Infantil" de la fuente 1 (coincidencia exacta de teléfono en las 7 escuelas, ver tabla siguiente) |
| **Registros** | 7 escuelas infantiles municipales, confirmadas por cruce con la fuente 1: San Roque (Algezares), Beniaján, La Ermita (La Alberca), La Paz (Murcia capital), Ntra. Sra. de la Fuensanta (Murcia capital/Santiago el Mayor), Ntra. Sra. de los Ángeles (Sangonera la Verde), El Lugarico (El Palmar) |

#### Datos aportados por esta fuente y usados en el dataset

- **Horario confirmado para el conjunto de las 7 escuelas**: lunes a viernes de 8:15 a 16:00 h, con servicio de matinal desde las 7:30 h (fuente: nota de prensa oficial del Ayuntamiento de Murcia sobre el inicio de curso, `web.murcia.es`)
- **Servicio de comedor confirmado para el conjunto de las 7 escuelas**, con menús adaptados a la edad
- **Edades atendidas confirmadas**: de 4 meses a 3 años, con aulas nido específicas (Aula Nido 1: 4-8 meses; Aula Nido 2: 9-11 meses) además de aulas de 1 y 2 años
- **Dato de contexto para el informe SEO**: la red municipal ofertó 512-523 plazas para el curso 2024/2025 en las 7 escuelas y se declaró "completa" (demanda superior a la oferta), según cobertura de prensa institucional (`web.murcia.es`, `lavozdelaregion.es`, `murcia.com`, `murciaplaza.com`) — señal de demanda insatisfecha relevante para el enfoque SEO de centros privados

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa del Ayuntamiento de Murcia, con teléfonos que coinciden exactamente con los de la fuente 1 (CARM) para las 7 escuelas, lo que da alta confianza cruzada
- Aporta horario y confirmación de comedor aplicable de forma homogénea al conjunto de las 7 escuelas (a diferencia de Valencia, donde no se pudo confirmar esto para las 11 escuelas municipales como grupo)
- **Limitaciones:** no hay ficha individual detallada por escuela (solo nombre, dirección, teléfono) en esta fuente; no se ha usado `escuelasinfantilesmurcia.es` (dominio oficial del Patronato pero excluido explícitamente como fuente por instrucción del coordinador, ver sección de fuentes no usadas)

---

### 3. Webs oficiales de centros privados individuales — USADAS PUNTUALMENTE PARA VERIFICAR SERVICIOS

| Campo | Detalle |
|-------|---------|
| **Uso dado** | Para 9 de los 38 centros privados (aquellos con web propia identificable y funcional, distinta de la ficha genérica `murciaeduca.es`), se consultó directamente su sitio web oficial para confirmar servicios reales (comedor, cocina propia, horario ampliado, bilingüe, psicomotricidad, música, actividades extraescolares, orientación pedagógica), citados en `verified_notes`/`long_description` de cada ficha |
| **Centros verificados con web propia** | AEPIO (ceiaepio.es), Origami (escuelainfantilorigami.com), Las Claras de la Flota (nurseryschoolmurcia.com), Érase Una Vez — Casillas (ceieraseunavez.com), Initial School (initialschool.es), Nice Day School (nicedayschool.es), EMPI (empi.es), Los Molinos (escuelainfantil-losmolinos.com), Arco Iris / El Patio del Arco Iris (elpatiodelarcoiris.es) |
| **Criterio aplicado** | Solo se asignó un servicio del enum `CenterService` cuando la propia web del centro lo mencionaba explícitamente en texto (nunca por inferencia de "es habitual en este tipo de centro"). Cuando un servicio mencionado en la web no tiene equivalente exacto en el enum cerrado del proyecto (p. ej. "logopedia", "estimulación temprana", "método Gordon", "apoyo a la lactancia"), no se ha forzado a la categoría más parecida — queda documentado en `long_description`/`verified_notes` pero no en el array `services` |
| **Los 29 centros privados restantes** | No se localizó una web propia funcional y verificable (solo agregadores de terceros como Micole, Educoland, Páginas Amarillas, que no se han usado como fuente), o la web encontrada no detallaba servicios con suficiente claridad textual. Estos centros entran en el dataset final solo con los datos de la fuente 1 (nombre, dirección, teléfono, email, tipo, titularidad, coordenadas) y sin servicios asignados |

#### Calidad estimada: ⭐⭐⭐ (complementaria, no sistemática)

- Aporta datos reales y verificables centro a centro, pero no es una fuente estructurada ni completa — depende de que cada centro tenga web propia indexada y de que el contenido sea legible por las herramientas de fetch disponibles
- **Limitación relevante:** no se ha podido verificar la web propia de los 29 centros privados restantes dentro del alcance de este sprint; quedan con confidence `medium` en vez de `high`

---

## Fuentes evaluadas y descartadas

| Fuente | Motivo de descarte |
|--------|---------------------|
| **`escuelasinfantilesmurcia.es`** | Excluida explícitamente por instrucción del coordinador. Es el dominio oficial del Patronato de Escuelas Infantiles del Ayuntamiento de Murcia (mencionado como referencia en informajoven.org), pero la instrucción de la tarea prohíbe expresamente usarlo como fuente. En su lugar se usó `informajoven.org` (también del Ayuntamiento de Murcia) para los datos de las 7 EMEI |
| **Dataset "Centros de Educación Infantil 0-3 años" (`educa-guarderias`) del Ayuntamiento de Molina de Segura** | Es un dataset **municipal de Molina de Segura**, no de Murcia ni de la CARM para el municipio de Murcia — a pesar de aparecer bajo el dominio `datosabiertos.regiondemurcia.es` (portal regional que aloja también catálogos municipales de distintos ayuntamientos). Verificado su contenido: los 10 registros son centros de Molina de Segura (C.A.I. Altorreal, CAI El Llano, etc.), confirmado por dirección y por el propio nombre del dataset en el catálogo ("Ayuntamiento de Molina de Segura"). Documentado en el dataset de excluidos |
| **Listado de Centros Educativos — Ayuntamiento de Cartagena** | Dataset municipal de Cartagena, otro municipio distinto de Murcia, descartado por ámbito |
| **Micole, Educoland, Páginas Amarillas, Guardería.info, Todoeduca, otros directorios/agregadores privados** | No usados como fuente de ningún dato ni de descubrimiento sistemático de centros — solo aparecieron incidentalmente en resultados de búsqueda al intentar localizar la web oficial de un centro concreto; nunca se ha copiado texto ni tomado datos estructurados de ellos |
| **Google Maps / Google Places** | No usado para scraping masivo, según instrucción del proyecto. Se usó puntualmente `WebSearch` genérico (no Google Maps) para localizar la URL de la web oficial de algunos centros |
| **Reseñas y valoraciones de usuarios (cualquier plataforma)** | No usadas como fuente de ningún dato, servicio ni descripción |

---

## Proceso de construcción del dataset (ejecutado en este sprint)

1. Se descargó el JSON completo de `mapaescolar.murciaeduca.es/mapaescolar-api/api/centros` (893 registros, toda la Región de Murcia, todos los niveles educativos).
2. Se filtró por `muncen === "MURCIA"` (término municipal completo, 279 registros de cualquier nivel) — **no** por `loccen`, que habría excluido incorrectamente las pedanías.
3. Sobre ese subconjunto, se filtró por `tipo` en `{"Escuela de Educación Infantil", "Centro Privado de Educación Infantil"}` → 52 centros candidatos de primer ciclo (0-3 años). Se descartaron explícitamente los 158 registros con flag `infantil="S"` pero `tipo` de colegio/centro con varias enseñanzas, por corresponder a segundo ciclo (3-6) dentro de centros de primaria, fuera del alcance MVP.
4. Se comprobó ausencia de duplicados por nombre, teléfono y dirección exacta entre los 52 candidatos: ninguno detectado.
5. Se clasificaron por `titularidad`: `P` (14, de los cuales 7 son EMEI municipales identificadas por `denLarga="Escuela Municipal de Educación Infantil"` y cruzadas con informajoven.org) → `type=escuela-infantil`, `ownership=publico`; `N` (38) → `type=guarderia`, `ownership=privado`. Mismo criterio aplicado en Valencia (público/concertado → escuela-infantil, privado puro → guardería).
6. Para las 7 EMEI, se incorporó horario, comedor y edad mínima real (4 meses) confirmados por el Ayuntamiento de Murcia vía informajoven.org y notas de prensa oficiales.
7. Para 9 centros privados con web propia localizada y verificable, se consultó dicha web para confirmar servicios reales del enum `CenterService`, sin inferir ni copiar texto.
8. Se generaron `short_description` (180-450 caracteres), `long_description` (solo para los 16 centros con datos suficientes: 7 EMEI + 9 privados verificados) y FAQs (5-6 por centro) de forma editorial original, con 4-8 estructuras de frase rotadas por grupo homogéneo para garantizar unicidad (verificado: 52/52 `short_description` únicas, 16/16 `long_description` únicas, sin aperturas de 6+ palabras repetidas más de 3 veces).
9. Se asignó `confidence_level`: `high` a los 14 centros públicos (EMEI + autonómicos, fuente oficial robusta con horario/servicio confirmado) y a los 9 privados con web propia verificada; `medium` a los 29 privados restantes (solo datos de la fuente CARM: nombre, dirección, teléfono, y en la mayoría email). Ningún centro quedó en `low`/`unknown`; los 52 candidatos pasaron el umbral mínimo de calidad (al menos nombre real, dirección clara, fuente oficial y teléfono o email confirmado, más `short_description` factual y FAQs).
10. Los 4 casos límite evaluados individualmente (2 datasets municipales fuera de ámbito, 2 centros con posible relación de marca no confirmable como sede compartida) se documentaron en `data/enrichment/murcia-centers-excluded.json`.

## Limitación estructural pendiente (igual que en Valencia)

No existe ninguna fuente oficial disponible con distritos formales de la capital de Murcia para estos centros. El campo `district` queda `null` en los 52 centros. Sí se ha podido rellenar `neighborhood_barrio` con el nombre de la pedanía (`loccen`) para los 33 centros situados fuera de la capital (Puente Tocinos, Espinardo, Cabezo de Torres, Churra, Beniaján, Algezares, La Alberca, El Palmar, Santo Ángel, Sangonera la Verde, Torreagüera, San Ginés, Casillas, Santiago y Zaraiche, Ermita de Patiño, Cobatillas, Esparragal, San José de la Montaña, Guadalupe, Gea y Truyols), quedando `null` únicamente para los centros situados en la propia capital.
