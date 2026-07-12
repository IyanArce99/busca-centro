# Fuentes de datos — Córdoba (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Córdoba capital. Sigue el mismo formato y nivel de rigor que `docs/data-sources-madrid.md`,
`docs/data-sources-barcelona.md`, `docs/data-sources-valencia.md`, `docs/data-sources-zaragoza.md`,
`docs/data-sources-murcia.md`, `docs/data-sources-sevilla.md` y `docs/data-sources-malaga.md`.

**Ámbito exacto**: únicamente el municipio de Córdoba (capital), incluyendo los núcleos
de población dentro de su término municipal (Villarrubia, Alcolea, Encinarejo, Cerro
Muriano, Santa Cruz, Trassierra, etc.). Se excluyen explícitamente los otros
municipios de la provincia de Córdoba cuyo nombre incluye o se confunde con
"Córdoba" (Priego de Córdoba, Villanueva de Córdoba, Villafranca de Córdoba,
Villaviciosa de Córdoba, Montalbán de Córdoba) y el resto de municipios provinciales
(Lucena, Palma del Río, Puente Genil, Baena, Montilla, Cabra, Pozoblanco, Fuente
Palmera, La Carlota, Fernán Núñez, Almodóvar del Río, Aguilar de la Frontera, etc.),
aunque aparecieran en fuentes provinciales o autonómicas de alcance más amplio. El
filtro aplicado sobre la fuente principal fue `D_MUNICIPIO === "Córdoba"` (valor
exacto de la codificación INE del municipio, sin ambigüedad textual con la
provincia ni con otros municipios que incluyen "Córdoba" en su nombre).

---

## Fuentes evaluadas

### 1. Centros de primer ciclo de educación infantil en Andalucía, con alumnado matriculado — Junta de Andalucía (datos abiertos) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Centros de primer ciclo de educación infantil en Andalucía, con alumnado matriculado |
| **Organismo** | Junta de Andalucía — Consejería de Desarrollo Educativo y Formación Profesional, a través del Portal de Datos Abiertos de la Junta de Andalucía |
| **URL catálogo** | https://datos.gob.es/en/catalogo/a01002820-centros-de-primer-ciclo-de-educacion-infantil-en-andalucia y https://www.juntadeandalucia.es/datosabiertos/portal/dataset/centros-de-primer-ciclo-de-educacion-infantil-en-andalucia |
| **URL descarga directa usada (curso 2024/2025)** | `https://www.juntadeandalucia.es/datosabiertos/portal/dataset/1943095a-6e22-434f-8fc6-6b9902f9ab83/resource/21a70523-ff32-449f-87f2-75508223f61e/download/da_centros-primer-ciclo-inf.csv` |
| **Formato** | CSV, delimitador `;`, codificación UTF-8, campos entre comillas dobles |
| **Licencia** | Reutilización libre conforme a las condiciones generales del Portal de Datos Abiertos de la Junta de Andalucía |
| **Descarga automatizada** | Sí, completa — URL estable, sin parámetros de filtro por municipio (se descargaron las 2.363 filas de toda Andalucía y se filtró localmente por `D_MUNICIPIO`) |
| **Registros totales (toda Andalucía)** | 2.363 filas |
| **Registros con `D_MUNICIPIO = "Córdoba"`** | 129 filas |
| **Registros en el resto de la provincia de Córdoba (excluidos de este dataset)** | 2.234 filas de toda Andalucía menos las de Córdoba capital; dentro de la provincia de Córdoba en concreto, 129 filas del municipio capital frente a filas repartidas en más de 60 municipios distintos de la provincia (Lucena 13, Palma del Río 9, Puente Genil 7, Baena 7, Montilla 6, Cabra 6, Priego de Córdoba 5, Pozoblanco 5, Fuente Palmera 5, y el resto con 1-3 filas cada uno) |

Esta es la misma fuente ya usada con éxito para Sevilla y Málaga. Es la fuente de
datos abiertos específica de primer ciclo (0-3 años); el "Directorio de centros
docentes no universitarios de Andalucía" general **no incluye** primer ciclo en su
versión 2024/2025 (misma limitación documentada en `docs/data-sources-sevilla.md`
y `docs/data-sources-malaga.md`; no se ha repetido la comprobación exhaustiva
porque el resultado ya está confirmado y es estructural de la fuente, no
específico de una provincia).

#### Campos disponibles (columnas del CSV)

| Campo | Descripción |
|---|---|
| `codigo` | Código de centro del Registro de Centros Docentes (8 dígitos, empieza por `14` para la provincia de Córdoba) |
| `D_DENOMINA` | Tipo de centro ("Centro de Educación Infantil" o "Escuela Infantil", según el registro) |
| `D_ESPECIFICA` | Nombre propio del centro |
| `D_TIPO` | Titularidad: `Público` o `Privado` (ver limitación importante más abajo) |
| `D_DOMICILIO` | Dirección postal |
| `D_LOCALIDAD`, `D_MUNICIPIO`, `D_PROVINCIA` | Localidad, municipio (clasificación INE vía `cod_municipio`) y provincia |
| `C_POSTAL` | Código postal |
| `N_TELEFONO`, `Correo_e` | Teléfono y correo electrónico de contacto |
| `N_LATITUD`, `N_LONGITUD` | Coordenadas WGS84 (formato con coma decimal), listas para usar tras conversión de separador |
| `N_COUTMX`, `N_COUTMY` | Coordenadas UTM, redundantes con lat/lng |
| `pub_adh_inf1` | Público adherido al Programa de Ayuda a las Familias (S/N) |
| `pub_noadh_inf1` | Público no adherido (S/N) |
| `priv_adh_inf1` | Privado **adherido** al Programa de Ayuda a las Familias para el fomento de la escolarización de educación Infantil (S/N) |
| `priv_noadh_inf1` | Privado **no adherido** (S/N) |

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente primaria oficial de la Junta de Andalucía, específica de primer ciclo de
  educación infantil.
- Cobertura del 100% de los centros con alumnado matriculado en primer ciclo en el
  municipio de Córdoba capital.
- Coordenadas en las 129 de 129 filas, todas dentro de un rango geográfico coherente
  del municipio (lat 37.83-38.00, lng -4.93 a -4.67), sin errores de longitud
  detectados (a diferencia del caso "Snoopy" documentado en Sevilla — en Córdoba
  también existe un centro llamado "Snoopy", con coordenadas correctas y sin
  incidencia, verificado explícitamente).
- Teléfono en 127 de 129 filas (98,4%) y correo electrónico en el 100% de las filas.

#### Limitación importante detectada y verificada en esta investigación: el campo `D_TIPO="Público"` agrupa tres redes distintas de titularidad pública

De las 13 filas con `D_TIPO="Público"` en Córdoba capital, la investigación
verificó **el correo electrónico institucional y, cuando fue necesario, fuente
externa propia** de cada una, con el siguiente resultado:

| Grupo | Nº centros | Evidencia de verificación | `ownership` final aplicado |
|---|---|---|---|
| Red genuina de la Junta de Andalucía | 11 (Virgen del Carmen, Azahara, Parque Figueroa, Jesús Ledesma, Nuestra Señora de la Soledad, La Victoria, Los Reyes, Peter Pan, San José, San Rafael, Santuario) | Correo institucional `[codigo].edu@juntadeandalucia.es` en la fuente oficial, confirmado además en `buscocolegio.com` para "Parque Figueroa" ("Administration: Junta de Andalucía", email `14010351.edu@juntadeandalucia.es`) | `publico` (red autonómica) |
| Entidad Local Autónoma de Encinarejo | 1 (Cigüeña Blanca) | Correo `e.i.c.b.08@hotmail.com` (no institucional de la Junta); dirección C/ Séneca s/n, CP 14711 Encinarejo. Verificado en `encinarejo.es` y Wikipedia que Encinarejo es una Entidad Local Autónoma **perteneciente al municipio de Córdoba**, constituida en 1957, con competencias administrativas propias sobre determinados servicios locales | `publico` (titularidad pública de la ELA, matiz documentado explícitamente) |
| Ministerio de Defensa (gestión Kidsco) | 1 (Cerro Muriano) | Correo `cerro.muriano@kidsco.es` (dominio de la empresa gestora, no de la Junta); dirección "Ctra. de Almadén, s/n. Base Cerro Muriano", CP 14350. Verificado que Kidsco Balance S.L. gestiona por concurso público la red de escuelas infantiles del Ministerio de Defensa en instalaciones militares de varias provincias, entre ellas Córdoba, con titularidad pública (Administración General del Estado) y gestión operativa delegada | `publico` (titularidad pública estatal, gestión operativa por empresa de servicios, matiz documentado explícitamente) |

**Motivo de la reclasificación explícita en tres subgrupos (mismo nivel de rigor ya
validado en la corrección post-auditoría de Sevilla y aplicado desde el origen en
Málaga, 2026-07-12)**: el campo `D_TIPO="Público"` de esta fuente no distingue
entre las distintas administraciones públicas titulares (Junta de Andalucía,
Entidad Local Autónoma, Ministerio de Defensa), ni si la gestión operativa diaria
corresponde a personal público o a una empresa de servicios contratada. Se
verificó cada una de las 13 filas `D_TIPO=Público` de Córdoba capital
individualmente contrastando su email de la fuente oficial (dominio
`@juntadeandalucia.es` frente a otros dominios) y, en los dos casos con dominio no
institucional, buscando la fuente externa que explica la titularidad real
(`encinarejo.es` para Cigüeña Blanca; prensa y fuentes oficiales de Defensa/Kidsco
para Cerro Muriano). Las 13 se han mantenido como `ownership: publico` porque las
tres son, en efecto, titularidad de una Administración Pública distinta (autonómica,
local autónoma o estatal) — a diferencia de Málaga, donde 4 de las 10 filas
`D_TIPO=Público` resultaron ser en realidad empresas privadas y se reclasificaron a
`privado`. En Córdoba no se ha detectado ningún caso de empresa privada disfrazada
de "Público" en la fuente cruda, pero sí una heterogeneidad de titulares públicos
que se ha documentado explícitamente en vez de asumir que las 13 pertenecen a la
misma red municipal o autonómica.

**No incluye**: distrito administrativo de Córdoba (Centro, Sur, Norte-Sierra,
Poniente-Guadalquivir, Levante, Poniente Sur, Periurbano Este, Periurbano
Oeste-Sierra), horario individual por centro (salvo el homogéneo de la red pública
genuina de la Junta), ni servicios concretos del enum `CenterService` del proyecto
— estos datos se han buscado de forma puntual en webs oficiales propias (ver fuente
4).

---

### 2. Escolarización 0 a 3 años — Portal de Educación de la Junta de Andalucía ⭐ A USAR (horario homogéneo de la red pública genuina y marco normativo)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escolarización: 0 a 3 años en Andalucía / Preguntas frecuentes |
| **Organismo** | Consejería de Desarrollo Educativo y Formación Profesional, Junta de Andalucía |
| **URL** | https://www.juntadeandalucia.es/educacion/portales/web/escolarizacion/0-a-3-anos y https://www.juntadeandalucia.es/educacion/portales/web/escolarizacion/0-a-3-anos/preguntas-frecuentes |
| **Formato** | HTML institucional |

#### Datos confirmados y usados

- **Horario general homogéneo**: "de 7:30h a 17:00h, ininterrumpidamente", dividido
  en tres tramos: aula matinal (7:30-9:00), atención socioeducativa (9:00-15:30,
  con comedor incluido) y aula de tarde (15:30-17:00). Aplicado como `schedule`
  verificado y homogéneo únicamente para las **11 escuelas infantiles de titularidad
  genuina de la Junta de Andalucía** en Córdoba capital.
- **Edades**: de 16 semanas (aproximadamente 4 meses) a 3 años — usado para
  `age_range` (4-36 meses) en todo el dataset.
- **Proceso de admisión**: procedimiento de reserva (para alumnado ya
  escolarizado, del 16 de marzo al 6 de abril) y procedimiento ordinario de nuevas
  solicitudes (1 al 30 de abril), con posibilidad de indicar un centro principal y
  hasta varios centros subsidiarios, y once criterios de admisión priorizados.
  Usado en `long_description` y FAQs de las 11 escuelas públicas genuinas.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del organismo titular de la red pública.
- Horario homogéneo confirmado explícitamente para toda la red, no inferido.
- **Limitación**: no desglosa horario ni servicios complementarios por centro
  individual, ni cubre la ELA de Encinarejo ni la red de Defensa/Kidsco.

---

### 3. Entidad Local Autónoma de Encinarejo y red de escuelas infantiles del Ministerio de Defensa/DIAPER — fuentes complementarias puntuales

| Fuente | Uso |
|---|---|
| `https://encinarejo.es/` (web institucional de la ELA de Encinarejo) | Confirma que Encinarejo es una Entidad Local Autónoma perteneciente al municipio de Córdoba desde 1957, con competencias administrativas propias, y que gestiona la escuela infantil "Cigüeña Blanca" en su núcleo de población |
| `https://ejercito.defensa.gob.es/diaper/centros-de-educaci%C3%B3n-infantil` (Ejército de Tierra, sección DIAPER) | Confirma la existencia de una red de centros de educación infantil del Ministerio de Defensa en instalaciones militares de distintas provincias, entre ellas Córdoba (Base Militar de Cerro Muriano) |
| Prensa especializada (El Confidencial Digital, Público) sobre la gestión de Kidsco Balance S.L. en la red de escuelas infantiles de Defensa | Confirma que la gestión operativa diaria de estos centros corresponde a una empresa de servicios adjudicataria de un concurso público (contrato marco valorado en 21 millones de euros a nivel nacional en 2022), manteniéndose la titularidad pública del centro (Administración General del Estado) |

Ambas fuentes se han usado exclusivamente para clarificar la naturaleza exacta de
la titularidad pública de dos centros concretos (Cigüeña Blanca y Cerro Muriano),
no como fuente masiva de datos.

---

### 4. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para un subconjunto de los 116 centros de titularidad privada, se localizó y
consultó la web oficial propia del centro (cuando existía, era accesible y se pudo
confirmar de forma inequívoca que correspondía al mismo centro del registro, por
coincidencia de nombre y dirección) para confirmar servicios concretos del enum
`CenterService`. Se verificaron con cita textual las siguientes cadenas/centros,
todos con sede confirmada dentro de Córdoba capital:

| Cadena / centro | Sedes en Córdoba capital incluidas | Web oficial | Servicios confirmados |
|---|---|---|---|
| La Salle Córdoba (CEI 0-3 años) | 1 | lasallecordoba.es | comedor, aula matinal/madrugadores, orientación pedagógica |
| 5 Chupetes Córdoba (Hospital Reina Sofía) | 1 | 5chupetes.com/cordoba | comedor, cocina propia, patio exterior, inglés, música, campamentos de verano |
| Jugando en Azahara | 1 | jugandoenazahara.es | comedor, catering, horario ampliado, madrugadores, bilingüe, inglés, psicomotricidad, música |
| Escuela Infantil Garabatos (Centro + Garabatos 2/Santa Rosa) | 2 | escuelainfantilgarabatos.com | comedor, horario ampliado, bilingüe, inglés |
| Happy Children 2 | 1 (de 2 sedes; "Happy Children 1", en local contiguo, no tiene mención propia diferenciada en la web) | happychildren2.com | inglés, música, psicomotricidad, horario ampliado, orientación pedagógica |
| Escuela Infantil Snoopy | 1 | guarderiasnoopy.com | comedor, cocina propia, horario ampliado, madrugadores, bilingüe, inglés, psicomotricidad, música, patio exterior, campamentos de verano |
| CEI Manolo Álvaro (sede original) | 1 (de 3 sedes; "Manolo Álvaro I" y "Manolo Álvaro II" no tienen dirección/servicio diferenciado confirmado en la web) | ceimanoloalvaro.es | comedor |
| Educare Eduquere | 1 | ed-ed.es | comedor, madrugadores, horario ampliado, patio exterior, psicomotricidad, inglés |
| Chupetines la Arruzafa | 1 | eichupetines.com | psicomotricidad, inglés, música |
| Escuela Infantil El Puzzle | 1 (de 2 sedes; "El Puzzle II" no tiene servicio diferenciado confirmado) | escuelainfantilelpuzzle.com | comedor, horario ampliado |
| Escuela Infantil Playschool | 1 | escuelainfantilplayschool.com | comedor, madrugadores, horario ampliado, inglés, psicomotricidad, música |
| Kid's Garden Córdoba | 1 | kidsgarden.edu.es/cordoba | bilingüe, inglés |
| Nuestra Señora del Rosario | 1 | guarderiarosario.com | comedor, patio exterior, inglés |
| Guardería Pinocho | 1 | guarderiapinocho.es | catering, horario ampliado, escuela de padres y madres |
| Colegio Bética-Mudarra (CEI, primer ciclo) | 1 | betica-mudarra.org | comedor, cocina propia, madrugadores, patio exterior |

**Total de centros con servicios confirmados por web propia: 16 de 129 (≈ 12,4%)**.

**Criterio aplicado de forma estricta con cadenas de varias sedes**: cuando una
cadena tiene varias sedes en el registro oficial (Garabatos/Garabatos 2, Manolo
Álvaro/I/II, Happy Children 1/2, El Puzzle/El Puzzle II) pero la web propia solo
describe servicios de forma diferenciada para algunas sedes concretas, **no se han
extrapolado servicios a las sedes sin confirmación explícita**. Por ejemplo,
"Garabatos" y "Garabatos 2" sí tienen confirmación explícita de ambas direcciones en
la página de contacto de la cadena, por lo que ambas llevan los mismos servicios;
en cambio "Manolo Álvaro I" y "Manolo Álvaro II" no tienen esa confirmación
diferenciada y quedan sin servicios asignados, pese a compartir marca y teléfono
con la sede original.

**Nota sobre "concertado" en el contexto de Córdoba**: no se ha detectado ningún
centro privado de Córdoba que se autodescriba como "concertado" en su propio
marketing (a diferencia de Pequeño Picasso en Málaga). Se mantiene el mismo
criterio técnico para todo el dataset: Andalucía no tiene concierto educativo
formal para el primer ciclo de infantil (0-3 años), por lo que ningún centro usa
`ownership: concertado`.

Para el resto de centros privados (100 de 116) no se localizó una web propia
accesible y verificable dentro del alcance de esta investigación, o la web
encontrada no confirmaba servicios concretos con claridad suficiente. En esos casos
`services` queda como array vacío (`[]`) — **no se ha inventado ningún servicio por
similitud con otros centros del mismo tipo**.

---

## Fuentes evaluadas y descartadas para el uso principal

### Directorio de centros docentes no universitarios de Andalucía (curso 2024/2025) — descartado como fuente de primer ciclo

Misma limitación estructural ya documentada en Sevilla y Málaga: este directorio
general no recoge primer ciclo de infantil (0-3 años) en su versión 2024/2025; el
primer ciclo se publica en un dataset separado (fuente 1 de este documento).

### Ayuntamiento de Córdoba (`cordoba.es`) — sin listado propio descargable de escuelas infantiles municipales

Se investigó específicamente `cordoba.es/servicios/educacion-e-infancia` y
`cordoba.es/servicios/educacion-e-infancia/la-delegacion` en busca de un listado
propio de "Escuelas Infantiles Municipales" equivalente al de Zaragoza o Murcia. El
resultado es que el Ayuntamiento de Córdoba **no gestiona directamente** una red
municipal propia de escuelas infantiles de primer ciclo (no se ha encontrado,
dentro del alcance de esta investigación, un listado oficial descargable en
`cordoba.es`); la red pública de primer ciclo en Córdoba capital corresponde a la
Junta de Andalucía (11 centros), a la Entidad Local Autónoma de Encinarejo (1
centro) y al Ministerio de Defensa (1 centro), según se detalla en la fuente 1. No
se ha forzado la búsqueda de una "red municipal" donde la evidencia disponible no
la confirma.

### Fuentes NO usadas (recordatorio, igual que en Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla y Málaga)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, Todoeduca, Todofamilias, Buscocolegio, Educateca, Infoescuelas, Empresite, QDQ, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro o confirmar que un nombre comercial existe — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario, precio) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Buscador interactivo de centros de la Junta de Andalucía (`educaweb.juntadeandalucia.es`) | Interfaz de consulta interactiva sin datos accesibles en descarga masiva estructurada; no se usó para extracción |

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo de la fuente 1 (2.363 filas de toda Andalucía,
   curso 2024/2025) y se filtró localmente por `D_MUNICIPIO === "Córdoba"` (valor
   exacto) → 129 centros: 13 con `D_TIPO=Público` y 116 con `D_TIPO=Privado`.
2. Se verificó que todos los códigos postales resultantes (14001-14014, más
   14193, 14350, 14610, 14710, 14711, correspondientes a pedanías y núcleos
   periféricos como Alcolea, Cerro Muriano, Villarrubia y Encinarejo) están dentro
   del término municipal de Córdoba, sin mezcla con otros municipios de la
   provincia.
3. Se comprobó ausencia de duplicados por código de centro (129 códigos únicos de
   129 filas) y por nombre+dirección exacta. Se detectaron varias cadenas legítimas
   con varias sedes que comparten teléfono de central (Manolo Álvaro I/II, Mi
   Granja/II/III, Supli Levante/Levante II, San Cayetano/II, Pipiolines-style
   numeración en varios nombres) — se verificó individualmente que cada sede tiene
   código de centro y dirección propios y distintos, por lo que no son duplicados.
4. Se verificó el rango de coordenadas de las 129 filas (lat 37.83-38.00, lng
   -4.93 a -4.67): todas coherentes con el municipio, sin errores de longitud
   detectados (se prestó especial atención al centro llamado "Snoopy", por el
   precedente de coordenadas erróneas con ese mismo nombre documentado en Sevilla;
   en Córdoba sus coordenadas son correctas).
5. Se clasificó `ownership` verificando individualmente, mediante el dominio de
   email institucional de la fuente oficial y fuentes externas puntuales cuando
   fue necesario, cada una de las 13 filas con `D_TIPO="Público"` (ver fuente 1,
   tabla de verificación). Resultado: 11 centros de la red genuina de la Junta de
   Andalucía, 1 de la Entidad Local Autónoma de Encinarejo y 1 del Ministerio de
   Defensa (gestión Kidsco) — las 13 se mantienen como `ownership: publico` por
   corresponder a titularidad de una Administración Pública, aunque de tres redes
   distintas, documentadas explícitamente. Los 116 centros con `D_TIPO="Privado"`
   de origen se mantuvieron como `privado` (105 adheridos al Programa de Ayuda a
   las Familias, 11 no adheridos). Ningún centro usa `ownership: concertado` —
   Andalucía no tiene concierto educativo formal de primer ciclo de infantil.
6. Se clasificó `type`: los 13 centros de titularidad pública →
   `escuela-infantil`; los 116 centros privados → `guarderia`, siguiendo el mismo
   criterio de "titularidad pública genuina o gestión institucional consolidada =
   escuela-infantil" aplicado en el resto de zonas ya integradas.
7. Se aplicó el horario oficial homogéneo (fuente 2) a las 11 escuelas públicas de
   la red Junta de Andalucía.
8. Se intentó localizar la web oficial propia de las cadenas privadas con varias
   sedes detectadas en el listado y de algunos centros individuales de perfil
   premium/bilingüe. Se confirmaron servicios con cita textual en 16 de 129
   centros (≈ 12,4%); el resto queda con `services: []` por falta de fuente
   primaria verificable dentro del alcance de esta investigación.
9. Se generaron slugs únicos (129/129 verificados), `short_description` (186-372
   caracteres, con 4 estructuras rotando para el grupo de las 11 escuelas públicas
   de la Junta, 1 estructura específica para Encinarejo, 1 estructura específica
   para Cerro Muriano/Defensa, 4 estructuras para privados con servicio
   confirmado, 6 estructuras para privados sin servicio confirmado adheridos, 3
   estructuras para privados sin servicio confirmado no adheridos — verificado
   129/129 textualmente únicas), `long_description` solo cuando había datos
   reales suficientes (29/129 centros: 11 públicos Junta + 1 Encinarejo + 1
   Defensa + 16 privados con servicio confirmado), y FAQs personalizadas (4-10 por
   centro, basadas únicamente en datos confirmados).
10. Total de candidatos evaluados: 129. Los 129 superaron el umbral mínimo de
    verificación del proyecto (todos tienen al menos teléfono o email confirmado
    en la fuente oficial de la Junta de Andalucía; 127/129 con teléfono y 129/129
    con email) → **0 centros al archivo de excluidos** en este sprint. Ver
    `docs/cordoba-quality-report.md` para el detalle completo de calidad y
    limitaciones.
