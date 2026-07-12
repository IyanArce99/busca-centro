# Fuentes de datos — Málaga (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de
centros de educación infantil de primer ciclo (0-3 años) en el término municipal de
Málaga capital. Sigue el mismo formato y nivel de rigor que `docs/data-sources-madrid.md`,
`docs/data-sources-barcelona.md`, `docs/data-sources-valencia.md`, `docs/data-sources-zaragoza.md`,
`docs/data-sources-murcia.md` y `docs/data-sources-sevilla.md`.

**Ámbito exacto**: únicamente el municipio de Málaga (capital). Se excluyen
explícitamente los otros 66 municipios de la provincia de Málaga (Torremolinos,
Benalmádena, Alhaurín de la Torre, Alhaurín el Grande, Rincón de la Victoria,
Marbella, Mijas, Fuengirola, Vélez-Málaga, Estepona, Cártama, Coín, Antequera,
Ronda, etc.), aunque aparecieran en fuentes provinciales o autonómicas de alcance
más amplio. El filtro aplicado sobre la fuente principal fue `D_MUNICIPIO === "Málaga"`
(valor exacto de la codificación INE del municipio, sin ambigüedad textual con la
provincia).

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
| **Registros con `D_MUNICIPIO = "Málaga"`** | 152 filas |
| **Registros en el resto de la provincia de Málaga (excluidos de este dataset)** | 265 filas, repartidas en 66 municipios distintos (Marbella, Vélez-Málaga, Fuengirola, Torremolinos, Mijas, Estepona, Rincón de la Victoria, Benalmádena, Alhaurín de la Torre, Coín, Antequera, Ronda, Cártama, etc.) |

Esta es la misma fuente ya usada con éxito para Sevilla. Es la fuente de datos
abiertos específica de primer ciclo (0-3 años); el "Directorio de centros docentes
no universitarios de Andalucía" general **no incluye** primer ciclo en su versión
2024/2025 (misma limitación documentada en `docs/data-sources-sevilla.md`, no se ha
repetido la comprobación exhaustiva porque el resultado ya está confirmado y es
estructural de la fuente, no específico de una provincia).

#### Campos disponibles (columnas del CSV)

| Campo | Descripción |
|---|---|
| `codigo` | Código de centro del Registro de Centros Docentes (8 dígitos, empieza por `29` para la provincia de Málaga) |
| `D_DENOMINA` | Tipo de centro (en este dataset, siempre "Centro de Educación Infantil") |
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
  municipio de Málaga capital.
- Coordenadas en las 152 de 152 filas, todas dentro del rango geográfico coherente
  del municipio (lat 36.65-36.76, lng -4.57 a -4.35), sin errores de longitud
  detectados (a diferencia del caso "Snoopy" documentado en Sevilla).
- Teléfono en 149 de 152 filas (98%) y correo electrónico en el 100% de las filas.

#### Limitación importante detectada y verificada en esta investigación: el campo `D_TIPO="Público"` no siempre equivale a titularidad pública genuina

De las 10 filas con `D_TIPO="Público"` en Málaga capital, la investigación
verificó **web propia de cada una** para confirmar la naturaleza real de la
titularidad, con el siguiente resultado:

| Nombre en la fuente | Verificación realizada | Conclusión aplicada |
|---|---|---|
| La Palma | Sin marca comercial, nombre de barriada ("Bda. La Palma"), sin web comercial propia — patrón coherente con la red genuina de titularidad de la Junta de Andalucía | `ownership: publico` (red Junta de Andalucía) |
| Los Asperones | Ídem (Ctra. Santa Inés-Campanillas, nombre de barriada/finca) | `ownership: publico` |
| Reyes Magos | Ídem (sin marca comercial) | `ownership: publico` |
| San José | Ídem (Bda. El Palo) | `ownership: publico` |
| Santo Ángel | Ídem | `ownership: publico` |
| Francisca Luque | Web oficial propia en `uma.es`: escuela infantil de la **Universidad de Málaga** (Vicerrectorado de Igualdad, Diversidad y Acción Social), en funcionamiento desde 1976, dirigida exclusivamente a hijos/nietos del personal y estudiantado de la UMA | `ownership: publico` (titularidad pública universitaria, distinta de la red Junta/municipal, documentada de forma explícita) |
| Novaschool Málaga Centro | Web oficial propia (`malagacentro.novaschool.es`): la propia web se describe como "escuela infantil bilingüe, como centro **adherido al Programa de Ayudas a las Familias**" — empresa privada (Grupo Educativo Novaschool) | Reclasificado a `ownership: privado` |
| Novaschool Baby Sunland | Web oficial propia (`babysunland.novaschool.es`): mismo grupo, "adherido al programa de ayuda a las familias de la Junta de Andalucía" | Reclasificado a `ownership: privado` |
| 5 Chupetes Guadalhorce | Web oficial del grupo (`5chupetes.com`) y fuentes de prensa confirman que está "subvencionada por la Junta de Andalucía" (financiación de puestos escolares, convenio documentado en `malaga.eu`) — empresa privada (S.L.) | Reclasificado a `ownership: privado` |
| 5 Chupetes Simón Bolívar | Mismo grupo empresarial que el anterior | Reclasificado a `ownership: privado` |

**Motivo de la reclasificación (mismo criterio ya validado en la corrección
post-auditoría de Sevilla, 2026-07-12)**: Andalucía no tiene concierto educativo
formal para el primer ciclo de educación infantil (0-3 años). La columna `D_TIPO`
de esta fuente puede marcar como "Público" centros que en realidad son empresas
privadas (sociedades limitadas) que prestan el servicio mediante gestión indirecta
o financiación municipal/autonómica de plazas — no titularidad pública en sentido
estricto. Se verificó cada una de las 10 filas `D_TIPO=Público` de Málaga capital
individualmente en su propia web oficial antes de decidir `ownership`, en vez de
asumir que el valor de la fuente era correcto sin contraste. Solo 6 de las 10
(La Palma, Los Asperones, Reyes Magos, San José, Santo Ángel, y Francisca Luque)
se confirmaron como titularidad pública genuina; las otras 4 (2 sedes de
Novaschool, 2 de 5 Chupetes) se trataron como lo que son: empresas privadas
adheridas a un programa de ayudas, igual que el resto del dataset privado. Ver
`docs/malaga-quality-report.md`, sección 1, para el detalle completo de esta
decisión.

**No incluye**: distrito administrativo de Málaga (Centro, Este, Ciudad Jardín,
Bailén-Miraflores, Palma-Palmilla, Cruz de Humilladero, Carretera de Cádiz,
Churriana, Campanillas, Puerto de la Torre, Teatinos-Universidad), horario
individual por centro (salvo el homogéneo de la red pública genuina), ni servicios
concretos del enum `CenterService` del proyecto — estos datos se han buscado de
forma puntual en webs oficiales propias (ver fuente 3).

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
  verificado y homogéneo únicamente para las **5 escuelas infantiles de titularidad
  genuina de la Junta de Andalucía** en Málaga capital (La Palma, Los Asperones,
  Reyes Magos, San José, Santo Ángel). No se aplicó a Francisca Luque (UMA), que
  tiene régimen propio de acceso restringido a la comunidad universitaria y cuyo
  horario detallado no se encontró en fuente oficial verificable dentro del
  alcance de esta investigación.
- **Edades**: de 16 semanas (aproximadamente 4 meses) a 3 años — usado para
  `age_range` (4-36 meses) en todo el dataset.
- **Proceso de admisión**: procedimiento de reserva (para alumnado ya
  escolarizado) y procedimiento ordinario de nuevas solicitudes en abril, con
  posibilidad de indicar un centro principal y hasta tres centros subsidiarios.
  Usado en `long_description` y FAQs de las 5 escuelas públicas genuinas.

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del organismo titular de la red pública.
- Horario homogéneo confirmado explícitamente para toda la red, no inferido.
- **Limitación**: no desglosa horario ni servicios complementarios por centro
  individual.

---

### 3. Ayuntamiento de Málaga — sin gestión directa municipal de escuelas infantiles de primer ciclo (con matiz)

Se investigó específicamente `educacion.malaga.eu` y `malaga.eu` para localizar un
listado propio de "Escuelas Infantiles Municipales" equivalente al de Zaragoza o
Murcia. El resultado es distinto al caso de Sevilla y merece documentarse con
precisión:

- El Ayuntamiento de Málaga **no gestiona directamente** (gestión propia, personal
  municipal) ninguna escuela infantil de primer ciclo — no existe una red
  municipal en sentido estricto como sí existe en Zaragoza o Murcia.
- Sin embargo, el Ayuntamiento **sí participa en la financiación de plazas** en
  varios centros privados a través de un plan/convenios de "puestos escolares"
  (documentado en un convenio de 2014 localizado para 5 Chupetes Guadalhorce,
  `malaga.eu/.../financiacion_puestos_escolares_de_escuela_infantil_5_chupetes_Guadalhorce.pdf`,
  y en referencias de prensa a la renovación de convenios "para cuatro escuelas
  infantiles municipales" con 481 plazas 0-3 años). Estos centros (Novaschool
  Málaga Centro, Novaschool Baby Sunland, 5 Chupetes Guadalhorce, 5 Chupetes
  Simón Bolívar) son en realidad **empresas privadas** que prestan el servicio con
  financiación pública parcial (municipal y/o autonómica), no centros de
  titularidad pública — de ahí la reclasificación documentada en la fuente 1.
- Se detectó además una referencia a una "Escuela Municipal Infantil Colores de
  Málaga" (C/ Chaves, 5, `malaga.eu/la-ciudad/instalaciones-y-espacios/...id=234`),
  descrita como "escuela infantil coordinada con la Junta de Andalucía", con 61
  plazas 0-3 años. **Este centro no aparece en absoluto en la fuente 1** (el CSV
  oficial de la Junta de Andalucía filtrado por `D_MUNICIPIO="Málaga"`), pese a
  búsquedas específicas por nombre y por la dirección conocida. No se ha podido
  confirmar su código de centro en el Registro de Centros Docentes ni sus datos de
  contacto directos (teléfono/email) en una fuente primaria propia de la Junta o
  del Ayuntamiento con el mismo nivel de detalle que el resto del dataset. **No se
  ha incluido en el dataset final** por no alcanzar el nivel de verificación
  exigido (no se dispone de código de centro oficial ni de contacto verificado en
  fuente primaria) — se documenta aquí como pista de enriquecimiento pendiente,
  sin forzar su inclusión con datos incompletos o inventados. Ver
  `docs/malaga-quality-report.md`, sección 6, para el detalle de este bloqueo.

---

### 4. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para un subconjunto de los 146 centros de titularidad privada (según la
clasificación final aplicada) y para Francisca Luque (UMA), se localizó y consultó
la web oficial propia del centro (cuando existía, era accesible y se pudo confirmar
de forma inequívoca que correspondía al mismo centro del registro, por coincidencia
de nombre y dirección) para confirmar servicios concretos del enum `CenterService`.
Se verificaron con cita textual las siguientes cadenas/centros, todos con sede
confirmada dentro de Málaga capital:

| Cadena / centro | Sedes en Málaga capital incluidas | Web oficial | Servicios confirmados |
|---|---|---|---|
| Novaschool (Málaga Centro + Baby Sunland) | 2 | malagacentro.novaschool.es / babysunland.novaschool.es | comedor, cocina propia, horario ampliado, proyecto bilingüe, música, actividades extraescolares (Málaga Centro); comedor, horario ampliado, patio exterior, psicomotricidad (Baby Sunland) |
| Don Pablito (I a VI) | 6 | donpablito.es | comedor, horario ampliado (aula matinal), inglés, orientación pedagógica, uniforme, campamento de verano |
| 5 Chupetes (Guadalhorce + Simón Bolívar) | 2 | 5chupetes.com | comedor, cocina propia |
| Pipiolines (I a IV) | 4 | centrospipiolines.com | escuela de padres y madres ("escuela de familias"), campamento de verano |
| Pequeño Picasso (I a III) | 3 | pequepicasso.com | comedor, horario ampliado (aula matinal 7:30-17:00), inglés, psicomotricidad, música |
| Piruleta | 1 (de 2 sedes; la segunda, "Piruleta II", no tiene web propia diferenciada localizada) | escuelaspiruleta.es | comedor, cocina propia |
| Institución Miramar | 1 | institucionmiramar.com | comedor, cocina propia, patio exterior, psicomotricidad, orientación pedagógica |
| Francisca Luque (UMA) | 1 | uma.es/escuela-infantil-francisca-luque | comedor, inglés, música |

**Total de centros con servicios confirmados por web propia: 20 de 152 (≈ 13,2%)**.

**Nota específica sobre "concertado" en marketing de centros privados**: la web
propia de Pequeño Picasso usa la frase "Nuestros centros están concertados con la
Junta de Andalucía" en una página, pero en otra página del mismo sitio se describe
correctamente como "Centro adherido al programa de ayudas de la Junta de
Andalucía". Se ha aplicado el criterio técnico correcto (adhesión a un programa de
ayudas a la demanda, no concierto educativo formal) y **no** se ha usado el valor
`concertado` del enum `CenterOwnership` para Pequeño Picasso ni para ningún otro
centro del dataset, siguiendo exactamente el precedente ya corregido y validado
en la auditoría de Sevilla (2026-07-12): Andalucía no tiene concierto educativo
formal de primer ciclo de infantil, con independencia de que el propio centro use
la palabra "concertado" de forma coloquial en su material comercial.

**Criterio aplicado de forma estricta**: cuando existían varios centros con el
mismo nombre comercial base pero **no fue posible confirmar con certeza** la
pertenencia a la misma cadena (por ejemplo, "Garabato" en Málaga capital frente a
"El Garabato" de Alhaurín de la Torre, con dirección y web distintas — se comprobó
explícitamente que no son el mismo centro y no se le asignaron servicios), **no se
asignaron servicios por similitud de nombre**.

Para el resto de centros privados (126 de 146) no se localizó una web propia
accesible y verificable dentro del alcance de esta investigación, o la web
encontrada no confirmaba servicios concretos con claridad suficiente. En esos casos
`services` queda como array vacío (`[]`) — **no se ha inventado ningún servicio por
similitud con otros centros del mismo tipo**.

---

## Fuentes evaluadas y descartadas para el uso principal

### Directorio de centros docentes no universitarios de Andalucía (curso 2024/2025) — descartado como fuente de primer ciclo

Misma limitación estructural ya documentada en Sevilla: este directorio general no
recoge primer ciclo de infantil (0-3 años) en su versión 2024/2025; el primer ciclo
se publica en un dataset separado (fuente 1 de este documento).

### Fuentes NO usadas (recordatorio, igual que en Madrid, Barcelona, Valencia, Zaragoza, Murcia y Sevilla)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, guarderia.net, guarderia.info, infoescuelas.com, todofamilias.com, todoeduca.com, educateca.com, infoisinfo.es, qdq.com, empresite.eleconomista.es, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro o confirmar que un nombre comercial existe — **nunca como fuente de verdad de un dato concreto** (teléfono, servicios, horario, precio) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Buscador interactivo de centros de la Junta de Andalucía (`educaweb.juntadeandalucia.es`) | Interfaz de consulta interactiva sin datos accesibles en descarga masiva estructurada; no se usó para extracción |

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo de la fuente 1 (2.363 filas de toda Andalucía,
   curso 2024/2025) y se filtró localmente por `D_MUNICIPIO === "Málaga"` (valor
   exacto) → 152 centros: 10 con `D_TIPO=Público` y 142 con `D_TIPO=Privado`.
2. Se verificó que todos los códigos postales resultantes (29002-29018, más
   29140/29190/29196/29590/29591, correspondientes a las pedanías de Churriana,
   Puerto de la Torre y Campanillas, todas dentro del término municipal de Málaga
   capital) están dentro del municipio, sin mezcla con otros municipios de la
   provincia.
3. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos) y
   por nombre+dirección exacta (0 coincidencias). Se detectaron varias cadenas
   legítimas con varias sedes que comparten un mismo teléfono de central
   (Pipiolines, Garabato, Don Pablito, Pequeño Picasso, Piruleta, Colorete,
   Alameda, Tito José) — se verificó individualmente que cada sede tiene código de
   centro y dirección propios y distintos, por lo que no son duplicados.
4. Se verificó el rango de coordenadas de las 152 filas (lat 36.65-36.76, lng
   -4.57 a -4.35): todas coherentes con el municipio, sin errores de longitud
   detectados.
5. Se clasificó `ownership` verificando individualmente, en su propia web oficial,
   cada una de las 10 filas con `D_TIPO="Público"` (ver fuente 1, tabla de
   verificación). Resultado: 6 centros con titularidad pública genuina (`publico`:
   5 de la red Junta de Andalucía + Francisca Luque de titularidad de la
   Universidad de Málaga) y 4 reclasificados a `privado` (2 sedes de Novaschool, 2
   de 5 Chupetes) por ser empresas privadas con financiación pública parcial, no
   titularidad pública. Los 142 centros con `D_TIPO="Privado"` de origen se
   mantuvieron como `privado`. Ningún centro usa `ownership: concertado` —
   Andalucía no tiene concierto educativo formal de primer ciclo de infantil.
6. Se clasificó `type`: los 6 centros de titularidad pública genuina →
   `escuela-infantil`; los 146 centros privados (incluidas las 4 filas
   reclasificadas de `D_TIPO=Público` a `ownership=privado`) → `guarderia`,
   siguiendo el mismo criterio de "titularidad pública genuina o gestión
   institucional consolidada = escuela-infantil" aplicado en el resto de zonas ya
   integradas.
7. Se aplicó el horario oficial homogéneo (fuente 2) a las 5 escuelas públicas de
   la red Junta de Andalucía.
8. Se intentó localizar la web oficial propia de las cadenas privadas con varias
   sedes detectadas en el listado y de algunos centros individuales de perfil
   premium/bilingüe (Institución Miramar). Se confirmaron servicios con cita
   textual en 20 de 152 centros (≈ 13,2%); el resto queda con `services: []` por
   falta de fuente primaria verificable dentro del alcance de esta investigación.
9. Se generaron slugs únicos (152/152 verificados), `short_description` (180-402
   caracteres, con 4 estructuras rotando para el grupo de las 5 escuelas públicas
   de la Junta, 1 descripción específica para Francisca Luque/UMA, 4 estructuras
   para privados con servicio confirmado, 6 estructuras para privados sin servicio
   confirmado — verificado 152/152 textualmente únicas), `long_description` solo
   cuando había datos reales suficientes (25/152 centros: 5 públicos Junta + 1
   UMA + 19 privados con servicio confirmado — nota: Piruleta e Institución
   Miramar también entran en este grupo pese a tener servicios más limitados,
   ver criterio en `docs/malaga-quality-report.md`), y FAQs personalizadas (5-6
   por centro, basadas únicamente en datos confirmados).
10. Total de candidatos evaluados: 152. Los 152 superaron el umbral mínimo de
    verificación del proyecto (todos tienen al menos teléfono o email confirmado
    en la fuente oficial de la Junta de Andalucía) → **0 centros al archivo de
    excluidos** en este sprint. La "Escuela Municipal Infantil Colores de Málaga"
    (ver fuente 3) se evaluó y se descartó explícitamente por no tener código de
    centro oficial ni contacto verificado en fuente primaria — no llegó a ser
    "candidato" con datos suficientes para figurar siquiera en el archivo de
    excluidos con un registro completo; se documenta como bloqueo/pista de
    enriquecimiento futuro. Ver `docs/malaga-quality-report.md` para el detalle
    completo de calidad y limitaciones.
