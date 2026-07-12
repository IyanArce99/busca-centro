# Fuentes de datos — Las Palmas de Gran Canaria (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset
de centros de educación infantil de primer ciclo (0-3 años) en el municipio de
Las Palmas de Gran Canaria. Sigue el mismo formato y nivel de rigor que
`docs/data-sources-alicante.md`, `docs/data-sources-sevilla.md` y
`docs/data-sources-palma.md`.

**Ámbito exacto**: únicamente el término municipal de Las Palmas de Gran Canaria
capital (`Municipio = "LAS PALMAS DE GRAN CANARIA"`, valor exacto en la fuente
oficial). Se excluyen explícitamente el resto de municipios de la isla de Gran
Canaria (Telde, Santa Brígida, Arucas, San Bartolomé de Tirajana, Agaete, Mogán,
Ingenio, Vega de San Mateo, etc.), aunque aparecieran en la misma fuente insular
o autonómica de alcance más amplio.

`city_slug` elegido para este dataset: **`las-palmas-de-gran-canaria`** (slug
completo, sin abreviar), consistente en JSON/CSV/SQL. Los nombres de archivo usan
el prefijo abreviado `las-palmas` por brevedad, siguiendo la convención indicada
por el coordinador.

---

## Fuentes evaluadas

### 1. Directorio de centros educativos de Canarias — Gobierno de Canarias (datos.canarias.es) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Centros educativos de Canarias — `centros.csv` |
| **Organismo** | Consejería de Educación, Formación Profesional, Actividad Física y Deportes — Gobierno de Canarias |
| **URL catálogo** | https://datos.canarias.es/catalogos/general/dataset/centros-educativos-de-canarias |
| **URL descarga directa usada** | `https://datos.canarias.es/catalogos/general/dataset/f6b15811-014b-46f7-a858-fe48b062ed05/resource/b5e08adf-841b-4ba5-a599-4339e772d792/download/centros.csv` |
| **Formato** | CSV (separador `,`, con campos entre comillas, codificación UTF-8, acentos correctos) |
| **Licencia** | Aviso Legal del Gobierno de Canarias (reutilización de datos abiertos) |
| **Descarga automatizada** | Sí, completa — URL estable, descargable sin autenticación. Es un único CSV con **todos** los centros educativos no universitarios de Canarias (1.306 filas, todos los niveles: infantil, primaria, secundaria, FP, adultos, música, idiomas, etc.), que se descargó completo y se filtró localmente |
| **Registros totales (dataset completo Canarias)** | 1.306 |
| **Registros con `Municipio = "LAS PALMAS DE GRAN CANARIA"` (cualquier tipo de centro)** | 207 |
| **Registros de primer ciclo de infantil en Las Palmas de Gran Canaria** | **40 centros**: 14 con `DesEtapaCentro = "EEI"` (Escuela de Educación Infantil, pública) + 26 con `DesEtapaCentro = "CPEI"` (Centro Privado de Educación Infantil) |
| **De las 14 EEI, tras verificación individual** | 11 de titularidad "Administración Local" (red municipal gestionada por TRASA) + 1 de titularidad "Cons. de Educación..." (EEI Almirante Antequera, **excluida**: solo 2º ciclo) + 1 de titularidad "Otros Ministerios" (EEI Grumete, **excluida**: uso exclusivo militar) + 1 de titularidad "Otras Consejerías" (EEI Aridamán, **excluida**: plazas de protección de menores) |

#### Campos disponibles (columnas del CSV)

`idCentro`, `Codigo`, `Denominacion`, `DesEtapaCentro`, `DescripcionEtapaCentro`,
`Direccion`, `Localidad`, `CodigoPostal`, `Municipio`, `Isla`, `Provincia`,
`Telefono`, `Fax`, `CorreoElectronico`, `SegundoCorreoElectronico`, `PaginaWeb`,
`Naturaleza`, `TipoCentro`, `Titular`, `CentroCER`, campos de accesibilidad/aulas
rurales (no aplicables a primer ciclo), `EOEP`, `FotoCentro`, enlaces a
KMZ/GoogleEarth, `VerMapaCentroGoogleMaps`, `Longitud`, `Latitud`,
`DescargarZonasInfluenciaCentroGoogleEarth`, `Concierto`.

**Incluye:** teléfono (40/40), email (40/40), coordenadas WGS84 (`Longitud`/
`Latitud`, 40/40, listas para usar sin conversión), titularidad (`Titular`),
web propia en algunos casos (17/37 del dataset final).

**No incluye:** distrito/barrio administrativo de Las Palmas de Gran Canaria,
horario, flag de comedor/horario ampliado/idiomas, ni detalle de servicios
complementarios por centro dentro de este fichero concreto (el portal sí publica
un CSV separado `servicios-complementarios-por-centro.csv` a nivel autonómico
general, pero no se localizó con desglose fiable y verificable para primer ciclo
en Las Palmas dentro del alcance de este sprint, por lo que no se ha usado como
fuente de servicios; se ha preferido verificar servicio a servicio contra la web
propia de cada centro).

#### Columna `Concierto`

El CSV incluye una columna `Concierto`, pero en los 37 registros finales de Las
Palmas de Gran Canaria (11 EEI + 26 CPEI) esta columna aparece vacía o sin valor
que indique concierto formal para primer ciclo. Esto es coherente con el marco
normativo canario: el concierto educativo en Canarias, igual que en el resto de
comunidades autónomas, se aplica típicamente a segundo ciclo de infantil,
primaria y secundaria, no al primer ciclo (0-3 años), que se rige por un régimen
de autorización y, en su caso, subvención (ver punto 2 y 3 más abajo). Se
verificó además, caso por caso en la web propia del centro cuando fue posible,
que ningún centro de este dataset tiene concierto para su primer ciclo — ver
sección "Precisión sobre `ownership`" más abajo.

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente primaria oficial de la Consejería de Educación del Gobierno de Canarias.
- Cubre todos los centros autorizados con primer ciclo de infantil del municipio,
  públicos (EEI) y privados (CPEI), identificados por el código de tipo de centro
  `DesEtapaCentro`.
- Incluye coordenadas WGS84 listas para usar en las 40 filas candidatas.
- Incluye teléfono y email en el 100% de las filas candidatas.
- **Limitaciones:**
  - No hay API REST filtrable de forma nativa por municipio+etapa — solo un CSV
    único y completo (1.306 filas de toda Canarias) que hay que descargar entero y
    filtrar localmente.
  - El campo `DesEtapaCentro = "EEI"` no distingue por sí solo entre centros de
    acceso público general y centros de titularidad especial (ver los 3 casos
    excluidos: Ministerio de Defensa, Dirección General de Protección a la
    Infancia). Fue necesaria verificación individual centro a centro contra fuentes
    adicionales para depurar el filtro inicial de 14 EEI a 11.
  - No indica distrito/barrio administrativo de Las Palmas de Gran Canaria.
  - No indica servicios (comedor, horario ampliado, idiomas) por centro de forma
    fiable y homogénea para primer ciclo.
  - `PaginaWeb` solo está informado en 4 de los 40 registros candidatos (1 EEI +
    3 CPEI); el resto de webs propias (14 adicionales) se localizaron mediante
    búsqueda dirigida y verificación de coincidencia de nombre/dirección/teléfono.

---

### 2. Escuelas Infantiles Municipales de Las Palmas de Gran Canaria — Ayuntamiento de Las Palmas de Gran Canaria ⭐ A USAR (fuente para los 11 centros municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles Municipales |
| **Organismo gestor** | Ayuntamiento de Las Palmas de Gran Canaria, a través de la empresa municipal **TRASA** (Trabajos, Asesoramiento y Servicios Auxiliares, o entidad equivalente gestora bajo ese nombre comercial) |
| **URL principal** | https://www.laspalmasgc.es/es/areas-tematicas/educacion/escuelas-infantiles-municipales/ |
| **URLs de notas de prensa complementarias** | https://www.laspalmasgc.es/es/ayuntamiento/prensa-y-comunicacion/notas-de-prensa/nota-de-prensa/El-Ayuntamiento-abre-el-plazo-de-solicitud-de-plaza-en-las-Escuelas-Municipales-de-Educacion-Infantil-para-el-curso-2026-2027/ |
| **Modelo de gestión** | Red de **11 escuelas infantiles municipales** de titularidad pública local, distribuidas por distintos distritos/barrios de la ciudad, para niños de 0 a 3 años, con plazas organizadas en categorías de edad 0-1, 1-2 y 2-3 años |
| **Formato** | HTML institucional — página de listado + notas de prensa periódicas con datos operativos (plazo de solicitud, número de plazas, horario, cuotas) |
| **Descarga automatizada** | No — no existe API ni fichero descargable único con el listado de las 11 escuelas; se accedió al contenido HTML de la página principal y de notas de prensa recientes |
| **Contacto general (gestora TRASA)** | Teléfono 928 948 525, email informacion@trasaservicios.es |
| **Registros** | 11 escuelas infantiles municipales, todas confirmadas también en el CSV de la Consejería de Educación (fuente 1) con `Titular = "Administración Local"`, con coincidencia de nombre y localización |

#### Campos disponibles (por la página de listado)

| Campo | Descripción |
|---|---|
| Nombre | Bambi, Blancanieves, La Carrucha, Los Pitufos, Pinocho, Princesa Tenesoya, La Sirenita, Pluto, Heidi, Pocahontas, Dumbo |
| Dirección | Calle y número, cruzada y verificada contra el CSV de la Consejería de Educación (fuente 1) |
| Distrito/barrio | Mencionado de forma descriptiva junto a cada escuela (p. ej. "Siete Palmas", "Schamann", "Pedro Hidalgo", "Tamaraceite", "La Isleta", "Cruz de Piedra", "El Polvorín", "Feria del Atlántico") |
| Teléfono / email | Confirmado por centro, con dominio institucional `@trasaservicios.es`, coincide con el CSV de la Consejería de Educación |
| Horario | **Confirmado y homogéneo para las 11**: horario base de 8:30 a 15:45 h (cierre a las 16:00 h), acogida temprana desde las 7:30 h y horario ampliado hasta las 18:00 h para familias que lo justifiquen por motivos laborales; curso de septiembre a julio |
| Servicio de comedor | Confirmado como incluido en la cuota, con sistema de bonificación según renta familiar (65% de plazas con cuota cero según nota de prensa del curso vigente) |
| Actividades complementarias | La página y las notas de prensa mencionan de forma general inglés, yoga infantil, huerto escolar, psicomotricidad y programas de participación familiar como parte del proyecto educativo de la red — se ha usado como contexto narrativo en `long_description`, **no** como `services[]` confirmado individualmente por centro, al no poder verificar con la misma certeza que las 11 escuelas ofrecen exactamente el mismo paquete de actividades cada curso |

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa (Ayuntamiento de Las Palmas de Gran Canaria), con horario
  y servicio de comedor confirmados de forma homogénea y explícita para las 11
  escuelas.
- Coincidencia de nombre, dirección y teléfono con el registro oficial de la
  Consejería de Educación (fuente 1), lo que da alta confianza en la autenticidad
  de los 11 centros.
- **Limitaciones:**
  - No hay listado único descargable (PDF/CSV) con ficha individual por escuela;
    se trabajó con el listado agregado de la página principal más notas de prensa.
  - No se ha localizado distrito administrativo oficial formal (los 5 distritos
    municipales: Vegueta-Cono Sur-Tafira, Centro Ciudad, Isleta-Puerto-Guanarteme,
    Ciudad Alta, Tamaraceite-San Lorenzo-Tenoya), por lo que se ha usado el campo
    `neighborhood_barrio` (barrio descriptivo) y se ha dejado `district` vacío para
    las 37 fichas de este dataset, evitando inferir el distrito formal sin fuente
    cartográfica verificada.
  - Las actividades complementarias (inglés, yoga, huerto, psicomotricidad) se
    describen a nivel de red, no centro a centro, por lo que no se han asignado
    como `services[]` individuales — ver criterio detallado en
    `docs/las-palmas-quality-report.md`.

---

### 3. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para el conjunto de 26 centros privados (CPEI) detectados en la fuente 1, se
intentó localizar y consultar la web oficial propia de cada centro (cuando
existía, era accesible y se pudo confirmar de forma inequívoca que correspondía
al mismo centro del registro, por coincidencia de nombre, dirección y/o
teléfono) para confirmar servicios concretos del enum `CenterService`. Se
verificaron con contenido citable directamente de la propia web (o de canal
oficial propio: Facebook/Instagram del centro, cuando la web no estuvo
disponible) los siguientes centros:

| Centro | Fuente propia verificada | Servicios confirmados |
|---|---|---|
| Anita Conrad | anitaconrad.com | proyecto bilingüe/trilingüe, comedor |
| Garabato | garabato.es | proyecto bilingüe, comedor, cocina propia, horario ampliado, música, psicomotricidad |
| Pizquito | pizquito.es | comedor, cocina propia, horario ampliado, actividades extraescolares, campamentos de verano |
| MiCole de Vegueta | micoledevegueta.net | comedor, cocina propia, patio exterior, horario ampliado, campamentos de verano |
| Marpe Infantil | colegiomarpe.com | comedor, horario ampliado, actividades extraescolares |
| Tambi 1 / Tambi 2 | escuelainfantiltambi.com | comedor, cocina propia (mismo grupo, 2 sedes) |
| Nueva Atlántida | guarderianuevaatlantida.com | comedor, cocina propia |
| Cascarón | cascaron.net | comedor, cocina propia, horario ampliado |
| Los Jaimitos | colegiojaimebalmes.es | horario ampliado (acogida desde 7:00 h) |
| La Manzana Arenales | la-manzana.com | comedor, cocina propia |
| La Casita de los Niños | web propia del centro (dominio con eñe) | comedor, cocina propia, horario ampliado, patio exterior |
| Children's World | Facebook/canal propio del centro | inglés (introducción, no inmersión) |
| Montessori Tafira | montessoritafira.com | proyecto bilingüe (metodología Montessori declarada) |

**Total de centros privados con al menos un servicio confirmado por fuente
propia: 13 de 26 (50%)**.

**Criterio aplicado de forma estricta ante indicios no verificables**:

- **La Gallina Turuleta, El Barquito (El Patio de mi Casa de Guanarteme), First
  Steps, Domingo Alonso, La Piruleta, El Patio de mi Casa (Ciudad Jardín), El
  Patio de mi Casa 7 Palmas, Little Star, Mafalda, La Blanca Paloma, El Arbolito,
  Mis Peques**: la web oficial existe en algunos casos, pero no devolvió
  contenido accesible durante los intentos de esta investigación (errores de
  conexión/DNS en varios dominios de hosting compartido), o los resultados de
  búsqueda no permitieron confirmar con cita textual propia servicios concretos
  del enum. **No se han asignado servicios** a estos centros pese a los indicios
  de terceros, para evitar inferencia no verificada. Ver detalle completo en
  `docs/las-palmas-quality-report.md`.
- **Nueva Atlántida**: la web propia presentaba contenido publicitario ajeno
  inyectado en parte de sus páginas en el momento de la consulta (señal de
  dominio potencialmente comprometido); solo se han tomado como confirmados los
  datos de contacto y el servicio de comedor casero mencionado explícitamente en
  el bloque principal de contenido propio del centro, evitando citar cualquier
  otro contenido de esa página.
- **Marpe Infantil**: la propia web del centro (parte del Colegio Marpe
  Altavista) confirma explícitamente que el concierto educativo del colegio
  aplica solo a Primaria y Secundaria, y que el primer ciclo de infantil (1-2
  años) es una etapa no concertada, de gestión privada — se ha mantenido
  `ownership = privado` para esta ficha, no `concertado`.
- **Los Jaimitos**: la propia web del Colegio Jaime Balmes confirma que el
  segundo ciclo de infantil (3-6 años) del colegio es "concertada y gratuita",
  mientras que el primer ciclo (0-3 años, Los Jaimitos) es una etapa de pago no
  concertada — se ha mantenido `ownership = privado` para esta ficha de primer
  ciclo, siguiendo el mismo criterio que con Marpe Infantil.

---

### Precisión sobre `ownership` en Canarias: el "Bono Infantil" NO es un concierto educativo

La Consejería de Educación del Gobierno de Canarias gestiona un programa de
**subvenciones a la escolarización temprana** (conocido públicamente como "Bono
Infantil"), mediante el cual tanto Escuelas de Educación Infantil (EEI)
municipales como Centros Privados de Educación Infantil (CPEI) autorizados
pueden inscribirse como "entidades colaboradoras" para gestionar ayudas directas
a familias que sufraguen parte del coste de la plaza en primer ciclo. Fuentes
consultadas: https://www.gobiernodecanarias.org/educacion/web/infantil/subvenciones-primer-ciclo-infantil/escolarizacion-temprana/ayudas-bono-infantil/index.html
y https://www.gobiernodecanarias.org/educacion/web/infantil/subvenciones-primer-ciclo-infantil/escolarizacion-temprana/seleccion-eei-cetros-privados-bono-infantil/.

Siguiendo la lección explícita de la auditoría de Sevilla, **esta adhesión a un
programa de subvención NO se ha mapeado como `ownership = concertado`** para
ningún centro de este dataset. Un centro privado adherido al Bono Infantil sigue
siendo una plaza privada con ayuda económica a la demanda, no un concierto
educativo formal (que implicaría gratuidad estructural de la plaza en los
términos de un convenio administración-centro, como el que sí existe para
segundo ciclo, primaria y secundaria en varios centros canarios, pero no se ha
localizado ningún caso confirmado para primer ciclo dentro del alcance de esta
investigación). El campo `Concierto` del CSV oficial (fuente 1) tampoco marca
ningún registro de este dataset como concertado. Por tanto, **el valor
`concertado` del enum `CenterOwnership` no se ha usado para ningún centro** de
Las Palmas de Gran Canaria en este sprint.

---

## Fuentes evaluadas y descartadas para el uso principal

### Buscador de centros educativos (openlayers) — gobiernodecanarias.org — EVALUADO, USADO SOLO PARA VERIFICACIÓN PUNTUAL

Interfaz de consulta interactiva del mismo registro que alimenta el CSV de
datos.canarias.es (fuente 1). Presentó errores intermitentes del sistema durante
la investigación ("Ha ocurrido un error a la hora de realizar la búsqueda en el
portal ckan"). No se extrajeron registros masivos de aquí porque el CSV ya cubre
el mismo universo de centros de forma estructurada y descargable en bloque; se
usó puntualmente para contrastar fichas individuales (p. ej. EEI Aridamán).

### Página del Ayuntamiento "Centros de Educación Infantil y Primaria" (laspalmasgc.es) — EVALUADA, NO ES LA FUENTE CORRECTA PARA PRIMER CICLO

Esta página del Ayuntamiento (`/es/areas-tematicas/educacion/centros-de-educacion-infantil-y-primaria/`)
lista los 68 centros públicos de infantil (segundo ciclo) y primaria cuyo
mantenimiento y limpieza gestiona el Ayuntamiento por delegación de competencias,
pero **no corresponde a primer ciclo (0-3 años)** sino a la red pública
autonómica de segundo ciclo/primaria. Se identificó y se descartó explícitamente
para no confundirla con la página correcta de Escuelas Infantiles Municipales
(fuente 2).

### Fuentes NO usadas (recordatorio, igual que en Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla, Palma, Málaga y Alicante)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, Todoeduca, Educateca, Vamosaestudiar, Buscocolegio, qdq, Infoisinfo, Cylex, guarderia.net, infoguarderias.com, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro, confirmar que un nombre comercial existe, o triangular direcciones/teléfonos ya presentes en la fuente oficial — **nunca como fuente de verdad de un dato concreto** (servicios, horario, precios) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Redes sociales de centros (Facebook, Instagram) | Usadas únicamente como fuente de último recurso para 1 centro (Children's World) cuando no había web propia accesible, y solo para confirmar un dato muy concreto y citable; no usadas como fuente masiva de datos estructurados |

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo `centros.csv` de `datos.canarias.es` (fuente 1,
   1.306 filas de toda Canarias, todos los niveles educativos) y se filtró
   localmente por `Municipio === "LAS PALMAS DE GRAN CANARIA"` (valor exacto) →
   207 centros de cualquier nivel educativo en el municipio.
2. Sobre ese subconjunto, se filtró por `DesEtapaCentro` en el conjunto `{"EEI",
   "CPEI"}` → **40 centros candidatos** con primer ciclo de infantil potencial
   (14 EEI públicas + 26 CPEI privados).
3. Se verificó individualmente cada una de las 14 EEI contra su titularidad
   (`Titular`) y fuentes adicionales, detectando 3 casos a excluir: EEI Almirante
   Antequera (titularidad autonómica pero solo imparte segundo ciclo 3-6 años,
   confirmado en su propio blog educativo oficial), EEI Grumete (titularidad
   "Otros Ministerios", uso exclusivo de personal militar de la Armada) y EEI
   Aridamán (titularidad "Otras Consejerías", plazas de protección de menores sin
   matrícula ordinaria). Quedan **11 EEI municipales** (titularidad
   "Administración Local"), todas confirmadas también en la web oficial del
   Ayuntamiento de Las Palmas de Gran Canaria (fuente 2).
4. Se comprobó que todos los códigos postales resultantes (35001-35019) están
   dentro del término municipal de Las Palmas de Gran Canaria capital, sin mezcla
   con otros municipios de la isla.
5. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos)
   y por dirección exacta (0 direcciones idénticas entre centros distintos,
   salvo las 2 parejas de sedes del mismo grupo comercial — Tambi 1/Tambi 2 y El
   Patio de mi Casa/El Patio de mi Casa 7 Palmas — que tienen direcciones
   distintas entre sí y se mantienen como fichas independientes por representar
   centros físicamente distintos con código de centro propio).
6. Se clasificó `ownership`: las 11 EEI municipales → `publico`; los 26 CPEI →
   `privado`. Ningún registro tiene marca de concierto para primer ciclo en la
   fuente oficial (columna `Concierto` vacía en los 37 registros finales) — ver
   sección "Precisión sobre `ownership` en Canarias" más arriba.
7. Se clasificó `type`: las 11 EEI municipales → `escuela-infantil` (titularidad
   pública, gestión institucional consolidada en red), siguiendo el mismo
   criterio aplicado en Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla,
   Palma, Málaga y Alicante; los 26 CPEI privados → `guarderia`.
8. Se cruzaron las 11 EEI municipales con la web oficial del Ayuntamiento de Las
   Palmas de Gran Canaria (fuente 2) para confirmar horario homogéneo (8:30-15:45
   h, acogida desde 7:30 h, ampliación hasta 18:00 h), comedor incluido en la
   cuota y barrio de ubicación.
9. Se intentó localizar la web oficial (o canal propio) de los 26 centros
   privados. Se confirmaron servicios con cita textual en 13 de 26 (50%); el
   resto queda con `services: []` por falta de fuente primaria verificable dentro
   del alcance de esta investigación.
10. Se generaron slugs únicos (37/37 verificados, sin colisiones),
    `short_description` (190-348 caracteres, con 3 estructuras para el grupo de
    11 centros municipales, 4 estructuras para el grupo de 13 privados con
    servicio confirmado y 8 estructuras para el grupo de 13 privados sin servicio
    confirmado, rotando de forma determinista), `long_description` solo cuando
    había datos reales suficientes (25/37 centros: los 11 municipales + 14
    privados con servicio y/u horario confirmado), y FAQs personalizadas (3-6 por
    centro según datos confirmados disponibles).
11. Total de candidatos evaluados: 40. De ellos, 3 se excluyeron por quedar fuera
    del alcance MVP o de acceso público general (ver
    `data/enrichment/las-palmas-centers-excluded.json`). Los 37 restantes
    superaron el umbral mínimo de verificación del proyecto (todos tienen al
    menos teléfono y email confirmados en la fuente oficial de la Consejería de
    Educación, más dirección, titularidad y coordenadas verificables en el 100%
    de los casos) → **37 centros en el dataset final, 3 en el archivo de
    excluidos**. Ver `docs/las-palmas-quality-report.md` para el detalle completo
    de calidad y limitaciones.
