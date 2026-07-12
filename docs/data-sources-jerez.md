# Fuentes de datos — Jerez de la Frontera (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Jerez de la Frontera (capital). Sigue el mismo formato y nivel de rigor que
`docs/data-sources-sevilla.md`, `docs/data-sources-malaga.md`,
`docs/data-sources-cordoba.md` y `docs/data-sources-granada.md`.

**Ámbito exacto**: únicamente el municipio de Jerez de la Frontera, incluyendo las
pedanías y núcleos de población dentro de su término municipal (Guadalcacín, Mesas
de Asta, La Barca de la Florida, Torrecera, El Torno, Estella del Marqués, entre
otras). Se excluye explícitamente el resto de la provincia de Cádiz (Cádiz capital,
El Puerto de Santa María, Sanlúcar de Barrameda, Chiclana de la Frontera, Arcos de
la Frontera, Rota, Puerto Real, etc.), aunque compartiera fuente provincial o
autonómica de alcance más amplio. El filtro aplicado sobre la fuente principal fue
`D_MUNICIPIO === "Jerez de la Frontera"` (valor exacto de la codificación INE del
municipio; no existe ningún otro municipio de Andalucía cuyo nombre incluya "Jerez",
por lo que no hay riesgo de confusión textual).

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
| **Registros con `D_MUNICIPIO = "Jerez de la Frontera"`** | 37 filas |
| **Registros del resto de la provincia de Cádiz (excluidos de este dataset)** | El resto de filas de la provincia de Cádiz corresponden a otros municipios (Cádiz capital, El Puerto de Santa María, Sanlúcar de Barrameda, Chiclana de la Frontera, Algeciras, San Fernando, Arcos de la Frontera, Rota, Puerto Real, etc.) y no se han incluido en este dataset |

Esta es la misma fuente ya usada con éxito para Sevilla, Málaga, Córdoba y Granada.
Es la fuente de datos abiertos específica de primer ciclo (0-3 años); el
"Directorio de centros docentes no universitarios de Andalucía" general **no
incluye** primer ciclo en su versión 2024/2025 (misma limitación documentada en las
cuatro zonas anteriores; no se ha repetido la comprobación exhaustiva porque el
resultado ya está confirmado y es estructural de la fuente, no específico de una
provincia).

#### Campos disponibles (columnas del CSV)

| Campo | Descripción |
|---|---|
| `codigo` | Código de centro del Registro de Centros Docentes (8 dígitos, empieza por `11` para la provincia de Cádiz) |
| `D_DENOMINA` | Tipo de centro ("Centro de Educación Infantil" o "Escuela Infantil", según el registro) |
| `D_ESPECIFICA` | Nombre propio del centro |
| `D_TIPO` | Titularidad: `Público` o `Privado` |
| `D_DOMICILIO` | Dirección postal |
| `D_LOCALIDAD`, `D_MUNICIPIO`, `D_PROVINCIA` | Localidad (incluye pedanías dentro del término municipal, como Mesas de Asta, Guadalcacín, La Barca de la Florida o Torrecera), municipio (clasificación INE vía `cod_municipio`) y provincia |
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
  municipio de Jerez de la Frontera.
- Coordenadas en las 37 de 37 filas, todas dentro de un rango geográfico coherente
  del término municipal (lat 36.60-36.79, lng -6.17 a -5.93), incluyendo las
  pedanías de Mesas de Asta, Guadalcacín, La Barca de la Florida y Torrecera. Sin
  errores de longitud/latitud detectados.
- Teléfono en 36 de 37 filas (97,3%; el centro "Nazaret" no tiene teléfono en el
  registro, solo email) y correo electrónico en el 100% de las filas.

#### Clasificación `D_TIPO="Público"`: las 6 filas corresponden genuinamente a la red de la Junta de Andalucía

A diferencia de Córdoba (donde 2 de 13 públicas resultaron ser una Entidad Local
Autónoma y una escuela del Ministerio de Defensa) y de Málaga (donde 4 de 10
resultaron ser empresas privadas mal etiquetadas), en Jerez de la Frontera **las 6
filas con `D_TIPO="Público"` tienen email institucional `@juntadeandalucia.es`**
(`11011263.edu@`, `11011287.edu@`, `11011330.edu@`, `11011408.edu@`,
`11011411.edu@`, `11012188.edu@`), confirmando que las 6 pertenecen genuinamente a
la red autonómica de escuelas infantiles de la Junta de Andalucía: Virgen del
Valle, Santa María (en la pedanía de Mesas de Asta), San Carlos, Rocinante,
Primavera y El Paje (en la pedanía de La Barca de la Florida). No se ha detectado
ningún caso de Entidad Local Autónoma, gestión militar/Defensa, ni empresa privada
mal etiquetada como pública dentro del municipio de Jerez de la Frontera en esta
fuente.

**No incluye**: distrito administrativo de Jerez (Centro, Este, Norte, Noreste,
Oeste, Sur), horario individual por centro (salvo el homogéneo de la red pública),
ni servicios concretos del enum `CenterService` del proyecto — estos datos se han
buscado de forma puntual en webs oficiales propias (ver fuente 3).

---

### 2. Escolarización 0 a 3 años — Portal de Educación de la Junta de Andalucía ⭐ A USAR (horario homogéneo de la red pública y marco normativo)

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
  verificado y homogéneo únicamente para las **6 escuelas infantiles públicas** de
  Jerez de la Frontera.
- **Edades**: desde las 16 semanas (aproximadamente 4 meses) hasta los 3 años —
  usado para `age_range` (4-36 meses) en todo el dataset.
- **Proceso de admisión (curso 2026/2027)**: procedimiento de reserva (16 de marzo
  al 6 de abril) y procedimiento ordinario de nuevas solicitudes (1 al 30 de
  abril), con posibilidad de indicar un centro principal y hasta varios centros
  subsidiarios. Usado en `long_description` y FAQs de las 6 escuelas públicas.
- **Gratuidad progresiva**: desde el curso 2025/26, Andalucía ofrece educación
  gratuita en el tramo de 2 años en escuelas infantiles de titularidad de la Junta
  de Andalucía (Decreto de gratuidad progresiva). No se ha aplicado como campo
  estructurado (el proyecto no tiene un campo de precio/gratuidad en el schema),
  pero se documenta como contexto relevante para el informe SEO.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del organismo titular de la red pública.
- Horario homogéneo confirmado explícitamente para toda la red, no inferido.
- **Limitación**: no desglosa horario ni servicios complementarios por centro
  individual.

---

### 3. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para un subconjunto de los 31 centros de titularidad privada, se localizó y
consultó la web oficial propia del centro (cuando existía, era accesible y se pudo
confirmar de forma inequívoca que correspondía al mismo centro del registro, por
coincidencia de nombre y dirección) para confirmar servicios concretos del enum
`CenterService`. Se verificaron con cita textual las siguientes webs, todas con
sede confirmada dentro de Jerez de la Frontera capital:

| Centro | Web oficial | Servicios confirmados | Nota |
|---|---|---|---|
| Attendis Preschool Jerez | attendis.com/attendis-preschool/ | comedor, bilingüe, patio exterior, psicomotricidad, escuela de padres | Sede del Grupo Attendis en Avda. de las Adelfas, 12 (Urb. Montealto); horario ampliado/madrugadores no confirmados de forma específica para la sede de Jerez en la web general del programa |
| Sol y Luna Escuela Infantil Jerez | solylunajerez.es | comedor, horario ampliado, servicio de madrugadores | Horario confirmado 7:30-17:00h, con aula matinal y aula de tarde; la web menciona también yoga, masaje y método Montessori, que no tienen equivalente en el enum cerrado de servicios y no se han incluido |
| Luna de Caramelo | lunadecaramelo.com | patio exterior, psicomotricidad | **Advertencia de clasificación**: la propia web se autodescribe como "guardería pública"/"centro público, autorizado por la Junta de Andalucía", pero la fuente oficial (fuente 1) lo registra con `D_TIPO="Privado"` y adherido al Programa de Ayuda a las Familias (`priv_adh_inf1=S`). Se mantiene `ownership: privado` siguiendo la fuente oficial, no la autodescripción comercial del propio centro — mismo criterio que ya obligó a corregir Sevilla tras auditoría, aplicado aquí desde el origen |
| El Recreo | elrecreodejerez.com | comedor, patio exterior | Comedor propio de 50 m² y patio exterior de 200 m² con suelo de seguridad, confirmados en la sección de instalaciones de su web |

**Total de centros con servicios confirmados por web propia: 4 de 37 (≈ 10,8%)**.

Se investigaron adicionalmente, sin lograr confirmación suficiente de servicios
concretos del enum en fuente propia verificable: Mundo Nuevo, El Salvador,
Colorines' House y Chupetes (esta última con web propia pero sin contenido sobre
servicios más allá de datos de contacto). En estos casos `services` queda como
array vacío (`[]`) — **no se ha inventado ningún servicio por similitud con otros
centros del mismo tipo**.

**Nota sobre "concertado" en el contexto de Jerez**: no se ha detectado ningún
centro privado de Jerez que se autodescriba como "concertado" en su propio
marketing. Se mantiene el mismo criterio técnico para todo el dataset: Andalucía
no tiene concierto educativo formal para el primer ciclo de infantil (0-3 años),
por lo que ningún centro usa `ownership: concertado`.

---

### 4. Ayuntamiento de Jerez de la Frontera (`jerez.es`) — sin listado propio descargable de escuelas infantiles municipales

Se investigó específicamente el área de Educación del Ayuntamiento de Jerez en
busca de un listado propio de "Escuelas Infantiles Municipales" equivalente al de
Zaragoza o Murcia. El resultado es que el Ayuntamiento de Jerez de la Frontera **no
gestiona directamente** una red municipal propia de escuelas infantiles de primer
ciclo descargable y verificable dentro del alcance de esta investigación; la red
pública de primer ciclo en Jerez de la Frontera corresponde íntegramente a la
Junta de Andalucía (6 centros), según se detalla en la fuente 1. No se ha forzado
la búsqueda de una "red municipal" donde la evidencia disponible no la confirma.

---

### 5. Nota sobre el teléfono compartido entre tres centros privados

Tres centros del registro oficial (Pequeños pasitos, código 11012701; Baby
Ilusiones, código 11012929; La Ardilla Pilla, código 11013089) comparten el mismo
número de teléfono de contacto (620565686), y dos de ellos (Pequeños pasitos y La
Ardilla Pilla) comparten además el mismo email exacto
(`monika.valenzuelatrigueros@gmail.com`). Se ha verificado que los tres tienen
código de centro, nombre y dirección postal distintos y propios en la fuente
oficial (C/ Abderramán 16; C/ Amadeo Vives 9; C/ Leones 8, respectivamente) — **no
se consideran duplicados del mismo centro**, sino tres centros distintos
posiblemente gestionados por la misma persona o gestora. Se documenta
explícitamente en el campo `notes_internal` de cada uno en el dataset final, sin
fusionarlos ni excluir ninguno.

---

## Fuentes evaluadas y descartadas para el uso principal

### Directorio de centros docentes no universitarios de Andalucía (curso 2024/2025) — descartado como fuente de primer ciclo

Misma limitación estructural ya documentada en Sevilla, Málaga, Córdoba y Granada:
este directorio general no recoge primer ciclo de infantil (0-3 años) en su
versión 2024/2025; el primer ciclo se publica en un dataset separado (fuente 1 de
este documento).

### Fuentes NO usadas (recordatorio, igual que en el resto de zonas ya integradas)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, Todoeduca, Educateca, Infoescuelas, Buscocolegio, Guiacolegios, Jerezlocal, Colesyguardes, Infoisinfo, QDQ, Empresite, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro o confirmar que un nombre comercial existe — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario, precio) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Buscador interactivo de centros de la Junta de Andalucía (`educaweb.juntadeandalucia.es`) | Interfaz de consulta interactiva sin datos accesibles en descarga masiva estructurada; no se usó para extracción |

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo de la fuente 1 (2.363 filas de toda Andalucía,
   curso 2024/2025) y se filtró localmente por `D_MUNICIPIO === "Jerez de la
   Frontera"` (valor exacto) → 37 centros: 6 con `D_TIPO=Público` y 31 con
   `D_TIPO=Privado`.
2. Se verificó que todos los códigos postales resultantes (11401-11408, más 11570
   La Barca de la Florida, 11590 Mesas de Asta, 11591 Guadalcacín y 11595
   Torrecera) están dentro del término municipal de Jerez de la Frontera, sin
   mezcla con otros municipios de la provincia de Cádiz.
3. Se comprobó ausencia de duplicados por código de centro (37 códigos únicos de
   37 filas) y por nombre+dirección exacta. Se detectó un caso de tres centros con
   teléfono compartido (Pequeños pasitos / Baby Ilusiones / La Ardilla Pilla,
   documentado en la fuente 5) y dos centros con nombre similar de la misma
   cadena/urbanización (Montealto / Montealto II) — se verificó individualmente
   que cada uno tiene código de centro y dirección propios y distintos, por lo que
   no son duplicados.
4. Se verificó el rango de coordenadas de las 37 filas (lat 36.60-36.79, lng -6.17
   a -5.93): todas coherentes con el término municipal, incluidas las pedanías.
5. Se clasificó `ownership` verificando individualmente, mediante el dominio de
   email institucional de la fuente oficial, cada una de las 6 filas con
   `D_TIPO="Público"` (ver fuente 1): las 6 tienen email `@juntadeandalucia.es`,
   confirmando que pertenecen genuinamente a la red autonómica. Los 31 centros con
   `D_TIPO="Privado"` de origen se mantuvieron como `privado` (29 adheridos al
   Programa de Ayuda a las Familias, 2 no adheridos). Ningún centro usa
   `ownership: concertado` — Andalucía no tiene concierto educativo formal de
   primer ciclo de infantil. Se detectó y corrigió explícitamente un caso de
   autodescripción comercial engañosa ("guardería pública") en un centro
   realmente privado (Luna de Caramelo, ver fuente 3), manteniendo el criterio de
   la fuente oficial sobre el marketing propio del centro.
6. Se clasificó `type`: los 6 centros de titularidad pública →
   `escuela-infantil`; los 31 centros privados → `guarderia`, siguiendo el mismo
   criterio de "titularidad pública genuina = escuela-infantil" aplicado en el
   resto de zonas ya integradas.
7. Se aplicó el horario oficial homogéneo (fuente 2) a las 6 escuelas públicas.
8. Se intentó localizar la web oficial propia de los centros privados con nombre
   comercial distintivo o de cadenas conocidas. Se confirmaron servicios con cita
   textual en 4 de 37 centros (≈ 10,8%); el resto queda con `services: []` por
   falta de fuente primaria verificable dentro del alcance de esta investigación.
9. Se generaron slugs únicos (37/37 verificados), `short_description` (190-318
   caracteres, con 4 estructuras rotando para el grupo de las 6 escuelas
   públicas, 4 estructuras para privados con servicio confirmado, 6 estructuras
   para privados adheridos sin servicio confirmado, 3 estructuras para privados
   no adheridos sin servicio confirmado — verificado 37/37 textualmente únicas),
   `long_description` solo cuando había datos reales suficientes (10/37 centros:
   6 públicos + 4 privados con servicio confirmado), y FAQs personalizadas (5-9
   por centro, basadas únicamente en datos confirmados).
10. Total de candidatos evaluados: 37. Los 37 superaron el umbral mínimo de
    verificación del proyecto (todos tienen al menos teléfono o email confirmado
    en la fuente oficial de la Junta de Andalucía; 36/37 con teléfono y 37/37 con
    email) → **0 centros al archivo de excluidos** en este sprint. Ver
    `docs/jerez-quality-report.md` para el detalle completo de calidad y
    limitaciones.
