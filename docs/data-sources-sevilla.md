# Fuentes de datos — Sevilla (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Sevilla capital. Sigue el mismo formato y nivel de rigor que `docs/data-sources-madrid.md`,
`docs/data-sources-barcelona.md`, `docs/data-sources-valencia.md`, `docs/data-sources-zaragoza.md`
y `docs/data-sources-murcia.md`.

**Ámbito exacto**: únicamente el municipio de Sevilla (capital). Se excluyen
explícitamente los municipios del área metropolitana (Dos Hermanas, Mairena del
Aljarafe, San Juan de Aznalfarache, Alcalá de Guadaíra, Camas, Tomares, Coria del
Río, Bormujos, La Rinconada, etc.), aunque aparecieran en fuentes provinciales o
autonómicas de alcance más amplio. El filtro aplicado sobre la fuente principal fue
`D_MUNICIPIO === "Sevilla"` (valor exacto, sin ambigüedad textual con la provincia:
el único municipio homónimo detectado en la fuente fue "El Cuervo de Sevilla",
claramente distinto y excluido automáticamente por no coincidir el valor exacto).

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
| **Descarga automatizada** | Sí, completa — URL estable, sin parámetros de filtro por municipio (hay que descargar las 2.363 filas de toda Andalucía y filtrar localmente por `D_MUNICIPIO`) |
| **Actualización** | Última actualización registrada en el catálogo: 2 de julio de 2026 (curso 2024/2025). Publicación de la serie desde el 19 de junio de 2018, con recursos históricos de los cursos 2021/2022, 2022/2023 y 2023/2024 también descargables |
| **Registros totales (toda Andalucía)** | 2.363 filas |
| **Registros con `D_MUNICIPIO = "Sevilla"`** | 218 filas |

#### Campos disponibles (columnas del CSV)

| Campo | Descripción |
|---|---|
| `codigo` | Código de centro del Registro de Centros Docentes (8 dígitos, empieza por `41` para la provincia de Sevilla) |
| `D_DENOMINA` | Tipo de centro (en este dataset, siempre "Centro de Educación Infantil") |
| `D_ESPECIFICA` | Nombre propio del centro |
| `D_TIPO` | Titularidad: `Público` o `Privado` |
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

**Significado de "adherido"** (confirmado en el propio fichero de variables oficial
del dataset y contrastado con la página de escolarización 0-3 años de la Junta de
Andalucía): un centro privado "adherido al Programa de Ayuda a las Familias" recibe
financiación pública que bonifica el precio del servicio educativo a las familias
(desde el curso 2025/26, gratuidad del tramo socioeducativo para plazas de 1 y 2
años, igual que en las escuelas infantiles de titularidad de la Junta). No es un
"concierto" educativo en el sentido clásico de otras etapas: Andalucía no tiene
concierto educativo formal para el primer ciclo de infantil (0-3 años). Por eso,
en este dataset `D_TIPO=Privado` + `priv_adh_inf1=S` (adherido) y `D_TIPO=Privado`
+ `priv_noadh_inf1=S` (no adherido) mapean ambos a `ownership: privado` — la
adhesión es una subvención pública a la demanda, no una titularidad distinta, y no
se usa el valor `concertado` del enum para este caso (corrección post-auditoría,
2026-07-12; ver nota en `docs/sevilla-quality-report.md`, sección 1). El dato de
adhesión/no adhesión se conserva igualmente en el campo interno `source_group`
(`privado_adherido` / `privado_no_adherido`) y en el texto de cada ficha.
`D_TIPO=Público` → `ownership: publico` (red de Escuelas Infantiles de titularidad
de la Junta de Andalucía).

**No incluye**: distrito o barrio municipal de Sevilla (los 11 distritos
administrativos), horario individual por centro, ni servicios concretos (comedor
propio/catering, idiomas, actividades). Solo indica adhesión/no adhesión al
programa de ayudas, que es un dato económico-administrativo, no un listado de
servicios del enum `CenterService`.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente primaria oficial de la Junta de Andalucía, específica de primer ciclo de
  educación infantil (a diferencia del "Directorio de centros docentes no
  universitarios de Andalucía", que en su versión 2024/2025 **no incluye** el
  primer ciclo 0-3 — ver limitación documentada más abajo).
- Cobertura del 100% de los centros con alumnado matriculado en primer ciclo en el
  municipio (15 públicos + 203 privados).
- Coordenadas en las 217 de 218 filas (ver incidencia de un registro con error de
  longitud, documentada abajo).
- Teléfono en 214 de 218 filas (98%) y correo electrónico en el 100% de las filas.
- **Limitaciones detectadas y verificadas en esta investigación:**
  - **Un registro con error de longitud de la propia fuente**: el centro `Snoopy`
    (código `41022735`, C/ Marqués de Paradas, 29, CP 41001, Sevilla) tiene
    `N_LONGITUD = -4.44543200915151`, un valor claramente erróneo (fuera del rango
    de todo el resto del municipio, que va de -6.01 a -5.92) — consistente con un
    error de dígito en la fuente. La latitud (`37.4739601680693`) sí es coherente
    con la zona real del centro (entorno de Puerta de Jerez / Torre del Oro). **No
    se ha inventado ni aproximado la longitud correcta**: en el dataset final,
    `latitude` y `longitude` de este centro quedan en `null`, documentado en
    `notes_internal`, en vez de forzar un valor no verificado.
  - No incluye distrito/barrio administrativo de Sevilla (los 11 distritos:
    Casco Antiguo, Macarena, Nervión, Cerro-Amate, Sur, Triana, Norte, San
    Pablo-Santa Justa, Este-Alcosa-Torreblanca, Palmera-Bellavista, Los Remedios).
    Un pequeño subconjunto (17 de 218 centros) sí tiene una barriada/urbanización
    reconocible mencionada explícitamente en su propia dirección oficial (p. ej.
    "Bda. San Diego", "Bda. Los Príncipes", "Bda. Juan XXIII", "Bda. Parque
    Alcosa") — esos se han incorporado en `neighborhood_barrio` porque son un dato
    real de la fuente oficial, no una inferencia. **No se ha construido ningún
    mapeo código postal → distrito**, porque en Sevilla los códigos postales no
    corresponden 1:1 con los 11 distritos administrativos y un mapeo así habría
    sido una aproximación no verificable centro a centro.
  - No indica servicios (comedor con cocina propia/catering, horario ampliado,
    idiomas, actividades) del enum `CenterService` del proyecto.
  - No indica horario de apertura por centro individual (aunque para la red
    pública de la Junta existe un horario general homogéneo publicado en fuente
    oficial complementaria, ver fuente 2).

---

### 2. Escolarización 0 a 3 años — Portal de Educación de la Junta de Andalucía ⭐ A USAR (horario homogéneo de la red pública y marco normativo del Programa de Ayuda a las Familias)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escolarización: 0 a 3 años en Andalucía / Preguntas frecuentes |
| **Organismo** | Consejería de Desarrollo Educativo y Formación Profesional, Junta de Andalucía |
| **URL** | https://www.juntadeandalucia.es/educacion/portales/web/escolarizacion/0-a-3-anos y https://www.juntadeandalucia.es/educacion/portales/web/escolarizacion/0-a-3-anos/preguntas-frecuentes |
| **Formato** | HTML institucional |

#### Datos confirmados y usados

- **Horario general homogéneo**: "El horario de apertura será, con carácter
  general, de 7:30h a 17:00h, ininterrumpidamente", dividido en tres tramos: aula
  matinal (7:30-9:00), atención socioeducativa (9:00-15:30, con comedor incluido) y
  aula de tarde (15:30-17:00). Se aplicó como `schedule` verificado y homogéneo
  para las **15 escuelas infantiles de titularidad de la Junta de Andalucía** en
  Sevilla capital, y se documentó también en `long_description` y FAQs de esos
  centros.
- **Edades**: de 16 semanas (aproximadamente 4 meses) a 3 años — usado para
  `age_range` (4-36 meses) en todo el dataset.
- **Gratuidad 2025/26 en adelante**: el servicio de atención socioeducativa es
  gratuito para las plazas de 1 y 2 años tanto en las escuelas infantiles de la
  Junta como en los centros privados adheridos al Programa de Ayuda a las
  Familias; los servicios complementarios (aula matinal, aula de tarde) mantienen
  bonificación según renta. Usado como contexto factual en `long_description` de
  las escuelas públicas, sin convertirlo en un campo de precio (fuera del alcance
  del schema del proyecto).
- **Proceso de admisión**: procedimiento de reserva (marzo-abril, para alumnado ya
  escolarizado) y procedimiento ordinario (abril, nuevas solicitudes), con
  posibilidad de indicar un centro principal y hasta tres centros subsidiarios.
  Usado en FAQs de las escuelas públicas.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del organismo titular de la red pública.
- Horario homogéneo confirmado explícitamente para toda la red, no inferido.
- **Limitación**: no desglosa horario ni servicios complementarios por centro
  individual (todos comparten el mismo marco horario general oficial).

---

### 3. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para un subconjunto de los 203 centros privados detectados en la fuente 1, se
localizó y consultó la web oficial propia del centro (cuando existía, era
accesible y se pudo confirmar de forma inequívoca que correspondía al mismo centro
del registro, por coincidencia de nombre y dirección) para confirmar servicios
concretos del enum `CenterService`. Se verificaron con cita textual las siguientes
cadenas/centros, todos con sede confirmada dentro de Sevilla capital:

| Cadena / centro | Sedes en Sevilla capital incluidas | Web oficial | Servicios confirmados |
|---|---|---|---|
| Gente Menuda (Gente Menuda, Gente Menuda 2, Gente Menuda 3, Gente Menuda 4) | 4 | gentemenuda.es | comedor, proyecto bilingüe, patio exterior, uniforme |
| CEI Chicle (León XIII, Macarena) | 2 (la sede de Mairena del Aljarafe se excluyó por estar fuera del municipio) | ceichicle.es | cocina propia, comedor, horario ampliado, proyecto bilingüe, orientación pedagógica |
| Escuela Infantil Bicho (Bicho/Bicho I, Bicho II, Bicho III) | 3 | escuelainfantilbicho.com | inglés, música, escuela de padres y madres, catering |
| Kindergarden Jardilín (Jardilín, Jardilín 2) | 2 | kindergardenjardilin.es | inglés, patio exterior, psicomotricidad, escuela de padres y madres, orientación pedagógica |
| Snoopy (Grupo Snoopy, "Snoopy Centro") | 1 (Marqués de Paradas, 29) | gruposnoopy.es | comedor, inglés, música, escuela de padres y madres, orientación pedagógica, campamentos de verano |
| Arteduca Santa Clara | 1 | arteduca.com | comedor, música, psicomotricidad, inglés |
| 5ª Avenida Cartuja | 1 | grupoquintavenida.com | comedor, proyecto bilingüe |

**Total de centros privados con servicios confirmados por web propia: 14 de 203
(≈ 6,9%)**. Este porcentaje es más bajo que el observado en Zaragoza (32%) o Murcia,
porque el volumen de centros privados individuales en Sevilla capital (203) es muy
superior y una parte relevante corresponde a centros de gestión unipersonal/familiar
sin web propia identificable con certeza dentro del alcance razonable de esta
investigación.

**Criterio aplicado de forma estricta**: cuando existían varios centros con el
mismo nombre comercial base pero **no fue posible confirmar con certeza** que
pertenecían a la misma cadena/grupo empresarial (por ejemplo, otros centros
llamados "Snoopy II", "Snoopy 6", "Snoopy 8" que aparecen en el registro oficial
pero cuya pertenencia al Grupo Snoopy no pudo confirmarse de forma inequívoca en la
web del grupo), **no se les asignaron los servicios de la cadena por similitud de
nombre** — se dejaron sin `services` confirmado, evitando la inferencia no
verificada que las reglas del proyecto prohíben explícitamente.

Para el resto de centros privados (189 de 203) no se localizó una web propia
accesible y verificable dentro del alcance de esta investigación, o la web
encontrada no confirmaba servicios concretos con claridad suficiente (por ejemplo,
resultados de directorios de terceros sin sitio propio del centro). En esos casos
`services` queda como array vacío (`[]`) — **no se ha inventado ningún servicio por
similitud con otros centros del mismo tipo**.

---

## Fuentes evaluadas y descartadas para el uso principal

### Directorio de centros docentes no universitarios de Andalucía (curso 2024/2025) — descartado como fuente de primer ciclo

| Campo | Detalle |
|---|---|
| **URL** | https://www.juntadeandalucia.es/datosabiertos/portal/dataset/directorio-de-centros-docentes-de-andalucia |
| **Motivo de descarte para este sprint** | Se descargó y analizó el CSV completo (7.106 filas, todo el sistema educativo andaluz no universitario). Tras filtrar por `D_MUNICIPIO="Sevilla"` (528 centros de todas las etapas) y revisar las columnas específicas de infantil de primer ciclo (`pub_adh_inf1`, `pub_noadh_inf1`, `priv_adh_inf1`, `priv_noadh_inf1`), **ningún registro tenía valor distinto de vacío/0 en esas columnas para ningún municipio de Andalucía en esta versión del dataset** — el listado 2024/2025 de este directorio general cubre centros de infantil de segundo ciclo (3-6 años) en adelante (CEIP, IES, etc.), pero el primer ciclo 0-3 se gestiona y publica en un dataset separado (fuente 1 de este documento), específico y más fiable para el objeto de esta investigación. |

### Ayuntamiento de Sevilla — sin gestión directa de escuelas infantiles de primer ciclo

A diferencia de Zaragoza o Murcia, el Ayuntamiento de Sevilla **no gestiona
directamente** una red propia de escuelas infantiles municipales de primer ciclo
0-3 años (no se localizó ningún patronato municipal de educación infantil ni
listado de "Escuelas Infantiles Municipales" en `sevilla.org`). En Andalucía, la
red pública de primer ciclo de infantil es de **titularidad de la Junta de
Andalucía** (Consejería de Desarrollo Educativo y Formación Profesional), gestión
que se refleja en la fuente 1 y 2 de este documento. Esta es una diferencia
estructural real del modelo andaluz frente a Aragón (Zaragoza) o Murcia, y se
documenta explícitamente en vez de forzar una equivalencia inexistente.

### Fuentes NO usadas (recordatorio, igual que en Madrid, Barcelona, Valencia, Zaragoza y Murcia)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, tusguarderias.com, todoeduca.com, educateca.com, colesyguardes.es, infoisinfo.es, qdq.com, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro o confirmar que un nombre comercial existe — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Buscador interactivo de centros de la Junta de Andalucía (`educaweb.juntadeandalucia.es`) | Interfaz de consulta interactiva sin datos accesibles en descarga masiva estructurada; no se usó para extracción, solo como referencia de la existencia del Registro de Centros Docentes |

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo de la fuente 1 (2.363 filas de toda Andalucía,
   curso 2024/2025) y se filtró localmente por `D_MUNICIPIO === "Sevilla"` (valor
   exacto) → 218 centros: 15 públicos (`D_TIPO=Público`) y 203 privados
   (`D_TIPO=Privado`).
2. Se verificó que todos los códigos postales resultantes (41001-41020, más 41092
   correspondiente a la Isla de la Cartuja) están dentro del término municipal de
   Sevilla capital, sin mezcla con municipios del área metropolitana.
3. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos) y
   por dirección exacta (0 direcciones idénticas). Se detectó un caso de mismo
   nombre comercial ("Arco Iris") en dos direcciones y teléfonos distintos,
   confirmado como dos centros reales diferentes (no un duplicado).
4. Se detectó y documentó 1 registro con error de longitud en la propia fuente
   oficial (`Snoopy`, código `41022735`) — se dejó sin coordenadas en vez de
   inventar o aproximar un valor.
5. Se clasificó `ownership` según `D_TIPO`: público → `publico`; privado → `privado`
   (tanto adherido como no adherido al Programa de Ayuda a las Familias). La
   adhesión (`priv_adh_inf1`) se conserva como dato informativo en `source_group`
   y en el texto de cada ficha, pero no se traduce al valor `concertado` del enum
   `ownership`, porque Andalucía no tiene concierto educativo formal en el primer
   ciclo de infantil (corrección post-auditoría, 2026-07-12).
6. Se clasificó `type`: los 15 centros públicos (red de titularidad de la Junta de
   Andalucía) → `escuela-infantil`; los 203 centros privados (adheridos o no) →
   `guarderia`, siguiendo el mismo criterio de "titularidad pública o gestión
   institucional consolidada = escuela-infantil" aplicado en Madrid, Barcelona,
   Valencia, Zaragoza y Murcia.
7. Se aplicó el horario oficial homogéneo (fuente 2) a los 15 centros públicos.
8. Se intentó localizar la web oficial propia de las cadenas privadas con varias
   sedes detectadas en el listado (Gente Menuda, Snoopy, CEI Chicle, Bicho,
   Kindergarden Jardilín, El Osito Azul, Nulú, Patín, entre otras). Se confirmaron
   servicios con cita textual en 14 de 203 centros privados (≈ 6,9%); el resto
   queda con `services: []` por falta de fuente primaria verificable dentro del
   alcance de esta investigación.
9. Se generaron slugs únicos (218/218 verificados, incluyendo desambiguación
   manual del caso "Arco Iris" con sufijo de calle/barrio), `short_description`
   (211-371 caracteres, con plantillas rotando de forma determinista por grupo
   homogéneo: 4 estructuras para las 15 escuelas públicas, 4-6 estructuras para
   privados sin servicio confirmado, 4 estructuras para privados con servicio
   confirmado), `long_description` solo cuando había datos reales suficientes
   (29/218 centros: los 15 públicos + los 14 privados con servicio confirmado por
   web propia), y FAQs personalizadas (4-6 por centro, basadas únicamente en datos
   confirmados).
10. Total de candidatos evaluados: 218. Los 218 superaron el umbral mínimo de
    verificación del proyecto (todos tienen al menos teléfono o email confirmado
    en la fuente oficial de la Junta de Andalucía) → **0 centros al archivo de
    excluidos** en este sprint. Ver `docs/sevilla-quality-report.md` para el
    detalle completo de calidad y limitaciones.
