# Fuentes de datos — Cartagena (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de centros de educación infantil de primer ciclo (0-3 años) en el **municipio de Cartagena** (término municipal completo: casco urbano y pedanías con vida administrativa propia, entre ellas Barrio Peral, La Concepción, Los Dolores, La Palma, Villalba, Pozo Estrecho, La Aljorra, El Algar, Vista Alegre, Los Mateos, entre otras). No incluye ningún otro municipio de la Región de Murcia (Murcia capital, Fuente Álamo, La Unión, Torre-Pacheco, etc.), que son entidades administrativas independientes. Sigue el mismo formato y nivel de rigor que `docs/data-sources-murcia.md`, `docs/data-sources-barcelona.md` y `docs/data-sources-valencia.md`.

---

## Fuentes evaluadas

### 1. Sedes de los Centros Educativos de la Región de Murcia — CARM / mapaescolar-api ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Sedes de los Centros Educativos de la Región de Murcia |
| **Organismo** | Comunidad Autónoma de la Región de Murcia (CARM), Consejería de Educación, Formación Profesional y Empleo. Alimenta la herramienta pública "Mapa Escolar" (`mapaescolar.murciaeduca.es`) |
| **URL catálogo (portal de datos abiertos)** | https://datosabiertos.regiondemurcia.es/carm/catalogo/educacion/sedes-de-los-centros-educativos-de-la-region-de-murcia |
| **API/descarga** | API JSON pública, sin autenticación: `https://mapaescolar.murciaeduca.es/mapaescolar-api/api/centros`. Devuelve un array JSON con todos los centros educativos (de todos los niveles) de toda la Región de Murcia en una sola respuesta (verificado: 893 registros en el momento de la investigación, el mismo dataset ya usado para Murcia capital) |
| **Formato** | JSON, un único endpoint sin filtros de query — se descarga todo y se filtra localmente |
| **Licencia** | Aviso legal del portal: https://datosabiertos.regiondemurcia.es/avisolegal |
| **Descarga automatizada** | Sí, confirmada con `curl` sin autenticación (HTTP 200, ~931 KB) |
| **Registros en `muncen="CARTAGENA"` (término municipal, todos los niveles)** | 115 centros |
| **Registros en `muncen="CARTAGENA"` con `tipo` de primer ciclo de infantil** | 19 candidatos iniciales: 13 "Escuela de Educación Infantil" + 6 "Centro Privado de Educación Infantil" |
| **Registros finalmente confirmados como primer ciclo real (0-3)** | **14** (ver sección "Reconciliación con la fuente municipal" más abajo): 8 EMEI públicas con código CARM propio + 6 privados |

#### Campos disponibles

Igual estructura que la usada en Murcia (ver `docs/data-sources-murcia.md` para el detalle completo de columnas): `codcen`, `dencen`, `denCorta`/`denLarga`, `tipo`, `titularidad` (`P`/`N`), `domcen`, `loccen`, `muncen`, `cpcen`, `telcen`/`telcen2`, `email`, `web` (ficha genérica `murciaeduca.es/[codcen]`, no la web propia), `geo-referencia.lat`/`.lon` (WGS84, listas para usar), flags de servicios (`comedor`, `bilingue_ingles`, `aulaMatinal`, etc.).

**Limitación crítica detectada en Cartagena (más severa que en Murcia):** el campo `tipo="Escuela de Educación Infantil"` **no es un indicador fiable de primer ciclo (0-3) en este municipio**. Se detectaron 4 registros con ese `tipo` que, verificados individualmente contra la web oficial del propio centro o el listado del Ayuntamiento de Cartagena, resultaron ser centros públicos de **segundo ciclo (3-6 años)**: PIPIRIPAO (confirmado 3-5 años en noticia oficial de `cartagena.es`), HAZIM (confirmado 3-5 años en la web oficial `murciaeduca.es/eeihazim/sitio/`), y LA GAVIOTA y LOS DOLORES/JARDINES (sin ficha propia en el listado oficial de escuelas infantiles municipales de 0-3 del Ayuntamiento, a diferencia de las 11 EMEI que sí figuran allí una a una — tratados como no confirmables como primer ciclo con la evidencia disponible y excluidos por precaución). Los flags de servicio (`comedor`, `aulaMatinal`, `bilingue_ingles`) tampoco son fiables para diferenciar ciclo, ya que aparecen indistintamente en centros de ambos ciclos.

**Además**, 2 Escuelas Infantiles Municipales de titularidad pública confirmadas por el Ayuntamiento (La Aljorra, Pozo Estrecho) **no aparecen en absoluto** en el dataset CARM con `tipo` de primer ciclo — no tienen código de centro individual localizado en esta fuente. Se han incorporado igualmente al dataset final porque están confirmadas por la fuente municipal (ver fuente 2).

#### Calidad estimada: ⭐⭐⭐ (menor que en Murcia por la ambigüedad ciclo 0-3 vs 3-6 detectada)

- Fuente primaria oficial de la CARM, con coordenadas WGS84 y contacto para los centros que sí corresponden a primer ciclo
- **Limitación específica de Cartagena:** el filtro por `tipo="Escuela de Educación Infantil"` que funcionó de forma limpia en Murcia capital (52/52 correctos) generó aquí 4 falsos positivos (centros de 3-6 años) que fue necesario descartar uno a uno contrastando con fuentes oficiales adicionales — ningún centro se incluyó en el dataset final solo con esta fuente si había señal de que pudiera ser de segundo ciclo
- No incluye distrito/barrio formal del casco urbano de Cartagena; sí incluye la pedanía en `loccen` quand corresponde

---

### 2. Escuelas Infantiles Municipales de Cartagena — Ayuntamiento de Cartagena (Concejalía de Educación) ⭐⭐⭐⭐ PRINCIPAL A USAR (para las EMEI municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles Municipales (EEIIMM) del Ayuntamiento de Cartagena |
| **Organismo gestor** | Concejalía de Educación, Ayuntamiento de Cartagena. Sede: C/ San Miguel, 8, 30201 Cartagena (unidad de gestión) / C/ Ronda Ciudad de la Unión, nº 4 (referencia alternativa citada en la propia web). Tel. 968 12 88 29 / 968 12 88 30. Email: educacion@ayto-cartagena.es |
| **URL listado general** | https://educacion.cartagena.es/escuelas_infantiles.asp |
| **URL fichas individuales de centro** | https://educacion.cartagena.es/detalle_centros.asp?idCentro=[ID], IDs 2082 a 2090 localizados y verificados uno a uno para 9 de las 11 escuelas |
| **URL horario** | https://educacion.cartagena.es/escuelas_infantiles_horario.asp |
| **URL servicios** | https://educacion.cartagena.es/escuelas_infantiles_servicios.asp |
| **URL matriculación / plazas curso 2026-2027** | https://educacion.cartagena.es/escuelas_infantiles_matriculacion.asp y noticia oficial https://www.cartagena.es/detalle_noticias.asp?id=87047 |
| **Formato** | HTML — listado general con datos de contacto de las 11 escuelas activas en el momento de la investigación, más fichas de detalle individuales para 9 de ellas |
| **Descarga automatizada** | No — datos incorporados manualmente tras lectura de cada página, cruzados por dirección/teléfono con los registros de titularidad `P` de la fuente 1 cuando existía coincidencia |
| **Registros confirmados por esta fuente** | **11 Escuelas Infantiles Municipales** de primer ciclo (0-3 años) activas: Bambi (El Algar), Barrio Peral, La Aljorra, La Concepción, La Milagrosa, La Palma, Pozo Estrecho, San Isidoro (Los Mateos), Villalba, Virgen de la Caridad, Vista Alegre. De estas, 9 tienen ficha de detalle individual verificada (todas menos La Aljorra y Pozo Estrecho, que solo constan en el listado general, sin ficha individual pero con dirección/teléfono/email propios) |

#### Datos aportados por esta fuente y usados en el dataset

- **Edad mínima real confirmada para las 11 EMEI**: 4 meses (no 0), texto literal "niños/as con edades comprendidas entre los 4 meses y los 3 años", repetido en el listado general y en cada ficha individual consultada
- **Horario homogéneo confirmado para el conjunto de las 11 escuelas** (octubre a junio): centro abierto de 7:30 a 16:00 h, horario lectivo de 8:30 a 15:30 h, comedor de 13:00 a 14:00 h, siesta de 14:00 a 15:30 h, horario ampliado de 7:30 a 8:30 h y de 15:30 a 16:00 h. En julio: centro de 7:30 a 15:00 h. Septiembre: horario flexible por adaptación
- **Servicios confirmados para el conjunto de las 11 escuelas**: comedor con comida elaborada en el propio centro (`comedor` + `cocina-propia`), aula matinal / horario ampliado antes y después de la jornada lectiva (`servicio-madrugadores` + `horario-ampliado`), atención a niños con necesidades educativas especiales con apoyo de un Equipo de Atención Temprana (dato de contexto, sin categoría exacta en el enum `CenterService`, no forzado)
- **Gratuidad total confirmada**: 1.010 plazas gratuitas ofertadas en la red municipal para el curso 2026-2027 (dato de contexto relevante para el informe SEO y para no clasificar estas escuelas como `concertado` — son `publico` puro, con gratuidad decidida por el propio Ayuntamiento, no un concierto formal con un centro privado)
- **Confirmación de que la red tiene 12 escuelas a partir de septiembre de 2026** (se añade una nueva escuela en el Parque de la Rosa, Ciudad Jardín) — no incluida en el dataset final por falta de ficha propia con dirección exacta, teléfono/email y coordenadas verificables en el momento de este sprint; documentada en el dataset de excluidos

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa del Ayuntamiento de Cartagena, con teléfonos y emails específicos por escuela, distintos y más actualizados que los del registro CARM (`637 XX XX XX` municipal frente a fijos antiguos o genéricos `@murciaeduca.es` en varios casos)
- Permite, de forma decisiva, **descartar** del dataset a Pipiripao, La Gaviota, Los Dolores/Jardines y Hazim como centros de primer ciclo: ninguno de los cuatro aparece en el listado municipal de las 11 EEIIMM de 0-3 años, y para Pipiripao y Hazim se confirmó explícitamente edad 3-5/3-6 en fuente oficial adicional (ver fuente 3)
- **Limitaciones:** las fichas de detalle individuales no están enlazadas desde el listado general (se accedió navegando IDs secuenciales `idCentro=2082` a `2090`); 2 de las 11 escuelas (La Aljorra, Pozo Estrecho) no tienen ficha de detalle propia localizada — se usaron sus datos del listado general, sin ficha ampliada; no se han podido geocodificar con precisión de calle exacta las direcciones de estas 2 escuelas (ver limitación de coordenadas más abajo)

---

### 3. Noticias y comunicados oficiales del Ayuntamiento de Cartagena (`cartagena.es`) — COMPLEMENTARIA, para casos límite

| Campo | Detalle |
|-------|---------|
| **Uso dado** | Para resolver la ambigüedad de ciclo (0-3 vs 3-6) de Pipiripao, y para documentar la apertura de la nueva escuela del Parque de la Rosa |
| **URLs usadas** | https://www.cartagena.es/detalle_noticias.asp?id=46786 (25º aniversario de Pipiripao, confirma 3-5 años), https://www.cartagena.es/detalle_noticias.asp?id=87047 (matrícula 2026-2027, 1.010 plazas, 12 escuelas), https://www.cartagenaactualidad.com/articulo/actualidad/cartagena-finaliza-nueva-escuela-infantil-parque-rosa-supera-1000-plazas-gratuitas-3-anos/20260702123826220091.html (apertura Parque de la Rosa, medio de prensa local que reproduce la nota oficial del Ayuntamiento) |
| **Criterio aplicado** | Usadas solo para confirmar o descartar candidatos, nunca para construir descripciones de centros ni para inventar datos de contacto no confirmados en la fuente 1 o 2 |

#### Calidad estimada: ⭐⭐⭐ (complementaria, no sistemática)

---

### 4. Webs oficiales de centros privados individuales — USADAS PUNTUALMENTE PARA VERIFICAR SERVICIOS

| Campo | Detalle |
|-------|---------|
| **Uso dado** | Para 3 de los 6 centros privados candidatos (aquellos con web propia identificable y funcional), se consultó directamente su sitio web oficial para confirmar servicios reales del enum `CenterService` |
| **Centros verificados con web propia** | Nice Day School (nicedayschool.es, subpágina específica del centro de Cartagena), Cativos Mediterráneo (cativos.com/mediterraneo/) |
| **Centros con web citada por terceros pero no accesible/fiable** | Pepico Paluco (`pepicopaluco.es` — error de certificado SSL al intentar el fetch directo, no se pudo verificar contenido de primera mano; se mantiene sin servicios asignados, solo datos de la fuente CARM); La Cometa de los Dolores (`ceilacometa.es` accedida, pero la página de inicio no detalla servicios más allá del texto genérico de la etapa 0-3, así que no se asignó ningún servicio del enum) |
| **Centros sin web propia verificable** | Alevines (solo página de Facebook activa, no usada como fuente de datos estructurados de ningún tipo — ni de servicios ni de descripciones), El País de Nunca Jamás (el dominio `ceielpaisdenuncajamas.es` que aparece en resultados de búsqueda corresponde a un centro homónimo distinto en Huelva, **no** se ha usado como fuente para este centro de Cartagena/La Palma para evitar atribuir datos de una entidad distinta) |
| **Criterio aplicado** | Solo se asignó un servicio del enum `CenterService` cuando la propia web del centro lo mencionaba explícitamente en texto. Servicios mencionados sin equivalente exacto en el enum (p. ej. "estimulación sensorial", "huerto", "inteligencia emocional") no se forzaron a ninguna categoría existente |

#### Calidad estimada: ⭐⭐ (complementaria, cobertura limitada: solo 2 de 6 privados con servicios verificados por web propia)

---

## Fuentes evaluadas y descartadas

| Fuente | Motivo de descarte |
|--------|---------------------|
| **Mapa Escolar de la Región de Murcia — registros de "Colegio Público"/"Centro Privado con varias Enseñanzas" con `infantil="S"`** | Corresponden a segundo ciclo (3-6) de infantil dentro de colegios de primaria, fuera del alcance MVP (primer ciclo 0-3). 96 registros descartados por esta vía en el municipio de Cartagena, igual criterio que en Murcia |
| **PIPIRIPAO (codcen 30011806)** | Marcado por CARM como "Escuela de Educación Infantil" (etiqueta ambigua de ciclo en este municipio), pero confirmado por noticia oficial de `cartagena.es` (25º aniversario) como centro de **3 a 5 años** (segundo ciclo). No aparece en el listado municipal de las 11 EEIIMM de 0-3. Excluido |
| **HAZIM (codcen 30008832, La Aparecida)** | Web oficial propia (`murciaeduca.es/eeihazim/sitio/`) confirma explícitamente **3 a 5 años**. Excluido |
| **LA GAVIOTA (codcen 30019519, Ensanche)** | Marcado por CARM como primer ciclo, pero sin ficha propia en el listado oficial de las 11 EEIIMM municipales del Ayuntamiento (a diferencia de las 11 que sí tienen ficha individual verificada). Datos contradictorios entre agregadores de terceros (edad 0-3 según algunos, sin confirmación en fuente oficial municipal ni autonómica directa). Excluido por precaución ante la imposibilidad de confirmar el ciclo con una fuente primaria fiable |
| **LOS DOLORES / JARDINES (codcen 30019520 y 30008662)** | Mismo caso que La Gaviota: marcados por CARM como "Escuela de Educación Infantil" pero sin ficha propia en el listado municipal de EEIIMM de 0-3, sin fuente oficial adicional que confirme el ciclo. Excluidos ambos por precaución |
| **`ceielpaisdenuncajamas.es`** | Dominio de un centro homónimo en Huelva, no del centro "El País de Nunca Jamás" de La Palma (Cartagena). No usado como fuente para este centro |
| **Micole, Educoland, Páginas Amarillas, Todoeduca, tusguarderias.com, guarderia.net, qdq, 11870, buscocolegio.com, infoisinfo.es, otros directorios/agregadores privados** | No usados como fuente de ningún dato ni de descubrimiento sistemático de centros — solo aparecieron incidentalmente en resultados de búsqueda al intentar localizar la web oficial de un centro concreto o al resolver la ambigüedad de ciclo; nunca se ha copiado texto ni tomado datos estructurados de ellos |
| **Facebook (páginas de centros)** | No usado como fuente de datos estructurados en ningún caso, solo como señal indirecta de actividad (p. ej. confirmar que Alevines sigue operativo), nunca citado como fuente en el dataset |
| **Google Maps / Google Places** | No usado para scraping masivo. Se usó puntualmente Nominatim (OpenStreetMap) para geocodificar 1 dirección (La Aljorra) sin coordenadas en la fuente CARM |
| **Reseñas y valoraciones de usuarios (cualquier plataforma)** | No usadas como fuente de ningún dato, servicio ni descripción |

---

## Reconciliación con la fuente municipal (proceso aplicado)

1. Se descargó el JSON completo de `mapaescolar.murciaeduca.es/mapaescolar-api/api/centros` (893 registros, toda la Región de Murcia).
2. Se filtró por `muncen === "CARTAGENA"` (término municipal completo, 115 registros de cualquier nivel) — no por `loccen`, para no excluir pedanías.
3. Se filtró por `tipo` en `{"Escuela de Educación Infantil", "Centro Privado de Educación Infantil"}` → 19 candidatos iniciales.
4. Se cruzó cada uno de los 13 candidatos públicos con el listado oficial de las 11 Escuelas Infantiles Municipales del Ayuntamiento de Cartagena (`educacion.cartagena.es/escuelas_infantiles.asp`): **9 coincidieron** (Villalba, San Isidoro, Virgen de la Caridad, Barrio Peral, La Concepción, La Milagrosa, Bambi, Vista Alegre — 8 con código CARM propio, más La Concepción) y **4 no coincidieron** (Pipiripao, La Gaviota, Los Dolores, Hazim/Jardines-Hazim son registros distintos, ver detalle en sección de descartes).
5. Para los 4 no coincidentes, se buscó confirmación adicional de ciclo (0-3 vs 3-6) en fuente oficial: Pipiripao y Hazim confirmados como 3-6 por fuente oficial adicional (noticia del Ayuntamiento y web propia del centro respectivamente); La Gaviota y Los Dolores/Jardines sin confirmación oficial de ciclo, excluidos por precaución.
6. Se detectaron 2 EEIIMM municipales (La Aljorra, Pozo Estrecho) confirmadas por el Ayuntamiento que **no** tienen código de centro individual en el dataset CARM con `tipo` de primer ciclo — incorporadas igualmente al dataset final usando la fuente municipal como principal para estos 2 casos, sin dato CARM de respaldo.
7. Los 6 candidatos privados de CARM se mantuvieron todos (ninguna señal de ser de otro ciclo o de estar fuera de Cartagena).
8. Total dataset final: **8 EMEI con código CARM + 2 EMEI solo con fuente municipal (La Aljorra, Pozo Estrecho) + 6 privados = 16 centros**.

## Limitaciones estructurales pendientes

- No existe ninguna fuente oficial disponible con distritos formales del casco urbano de Cartagena para estos centros. El campo `district` queda `null` en los 16 centros; `neighborhood_barrio` recoge el nombre del barrio/pedanía cuando la fuente lo indica con claridad (Barrio Peral, La Concepción, Villalba, Los Mateos/San Isidoro, Virgen de la Caridad, La Milagrosa, Vista Alegre, El Algar, La Aljorra, Pozo Estrecho, La Palma, Los Dolores).
- **Coordenadas**: 14 de los 16 centros tienen coordenadas WGS84 directamente de la fuente oficial CARM (validadas cruzando 1 caso contra Nominatim/OpenStreetMap con coincidencia casi exacta, ~30 metros de diferencia). Para La Aljorra se geocodificó la calle (no el número exacto) vía Nominatim como aproximación razonable documentada. Para Pozo Estrecho no fue posible geocodificar con precisión suficiente la dirección exacta (Nominatim solo devolvió el centroide de la pedanía, no la dirección concreta); se ha dejado `latitude`/`longitude` en `null` en vez de usar una aproximación no verificable, conforme a la regla de no inventar coordenadas.
- El dataset CARM de servicios (`comedor`, `bilingue_ingles`, `aulaMatinal`, etc.) demostró no ser fiable para diferenciar ciclo educativo en Cartagena y tampoco se ha usado como fuente de servicios de las EMEI (se ha usado en su lugar el texto explícito de la fuente municipal, más completo y consistente).
- La nueva Escuela Infantil Municipal del Parque de la Rosa (Ciudad Jardín), con apertura confirmada para el 8 de septiembre de 2026, no se ha incluido en el dataset final por no disponer de ficha propia con dirección exacta, teléfono/email de contacto ni coordenadas verificables en el momento de este sprint — documentada en `data/enrichment/cartagena-centers-excluded.json`.
