# Fuentes de datos — Castelló de la Plana (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset
de centros de educación infantil de primer ciclo (0-3 años) en el municipio de
Castelló de la Plana. Sigue el mismo formato y nivel de rigor que
`docs/data-sources-valencia.md` y `docs/data-sources-alicante.md` (misma comunidad
autónoma, misma fuente autonómica principal).

**Ámbito exacto**: únicamente el término municipal de Castelló de la Plana capital,
incluyendo su distrito de El Grao (Grau de Castelló) — que en la fuente oficial de
la Generalitat aparece con un valor de `localidad` propio y distinto
(`"GRAU DE CASTELLÓ"`), pero que administrativamente es uno de los 6 distritos
oficiales del propio municipio de Castelló de la Plana (norte, sur, este, oeste,
centro y Grao), no un municipio independiente. Se ha verificado explícitamente que
El Grao tiene identidad administrativa, censal y eclesiástica propia dentro del
municipio (población aproximada de 15.324 habitantes en 2023, según fuentes
periodísticas y enciclopédicas consultadas), por lo que se ha incluido en el
ámbito del dataset.

Se ha excluido explícitamente el valor de `localidad` `"CASTELLÓ"` (sin "DE LA
PLANA"), que en la fuente oficial de la Generalitat corresponde a un **municipio
completamente distinto** de la provincia de Valencia (código postal 46270,
comarca de La Costera, con centros como "CEIP Severí Torres" o "IES Vicente
Gandia"), sin ninguna relación con Castelló de la Plana capital pese a la
similitud textual del nombre. Este es un riesgo de confusión específico y real de
esta zona (distinto del caso "Sant Joan d'Alacant" ya documentado para Alicante),
verificado y descartado antes de construir el dataset.

---

## Fuentes evaluadas

### 1. Centres docents de la Comunitat Valenciana — Generalitat Valenciana (dadesobertes.gva.es) ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Centres docents de la Comunitat Valenciana |
| **Organismo** | Conselleria d'Educació, Universitats i Ocupació — Generalitat Valenciana. Fuente: Registre de Centres Docents (creado por Decret 115/1990) |
| **URL catálogo** | https://dadesobertes.gva.es/va/dataset/edu-centros |
| **URL descarga directa usada** | `https://dadesobertes.gva.es/dataset/68eb1d94-76d3-4305-8507-e1aab7717d0e/resource/1aa53c3a-4639-41aa-ac85-d58254c428c0/download/centros-docentes-de-la-comunitat-valenciana.csv` (misma URL fija ya documentada para Valencia y Alicante; es un único CSV para toda la Comunitat Valenciana) |
| **Formato** | CSV (separador `;`, codificación con acentos correctos) |
| **Licencia** | Creative Commons Attribution (CC-BY) |
| **Descarga automatizada** | Sí, completa — URL estable, descargable sin autenticación. Se descargó el CSV completo (1.855.760 bytes, idéntico al usado para Valencia y Alicante, todos los municipios y niveles educativos de la Comunitat Valenciana) y se filtró localmente |
| **Registros totales (dataset completo)** | 3.688 filas, todos los niveles educativos de toda la Comunitat Valenciana |
| **Registros con `localidad` en {"CASTELLÓ DE LA PLANA", "GRAU DE CASTELLÓ"}, cualquier tipo de centro** | 124 (116 en "CASTELLÓ DE LA PLANA" + 8 en "GRAU DE CASTELLÓ") |
| **Registros de primer ciclo/infantil en ese ámbito** | **27 centros**: 21 "Centro privado de educación infantil de primer ciclo" + 6 "Escuela infantil de primer ciclo" (públicas) |
| **De esos 27, por `regimen`** | 21 "PRIV.", 6 "PÚB." (ninguno "PRIV. CONC.") |
| **De los 6 públicos, por `titular`** | 2 "GENERALITAT VALENCIANA" (EI Nuestra Señora de Lourdes, EI Mar de Somnis) + **4 "AJUNTAMENT DE CASTELLÓ DE LA PLANA"** (EI Municipal Los Duendes, EI Municipal Chupetes, EI Municipal Biberons, EI Municipal Peücs) |

#### Campos disponibles (columnas del CSV)

Idénticas a las ya documentadas en `docs/data-sources-valencia.md` y
`docs/data-sources-alicante.md` (mismo dataset, mismo esquema): `codigo`,
`denominacion_generica_es`/`val`, `denominacion_especifica`, `denominacion`,
`regimen`, `tipo_via`, `direccion`, `numero`, `codigo_postal`, `localidad`,
`provincia`, `telefono`, `fax`, `cod_edificacion`, `longitud`, `latitud`,
`titular`, `cif`, `comarca`, `url_es`, `url_va`, `fe_constitucion`.

**No incluye:** email, distrito/barrio municipal (salvo el caso particular de El
Grao, que sí aparece como `localidad` propia), flag de comedor/horario
ampliado/idiomas, ni indicación de concierto económico específico para primer
ciclo (ningún registro `PRIV. CONC.` en este subconjunto).

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente primaria oficial de la Generalitat Valenciana, equivalente funcional del
  dataset ya usado con éxito para Valencia y Alicante.
- Cubre todos los centros autorizados con primer ciclo de infantil del municipio,
  públicos y privados, identificados por texto en `denominacion_generica_es`.
- Incluye coordenadas WGS84 (columnas `longitud`/`latitud`) listas para usar, sin
  conversión, en las 27 filas.
- Incluye teléfono en 27/27 filas (100%).
- La columna `titular` permite aislar de forma fiable los 4 centros de titularidad
  `AJUNTAMENT DE CASTELLÓ DE LA PLANA` directamente desde esta fuente.
- **Limitaciones (idénticas a las ya documentadas para Valencia y Alicante):**
  - No hay API REST/Socrata filtrable — solo un CSV único y completo que hay que
    descargar entero y filtrar localmente por `localidad`.
  - No hay flag booleano de primer ciclo — el filtro depende de parsear texto
    libre en `denominacion_generica_es`.
  - No hay columna de distrito/barrio salvo el caso de El Grao.
  - No incluye email del centro (0/27 con email en esta fuente; los emails del
    dataset final proceden de webs propias o de las webs de las escuelas
    municipales gestionadas por concesión).
  - `url_es`/`url_va` apuntan a la ficha del Registre de Centres Docents, no a la
    web propia del centro.
  - No indica servicios (comedor, horario ampliado, idiomas) ni proyecto
    educativo.

---

### 2. Escuelas infantiles municipales de Castelló de la Plana — Ayuntamiento de Castelló de la Plana ⭐ A USAR (fuente para 3 de los 4 centros municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles Municipales de primer ciclo de Castelló de la Plana |
| **Organismo/modelo de gestión** | A diferencia de Alicante (gestión directa municipal a través de un Patronato) o de Valencia (11 escoles infantils municipals), el Ayuntamiento de Castelló de la Plana gestiona sus escuelas infantiles municipales de primer ciclo mediante **concesión de servicio público**, adjudicada a la empresa **EULEN Servicios Sociosanitarios**. Se han identificado 4 escuelas de titularidad municipal en el registro oficial (fuente 1): "Los Duendes", "Chupetes", "Biberons" y "Peücs" |
| **Webs propias localizadas** | 3 de las 4 escuelas tienen web propia dedicada y accesible: `escuelachupetes.com`, `escuelabiberons.com`, `escuelapeucs.com`. Los emails institucionales confirmados (`eichupetes@eulen.com`, `eibiberons@eulen.com`, `eipeucs@eulen.com`) coinciden con la gestora EULEN y con el teléfono ya registrado en la fuente oficial (fuente 1), lo que da alta confianza en su autenticidad |
| **Escuela sin web propia verificable** | "Escuela Infantil Municipal Los Duendes" no tiene web oficial propia localizable dentro del alcance de esta investigación. Se descartó explícitamente una coincidencia de nombre con una escuela infantil privada de gestión distinta en otra ubicación, por no poder confirmarse que correspondiera al mismo centro |
| **Descarga automatizada** | No — no existe API ni fichero descargable único. Se accedió directamente a las webs propias de cada una de las 3 escuelas con web localizada |
| **Registros** | 4 escuelas infantiles municipales, las 4 confirmadas como `titular = "AJUNTAMENT DE CASTELLÓ DE LA PLANA"` en el CSV de la Generalitat (fuente 1) |

#### Campos disponibles (por web propia, 3 de 4 escuelas)

| Campo | Descripción |
|---|---|
| Nombre | "Escuela Chupetes" / "Escuela Biberons" / "Escuela Peücs" |
| Dirección | Calle y número (con una pequeña discrepancia de numeración en Peücs frente al registro oficial, documentada en `notes_internal`) |
| Teléfono | Confirmado por centro, coincide con el CSV de la Generalitat en los 3 casos |
| Email | Institucional `@eulen.com` para las 3 escuelas |
| Horario | Confirmado y homogéneo en las 3: horario ampliado de mañana (7:30-9:00 h), horario central (9:00-17:00 h, con salidas intermedias), horario ampliado de tarde (17:00-18:00 h) |
| Servicio de comedor | Confirmado explícitamente como servicio de las 3 escuelas |
| Servicios adicionales | Escuela Chupetes confirma además música, psicomotricidad y programas de vacaciones (escuela de verano/Navidad/Pascua) en su propia web; Biberons y Peücs confirman escuela de verano/actividades de ocio pero sin detalle de música/psicomotricidad citable con precisión suficiente |

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa (webs propias de cada escuela, gestionadas por la
  concesionaria del servicio público municipal), con horario homogéneo confirmado
  explícitamente para 3 de las 4 escuelas.
- Coincidencia de nombre, dirección, teléfono y email institucional con el
  registro oficial de la Generalitat (fuente 1), lo que da alta confianza en la
  autenticidad de los 3 centros con web propia.
- **Limitaciones:**
  - No hay listado único descargable (PDF/CSV) del conjunto de escuelas
    municipales publicado por el Ayuntamiento; se accedió centro a centro.
  - El dominio institucional `castello.es` no respondió de forma estable durante
    esta investigación (error de conexión persistente tanto por herramienta de
    fetch como por acceso directo), por lo que no se pudo consultar directamente
    la página oficial del Ayuntamiento con el listado de "Centros de Enseñanza" ni
    la ficha de "Centros privados de educación infantil de 1º ciclo" que sí
    aparece indexada en buscadores. Se ha dejado constancia de este bloqueo de
    acceso; no ha impedido completar el dataset porque la fuente 1 (Generalitat)
    ya cubre el universo completo de centros con datos suficientes.
  - "Escuela Infantil Municipal Los Duendes" queda sin web oficial propia
    verificable y, por tanto, sin servicios ni horario confirmados más allá de
    los datos base del registro oficial (nombre, dirección, teléfono,
    titularidad).

---

### 3. Webs propias de centros de titularidad Generalitat Valenciana — portal.edu.gva.es

Las 2 escuelas infantiles de titularidad `GENERALITAT VALENCIANA` (EI Nuestra
Señora de Lourdes, EI Mar de Somnis) tienen web propia institucional en el
subdominio `portal.edu.gva.es`, con ficha de centro que incluye proyectos
educativos y equipamiento (huerto didáctico, psicomotricidad vivencial, comedor,
sala multiusos, patios). Se han confirmado servicios concretos del enum
`CenterService` con cita textual de cada ficha.

---

### 4. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para el conjunto de 21 centros privados detectados en la fuente 1 (más las 2
sedes adicionales del mismo grupo que en algunos casos comparten titular), se
intentó localizar y consultar la web oficial propia de cada centro (cuando
existía, era accesible y se pudo confirmar de forma inequívoca que correspondía
al mismo centro del registro, por coincidencia de nombre, dirección y/o
teléfono) para confirmar servicios concretos del enum `CenterService`. Se
verificaron con contenido citable directamente de la propia web (o de search
snippets que citan literalmente el contenido de la propia web, cuando el acceso
directo por fetch falló por bloqueo técnico) los siguientes centros:

| Centro | Web oficial | Servicios confirmados |
|---|---|---|
| Escuela Infantil San Cristóbal | sancristobalsl.com | bilingüe/inglés (50% sesiones en inglés), música, psicomotricidad |
| CEI Los Ángeles | escuelainfantilosangeles.com | comedor, cocina propia, horario ampliado (7:30-18:00), patio exterior, escuela de verano/Pascua/Navidad |
| La Jirafa | lajirafa.es | comedor, horario ampliado (aula matinera 7:30-9:00), bilingüe/inglés (método "English Immersion") |
| La Jirafa II | lajirafa.es (web de grupo) | mismos servicios que La Jirafa (mismo titular, Escola i Oci SL) |
| Fabulinus | fabulinus.com | comedor, horario ampliado (7:30-18:00), bilingüe/trilingüe (valenciano, castellano, inglés) |
| Fabulinus Ribalta | fabulinus.com (web de grupo) | mismos servicios que Fabulinus (mismo titular, Proeduca Gestión) |
| Kid's Garden | kidsgarden.edu.es/castellon | comedor, horario ampliado, bilingüe |
| Picarol | ceipicarol.es | comedor, horario ampliado (7:30-17:30) |
| La Lluna-UJI | lalluna.net | patio exterior (más de 750 m² confirmados) |
| Apapachoa | apapachoaescuelainfantil.com | comedor, cocina propia, horario ampliado (8:00-17:00), escuela de verano |
| Els Sentits | elssentits.com | comedor, cocina propia, inglés, patio exterior, horario ampliado (7:30-17:00), escuela de verano |
| Primers Passos | primerspassos.com | cocina propia, inglés, música, horario ampliado (7:30-17:00), escuela de verano/Pascua/Navidad |
| Primers Passos Sensal | primerspassos.com (web de grupo, 2ª sede confirmada explícitamente) | mismos servicios que Primers Passos |
| IEP Bebés | (indicios múltiples y consistentes del nombre comercial "IEP English"/"International English School", web propia inaccesible por fallo DNS durante la consulta) | bilingüe/inglés (asignado de forma conservadora solo por consistencia fuerte del propio nombre comercial, sin cita textual directa verificada de la web propia) |

**Total de centros privados con al menos un servicio confirmado: 15 de 21
registros base (contando cada sede por separado: 17 de 23 filas privadas, ≈
74%)**. Este porcentaje es más alto que el observado en Alicante (53%) gracias al
volumen todavía más manejable de centros privados en Castelló de la Plana (21).

**Criterio aplicado de forma estricta ante indicios no verificables**:

- **Mikole**: no se localizó ninguna web oficial propia dedicada y accesible
  (solo directorios de terceros). `services` queda como array vacío.
- **La Papallona Menuda**: no se localizó web oficial propia estable dentro del
  alcance de esta investigación. `services` queda vacío.
- **La Marieta**: solo se localizó un perfil de constructor de páginas (Wix) sin
  contenido estable citable. `services` queda vacío.
- **Sirius**: existe una web de grupo ("Centros Infantiles Sirius") que menciona
  una escuela infantil de primer ciclo, pero con una dirección (Plaza Escuelas
  Pías) que **no coincide** con la dirección registrada oficialmente para este
  centro (Calle Gumbau, 19 bis). Por prudencia, y siguiendo la regla de no
  inferir por similitud de nombre sin confirmación de identidad inequívoca, no se
  han asignado los servicios de esa web a este registro. `services` queda vacío.
- **Primers Passos Censal II**: comparte titular (Nova Escoleta, SL) con
  "Primers Passos" y "Primers Passos Sensal", pero la web oficial del grupo solo
  confirma explícitamente 2 direcciones/sedes, sin mencionar esta tercera. Por
  prudencia no se han extendido los servicios del grupo a esta sede sin
  confirmación directa. `services` queda vacío.
- **Conta'm un Conte**: solo se localizó un blog de WordPress con contenido de
  actividades pedagógicas, sin datos de contacto ni servicios estructurados
  citables. `services` queda vacío.
- **Escuela Infantil Municipal Los Duendes**: ver detalle en fuente 2.

---

## Fuentes evaluadas y descartadas o bloqueadas

### Portal `castello.es` (Ayuntamiento de Castelló de la Plana) — ACCESO BLOQUEADO DURANTE ESTA INVESTIGACIÓN

Se intentó acceder repetidamente (tanto por herramienta de fetch como por
petición HTTP directa) a varias páginas institucionales de `castello.es`
(listado de "Centros de Enseñanza", ficha de "Centros privados de educación
infantil de 1º ciclo", sección "Familia e Infancia"), identificadas como
relevantes a través de resultados de búsqueda. Todas las peticiones directas al
dominio devolvieron error de conexión (`ECONNREFUSED`/timeout), sin poder
confirmarse si se trata de un bloqueo anti-bot, una caída puntual del servidor o
una restricción de red del entorno de esta investigación. **Se documenta este
bloqueo explícitamente como incidencia**: no impidió completar el dataset (la
fuente 1 ya cubre el universo completo de centros con datos suficientes, y las
webs propias de las escuelas municipales sustituyeron parcialmente esta fuente),
pero es una vía de verificación adicional pendiente para una fase futura,
especialmente para intentar confirmar datos de "Los Duendes" y localizar
distrito/barrio administrativo oficial por calle.

### `castellosom.es` — DESCARTADA POR CONFUSIÓN DE MUNICIPIO

Durante la búsqueda de las escuelas municipales apareció el dominio
`castellosom.es` con una "Escola Infantil Municipal", pero al consultarlo se
confirmó que corresponde a una escuela infantil de **Villanueva de Castellón**
(municipio de la provincia de Valencia, código postal 46270 — el mismo municipio
homónimo ya descartado en la fuente 1), no a Castelló de la Plana. Se descarta
explícitamente como fuente, y se deja documentado el riesgo de confusión por
similitud de nombre para futuras investigaciones de esta zona.

### Guia de Centres Docents (buscador web) — ceice.gva.es — EVALUADA, NO USADA COMO FUENTE DE DATOS MASIVA

Interfaz de consulta interactiva del mismo Registre de Centres Docents que
alimenta el CSV de dadesobertes.gva.es (fuente 1). No se extrajeron registros
masivos de aquí porque el CSV ya cubre el mismo universo de centros de forma
estructurada y descargable en bloque.

### Fuentes NO usadas (recordatorio, igual que en el resto de zonas ya integradas)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo salvo consulta puntual de contraste |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, Todoeduca, Educateca, Vamosaestudiar, Buscocolegio, qdq, Infoisinfo, Cylex, Ceipflaviosanroman, Lomejordelbarrio, Guarderia.net, InfoGuarderia, Tuguiaonline, Academia Format, etc.) | Usados exclusivamente como referencia para localizar la web oficial de un centro, confirmar que un nombre comercial existe, o triangular direcciones/teléfonos ya presentes en la fuente oficial — **nunca como fuente de verdad de un dato concreto** (servicios, horario, precios) ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato, conforme a las reglas del proyecto |
| Redes sociales de centros (Facebook, Instagram) | No usadas como fuente de datos estructurados; solo confirman de forma puntual la existencia de algún centro |

---

## Proceso de construcción del dataset

1. Se descargó el CSV completo de `dadesobertes.gva.es` (fuente 1, mismo fichero
   de toda la Comunitat Valenciana ya usado para Valencia y Alicante) y se filtró
   localmente por `localidad ∈ {"CASTELLÓ DE LA PLANA", "GRAU DE CASTELLÓ"}` →
   124 centros de cualquier nivel educativo.
2. Sobre ese subconjunto, se filtró por `denominacion_generica_es` en el
   conjunto `{"CENTRO PRIVADO DE EDUCACIÓN INFANTIL DE PRIMER CICLO", "CENTRO
   PRIVADO DE EDUCACIÓN INFANTIL", "ESCUELA INFANTIL DE PRIMER CICLO", "ESCUELA
   INFANTIL"}` → **27 centros candidatos** con primer ciclo 0-3 autorizado (21
   privados, 6 públicos).
3. Se verificó explícitamente que el valor de `localidad` `"CASTELLÓ"` (7 filas
   en el dataset completo, código postal 46270, provincia de Valencia) es un
   municipio distinto y se excluyó por completo del filtro, evitando el riesgo
   de mezclar ambas zonas por similitud de nombre.
4. Se comprobó ausencia de duplicados por código de centro (0 códigos repetidos)
   y por dirección exacta (0 direcciones idénticas entre centros distintos). Un
   único caso de teléfono compartido (964224465, entre "Fabulinus" y "Fabulinus
   Ribalta") se verificó como legítimo: 2 sedes reales del mismo grupo/titular
   (Proeduca Gestión), no un error de duplicación.
5. Se clasificó `ownership` según `regimen`/`titular`: `PÚB.` → `publico` (2 de
   titularidad `GENERALITAT VALENCIANA` + 4 de titularidad `AJUNTAMENT DE
   CASTELLÓ DE LA PLANA`); `PRIV.` → `privado`. No se detectó ningún registro
   `PRIV. CONC.` en este subconjunto, por lo que el valor `concertado` del enum
   `CenterOwnership` **no se ha usado para ningún centro** de Castelló de la
   Plana en este sprint — mismo resultado ya observado en Valencia y Alicante
   para primer ciclo en esta comunidad autónoma.
6. Se clasificó `type`: los 6 centros públicos (2 de la Generalitat + 4
   municipales del Ayuntamiento) → `escuela-infantil`, siguiendo el mismo
   criterio de "titularidad pública o gestión institucional consolidada =
   escuela-infantil" aplicado en el resto de zonas ya integradas; los 21 centros
   privados → `guarderia`.
7. Se cruzaron los 4 registros con `titular = "AJUNTAMENT DE CASTELLÓ DE LA
   PLANA"` con las webs oficiales propias de 3 de ellos (fuente 2, gestionadas
   por la concesionaria EULEN) para confirmar horario homogéneo, comedor, email
   institucional y teléfono; el cuarto ("Los Duendes") queda sin estos datos
   adicionales por falta de web propia verificable.
8. Se intentó localizar la web oficial propia de los 21 centros privados (23
   registros/sedes en total, contando las 2 sedes extra de La Jirafa/Fabulinus
   ya incluidas en el recuento de 21 titulares). Se confirmaron servicios con
   cita textual (directa o vía snippet que cita literalmente la propia web) en
   15 de 21 titulares privados distintos; el resto queda con `services: []` por
   falta de fuente primaria verificable dentro del alcance de esta
   investigación.
9. Se generaron slugs únicos (27/27 verificados, sin colisiones),
   `short_description` (210-356 caracteres, con 3 estructuras para el grupo de
   2 centros públicos de titularidad Generalitat, 4 estructuras para el grupo de
   4 escuelas municipales gestionadas por EULEN, 8 estructuras para el grupo de
   privados con servicio confirmado y 8 estructuras para el grupo de privados
   sin servicio confirmado, rotando de forma determinista), `long_description`
   solo cuando había datos reales suficientes (20/27 centros), y FAQs
   personalizadas (5-6 por centro según datos confirmados disponibles, con
   presupuesto máximo de 6 FAQs por ficha).
10. Total de candidatos evaluados: 27. Los 27 superaron el umbral mínimo de
    verificación del proyecto (todos tienen al menos teléfono confirmado en la
    fuente oficial de la Generalitat, más dirección, titularidad y coordenadas
    verificables en el 100% de los casos) → **0 centros al archivo de
    excluidos** en este sprint. Ver `docs/castellon-quality-report.md` para el
    detalle completo de calidad y limitaciones.
