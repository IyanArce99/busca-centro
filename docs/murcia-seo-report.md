# Informe SEO — Murcia (sprint v1)

Keyword research y recomendación de landings para el municipio de Murcia, con recuento real de centros de soporte contra los umbrales de `src/lib/constants.ts` (`MIN_CENTERS_FOR_CITY_PAGE = 10`, `MIN_CENTERS_FOR_TYPE_PAGE = 5`). Este informe **no crea ni modifica** `src/data/mock-seo-pages.ts` — solo recomienda, según instrucción del proyecto; la creación de landings es competencia del integrador tras auditoría.

---

## 1. Keyword research — intención de búsqueda en Murcia

### Búsquedas genéricas (volumen probable alto, competencia de agregadores ya posicionados)

- "guarderías en murcia" / "guardería murcia"
- "escuela infantil murcia" / "escuelas infantiles murcia"
- "guarderías murcia capital"
- "centros de educación infantil murcia"

Confirmado por búsqueda: los primeros resultados actuales para estas consultas son mayoritariamente agregadores de terceros (educoland.com, tusguarderias.com, micole.net, guarderia.net, murcia10.es) y no fuentes oficiales — hay hueco para una ficha con datos verificados de fuente oficial (CARM/Ayuntamiento) que estos agregadores no citan.

### Búsquedas por servicio (intención más específica, más cercana a conversión)

- "guarderías con comedor en murcia"
- "guarderías con horario ampliado murcia" / "guardería horario flexible murcia"
- "guarderías bilingües murcia" / "escuela infantil bilingüe murcia"
- "escuela infantil inglés murcia"

Confirmado por búsqueda: existe oferta real y demanda buscada específicamente en horario ampliado (varios centros anuncian apertura 7:30-20:00/20:30) y en programas bilingües/inglés, coherente con los 5 centros del dataset con `bilingue`/`ingles` confirmado.

### Búsquedas relacionadas con la red pública municipal (señal de demanda insatisfecha)

- "escuelas infantiles municipales murcia"
- "plazas escuela infantil municipal murcia"
- "admisión escuela infantil murcia"

**Dato relevante para el enfoque SEO**: la red de 7 Escuelas Infantiles Municipales del Ayuntamiento de Murcia se declaró "completa" (plazas agotadas) para el curso 2024/2025, con 512-523 plazas ofertadas frente a una demanda que las superó, según cobertura de prensa institucional (`web.murcia.es`, `lavozdelaregion.es`, `murciaplaza.com`; ver `docs/data-sources-murcia.md`). Esto es una señal directa de demanda insatisfecha hacia la oferta privada: familias que buscan "escuela infantil municipal murcia" y no encuentran plaza son una audiencia natural para landings de guarderías privadas con comedor/horario ampliado, especialmente en pedanías donde la red municipal tiene presencia limitada (solo 5 de las 7 EMEI están fuera de la capital).

### Búsquedas por pedanía (long-tail, menor volumen individual pero relevante para SEO local)

Ejemplos con presencia real en el dataset: "guardería el palmar murcia", "escuela infantil beniaján", "guardería la alberca murcia", "guardería espinardo". El municipio de Murcia es atípico frente a Madrid/Barcelona/Valencia por su enorme extensión con pedanías semi-independientes que generan búsquedas locales propias — una familia de El Palmar no suele buscar "guardería en Murcia" sino "guardería en El Palmar", aunque administrativamente sea el mismo municipio.

---

## 2. Landings recomendadas (con recuento real de soporte)

### 2.1 Landing municipal general — RECOMENDADA, alcanza el umbral

| Landing propuesta | Filtro | Centros de soporte | Umbral (`MIN_CENTERS_FOR_CITY_PAGE`) | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-murcia` | `type=guarderia`, `city=murcia` | **38** | 10 | Indexable por volumen. Cumple ampliamente. |
| `/escuelas-infantiles-en-murcia` | `type=escuela-infantil`, `city=murcia` | **14** | 10 | Indexable por volumen. Cumple. |

Ambas superan el umbral de 10 centros con margen amplio. **Recomendación**: crear ambas landings, siguiendo la lección de la auditoría de Barcelona — no lanzarlas con contenido mínimo placeholder; incluir `sections` (2 bloques H2+párrafos) y 4-5 FAQs desde el primer commit potencialmente indexable, diferenciando explícitamente el enfoque de guardería (conciliación, horario, comedor) del de escuela-infantil (red municipal, proceso de admisión, titularidad pública).

**Matiz importante para el redactor de estas landings**: aunque hay 38+14=52 centros de soporte cuantitativo, solo 16 de ellos (30.8%) son individualmente indexables según `isCenterIndexable` (ver `docs/murcia-quality-report.md`). El listado de la landing mostrará centros con fichas todavía `noindex,follow` a nivel de detalle — esto no impide que la landing en sí sea indexable (el umbral de la landing es un recuento de centros que cumplen el filtro, no que cada ficha individual esté indexada), pero conviene que el coordinador lo tenga presente antes de solicitar indexación manual de estas dos URLs.

### 2.2 Landings de servicio a nivel municipal — NINGUNA alcanza el umbral todavía

| Landing propuesta | Filtro | Centros de soporte | Umbral (`MIN_CENTERS_FOR_TYPE_PAGE`) | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-murcia` | `service=comedor`, `type=guarderia` | 4 | 5 | **No alcanza.** Falta 1. |
| `/escuelas-infantiles-con-comedor-en-murcia` | `service=comedor`, `type=escuela-infantil` | 7 | 5 | **Alcanza.** |
| `/guarderias-bilingues-en-murcia` | `service=bilingue`, `type=guarderia` | 5 | 5 | **Alcanza (justo).** |
| `/guarderias-con-horario-ampliado-en-murcia` | `service=horario-ampliado`, `type=guarderia` | 4 | 5 | No alcanza. Falta 1. |
| `/escuelas-infantiles-con-madrugadores-en-murcia` | `service=servicio-madrugadores`, `type=escuela-infantil` | 7 | 5 | **Alcanza.** (Las 7 EMEI tienen este servicio confirmado.) |

**Recomendación**: de las landings de servicio evaluadas, solo 3 alcanzan el umbral real hoy:
1. `/escuelas-infantiles-con-comedor-en-murcia` (7 centros, todos EMEI + 0 autonómicos con comedor confirmado — en realidad son las 7 EMEI, ya que los 7 públicos autonómicos no tienen servicios verificados)
2. `/escuelas-infantiles-con-madrugadores-en-murcia` (7 centros, mismas 7 EMEI)
3. `/guarderias-bilingues-en-murcia` (5 centros, justo en el umbral — frágil: si se corrige o excluye un solo centro, deja de cumplir)

Dado que las landings 1 y 2 tendrían exactamente el mismo conjunto de 7 centros (las EMEI confirman ambos servicios de forma idéntica), **no recomendamos crear las dos por separado** — solo aportaría valor real crear una de ellas, o esperar a tener más centros privados verificados con `comedor`/`servicio-madrugadores` propio para diferenciarlas. La de bilingüe (5 centros) es viable pero frágil por estar justo en el umbral; recomendamos ampliar la verificación de webs propias de más centros privados (de los 29 sin web verificada) antes de lanzarla, para no arriesgarse a caer por debajo de 5 si se revisa algún dato.

**No recomendadas por insuficiencia clara de soporte** (menos de 5, sin margen): `horario-ampliado` en guardería (4), `cocina-propia` (4 en guardería), `psicomotricidad` (4), `actividades-extraescolares` (4), `patio-exterior` (3), `musica` (3), `verano-campamentos` (3), `orientacion-pedagogica` (3), `catering` (0), `escuela-de-padres` (0), `uniformes` (0).

### 2.3 Landings de pedanía/distrito — NO RECOMENDADAS por ahora

| Pedanía | Centros | Umbral (`MIN_CENTERS_FOR_TYPE_PAGE`) | Veredicto |
|---|---|---|---|
| La Alberca | 3 | 5 | No alcanza |
| El Palmar | 2 | 5 | No alcanza |
| Beniaján | 2 | 5 | No alcanza |
| Sangonera la Verde | 2 | 5 | No alcanza |
| Resto de pedanías | 1 cada una | 5 | No alcanza |

Ninguna pedanía alcanza individualmente el umbral de 5 centros exigido para páginas de tipo/segmento. La capital (27 centros) sí lo alcanzaría ampliamente si se creara como landing propia (`/guarderias-en-murcia-capital` o similar), pero el proyecto no tiene actualmente un concepto de "distrito"/"zona interna" para Murcia capital en el schema (`district` queda `null` en todo el dataset, ver limitación documentada en `docs/data-sources-murcia.md`), así que no es una landing viable con los datos actuales sin inventar una zonificación no verificada.

**Recomendación**: no crear landings de pedanía en esta fase. Si en una futura iteración se amplía el número de centros verificados (especialmmente en pedanías con más de un centro), reevaluar. Mientras tanto, el volumen de búsqueda long-tail por pedanía puede capturarse parcialmente mediante las fichas individuales de cada centro (que ya incluyen el nombre de la pedanía en `neighborhood_barrio`, `short_description` y FAQs) sin necesidad de una landing dedicada.

---

## 3. Resumen de recomendación de landings

| # | Landing | Centros soporte | Cumple umbral | Prioridad |
|---|---|---|---|---|
| 1 | `/guarderias-en-murcia` | 38 | Sí (≥10) | Alta |
| 2 | `/escuelas-infantiles-en-murcia` | 14 | Sí (≥10) | Alta |
| 3 | `/escuelas-infantiles-con-comedor-en-murcia` **o** `/escuelas-infantiles-con-madrugadores-en-murcia` (elegir una, mismo conjunto de centros) | 7 | Sí (≥5) | Media |
| 4 | `/guarderias-bilingues-en-murcia` | 5 | Sí, pero justo en el umbral | Baja/condicionada — verificar más centros antes de lanzar |

**Total de landings recomendadas: 2 firmes (municipal general) + 1-2 condicionadas (servicio), 0 de pedanía por ahora.**

---

## 4. Notas para el integrador

- Todas las cifras de este informe están calculadas directamente sobre `data/enrichment/murcia-centers.json` (52 centros), no son estimaciones.
- El recuento de soporte de cada landing de servicio bajará automáticamente si, tras la auditoría del coordinador, algún centro pasa de `draft` a excluido — recomendamos recalcular antes de crear cualquier landing de servicio, especialmente la de `bilingue` (justo en el umbral de 5).
- Ninguna landing ha sido creada por este agente (no se ha tocado `src/data/mock-seo-pages.ts`), conforme a la instrucción del proyecto.
