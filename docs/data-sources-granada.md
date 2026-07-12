# Fuentes de datos — Granada (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Granada capital. Sigue el mismo formato y nivel de rigor que
`docs/data-sources-madrid.md`, `docs/data-sources-barcelona.md`,
`docs/data-sources-valencia.md`, `docs/data-sources-zaragoza.md`,
`docs/data-sources-murcia.md`, `docs/data-sources-sevilla.md`,
`docs/data-sources-palma.md`, `docs/data-sources-malaga.md` y
`docs/data-sources-alicante.md`.

**Ámbito exacto**: únicamente el municipio de Granada (capital). Se excluyen
explícitamente los otros 31 municipios de la provincia de Granada (Armilla, Maracena,
Las Gabias, Peligros, Churriana de la Vega, Huétor Vega, Cenes de la Vega, Ogíjares,
Albolote, Atarfe, Pinos Puente, Santa Fe, etc.), aunque aparecieran en fuentes
provinciales o autonómicas de alcance más amplio. El filtro aplicado sobre la fuente
principal fue `D_MUNICIPIO === "Granada"` combinado con `cod_municipio === "18087"`
(código INE del municipio, sin ambigüedad textual con la provincia homónima).

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
| **Descarga automatizada** | Sí, completa — URL estable, sin parámetros de filtro por municipio (se descargaron las 2.363 filas de toda Andalucía y se filtró localmente por `D_MUNICIPIO` + `cod_municipio`) |
| **Registros totales (toda Andalucía)** | 2.363 filas |
| **Registros con `D_MUNICIPIO = "Granada"` y `cod_municipio = "18087"`** | 60 filas |
| **Registros en el resto de la provincia de Granada (excluidos de este dataset)** | 182 filas (242 en toda la provincia − 60 en la capital), repartidas en 31 municipios distintos |

Esta es la misma fuente ya usada con éxito para Sevilla y Málaga. Es la fuente de
datos abiertos específica de primer ciclo (0-3 años); el "Directorio de centros
docentes no universitarios de Andalucía" general **no incluye** primer ciclo en su
versión 2024/2025 (misma limitación estructural ya documentada en Sevilla y Málaga,
no repetida exhaustivamente aquí por ser un hecho estructural de la fuente, no
específico de Granada).

#### Campos disponibles (columnas del CSV)

| Campo | Descripción |
|---|---|
| `codigo` | Código de centro del Registro de Centros Docentes (8 dígitos, empieza por `18` para la provincia de Granada) |
| `D_DENOMINA` | Tipo de centro en el registro: `Centro de Educación Infantil`, `Centro Docente Privado`, `Escuela Infantil` o `Centro de Convenio` (ver hallazgo específico de Granada más abajo) |
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
  municipio de Granada capital.
- Coordenadas en las 60 de 60 filas, todas dentro del rango geográfico coherente del
  municipio (lat 37.15-37.21, lng -3.65 a -3.58), sin errores de longitud detectados.
- Teléfono en 60 de 60 filas (100%, tras aplicar una corrección puntual verificada,
  ver sección de incidencias) y correo electrónico en 60 de 60 filas (100%, tras
  corrección puntual).

#### Hallazgo específico de Granada: `D_TIPO="Público"` incluye dos redes distintas, ambas de titularidad pública genuina

A diferencia de Málaga (donde 4 de 10 filas `D_TIPO=Público` resultaron ser en
realidad empresas privadas subvencionadas), en Granada las 14 filas con
`D_TIPO="Público"` se dividen limpiamente en **dos redes públicas genuinas y
distintas**, diferenciadas por el campo `D_DENOMINA`:

1. **10 filas con `D_DENOMINA="Escuela Infantil"` y `pub_adh_inf1="S"`** (salvo
   Los Mondragones, con `pub_noadh_inf1="S"`): red de escuelas infantiles de
   titularidad de la **Junta de Andalucía** (Almanjáyar, Cristo de la Yedra, Portal
   de Belén, El Príncipe, Santo Domingo, Virgen del Carmen, Virgen de Loreto, Virgen
   Inmaculada, Los Mondragones, Juan Latino).
2. **4 filas con `D_DENOMINA="Centro de Convenio"` y `pub_noadh_inf1="S"`**: Arlequín,
   Duende, Luna y Belén. Se verificó en fuente oficial propia
   (`fundaciongranadaeduca.org`) que son las **cuatro Escuelas Infantiles
   Municipales (EIM) del Ayuntamiento de Granada**, de titularidad pública
   municipal genuina, gestionadas de forma directa por la **Fundación Pública Local
   GranadaEduca** (entidad pública dependiente del Ayuntamiento). Su clasificación
   como "Centro de Convenio" en el registro autonómico refleja que colaboran con la
   Junta de Andalucía mediante convenio (mismo marco del Decreto 76/2025 y su
   normativa de desarrollo), no que sean empresas privadas subvencionadas — es un
   caso distinto del patrón de riesgo detectado en Sevilla/Málaga (centros
   privados etiquetados como "Público" por la fuente cruda). Se ha aplicado
   `ownership: publico` para las 14 filas, sin ninguna reclasificación a
   `privado`, tras verificación individual de las 4 filas "Centro de Convenio" en
   la web oficial de la Fundación.

**Ninguna fila de Granada usa `ownership: concertado`.** Igual que en Sevilla y
Málaga, Andalucía no tiene concierto educativo formal para el primer ciclo de
educación infantil (0-3 años); los 46 centros privados están clasificados como
`privado` (33 adheridos al Programa de Ayuda a las Familias, 13 no adheridos según
el propio registro), con independencia de que algunos de ellos (La Asunción, San
Isidoro, Monaita/Mulhacén, Nazaret) sean colegios con concierto educativo *en
etapas posteriores* (Primaria/Secundaria) según fuentes de terceros — ese concierto
no aplica al primer ciclo de infantil (0-3 años), que es el único alcance de este
proyecto, y la fuente oficial específica de primer ciclo los marca inequívocamente
como `Privado` con `priv_noadh_inf1="S"` (no adheridos al programa de bonificación
de 0-3). Ver `docs/granada-quality-report.md`, sección 1, para el detalle completo
de esta decisión.

**No incluye**: distrito administrativo de Granada para los centros privados
(Albaicín, Centro, Genil, Zaidín, Ronda, Beiro, Norte, Chana), horario individual
por centro privado (salvo el homogéneo de las dos redes públicas), ni servicios
concretos del enum `CenterService` del proyecto — estos datos se han buscado de
forma puntual en webs oficiales propias (ver fuente 3).

---

### 2. Escolarización 0 a 3 años — Portal de Educación de la Junta de Andalucía ⭐ A USAR (horario homogéneo de la red pública autonómica genuina y marco normativo)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escolarización: 0 a 3 años en Andalucía / Preguntas frecuentes |
| **Organismo** | Consejería de Desarrollo Educativo y Formación Profesional, Junta de Andalucía |
| **URL** | https://www.juntadeandalucia.es/educacion/portales/web/escolarizacion/0-a-3-anos y https://www.juntadeandalucia.es/educacion/portales/web/escolarizacion/0-a-3-anos/preguntas-frecuentes |
| **Formato** | HTML institucional |

#### Datos confirmados y usados

- **Horario general homogéneo**: "de 7:30h a 17:00h, ininterrumpidamente", dividido
  en tres tramos: aula matinal (7:30-9:00), atención socioeducativa (9:00-15:30, con
  comedor incluido) y aula de tarde (15:30-17:00). Aplicado como `schedule`
  verificado y homogéneo únicamente para las **10 escuelas infantiles de titularidad
  genuina de la Junta de Andalucía** en Granada capital.
- **Edades**: de 16 semanas (aproximadamente 4 meses) a 3 años — usado para
  `age_range` (4-36 meses) en todo el dataset.
- **Proceso de admisión**: procedimiento de reserva (para alumnado ya escolarizado)
  y procedimiento ordinario de nuevas solicitudes en abril, con posibilidad de
  indicar un centro principal y hasta tres centros subsidiarios. Usado en
  `long_description` y FAQs de las 10 escuelas públicas de la Junta.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del organismo titular de la red pública autonómica.
- Horario homogéneo confirmado explícitamente para toda la red, no inferido.
- **Limitación**: no desglosa horario ni servicios complementarios por centro
  individual, ni cubre las escuelas infantiles municipales (fuente 3, distinta).

---

### 3. Fundación Pública Local GranadaEduca — Ayuntamiento de Granada ⭐ A USAR (las 4 escuelas infantiles municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Fundación Pública Local GranadaEduca — "Las Escuelas Infantiles Municipales" |
| **Organismo** | Ayuntamiento de Granada, a través de la Fundación Pública Local GranadaEduca (entidad de titularidad municipal) |
| **URL principal** | https://www.fundaciongranadaeduca.org/las-escuelas/ |
| **URLs por centro** | https://www.fundaciongranadaeduca.org/las-escuelas/eim-arlequin/, .../eim-belen/, .../eim-duende/, .../eim-luna/ |
| **URL institucional (naturaleza jurídica)** | https://www.fundaciongranadaeduca.org/portal-de-la-transparencia/fines-de-la-fundacion-local-granada-educa/ |
| **Formato** | HTML institucional |

#### Datos confirmados y usados

- Confirmación de que las 4 escuelas (Arlequín, Belén, Duende, Luna) son de
  **titularidad pública municipal** genuina, gestionadas directamente por la
  Fundación Pública Local GranadaEduca (dependiente del Ayuntamiento de Granada),
  no empresas privadas.
- Dirección, teléfono y email propios de cada una de las 4 escuelas, verificados
  contra la fuente oficial de la Junta de Andalucía (coinciden en las 4).
- Distrito/barrio de cada escuela: Arlequín (Albaicín), Duende (Realejo), Luna
  (Casería de Montijo/Zaidín), Belén (Zaidín).
- Horario y servicios propios de cada escuela: las 4 cuentan con cocina propia,
  aula matinal (horario ampliado) e iniciación al inglés para los grupos de mayor
  edad; Luna especifica horario ininterrumpido de 7:30 a 17:00h; Arlequín añade
  psicomotricidad explícita en su ficha.
- **Matiz de alcance importante**: las 4 EIM atienden oficialmente de 4 meses a 6
  años (primer y segundo ciclo de infantil en el mismo centro). Este proyecto tiene
  como alcance MVP únicamente el primer ciclo (0-3 años); los datos de `age_range`
  se han limitado a 4-36 meses (0-3 años) siguiendo el criterio ya aplicado a todo
  el dataset, y se ha dejado constancia explícita en `long_description` y FAQs de
  que estas escuelas también tienen aulas de 3-6 años fuera del alcance de esta
  ficha, para no generar una expectativa incorrecta sobre el contenido del
  directorio.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del titular real del centro (Ayuntamiento de Granada vía
  su fundación pública), con página propia por escuela.
- Datos de contacto coincidentes al 100% con el registro autonómico de primer
  ciclo, lo que refuerza la fiabilidad cruzada de ambas fuentes.

---

### 4. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para un subconjunto de los 46 centros de titularidad privada, se localizó y
consultó la web oficial propia del centro (cuando existía, era accesible y se pudo
confirmar de forma inequívoca que correspondía al mismo centro del registro, por
coincidencia de nombre y dirección) para confirmar servicios concretos del enum
`CenterService`. Se verificaron con cita textual los siguientes centros, todos con
sede confirmada dentro de Granada capital:

| Centro | Web oficial | Servicios confirmados |
|---|---|---|
| Nazaret | colegionazaretgranada.es | horario ampliado (aula matinal), psicomotricidad, actividades extraescolares |
| Babyschool Granada | babyschoolgranada.es | proyecto bilingüe, patio exterior, horario ampliado |
| San Isidoro | cisidoro.com | comedor, cocina propia, horario ampliado (aula matinal) |
| Monaita (Grupo Attendis / Mulhacén) | attendis.com | comedor, cocina propia, proyecto bilingüe |
| Pizarrín | centroinfantilpizarrin.com | comedor, horario ampliado, inglés |
| Chiquitines | guarderiachiquitines.es | comedor, inglés, patio exterior, psicomotricidad |
| Virgen del Pilar | ceivirgendelpilar.es | comedor, horario ampliado (aula matinal y de tarde) |
| Bola de Oro | escuelainfantilboladeoro.com | comedor, horario ampliado (aula matinal) |
| Las Perlas | centroinfantillasperlas.com | comedor, horario ampliado (aula matinal) |
| Érase una vez... | centroeraseunavez.com | comedor, inglés, campamentos de verano, horario ampliado, psicomotricidad, actividades extraescolares |
| Ohana (Bárbara Molina Valladares) | ohanacentroinfantil.com | música, inglés, campamentos de verano |
| The Globe (Nativo Babies) | theglobenativo.com | comedor, proyecto bilingüe, horario ampliado, patio exterior, psicomotricidad |
| Pulpitos | pulpitos.es | comedor, horario ampliado (aula matinal y de tarde) |
| Gaviota | escuelainfantilgaviota.org | comedor, cocina propia |
| Los Ángeles | escuelainfantillosangeles.es | comedor, horario ampliado, música, campamentos de verano, actividades extraescolares |

**Total de centros privados con servicios confirmados por web propia: 15 de 46
(≈ 32,6%)**, a los que se suman las 10 escuelas públicas de la Junta (horario
homogéneo confirmado, sin servicio adicional individual) y las 4 EIM municipales
(servicios propios confirmados por la Fundación GranadaEduca) — **19 de 60 centros
del dataset final (31,7%) con algún servicio del enum `CenterService`
confirmado**.

**Nota sobre el concierto educativo en otras etapas (no en primer ciclo)**: varias
fuentes de terceros describen a San Isidoro, Monaita/Mulhacén y Nazaret como
centros "concertados". Se ha verificado que ese concierto corresponde a las etapas
de Primaria/Secundaria/Bachillerato (fuera del alcance MVP de este proyecto), no al
primer ciclo de infantil (0-3 años); la fuente oficial específica de 0-3 años (Junta
de Andalucía, fuente 1) los clasifica sin ambigüedad como `Privado`, con
`priv_noadh_inf1="S"` en los tres casos (no adheridos al Programa de Ayuda a las
Familias para el tramo 0-3). Se ha aplicado `ownership: privado` para el primer
ciclo, siguiendo estrictamente el criterio ya validado en Sevilla y Málaga: no
mezclar el régimen de financiación de otras etapas educativas con la titularidad
del tramo 0-3 años.

**Criterio aplicado de forma estricta sobre similitud de nombre**: se detectó una web
(`centroinfantilgarabatos.com`) para un centro llamado "Garabatos", pero su dirección
corresponde a Huelva capital, no a Granada. Se descartó como fuente para "Garabatos"
y "Garabatos de Arabial" de Granada capital (mismo criterio ya aplicado en Málaga con
el caso "Garabato"/"El Garabato" de Alhaurín de la Torre): **no se asignaron
servicios por similitud de nombre sin confirmación de dirección exacta**.

Para el resto de centros privados (31 de 46) no se localizó una web propia accesible
y verificable dentro del alcance de esta investigación, o la web encontrada no
confirmaba servicios concretos del enum con claridad suficiente (por ejemplo,
Colorines, Bubú, La Casa de Oikodoro, Aldeas Infantiles SOS, Caracoles, Alquería,
Garabatos, Garabatos de Arabial, Mofletes, Snoopy y María Inmaculada tienen web
propia localizada pero sin cita textual suficientemente clara de servicios
concretos del enum, por lo que se ha dejado `services: []` en vez de forzar una
inferencia). En esos casos `services` queda como array vacío (`[]`) — **no se ha
inventado ningún servicio por similitud con otros centros del mismo tipo**.

---

## Fuentes evaluadas y descartadas para el uso principal

### Directorio de centros docentes no universitarios de Andalucía (curso 2024/2025) — descartado como fuente de primer ciclo

Misma limitación estructural ya documentada en Sevilla y Málaga: este directorio
general no recoge primer ciclo de infantil (0-3 años) en su versión 2024/2025; el
primer ciclo se publica en un dataset separado (fuente 1 de este documento).

### Fuentes NO usadas (recordatorio, igual que en Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla, Palma, Málaga y Alicante)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, guarderia.net, guarderia.info, infoescuelas.com, todofamilias.com, todoeduca.com, educateca.com, infoisinfo.es, qdq.com, empresite.eleconomista.es, encontrarguarderia.com, buscocolegio.com, infoguarderias.com, tusguarderias, mejoresdegranada.es, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro o confirmar que un nombre comercial existe — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario, precio) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Buscador interactivo de centros de la Junta de Andalucía (`educaweb.juntadeandalucia.es`) | Interfaz de consulta interactiva sin datos accesibles en descarga masiva estructurada; no se usó para extracción |

---

## Incidencias de calidad de datos detectadas y corregidas

1. **"Sueña by Nerea Bedmar" (código `18015420`)**: fila con `Correo_e` vacío en la
   fuente cruda. Se verificó por búsqueda de la propia web del centro
   (`centroinfantilsuena.com`, dominio no resoluble directamente desde esta
   investigación pero confirmado por resultados de búsqueda y redes sociales
   propias del centro) que el email de contacto es `hola@centroinfantilsuena.com`
   y que el teléfono coincide con el de la fuente oficial (665233411). Se ha
   aplicado como corrección puntual documentada, no como dato inventado.
2. **"Pulpitos" (código `18015754`)**: fila con `N_TELEFONO` vacío en la fuente
   cruda. Se verificó en su propia web oficial (`pulpitos.es`) el teléfono
   643981336, usado como corrección puntual documentada.
3. **Formato de coordenadas con decimales extendidos**: la fila de "Los
   Mondragones" (código `18013782`) trae `N_LATITUD`/`N_LONGITUD` con un formato
   de decimales inusualmente largo (39 dígitos tras la coma). Se ha verificado que
   el valor numérico resultante tras el parseo (37.179081, -3.604272) es coherente
   con el resto del municipio, sin necesidad de descartarlo.
4. **Ningún email con formato "varios correos concatenados"** se ha detectado en
   Granada (a diferencia de Málaga), salvo el caso de "La Asunción"
   (`secretaria@asunciongranada.es      -      asuncion@asunciongranada.es`),
   donde se ha conservado únicamente el primer correo válido tras `trim`.

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo de la fuente 1 (2.363 filas de toda Andalucía, curso
   2024/2025) y se filtró localmente por `D_MUNICIPIO === "Granada"` combinado con
   `cod_municipio === "18087"` (para evitar cualquier colisión textual con otro
   municipio homónimo o con la provincia) → 60 centros: 46 con `D_TIPO=Privado` y
   14 con `D_TIPO=Público`.
2. Se verificó que todos los códigos postales resultantes (18002-18016) están
   dentro del municipio de Granada capital, sin mezcla con otros municipios de la
   provincia.
3. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos),
   por nombre exacto (0 coincidencias) y por dirección+código postal exacta (0
   coincidencias). Se detectaron dos pares de centros que comparten un email de
   contacto de gestión (Garabatos / Garabatos de Arabial; Centro de Atención
   Familiar / La Cartuja) — se verificó individualmente que cada uno tiene código
   de centro y dirección propios y distintos, por lo que no son duplicados.
4. Se verificó el rango de coordenadas de las 60 filas (lat 37.15-37.21, lng -3.65
   a -3.58): todas coherentes con el municipio, sin errores de longitud
   detectados.
5. Se clasificó `ownership` verificando individualmente, en fuente oficial propia,
   las 4 filas con `D_DENOMINA="Centro de Convenio"` (Arlequín, Duende, Luna,
   Belén) contra la web de la Fundación Pública Local GranadaEduca. Resultado: las
   14 filas `D_TIPO="Público"` de la fuente cruda se confirmaron como titularidad
   pública genuina (10 de la red autonómica Junta de Andalucía + 4 de la red
   municipal GranadaEduca) — **ninguna reclasificación a `privado`** fue necesaria
   en Granada, a diferencia de Málaga. Los 46 centros con `D_TIPO="Privado"` de
   origen se mantuvieron como `privado`. Ningún centro usa `ownership: concertado`
   — Andalucía no tiene concierto educativo formal de primer ciclo de infantil.
6. Se clasificó `type`: los 14 centros de titularidad pública genuina (Junta +
   GranadaEduca) → `escuela-infantil`; los 46 centros privados → `guarderia`,
   siguiendo el mismo criterio de "titularidad pública genuina o gestión
   institucional consolidada = escuela-infantil" aplicado en el resto de zonas ya
   integradas.
7. Se aplicó el horario oficial homogéneo (fuente 2) a las 10 escuelas públicas de
   la red Junta de Andalucía, y el horario/servicios propios (fuente 3) a las 4
   EIM municipales.
8. Se localizó la web oficial propia de 15 centros privados individuales con
   nombre distintivo (no genérico) y se confirmaron servicios con cita textual;
   otros 11 centros privados con web propia localizada no tenían suficiente
   detalle textual de servicios concretos del enum y se dejaron con
   `services: []` en vez de forzar una inferencia (ver fuente 4).
9. Se generaron slugs únicos (60/60 verificados), `short_description` (259-368
   caracteres, con 4-6 estructuras rotando por grupo determinístico basado en hash
   del código de centro — verificado 60/60 textualmente únicas), `long_description`
   solo cuando había datos reales suficientes (29/60 centros: 10 públicos Junta +
   4 EIM municipales + 15 privados con servicio confirmado), y FAQs personalizadas
   (5-6 por centro, basadas únicamente en datos confirmados, consolidando en una
   única pregunta los centros con 3 o más servicios para mantenerse dentro del
   rango 3-6 FAQs exigido).
10. Total de candidatos evaluados: 60. Los 60 superaron el umbral mínimo de
    verificación del proyecto (todos tienen teléfono y email confirmados, dirección
    clara, coordenadas verificables y fuente oficial primaria) → **0 centros al
    archivo de excluidos** en este sprint. Ver `docs/granada-quality-report.md`
    para el detalle completo de calidad y limitaciones.
