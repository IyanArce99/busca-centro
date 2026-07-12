# Fuentes de datos — Zaragoza (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Zaragoza capital. Sigue el mismo formato y nivel de rigor que `docs/data-sources-madrid.md`,
`docs/data-sources-barcelona.md` y `docs/data-sources-valencia.md`.

**Ámbito exacto**: únicamente el municipio de Zaragoza (capital). Se excluyen
explícitamente los municipios del área metropolitana (Utebo, Cuarte de Huerva, La
Muela, María de Huerva, Zuera, etc.), aunque aparecieran en fuentes provinciales o
autonómicas de alcance más amplio.

---

## Fuentes evaluadas

### 1. Directorio de Centros Educativos de Aragón — Gobierno de Aragón (opendata.aragon.es, API GA_OD_Core) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Directorio de centros educativos de Aragón |
| **Organismo** | Gobierno de Aragón — Departamento de Educación, Ciencia y Universidades, a través del portal de datos abiertos "Aragón Open Data" |
| **URL catálogo (portal, SPA no navegable directamente)** | https://opendata.aragon.es/datos/catalogo/dataset/directorio-de-centros-educativos-de-aragon |
| **API real usada** | El portal es una SPA basada en Liferay que no expone los datos en el HTML estático. Los datos reales se sirven a través de la **API GA_OD_Core** (herramienta propia de Aragón Open Data, ver https://github.com/aragonopendata/GA_OD_Core), en concreto la vista `view_id=167`, descargable directamente en GeoJSON sin autenticación: `https://opendata.aragon.es/GA_OD_Core/download?view_id=167&formato=json` |
| **Formato** | GeoJSON (FeatureCollection), también disponible en CSV/XML vía la misma API cambiando el parámetro `formato` |
| **Licencia** | Creative Commons Attribution 4.0 (CC-BY), como el resto de Aragón Open Data |
| **Descarga automatizada** | Sí, completa — URL estable, sin parámetros de filtro por municipio (hay que descargar las ~896 filas de toda Aragón y filtrar localmente por `localidad` y `tipo_centr`) |
| **Actualización** | No se ha podido confirmar periodicidad exacta en los metadatos accedidos; los datos de las fichas municipales de Zaragoza contrastadas coinciden en su mayoría, con la excepción documentada más abajo |
| **Registros totales (toda Aragón, todos los niveles)** | 896 filas |
| **Registros en localidad = "Zaragoza" con tipo relevante (0-3 años)** | 53 filas brutas, de las cuales 52 son correctas y 1 es un error de geolocalización de la propia fuente (ver limitaciones) |

#### Campos disponibles (columnas del GeoJSON, dentro de `properties`)

| Campo | Descripción |
|---|---|
| `objectid`, `idcentrorc` | Identificadores internos; `idcentrorc` es el código del Registro de Centros Docentes (empieza por el prefijo de provincia: `50` para Zaragoza provincia, `22` para Huesca) |
| `nombre_cen` | Nombre del centro, con prefijo de tipo (`E.E.I.`, `C.E.I.`, `C.P.`, etc.) |
| `tipo_centr` | Tipología oficial. Para primer ciclo 0-3: `"Escuela de Educación Infantil"`, `"Centro Privado de Educación Infantil"`, `"Escuela Infantil"` |
| `naturaleza` | `Público`, `Privado` o `Concertado` (a nivel de centro; en la práctica no se observó ningún centro de primer ciclo con `naturaleza=Concertado` en Zaragoza en este dataset) |
| `localidad` | Municipio. Único valor `"Zaragoza"` sin ambigüedad textual con la provincia |
| `direccion`, `codpostal` | Dirección postal y código postal |
| `telefono`, `mail`, `fax`, `web` | Datos de contacto (web con frecuencia vacía o apuntando a un dominio genérico) |
| `longitud`, `latitud` | Coordenadas WGS84 en columnas separadas, listas para usar sin conversión |
| `coordx`, `coordy` | Coordenadas en EPSG:25830 (UTM huso 30N), redundantes con `longitud`/`latitud` |

**No incluye**: distrito o barrio municipal, régimen de concierto de primer ciclo (el
concierto 0-3 en Aragón está en fase de implementación normativa durante 2026 y no
está reflejado en este dataset), horario, ni servicios (comedor, idiomas, etc.).

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente primaria oficial del Gobierno de Aragón, equivalente funcional al Directori
  de centres docents catalán, al dataset CAM de Madrid y al CSV de dadesobertes.gva.es
  de Valencia.
- Incluye coordenadas WGS84 listas para usar.
- Incluye teléfono en prácticamente todos los registros y email en una parte
  significativa (especialmente en centros públicos y algunos privados).
- **Limitaciones detectadas y verificadas en esta investigación:**
  - **Un registro con error de geolocalización de la propia fuente**: `E.E.I.
    Villanueva de Sijena` aparece con `localidad="Zaragoza"`, pero su `idcentrorc`
    (`22010931`) y código postal (`22231`) corresponden a la provincia de Huesca
    (Villanueva de Sijena es un municipio oscense). Se excluyó del dataset tras esta
    verificación cruzada — **no se incluyó en el dataset final ni en el SQL**.
  - **Desactualizado para una parte de la red pública**: 4 de las 13 Escuelas
    Infantiles Municipales del Ayuntamiento de Zaragoza (El Bosque, Parque Bruil, El
    Andén, Parque Venecia) **no aparecen en absoluto** en este dataset bajo ningún
    nombre reconocible, a pesar de ser centros activos y confirmados en la propia web
    municipal. Se completaron con la fuente 2 (zaragoza.es).
  - **No incluye las 4 escuelas infantiles de titularidad autonómica** (Red de
    Escuelas Infantiles del Gobierno de Aragón en Zaragoza capital: Aragón, Inmaculada
    Concepción, Monsalud, Santa María del Pilar) bajo esos nombres — se completaron
    con la fuente 3 (aragon.es).
  - No hay columna de distrito/barrio, igual que en Valencia.
  - No indica servicios (comedor, horario ampliado, idiomas) ni proyecto educativo.

---

### 2. Escuelas Infantiles Municipales — Patronato Municipal de Educación y Bibliotecas (Ayuntamiento de Zaragoza) ⭐ A USAR (fuente para las 13 escuelas municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles Municipales de Zaragoza |
| **Organismo gestor** | Patronato Municipal de Educación y Bibliotecas, organismo autónomo del Ayuntamiento de Zaragoza |
| **URL listado** | https://www.zaragoza.es/sede/portal/escuelas-infantiles/centros |
| **URL fichas individuales de equipamiento** | Una URL por centro en `zaragoza.es/sede/servicio/equipamiento/[id]`, con horario, servicios, capacidad por aulas y distrito/barrio |
| **Formato** | HTML — listado + una ficha propia por cada centro |
| **Descarga automatizada** | No hay API ni CSV/PDF único descargable; requiere lectura de la página de listado y de cada ficha individual (13 páginas) |
| **Actualización** | Páginas institucionales mantenidas por el Ayuntamiento; se detectó una nota vigente de traslado temporal de un centro (ver más abajo) |
| **Registros** | 13 Escuelas Infantiles Municipales |
| **Nombres confirmados** | Los Vientos, María Urrea, El Bosque, Parque Bruil, El Andén, Pirineos, Villacampa, El Tren, La Piraña, Los Ibones, Brioletas, La Paz, Parque Venecia |

#### Campos disponibles (por ficha individual)

| Campo | Descripción |
|---|---|
| Nombre, dirección, código postal, distrito/barrio | Verificados en cada ficha de equipamiento |
| Teléfono, email institucional `@zaragoza.es` | Verificados centro a centro |
| Horario | Confirmado de forma homogénea en las 9 fichas revisadas en detalle: **8:30 a 16:30 h, con permanencia máxima de 8 horas por niño/a** |
| Servicios | Confirmado de forma homogénea: **comedor elaborado en cocina propia** y **"Escuela de Madres y Padres"**; la mayoría menciona también patio/jardín exterior propio |
| Edades | 4 a 36 meses (primer ciclo) |
| Nota especial detectada | La ficha oficial de la **Escuela Infantil Municipal La Piraña** indica explícitamente que, durante el curso 2025/26, el centro permanece cerrado y trasladado temporalmente a la Escuela Infantil Municipal Parque Bruil. Se documenta esta incidencia en el dataset (campo `notes_internal` y FAQ dedicada) en vez de omitirla u ocultarla. |

Se complementó con la **Guía del Usuario de las Escuelas Infantiles Municipales**
(PDF institucional, `zaragoza.es/contenidos/educacionybibliotecas/Guia_uso_esc_inf_08.pdf`),
usada únicamente como confirmación adicional del modelo de comedor con cocina propia y
del proceso de admisión municipal con baremo — **no como fuente de horarios actuales**,
ya que el documento data de una versión antigua (9 escuelas, cuando hoy son 13) y
algunos datos concretos de horario por franja pueden haber cambiado.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa (Ayuntamiento), con teléfono, email y horario verificables
  centro a centro en fichas individuales actualizadas.
- Documenta explícitamente distrito/barrio para las 13 escuelas — el único subconjunto
  del dataset de Zaragoza con esta información confirmada por fuente oficial.
- **Limitaciones**: no hay CSV/PDF único descargable con las 13 escuelas y todos sus
  campos; hubo que verificar cada ficha de equipamiento por separado.

---

### 3. Red de Escuelas Infantiles del Gobierno de Aragón (aragon.es / educa.aragon.es) ⭐ A USAR (fuente para las 4 escuelas autonómicas)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Red de Escuelas Infantiles del Gobierno de Aragón |
| **Organismo** | Departamento de Educación, Ciencia y Universidades del Gobierno de Aragón |
| **URL principal** | https://www.aragon.es/escolarizar-en-centros-educativos/red-de-escuelas-infantiles |
| **URL fichas individuales** | Una URL por centro en `aragon.es/-/escuela-de-educacion-infantil-[nombre]-en-zaragoza` |
| **Formato** | HTML — página general de la red + una ficha propia por centro |
| **Registros** | 11 escuelas infantiles en toda Aragón, de las cuales **4 están en Zaragoza capital**: Aragón, Inmaculada Concepción, Monsalud, Santa María del Pilar (el resto están en Calatayud, Ejea de los Caballeros, Gallur, Alcañiz, Barbastro, Monzón y Huesca capital — fuera del ámbito de esta investigación) |

#### Campos disponibles (por ficha individual)

| Campo | Descripción |
|---|---|
| Dirección, código postal, teléfono, email `@educa.aragon.es` | Verificados centro a centro en las 4 fichas |
| Horario | Confirmado de forma homogénea: **9:00 a 17:00 h, con entrada anticipada opcional desde las 7:45 h** (confirmado explícitamente en Aragón, Inmaculada Concepción y Santa María del Pilar) |
| Servicios | Cocina propia con menús adaptados y equilibrados (confirmado en las 4); psicomotricidad como taller semanal (confirmado en Aragón e Inmaculada Concepción); patio exterior (confirmado en Aragón, Santa María del Pilar) |
| Edades | 0-3 años / 4-36 meses según la ficha |

**Nota importante**: este subconjunto de 4 centros **no aparece bajo estos nombres en
el Directorio de Centros Educativos de Aragón (fuente 1)**, a pesar de ser centros
públicos activos y con ficha propia en el portal oficial del Gobierno de Aragón. Se
trata de una discrepancia entre el dataset abierto (desactualizado en este
subconjunto) y las fichas institucionales vigentes.

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa del organismo titular (Gobierno de Aragón).
- Datos de contacto y horario verificados centro a centro.
- **Limitación**: no hay listado único descargable; hubo que localizar y leer cada
  ficha individual por separado.

---

### 4. Coordenadas de las escuelas municipales y autonómicas no presentes en GA_OD_Core (geocodificación verificable)

Para las 4 escuelas municipales y las 4 escuelas autonómicas que no aparecen en el
Directorio de Centros Educativos de Aragón (fuente 1), las coordenadas se obtuvieron
mediante **geocodificación de la dirección oficial contra OpenStreetMap/Nominatim**,
contrastando en cada caso que el resultado devuelto correspondiera exactamente al
nombre del centro (`amenity=kindergarten`/`school` con el nombre propio coincidente) y
no a una calle homónima en otro municipio — se descartaron y corrigieron manualmente
dos primeras resoluciones erróneas (calles "Ramiro I" y "José Pellicer" que existen
también en Cuarte de Huerva y María de Huerva, fuera del ámbito de esta investigación)
hasta obtener la coincidencia exacta por nombre de centro dentro del término municipal
de Zaragoza. No se han inventado ni aproximado coordenadas al centro de la ciudad en
ningún caso.

---

### 5. Webs propias de centros privados — verificación puntual (no fuente masiva)

Para una parte de los 41 centros privados detectados en la fuente 1, se localizó y
consultó la web oficial propia del centro (cuando existía y era accesible) para
confirmar servicios concretos del enum `CenterService`: Nanyland (3 centros en
Zaragoza), Bosque Ternura, Zarapeques, Las Torres de Montecanal, Divina Pastora,
Virgen de Guadalupe, Nemomarlin Paseo de Sagasta, Fundación La Caridad / Cantinela,
Patronato Nuestra Señora de los Dolores, Cu Cu-Tas Tas. En estos casos, `services` y
`long_description` se redactaron a partir de lo que la propia web confirma
explícitamente, nunca por inferencia de "qué es habitual en este tipo de centro".

Para el resto de centros privados (más de la mitad del total) no se localizó una web
propia accesible y verificable dentro del alcance de esta investigación, o la web
encontrada no confirmaba servicios concretos con claridad suficiente. En esos casos
`services` queda como array vacío (`[]`) — **no se ha inventado ningún servicio por
similitud con otros centros del mismo tipo**.

---

## Fuentes NO usadas (recordatorio, igual que en Madrid, Barcelona y Valencia)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, guarderiasenzaragoza.es, todoeduca.com, infoguarderias.com, qdq.com, etc.) | Usados exclusivamente como referencia para localizar qué centros existen y confirmar direcciones/nombres a triangular contra la fuente oficial — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario) ni se ha copiado su texto |
| CATEDU (centrosdocentes.catedu.es) | Portal que aloja las webs propias de algunos centros públicos (ej. Monsalud); se usó puntualmente para localizar la web oficial de un centro, no como fuente masiva de extracción |
| Buscador interactivo `centroseducativosaragon.es` | Dominio no resoluble/alcanzable durante la investigación; descartado en favor de la API GA_OD_Core, que sirve el mismo universo de datos de forma estructurada |
| Educaragón (buscador SPA, `educa.aragon.es/buscador-de-centros`) | Interfaz de consulta interactiva en JavaScript sin datos accesibles en el HTML estático; no se usó para extracción masiva, solo como referencia de la existencia del Registro de Centros Docentes |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |

---

## Proceso de construcción del dataset

1. Se descargó el GeoJSON completo de la API GA_OD_Core (vista 167, 896 features de
   toda Aragón) y se filtró localmente por `localidad="Zaragoza"` y `tipo_centr` en el
   conjunto `{"Escuela de Educación Infantil", "Centro Privado de Educación Infantil",
   "Escuela Infantil"}` → 53 candidatos brutos.
2. Se detectó y excluyó 1 registro con error de geolocalización de la propia fuente
   (Villanueva de Sijena, provincia de Huesca) mediante verificación cruzada del
   prefijo de `idcentrorc` y del código postal → 52 candidatos válidos.
3. Se clasificaron los 52 candidatos por `naturaleza`: 11 públicos (10 municipales +
   Nuestra Señora de Loreto) y 41 privados.
4. Se contrastó el listado de 13 Escuelas Infantiles Municipales oficiales
   (zaragoza.es) contra los 10 públicos municipales detectados en el paso 3,
   identificando 4 escuelas municipales activas y confirmadas (El Bosque, Parque
   Bruil, El Andén, Parque Venecia) ausentes en la fuente 1. Se incorporaron
   íntegramente desde la fuente municipal, con coordenadas por geocodificación
   verificable de su dirección oficial.
5. Se identificaron las 4 escuelas infantiles de titularidad autonómica (Red de
   Escuelas Infantiles del Gobierno de Aragón en Zaragoza capital), ausentes también
   en la fuente 1, y se incorporaron desde sus fichas oficiales en aragon.es, con
   coordenadas por el mismo método de geocodificación verificable.
6. Se documentó el carácter de acceso restringido de la Escuela Infantil Nuestra
   Señora de Loreto (convenio Ministerio de Defensa - Gobierno de Aragón, Base Aérea
   de Zaragoza) mediante el BOE-A-2007-2433.
7. Para los 41 centros privados, se intentó localizar la web oficial propia de cada
   uno (búsqueda dirigida + verificación de dominio propio, nunca agregadores) para
   confirmar servicios concretos del enum `CenterService`. Se confirmaron servicios en
   13 de los 41 (~32%); el resto queda con `services: []` por falta de fuente
   primaria verificable dentro del alcance de esta investigación.
8. Total de candidatos evaluados: 60 (18 públicos + 42 privados). Tras aplicar el
   criterio de calidad mínima (ver `docs/zaragoza-quality-report.md`), 59 entraron en
   el dataset final y 1 (Duendecillos, sin teléfono, email, web ni servicio
   confirmado) quedó excluido con motivo documentado.
9. Se generaron slugs únicos, `short_description` (180-450 caracteres, con 4-8
   estructuras de frase rotando por grupo homogéneo para evitar el incidente de
   plantilla detectado en Barcelona), `long_description` solo cuando había datos
   reales suficientes (32/59 centros), y FAQs personalizadas (3-6 por centro, basadas
   únicamente en datos confirmados).
