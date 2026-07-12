# Informe SEO — Palma (sprint v1)

Keyword research y recomendación de landings para el municipio de Palma, con recuento real de centros de soporte contra los umbrales de `src/lib/constants.ts` (`MIN_CENTERS_FOR_CITY_PAGE = 10`, `MIN_CENTERS_FOR_TYPE_PAGE = 5`). Este informe **no crea ni modifica** `src/data/mock-seo-pages.ts` — solo recomienda, según instrucción del proyecto; la creación de landings es competencia del integrador tras auditoría.

---

## 1. Keyword research — intención de búsqueda en Palma

### Búsquedas genéricas (volumen probable alto, competencia de agregadores ya posicionados)

- "guarderías en Palma" / "guardería Palma de Mallorca"
- "escuela infantil Palma" / "escuelas infantiles Palma de Mallorca"
- "guarderías Palma capital"
- "centros de educación infantil Palma"

Confirmado por búsqueda: los primeros resultados actuales para estas consultas son mayoritariamente agregadores de terceros (Micole, Páginas Amarillas, Educoland, "palmademallorcatop.es", "mallorcalovers.city") con listados de tipo ranking ("las 17 mejores guarderías", "las 10 mejores guarderías") y valoraciones de usuarios — hay hueco para una ficha con datos verificados de fuente oficial (Govern de les Illes Balears / Ajuntament de Palma) que estos agregadores no citan, y que evita expresamente el lenguaje de ranking/valoración que el propio proyecto tiene prohibido (ver `AGENTS.md`, sección de contenido y copy).

### Búsquedas con el término local "escoleta"

- "escoleta Palma" / "escoletes Palma"
- "escoleta infantil Palma de Mallorca"
- "escoletes municipals Palma"

El término "escoleta" (equivalente balear a "guardería"/"escuela infantil") aparece de forma natural y frecuente en nombres reales de centros del propio dataset (Atlas Escoleta, Escoleta Pessigolles, Escoleta Somnis, Escoleta Luis Vives, Escoleta Infantil Gran Món, Escoleta Pequeño Da Vinci, Sweet Dreams... varias marcas se autodenominan "Escoleta X" en su propio nombre comercial) y en la web oficial del Patronat Municipal d'Escoles d'Infants (`palmaescolesinfants.cat`, con contenido en catalán/castellano y uso constante de "escoleta"/"escola d'infants"). Es una señal de demanda real y local, no forzada: recomendamos incorporarlo de forma natural en el contenido de las landings municipales (por ejemplo, como sinónimo mencionado una vez en el intro o en una FAQ, del estilo "también conocidas como escoletes en Mallorca"), sin sustituir la terminología del `type` del centro ni forzarlo en cada párrafo (riesgo de keyword stuffing, expresamente desaconsejado en `docs/checklist-calidad-nueva-ciudad.md`).

### Búsquedas por servicio (intención más específica, más cercana a conversión)

- "guarderías con comedor en Palma"
- "guarderías con cocina propia Palma"
- "escuela infantil bilingüe Palma" / "guardería inglés Palma"
- "guarderías con horario ampliado Palma"

Confirmado por el propio dataset: existe oferta real verificada en cocina propia (4 centros), inglés (2), horario ampliado (2) y bilingüe (1), pero en volúmenes aún insuficientes para sostener una landing de servicio específica (ver sección 2.2). La intención de búsqueda existe (el mercado privado de Palma incluye varios centros que promocionan explícitamente inglés nativo, método Montessori y cocina propia en sus propias webs), pero el dataset verificado todavía no tiene masa suficiente para una landing propia sin ampliar la verificación de más centros.

### Búsquedas relacionadas con la red pública municipal (señal de contexto, no necesariamente de demanda insatisfecha confirmada)

- "escoletes municipals Palma" / "escuelas infantiles municipales Palma"
- "plaza escoleta municipal Palma" / "solicitud plaza PMEI"
- "mapa de vacantes educación 0-3 Palma"

**Dato de contexto para el enfoque SEO**: el Govern de les Illes Balears lanzó en 2025 un "mapa interactivo" público (`caib.es/sites/escolaritzacio03/ca/mapa_de_vacants/`) para consultar vacantes de la red pública y concertada de educación 0-3 por municipio y curso escolar — señal de que la administración considera relevante la búsqueda de plazas por parte de las familias. El PMEI de Palma gestiona un proceso de solicitud de plaza anual con plazos concretos (por ejemplo, del 13 al 21 de abril de 2026 para nacidos en 2024-2026, según su propia web). A diferencia de Murcia (donde hay confirmación explícita de "red completa"/demanda superior a la oferta en prensa institucional), no se ha encontrado en este sprint una fuente equivalente que confirme una situación de saturación específica de la red pública de Palma — se recomienda no afirmar demanda insatisfecha en el contenido de las landings sin una fuente que lo confirme explícitamente, siguiendo la regla del proyecto de no hacer afirmaciones no verificadas.

### Búsquedas por barrio/pedanía (long-tail, menor volumen individual pero relevante para SEO local)

Ejemplos con presencia real en el dataset: "guardería Son Ferriol", "escoleta S'Arenal Palma", "guardería Es Coll d'en Rabassa", "escoleta Can Pastilla". Palma, igual que Murcia, es un municipio extenso con barrios y pedanías periféricas que generan búsquedas locales propias distintas de "Palma centro" — pero, a diferencia de Murcia (donde varias pedanías concentran 2-3 centros), en Palma ningún barrio periférico alcanza aún el umbral de 5 centros necesario para una landing de zona (ver sección 2.3).

---

## 2. Landings recomendadas (con recuento real de soporte)

### 2.1 Landing municipal general — RECOMENDADA, alcanza el umbral ampliamente

| Landing propuesta | Filtro | Centros de soporte | Umbral (`MIN_CENTERS_FOR_CITY_PAGE`) | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-palma` | `type=guarderia`, `city=palma` | **54** | 10 | Indexable por volumen. Cumple ampliamente. |
| `/escuelas-infantiles-en-palma` | `type=escuela-infantil`, `city=palma` | **21** | 10 | Indexable por volumen. Cumple. |

Ambas superan el umbral de 10 centros con margen amplio. **Recomendación**: crear ambas landings, siguiendo la lección de la auditoría de Barcelona — no lanzarlas con contenido mínimo placeholder; incluir `sections` (2 bloques H2+párrafos) y 4-5 FAQs desde el primer commit potencialmente indexable, diferenciando explícitamente el enfoque de guardería (mercado privado, conciliación, cocina propia/inglés en varios centros del dataset) del de escuela-infantil (red municipal PMEI + red concertada, proceso de admisión, titularidad).

**Matiz importante para el redactor de estas landings**: aunque hay 54+21=75 centros de soporte cuantitativo, solo 18 de ellos (24.0%) son individualmente indexables según `isCenterIndexable` (ver `docs/palma-quality-report.md`). El listado de la landing mostrará centros con fichas todavía `noindex,follow` a nivel de detalle — esto no impide que la landing en sí sea indexable (el umbral de la landing es un recuento de centros que cumplen el filtro, no que cada ficha individual esté indexada), pero conviene que el coordinador lo tenga presente antes de solicitar indexación manual de estas dos URLs.

### 2.2 Landings de servicio a nivel municipal — NINGUNA alcanza el umbral todavía

| Landing propuesta | Filtro | Centros de soporte | Umbral (`MIN_CENTERS_FOR_TYPE_PAGE`) | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-palma` | `service=comedor`, `type=guarderia` | 2 | 5 | No alcanza |
| `/escuelas-infantiles-con-comedor-en-palma` | `service=comedor`, `type=escuela-infantil` | 12 | 5 | **Alcanza.** |
| `/guarderias-con-cocina-propia-en-palma` | `service=cocina-propia`, `type=guarderia` | 3 | 5 | No alcanza |
| `/guarderias-con-horario-ampliado-en-palma` | `service=horario-ampliado`, `type=guarderia` | 2 | 5 | No alcanza |
| `/guarderias-bilingues-en-palma` | `service=bilingue`, `type=guarderia` | 1 | 5 | No alcanza |
| `/guarderias-con-ingles-en-palma` | `service=ingles`, `type=guarderia` | 2 | 5 | No alcanza |
| `/guarderias-con-patio-exterior-en-palma` | `service=patio-exterior`, `type=guarderia` | 3 | 5 | No alcanza |
| `/guarderias-con-campamentos-de-verano-en-palma` | `service=verano-campamentos`, `type=guarderia` | 3 | 5 | No alcanza |

**Recomendación**: de todas las landings de servicio evaluadas, **solo una alcanza el umbral hoy**: `/escuelas-infantiles-con-comedor-en-palma` (12 centros: las 11 EIEL municipales del PMEI, con comedor incluido en su horario general confirmado por fuente oficial, más 1 centro concertado adicional). Es una landing con soporte real y margen cómodo sobre el umbral (12 frente a 5), pero su contenido se solaparía en gran medida con `/escuelas-infantiles-en-palma` (21 centros totales, de los cuales 12 ya tienen comedor) — recomendamos valorar si aporta suficiente diferenciación de intención de búsqueda antes de lanzarla, o esperar a ampliar la verificación de comedor en centros privados/concertados adicionales para reforzar el contraste.

El resto de landings de servicio (guardería con comedor, cocina propia, horario ampliado, bilingüe, inglés, patio exterior, campamentos de verano) están todas por debajo del umbral, algunas muy lejos (1-3 centros frente a 5 exigidos). **No recomendamos crear ninguna landing de servicio en el segmento `guarderia` en esta fase** — el dataset actual solo verificó servicios en 6 de 54 guarderías privadas (11.1%), muy por debajo de lo necesario. Ampliar la verificación de webs propias de los 55 centros privados/concertados restantes sin web confirmada sería el paso previo natural para que alguna de estas landings de servicio alcance el umbral en una futura iteración.

### 2.3 Landings de barrio/pedanía — NO RECOMENDADAS por ahora

| Barrio/pedanía | Centros | Umbral (`MIN_CENTERS_FOR_TYPE_PAGE`) | Veredicto |
|---|---|---|---|
| Son Ferriol | 3 | 5 | No alcanza |
| Es Secar de la Real | 2 | 5 | No alcanza |
| Resto de barrios/pedanías (Es Coll d'en Rabassa, Ciutat Jardí, Can Pastilla, El Terreno, Establiments, Sant Jordi, Es Pil·larí, S'Arenal, Son Espanyolet) | 1 cada uno | 5 | No alcanza |

Ningún barrio o pedanía alcanza individualmente el umbral de 5 centros exigido para páginas de tipo/segmento. La capital estricta (61 centros) sí lo alcanzaría ampliamente si se creara como landing propia (`/guarderias-en-palma-centro` o similar), pero, igual que en Murcia y Valencia, el proyecto no tiene actualmente un concepto de "distrito"/"zona interna" verificado para Palma capital en el schema (`district` queda `null` en todo el dataset, ver limitación documentada en `docs/data-sources-palma.md`), así que no es una landing viable con los datos actuales sin inventar una zonificación no verificada (Palma capital sí tiene barrios administrativos oficiales reconocibles — Santa Catalina, Es Molinar, El Terreno, etc. — pero la fuente de datos usada en este sprint no los distingue de forma sistemática dentro del núcleo urbano, solo para las pedanías/barrios periféricos vía el sufijo `"(Palma)"`).

**Recomendación**: no crear landings de barrio/pedanía en esta fase. Si en una futura iteración se amplía el número de centros verificados y se consigue una fuente fiable de distrito/barrio para la capital (por ejemplo, cruzando con el callejero oficial del Ayuntamiento de Palma por distritos), reevaluar. Mientras tanto, el volumen de búsqueda long-tail por barrio/pedanía puede capturarse parcialmente mediante las fichas individuales de cada centro (que ya incluyen el nombre del barrio/pedanía en `neighborhood_barrio`, `short_description` y FAQs cuando aplica) sin necesidad de una landing dedicada.

---

## 3. Resumen de recomendación de landings

| # | Landing | Centros soporte | Cumple umbral | Prioridad |
|---|---|---|---|---|
| 1 | `/guarderias-en-palma` | 54 | Sí (≥10) | Alta |
| 2 | `/escuelas-infantiles-en-palma` | 21 | Sí (≥10) | Alta |
| 3 | `/escuelas-infantiles-con-comedor-en-palma` | 12 | Sí (≥5) | Media/condicionada — valorar solapamiento con la landing #2 antes de lanzarla |

**Total de landings recomendadas: 2 firmes (municipal general) + 1 condicionada (servicio), 0 de barrio/pedanía por ahora.**

---

## 4. Notas para el integrador

- Todas las cifras de este informe están calculadas directamente sobre `data/enrichment/palma-centers.json` (75 centros), no son estimaciones.
- El recuento de soporte de cada landing bajará automáticamente si, tras la auditoría del coordinador, algún centro pasa de `draft` a excluido — recomendamos recalcular antes de crear cualquier landing, especialmente la de servicio (`comedor` en escuela-infantil), que depende en su mayoría de las 11 EIEL municipales.
- El término local "escoleta" tiene presencia real y natural en nombres propios de centros y en la fuente oficial del PMEI — recomendamos usarlo puntualmente en el contenido editorial de las landings municipales, sin sustituir la terminología técnica del proyecto (`guardería`/`escuela infantil`) ni forzarlo por densidad de palabra clave.
- Ninguna landing ha sido creada por este agente (no se ha tocado `src/data/mock-seo-pages.ts`), conforme a la instrucción del proyecto.
