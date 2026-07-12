# Fuentes de datos — Alicante (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset
de centros de educación infantil de primer ciclo (0-3 años) en el municipio de
Alicante. Sigue el mismo formato y nivel de rigor que `docs/data-sources-valencia.md`
(misma comunidad autónoma, misma fuente autonómica principal) y
`docs/data-sources-sevilla.md`.

**Ámbito exacto**: únicamente el término municipal de Alicante capital. Se
excluyen explícitamente los municipios cercanos del área metropolitana (San
Vicente del Raspeig, El Campello, Sant Joan d'Alacant, Mutxamel, Sant Vicent del
Raspeig, etc.), aunque aparecieran en fuentes provinciales o autonómicas de
alcance más amplio. El filtro aplicado sobre la fuente principal fue
`localidad === "ALACANT"` (valor exacto), claramente distinto de
`"SANT JOAN D'ALACANT"`, que es un municipio homónimo/vecino independiente
presente en la misma fuente y excluido en su totalidad de este dataset.

---

## Fuentes evaluadas

### 1. Centres docents de la Comunitat Valenciana — Generalitat Valenciana (dadesobertes.gva.es) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Centres docents de la Comunitat Valenciana |
| **Organismo** | Conselleria d'Educació, Universitats i Ocupació — Generalitat Valenciana. Fuente: Registre de Centres Docents (creado por Decret 115/1990) |
| **URL catálogo** | https://dadesobertes.gva.es/va/dataset/edu-centros |
| **URL descarga directa usada** | `https://dadesobertes.gva.es/dataset/68eb1d94-76d3-4305-8507-e1aab7717d0e/resource/1aa53c3a-4639-41aa-ac85-d58254c428c0/download/centros-docentes-de-la-comunitat-valenciana.csv` (misma URL fija ya documentada para Valencia; es un único CSV para toda la Comunitat Valenciana) |
| **Formato** | CSV (separador `;`, codificación con acentos correctos) |
| **Licencia** | Creative Commons Attribution (CC-BY) |
| **Descarga automatizada** | Sí, completa — URL estable, descargable sin autenticación. No hay filtrado por parámetros de servidor; se descargó el CSV completo (1.855.760 bytes, todos los municipios y niveles educativos de la Comunitat Valenciana) y se filtró localmente |
| **Registros totales (dataset completo)** | Varios miles de filas, todos los niveles educativos de toda la Comunitat Valenciana (idéntico fichero al usado en la investigación de Valencia) |
| **Registros con `provincia = "ALICANTE/ALACANT"`** | No cuantificado de forma independiente; se filtró directamente por `localidad` |
| **Registros con `localidad = "ALACANT"` (cualquier tipo de centro)** | 169 |
| **Registros en Alicante con denominación genérica de primer ciclo/infantil** | **37 centros**: 30 "Centro privado de educación infantil de primer ciclo" + 2 "Centro privado de educación infantil" + 4 "Escuela infantil de primer ciclo" (públicas) + 1 "Escuela infantil" (pública) |
| **De esos 37, por `regimen`** | 32 "PRIV.", 5 "PÚB." (ninguno "PRIV. CONC.") |
| **De los 5 públicos, por `titular`** | 3 "GENERALITAT VALENCIANA" (EI Benacantil, EI El Tossalet, EI Rayuela) + **2 "AJUNTAMENT D'ALACANT"** (EI Municipal Siete Enanitos, EI Municipal Els Xiquets — ver fuente 2) |

#### Campos disponibles (columnas del CSV)

Idénticas a las ya documentadas en `docs/data-sources-valencia.md` (mismo dataset,
mismo esquema): `codigo`, `denominacion_generica_es`/`val`, `denominacion_especifica`,
`denominacion`, `regimen`, `tipo_via`, `direccion`, `numero`, `codigo_postal`,
`localidad`, `provincia`, `telefono`, `fax`, `cod_edificacion`, `longitud`,
`latitud`, `titular`, `cif`, `comarca`, `url_es`, `url_va`, `fe_constitucion`.

**No incluye:** email, distrito/barrio municipal de Alicante, flag de
comedor/horario ampliado/idiomas, ni indicación de concierto económico específico
para primer ciclo (en la Comunitat Valenciana, igual que en Catalunya, el
concierto para 0-3 años es infrecuente; en este subconjunto de Alicante no
apareció ningún registro `PRIV. CONC.`).

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente primaria oficial de la Generalitat Valenciana, equivalente funcional del
  dataset ya usado con éxito para Valencia capital.
- Cubre todos los centros autorizados con primer ciclo de infantil del municipio,
  públicos y privados, identificados por texto en `denominacion_generica_es`.
- Incluye coordenadas WGS84 (columnas `longitud`/`latitud`) listas para usar, sin
  conversión, en las 37 filas.
- Incluye teléfono en 37/37 filas (100%).
- La columna `titular` permite aislar de forma fiable los 2 centros de titularidad
  `AJUNTAMENT D'ALACANT` directamente desde esta fuente.
- **Limitaciones (idénticas a las ya documentadas para Valencia):**
  - No hay API REST/Socrata filtrable — solo un CSV único y completo que hay que
    descargar entero y filtrar localmente por `localidad`.
  - No hay flag booleano de primer ciclo — el filtro depende de parsear texto
    libre en `denominacion_generica_es` (en la práctica, los 4 valores observados
    para primer ciclo en Alicante son consistentes con los ya vistos en Valencia).
  - No hay columna de distrito ni barrio de la ciudad de Alicante.
  - No incluye email del centro (0/37 con email en esta fuente; los 22/37 emails
    del dataset final proceden de webs propias o de la web del Ayuntamiento).
  - `url_es`/`url_va` apuntan a la ficha del Registre de Centres Docents
    (`ceice.gva.es/web/centros-docentes/ficha-centro?codi=...`), no a la web
    propia del centro.
  - No indica servicios (comedor, horario ampliado, idiomas) ni proyecto
    educativo.

---

### 2. Escuelas infantiles municipales de Alicante — Ayuntamiento de Alicante (Patronato Municipal de Educación Infantil) ⭐ A USAR (fuente para los 2 centros municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas infantiles municipales de Alicante |
| **Organismo gestor** | Patronato Municipal de Educación Infantil, Ayuntamiento de Alicante |
| **URL principal** | https://www.alicante.es/es/area-tematica/escuelas-infantiles y https://www.alicante.es/es/equipamientos/escuelas-infantiles |
| **URL fichas individuales** | https://www.alicante.es/es/equipamientos/escuela-infantil-els-xiquets y https://www.alicante.es/es/equipamientos/escuela-infantil-siete-enanitos |
| **Modelo de gestión** | A diferencia de Valencia (11 escuelas municipales) o de la red autonómica de Sevilla (15 centros de la Junta de Andalucía), el Ayuntamiento de Alicante gestiona directamente, a través de su Patronato Municipal de Educación Infantil, **únicamente 2 escuelas infantiles municipales**: "Els Xiquets" (Virgen del Remedio) y "Siete Enanitos" (Pla del Bon Repòs), ambas en el área norte de la ciudad |
| **Formato** | HTML institucional — página de listado + una ficha propia por cada uno de los 2 centros en `alicante.es` |
| **Descarga automatizada** | No — no existe API ni fichero descargable único. Se accedió directamente a las 2 fichas individuales (`alicante.es/es/equipamientos/escuela-infantil-els-xiquets` y `...-siete-enanitos`), que sí respondieron con normalidad a herramientas de fetch, sin bloqueo anti-bot detectado |
| **Contacto general del Patronato** | Teléfono 010 / 900 153 862, Plaza del Ayuntamiento 1, 03002 Alicante |
| **Registros** | 2 escuelas infantiles municipales, ambas confirmadas también como `titular = "AJUNTAMENT D'ALACANT"` en el CSV de la Generalitat (fuente 1), con coincidencia de nombre y localización |

#### Campos disponibles (por ficha individual)

| Campo | Descripción |
|---|---|
| Nombre | "Escuela infantil Els Xiquets" / "Escuela infantil Siete Enanitos" |
| Dirección | Calle y número (verificados: C/ del Clot 8, 03011; C/ Miguel Jiménez Reyes 18-20-22, 03015) |
| Teléfono | Confirmado por centro (965173565; 965182385, coincide con el CSV de la Generalitat) |
| Email | Institucional `@alicante.es` (`elsxiquets@alicante.es`; `7enanitos@alicante.es`) |
| Horario | **Confirmado y homogéneo para ambas**: "Guardería" de 7:45 a 9:00 h + "Escuela infantil" de 9:00 a 17:00 h, curso del 8 de septiembre al 22 de julio |
| Servicio de comedor | Confirmado como "servicio de comedor voluntario", con menús determinados por comisión y preparados en el propio centro |
| Servicios adicionales | Trabajadora social; transporte gestionado por la Asociación de Madres y Padres (AMPA) |
| Distrito/barrio | No se muestra como campo estructurado, aunque el texto menciona el barrio de forma descriptiva (Virgen del Remedio; Pla del Bon Repòs) |

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa (Ayuntamiento de Alicante / Patronato Municipal de
  Educación Infantil), con horario homogéneo confirmado explícitamente para los 2
  centros — a diferencia de Valencia, donde no se pudo confirmar un horario
  homogéneo para las 11 escuelas municipales.
- Coincidencia de nombre, dirección y teléfono con el registro oficial de la
  Generalitat (fuente 1), lo que da alta confianza en la autenticidad de los 2
  centros.
- **Limitaciones:**
  - Solo cubre 2 de los 37 centros del dataset (el resto son privados o públicos
    de titularidad autonómica).
  - No hay listado único descargable (PDF/CSV); se accedió centro a centro.
  - La dirección exacta de "Siete Enanitos" en la ficha municipal ("18-20-22")
    difiere ligeramente del número registrado en el CSV de la Generalitat ("18")
    — se ha usado la versión de la ficha municipal, más reciente y específica, y
    se documenta la discrepancia en `notes_internal` del dataset.

---

### 3. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para el conjunto de 32 centros privados detectados en la fuente 1, se intentó
localizar y consultar la web oficial propia de cada centro (cuando existía, era
accesible y se pudo confirmar de forma inequívoca que correspondía al mismo
centro del registro, por coincidencia de nombre, dirección y/o teléfono) para
confirmar servicios concretos del enum `CenterService`. Se verificaron con
contenido citable directamente de la propia web los siguientes centros:

| Centro | Web oficial | Servicios confirmados |
|---|---|---|
| Ciudad Infantil San Jorge | ciudadinfantilsanjorge.com | bilingüe, actividades extraescolares |
| Montessori | alicantemontessori.com | comedor, horario ampliado (07:30-17:15) |
| Ángel de la Guarda | angeldelaguarda.eu | comedor, música, psicomotricidad |
| Elisa Tomás Yusti | elisatomasyusti.es | comedor, orientación pedagógica (gabinete psicopedagógico) |
| Nuestra Escuela Garabatos | nuestraescuelagarabatos.es | bilingüe, horario ampliado (7:30-18:00) |
| La Mar Salada (2 sedes: Golf y Condomina) | escuelalamarsalada.com | bilingüe |
| Escuelas Infantiles Granvía (3 sedes: Parque Aventura, Gran Vía Alicante, Pau I) | escuelainfantilgranvia.es | bilingüe (Total English Teaching), cocina propia, horario ampliado (7:30-18:00, verano hasta 20:00) |
| Hormiguitas | ceihormiguitas.com | comedor con cocina propia, bilingüe/inglés, patio exterior |
| Los Olivos 2 | centroinfantillosolivos.com | música, patio exterior, horario ampliado (7:45-17:30) |
| El Almendro | sites.google.com/view/escuela-infantil-el-almendro | comedor, cocina propia, orientación pedagógica, patio exterior |
| Britania | escuelainfantilbritania.com | bilingüe (inmersión inglés), cocina propia, patio exterior |
| Little Land | little-land.es | bilingüe, comedor, música, psicomotricidad, horario ampliado (7:30-17:00) |
| Googie's | googies.es | bilingüe, horario ampliado (7:00-19:00) |
| Somos Colores | somoscolores.com | comedor con cocina propia, horario ampliado (7:30-18:00), psicomotricidad, música, actividades extraescolares, orientación pedagógica, escuela de padres |
| Picapiedra | escuelainfantilpicapiedra.com | (web accesible, sin servicios citables con precisión suficiente para el enum) |

**Total de centros privados con al menos un servicio confirmado por web propia:
17 de 32 (≈ 53%)**. Este porcentaje es notablemente más alto que el observado en
Sevilla (6,9%) o Murcia, porque el volumen de centros privados en Alicante
capital (32) es mucho más manejable dentro del alcance de un único sprint de
investigación, permitiendo verificar la web propia de la inmensa mayoría.

**Criterio aplicado de forma estricta ante indicios no verificables**:

- **Vistahermosa Family School**: varias fuentes de terceros (directorios)
  mencionan "inmersión en inglés", pero no fue posible acceder directamente a la
  web oficial (`escuelavistahermosa.com` no resolvió DNS durante la
  investigación) para confirmar el dato con cita textual propia. **No se ha
  asignado el servicio `bilingue`/`ingles`** pese a la coincidencia de varias
  fuentes secundarias, siguiendo la regla del proyecto de no usar agregadores de
  terceros como fuente de verdad.
- **Nido, Peter Pan, Kid's Garden**: la web oficial existe y es citada por
  terceros, pero devolvió error HTTP (503/403) durante los intentos de acceso
  directo en esta investigación, o solo se dispuso de fragmentos de búsqueda sin
  poder verificar contenido completo con cita textual propia. **No se han
  asignado servicios** a estos 3 centros pese a los indicios, para evitar
  inferencia no verificada.
- **Colorín Colorado, La Cometa, Acuarelas/Acuarelas 2, Ninón, Princesa Mercedes/
  Babel, Mi Cole-El Solet, Children Isla Tabarca, Pequeño Mundo**: no se localizó
  una web oficial propia accesible y verificable dentro del alcance razonable de
  esta investigación (solo resultados de directorios de terceros). **`services`
  queda como array vacío** — no se ha inventado ningún servicio por similitud con
  otros centros del mismo tipo.
- **Grupo Escuelas Infantiles Granvía**: la web del grupo confirma
  explícitamente 3 sedes en Alicante ("Granvía" en Avd. Pintor Xavier Soler,
  "Albufereta" en C/ Deportista Juan Matos, y "Pau" en Plaza Juan Pablo II), que
  se cruzaron por nombre y zona con los 3 registros oficiales "Gran Vía Parque
  Aventura", "Gran Vía Alicante" y "Gran Via Pau I" del CSV de la Generalitat. Se
  detectó una discrepancia de dirección exacta para la sede "Pau" (el registro
  oficial indica Calle Médico Antonio Arroyo, 2, mientras que la web del grupo
  menciona Plaza Juan Pablo II, 19) — se ha mantenido la dirección del registro
  oficial por ser la fuente de mayor autoridad geográfica, y la discrepancia
  queda documentada en `notes_internal` del centro.

---

## Fuentes evaluadas y descartadas para el uso principal

### Guia de Centres Docents (buscador web) — ceice.gva.es — EVALUADA, NO USADA COMO FUENTE DE DATOS MASIVA

Interfaz de consulta interactiva del mismo Registre de Centres Docents que
alimenta el CSV de dadesobertes.gva.es (fuente 1). No se extrajeron registros
masivos de aquí porque el CSV ya cubre el mismo universo de centros de forma
estructurada y descargable en bloque.

### Otros datasets del portal de datos abiertos del Ayuntamiento de Alicante — NO LOCALIZADO NINGÚN DATASET ESPECÍFICO DE ESCUELAS INFANTILES

A diferencia de Valencia (`opendata.vlci.valencia.es`, con dataset "Centres
educatius en València"), no se localizó durante esta investigación un dataset
abierto equivalente y específico de centros de educación infantil de primer
ciclo en el portal de datos abiertos del Ayuntamiento de Alicante. La
información de los 2 centros municipales se obtuvo directamente de las páginas
institucionales de `alicante.es` (fuente 2).

### Fuentes NO usadas (recordatorio, igual que en Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla y Palma)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, Todoeduca, Educateca, Vamosaestudiar, Buscocolegio, qdq, Infoisinfo, Cylex, Firmania, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro, confirmar que un nombre comercial existe, o triangular direcciones/teléfonos ya presentes en la fuente oficial — **nunca como fuente de verdad de un dato concreto** (servicios, horario, precios) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Redes sociales de centros (Facebook, Instagram) | No usadas como fuente de datos estructurados; solo confirman de forma puntual la existencia de algún centro |

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo de `dadesobertes.gva.es` (fuente 1, mismo fichero
   de toda la Comunitat Valenciana ya usado para Valencia) y se filtró localmente
   por `localidad === "ALACANT"` (valor exacto) → 169 centros de cualquier nivel
   educativo.
2. Sobre ese subconjunto, se filtró por `denominacion_generica_es` en el
   conjunto `{"CENTRO PRIVADO DE EDUCACIÓN INFANTIL DE PRIMER CICLO", "CENTRO
   PRIVADO DE EDUCACIÓN INFANTIL", "ESCUELA INFANTIL DE PRIMER CICLO", "ESCUELA
   INFANTIL"}` → **37 centros candidatos** con primer ciclo 0-3 autorizado (32
   privados, 5 públicos).
3. Se verificó que todos los códigos postales resultantes (03005-03016, 03540,
   03112, 03113) están dentro del término municipal de Alicante capital, sin
   mezcla con municipios cercanos. Se comprobó específicamente que ningún
   registro tenía `localidad = "SANT JOAN D'ALACANT"` (el municipio homónimo/
   vecino más susceptible de confusión textual).
4. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos)
   y por dirección exacta (0 direcciones idénticas entre centros distintos).
5. Se clasificó `ownership` según `regimen`/`titular`: `PÚB.` → `publico`
   (tanto los 3 de titularidad `GENERALITAT VALENCIANA` como los 2 de titularidad
   `AJUNTAMENT D'ALACANT`); `PRIV.` → `privado`. No se detectó ningún registro
   `PRIV. CONC.` en este subconjunto, por lo que el valor `concertado` del enum
   `CenterOwnership` **no se ha usado para ningún centro** de Alicante en este
   sprint.
6. Se clasificó `type`: los 5 centros públicos (3 de la Generalitat + 2
   municipales del Ayuntamiento) → `escuela-infantil`, siguiendo el mismo
   criterio de "titularidad pública o gestión institucional consolidada =
   escuela-infantil" aplicado en Madrid, Barcelona, Valencia, Zaragoza, Murcia,
   Sevilla y Palma; los 32 centros privados → `guarderia`.
7. Se cruzaron los 2 registros con `titular = "AJUNTAMENT D'ALACANT"` con la web
   oficial del Ayuntamiento de Alicante (fuente 2) para confirmar horario
   homogéneo (guardería 7:45-9:00 h + escuela infantil 9:00-17:00 h), comedor
   voluntario, email institucional y teléfono.
8. Se intentó localizar la web oficial propia de los 32 centros privados. Se
   confirmaron servicios con cita textual en 17 de 32 (≈ 53%); el resto queda con
   `services: []` por falta de fuente primaria verificable dentro del alcance de
   esta investigación (bien por no tener web propia localizable, bien por errores
   de acceso HTTP/DNS durante la consulta).
9. Se generaron slugs únicos (37/37 verificados, sin colisiones de nombre),
   `short_description` (183-341 caracteres, con 3 estructuras para el grupo de
   5 centros públicos, 4 estructuras para el grupo de 17 privados con servicio
   confirmado y 8 estructuras para el grupo de 15 privados sin servicio
   confirmado, rotando de forma determinista), `long_description` solo cuando
   había datos reales suficientes (21/37 centros: los 5 públicos + los 16
   privados con servicio y/u horario confirmado), y FAQs personalizadas (3-6 por
   centro según datos confirmados disponibles, con presupuesto máximo de 6 FAQs
   por ficha).
10. Total de candidatos evaluados: 37. Los 37 superaron el umbral mínimo de
    verificación del proyecto (todos tienen al menos teléfono confirmado en la
    fuente oficial de la Generalitat, más dirección, titularidad y coordenadas
    verificables en el 100% de los casos) → **0 centros al archivo de excluidos**
    en este sprint. Ver `docs/alicante-quality-report.md` para el detalle
    completo de calidad y limitaciones.
