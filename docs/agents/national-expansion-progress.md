# Progreso de expansión nacional — BuscaCentro

> Este archivo es el registro de continuidad entre sesiones para la expansión de
> BuscaCentro a nuevas ciudades/provincias mediante la red de subagentes
> (`buscacentro-zone-researcher`, `buscacentro-seo-data-auditor`,
> `buscacentro-zone-integrator`). Todos los agentes deben leer este archivo antes
> de empezar y actualizarlo antes de terminar.

## Estado general

En curso. Coordinador (sesión principal, Opus) lanzó la expansión nacional de 6
zonas nuevas para llegar a 9 zonas totales (Madrid, Barcelona, Valencia + 6 nuevas).

**Decisión de arquitectura (2026-07-12):** el schema actual (`Center.address`,
`SeoPageFilters`, `MIN_CENTERS_FOR_CITY_PAGE`, sitemap) no soporta "provincia" como
unidad geográfica — solo ciudad/municipio (`citySlug`). El usuario confirmó
explícitamente: **las 6 zonas nuevas serán municipios/ciudades**, mismo patrón que
Madrid/Barcelona/Valencia. No se ejecuta ninguna migración de schema en esta
ejecución. Propuesta de migración para soportar provincias en el futuro: añadir
`province`/`provinceSlug` a `Center.address` y a la tabla `centers`, extender
`SeoPageFilters` con modo `provinceSlug` alternativo a `citySlug`, generalizar
`isSeoPageIndexableFromCenters`/sitemap para agregar por provincia. Queda como
trabajo futuro, no iniciado.

## Fase actual

Pareja 1 (Zaragoza + Murcia): CERRADA — investigada, auditada (APROBADO ambas) e
integrada. 111 centros en código, 7 landings, build limpio.

Pareja 2 (Sevilla + Palma): ambas investigaciones completadas, lanzando auditor.

## Auditoría de schema — mapeo de nombres de campos reales

Confirmado contra `src/types/center.ts`, `src/types/city.ts`,
`supabase/migrations/20260701000000_initial.sql` y `data/migrations/001_enrich_centers.sql`.
Los investigadores deben usar estos nombres reales, no los nombres genéricos:

| Campo genérico (prompt) | Campo real en el proyecto | Notas |
|---|---|---|
| `province_name` / `province_slug` | **No existe en `centers`.** Solo `cities.province` (string libre, 1 por ciudad) | No modelar provincia a nivel de centro en esta ronda |
| `opening_hours` | `schedule` (TEXT libre) | No estructurado, texto humano tipo "Lunes a viernes de 7:30 a 17:30" |
| `indexable` / `recommended_indexable` | **No existe como columna.** Se calcula en runtime vía `isCenterIndexable()` (`src/lib/centers.ts`) e `isSeoPageIndexableFromCenters()` (`src/lib/data/seo-pages.ts`) | No hay que "setear" indexabilidad, es derivada de los demás campos + umbrales `MIN_CENTERS_FOR_CITY_PAGE=10` / `MIN_CENTERS_FOR_TYPE_PAGE=5` |
| `age_min_months` / `age_max_months` | `age_min_months` / `age_max_months` (tabla) → `ageRange.minMonths`/`maxMonths` (TS) | Confirmado, coincide |
| resto de campos (`slug`, `type`, `ownership`, `status`, `city_name`, `city_slug`, `district`, `neighborhood_barrio`, `street`, `postal_code`, `latitude`, `longitude`, `phone`, `email`, `website`, `social_links`, `services`, `pedagogical_approach`, `short_description`, `long_description`, `faqs`, `source_url`, `source_urls_secondary`, `verified_at`, `verification_status`, `confidence_level`, `data_conflicts`, `is_claimed`, `is_verified`) | Confirmados, coinciden con `centers` real (ver `data/migrations/001_enrich_centers.sql` + `019_insert_valencia_centers.sql` como ejemplo de columnas completas usadas) | — |

No existe mapa (Leaflet/Mapbox/Google Maps) implementado en el proyecto todavía —
no bloquea esta expansión, pero el brief original lo mencionaba como parte del
stack y no lo es aún.

## Zonas seleccionadas

Keyword research nacional completado (2026-07-12) sobre 47 ciudades candidatas,
puntuación 0-100 según: demanda SEO 25 / centros potenciales 15 / oportunidad vs
competencia 15 / fuentes oficiales 15 / valor comercial 15 / arquitectura SEO
escalable 10 / facilidad de datos de calidad 5.

**6 zonas seleccionadas (todas municipio/ciudad, no provincia):**

| # | Ciudad | Puntos | Población aprox. | Centros 0-3 estimados | Fuente oficial principal |
|---|---|---|---|---|---|
| 1 | Zaragoza | 80 | 691.000 | 160-190 | educa.aragon.es (Educaragon) + centrosdocentes.catedu.es |
| 2 | Málaga | 78 | 592.000 | 140-170 | Registro Centros Docentes Junta de Andalucía |
| 3 | Sevilla | 77 | 688.000 | 155-185 | Registro Centros Docentes Andalucía + dataset abierto datos.gob.es |
| 4 | Murcia | 71 | 472.000 | 100-130 | portal datos abiertos regionmurcia.es (dataset específico 0-3) |
| 5 | Palma | 69 | 438.000 | 100-125 | Patronat Municipal d'Escoles d'Infants + Registre CAIB |
| 6 | Alicante | 67 | 359.000 | 75-95 | Conselleria d'Educació CV (mismo tipo de fuente que Valencia) |

**Descartada del top 6 pese a posición cercana:** Las Palmas de Gran Canaria (66,
puesto 7) y Córdoba (63, puesto 8) quedan como candidatas para una futura ronda.

**Decisión de producto documentada:** Marbella (60 pts, valor comercial máximo
15/15 por alto poder adquisitivo) quedó fuera del top 6 pese a su atractivo
comercial, porque su puntuación total es menor (menor volumen SEO, sin identidad
de distritos para landings futuras) y el criterio de selección pactado pondera
demanda SEO (25%) por encima de valor comercial (15%). Queda documentada como
alternativa de nicho para una ronda futura centrada en valor comercial en vez de
volumen.

**Ciudades excluidas explícitamente por gratuidad del sistema público** (reduce
valor comercial del modelo de leads): Vigo, A Coruña, Santiago de Compostela
(Galicia, 0-3 gratuito desde 2022), Santander (87% financiación pública en
Cantabria), San Sebastián/Vitoria-Gasteiz (Consorcio Haurreskolak en Euskadi).
**Añadido en pasada rápida posterior (2026-07-12) para la ronda de candidatas
7-14**: Oviedo y Gijón (Asturias, red "Les Escuelines/As Escolíes" gratuita desde
2024-25, primera CCAA con gratuidad 0-3→universidad) y Pamplona (Navarra, 0-3
público gratuito para todas las familias desde curso 2024-2025) — mismo motivo,
quedan fuera de cualquier ronda futura salvo cambio de criterio.

## Candidatas para una futura ronda (puestos 7-14, pasada rápida 2026-07-12)

Tras el research exhaustivo original (top 6 ya integradas) y una segunda pasada
rápida (1-2 búsquedas/ciudad, no exhaustiva) para ampliar el horizonte:

| # | Ciudad | Pts | Centros estimados | Nota |
|---|---|---|---|---|
| 7 | Las Palmas de Gran Canaria | 66 | — | Research exhaustivo original |
| 8 | Córdoba | 63 | — | Research exhaustivo original, misma fuente ya validada (Junta Andalucía) |
| 9 | Granada | 61 | ~90-100 | Pasada rápida — ciudad universitaria, sin gratuidad total |
| 10 | Castellón de la Plana | 54 | ~35-40 | Pasada rápida — mercado mixto, arquitectura hub provincia+ciudad |
| 11 | Valladolid | 53 | ~40-50 | Pasada rápida — oferta pública municipal fuerte reduce cuña comercial |
| 12 | Jerez de la Frontera | 51 | ~25-30 | Pasada rápida — menor renta media reduce valor de lead |
| 13 | Salamanca | 49 | ~25-30 | Pasada rápida — expansión reciente de plazas públicas gratuitas erosiona mercado |
| 14 | Albacete | 46 | ~30-40 | Pasada rápida — volumen bajo, oportunidad de nicho poco competida |

**Recomendación rápida para las próximas 4**: Granada → Castellón → Valladolid →
Jerez de la Frontera. Salamanca y Albacete como reserva de siguiente ola.

**Descartadas para sub-hub, no ciudad independiente** (riesgo de canibalización
con ciudad matriz ya integrada): Elche (solapa con Alicante), Sabadell/Terrassa/
Badalona (área metropolitana Barcelona), Alcalá de Henares/Getafe/Móstoles/
Leganés (0-3 gratuito en toda Madrid desde 2019, mejor como sub-página del hub
Madrid que ciudad propia).

**IMPORTANTE**: estas 8 candidatas (puestos 9-14) son de una pasada RÁPIDA, no
exhaustiva (sin verificación profunda de fuentes oficiales ni conteo real de
centros) — antes de integrar cualquiera de ellas, deben pasar por el research
exhaustivo completo vía `buscacentro-zone-researcher`, igual que se hizo con
Las Palmas/Córdoba (puestos 7-8, sí exhaustivos).

## Parejas de trabajo

Organizadas equilibrando volumen estimado de centros, complejidad de fuentes e
idioma local, evitando juntar las dos zonas más grandes/difíciles en la misma
pareja:

- **Pareja 1**: Zaragoza (160-190 centros, fuente aragonesa, castellano) +
  Murcia (100-130 centros, fuente murciana con dataset abierto explícito,
  castellano). Ambas de complejidad de fuente similar y manejable, sin lengua
  cooficial.
- **Pareja 2**: Sevilla (155-185 centros, fuente andaluza ya validada por el
  research como la mejor del estudio, castellano) + Palma (100-125 centros,
  fuente balear + municipal, término local "escoleta" a evaluar sin forzar).
  Sevilla es la más grande de las 6, se empareja con Palma (volumen medio) en vez
  de con Málaga (también grande) para no concentrar las dos ciudades más
  voluminosas en la misma pareja.
- **Pareja 3**: Málaga (140-170 centros, fuente andaluza, castellano) + Alicante
  (75-95 centros, fuente valenciana, términos "escola infantil"/"escoleta
  infantil" cooficiales — mismo tipo de tratamiento lingüístico ya usado en
  Valencia). Málaga (grande) se compensa con Alicante (la más pequeña de las 6)
  para equilibrar la carga total de la pareja.

## Agentes activos

- `buscacentro-zone-integrator` → Trío 3 (Cartagena + Albacete + Salamanca) —
  en curso (integración en código únicamente, sin publicar)

## Zonas terminadas

### Sevilla — investigación completada (2026-07-12), pendiente auditoría

- Ámbito: término municipal de Sevilla capital, filtro exacto `D_MUNICIPIO ===
  "Sevilla"` sobre fuente oficial Junta de Andalucía (218 de 2.363 filas
  andaluzas), excluye explícitamente Dos Hermanas, Mairena del Aljarafe, San Juan
  de Aznalfarache, Alcalá de Guadaíra y resto de área metropolitana. CP
  confirmados 41001-41020 + 41092 (Isla de la Cartuja).
- Dataset final: 218 centros (15 escuela-infantil pública Junta de Andalucía +
  203 guardería privada, de los cuales 174 adheridos al Programa de Ayuda a las
  Familias mapeado a `ownership: concertado`, 29 `privado`). **0 excluidos.**
- Servicios confirmados: 29/218 (13.3%) — 15 públicos (comedor) + 14 privados de
  7 cadenas con web propia verificada. 86.7% restante sin web verificable en este
  sprint, quedan `services: []`, no indexables individualmente pero con sustancia
  mínima (contacto oficial verificado).
- Landings recomendadas: `/guarderias-en-sevilla` (203), `/escuelas-infantiles-en-
  sevilla` (15), `/guarderias-con-comedor-en-sevilla` (9), `/escuelas-infantiles-
  con-comedor-en-sevilla` (15), `/guarderias-bilingues-en-sevilla` (7),
  `/guarderias-con-ingles-en-sevilla` (7). Con cautela: `/guarderias-con-patio-
  exterior-en-sevilla` (6, justo en umbral). Ninguna landing de distrito/barrio
  (máx. 3 centros por barriada, solo 17/218 con barrio documentado).
- Incidencias documentadas por el investigador (a revisar por el auditor): un
  centro (Snoopy) con error de longitud en la propia fuente oficial, coordenadas
  dejadas en null en vez de inventadas; `CenterOwnership` no tiene valor
  específico para "adherido al Programa de Ayuda a las Familias" (régimen andaluz
  propio), mapeado a `concertado` como equivalencia más cercana, documentado
  explícitamente; gabinete psicopedagógico mapeado a `orientacion-pedagogica`,
  servicio de pediatría y metodologías de marca no forzados en el enum; solo
  17/218 con `neighborhood_barrio`, ningún `district` (no hay mapeo CP→distrito
  verificable 1:1 en Sevilla); Ayuntamiento de Sevilla no gestiona red municipal
  propia (a diferencia de Zaragoza/Murcia, red pública es autonómica).
- 9 archivos entregados en rutas estándar.
- Confirmado por el investigador: sin SQL ejecutado, sin deploy, resto de
  ciudades sin tocar.

### Palma — investigación completada (2026-07-12), pendiente auditoría

- Ámbito: término municipal de Palma (capital + barrios/pedanías del mismo
  término: Son Ferriol, S'Arenal (Palma) —distinto del S'Arenal de Llucmajor—,
  Es Coll d'en Rabassa, Can Pastilla, Establiments, Es Pil·larí, Sant Jordi,
  Ciutat Jardí, Es Secar de la Real, El Terreno, Son Espanyolet). Excluye
  explícitamente Calvià, Marratxí, Llucmajor y resto de Mallorca/Baleares.
- Dataset final: 75 centros (54 guardería privada + 14 escuela-infantil pública +
  7 escuela-infantil concertada). Excluidos: 4 (2 escuelas municipales
  autorizadas pero no operativas hasta curso 2026-2027, 2 privados sin contacto
  verificable) + 1 fuente alternativa descartada documentada.
- Servicios confirmados: 18/75 (24.0%, coincide con `isCenterIndexable` real) —
  11 EIEL municipales + Verge de la Salut + 6 privados/concertados con web propia.
- Landings recomendadas: `/guarderias-en-palma` (54), `/escuelas-infantiles-en-
  palma` (21). Condicionada: `/escuelas-infantiles-con-comedor-en-palma` (12,
  alto solapamiento con la general, evaluar antes de lanzar). Ninguna landing de
  servicio en guardería ni de barrio/pedanía alcanza umbral de 5.
- Incidencias documentadas por el investigador (a revisar por el auditor): fuente
  CAIB inicial (datos abiertos) estaba corrupta/limitada a 100 filas, sustituida
  por endpoint oficial GestIB (984 centros Baleares sin paginación) — documentado
  con detalle; 3 centros sin coordenadas por geocodificación no fiable (dejados
  en null, no aproximados); edad mínima fijada en 0 meses (no 4 como Murcia) por
  falta de fuente específica; acogida matinal/tarde de 11 EIEL documentada en
  `schedule` pero NO mapeada a `servicio-madrugadores` — el investigador pide
  validación explícita del coordinador/auditor sobre este criterio; CCEI marcado
  `concertado` tras confirmar que Baleares sí tiene régimen de "conveni" propio
  para primer ciclo (a diferencia de Murcia).
- Nota del investigador: detectó cambios preexistentes en `src/data/mock-
  cities.ts` y `src/data/mock-seo-pages.ts` en el árbol de trabajo (del
  integrador de la Pareja 1, corriendo en paralelo) — confirmado que NO los leyó
  ni escribió, correctamente fuera de su alcance.
- 9 archivos entregados en rutas estándar.
- Confirmado por el investigador: sin SQL ejecutado, sin deploy, resto de
  ciudades sin tocar.

**Pareja 2 (Sevilla + Palma) — AUDITORÍA COMPLETADA (2026-07-12): PALMA APROBADA,
SEVILLA RECHAZADA (1 incidencia high).**

### Veredicto auditoría — Palma: APROBADO CON OBSERVACIONES MENORES
Incidencia `high` (P-1: omisión de `servicio-madrugadores` en las 11 EIEL
municipales pese a que `schedule` la documenta inequívocamente con fuente oficial
citada) **corregida directamente por el auditor** de forma consistente en JSON,
CSV y SQL (11/11/11 verificado). Solo quedan 2 observaciones `low` (informe de
calidad desactualizado tras la corrección; frase de apertura compartida no
bloqueante). Recuento final: 75 aprobados, 0 excluidos adicionales. CCEI
verificado correctamente como `concertado` (Baleares SÍ tiene régimen de
"conveni" propio para 0-3, confirmado con fuentes oficiales — primera CCAA en
implantarlo, fuentes citadas por el auditor). Landings aprobadas:
`/guarderias-en-palma` (54), `/escuelas-infantiles-en-palma` (21). Condicionada,
valorar antes de lanzar por solapamiento: `/escuelas-infantiles-con-comedor-en-
palma` (12). Oportunidad nueva no propuesta por el investigador tras la
corrección: `/escuelas-infantiles-con-servicio-madrugadores-en-palma` (11,
opcional a futuro).

### Veredicto auditoría — Sevilla: **RECHAZADO**
Incidencia `high` sin resolver (S-1): **174 de 218 centros privados (80%)**
adheridos al "Programa de Ayuda a las Familias" (régimen andaluz de subvención,
NO un concierto educativo) fueron mapeados por el investigador a
`ownership: concertado`. El auditor determinó que es una **misclasificación**
por tres motivos: (a) el propio contenido visible de esas 174 fichas dice
"titularidad privada", contradiciendo el badge "Concertada" que se renderizaría;
(b) Andalucía NO tiene concierto de 0-3 (verificado externamente); (c) **diverge
del precedente ya aprobado** — Zaragoza y Murcia clasificaron TODOS los privados
subvencionados o no como `privado`, sin usar `concertado`. Remediación exacta
indicada por el auditor: reclasificar los 174 `concertado → privado` en
`sevilla-centers.json`, `.csv` y `insert-sevilla-centers.sql` (filtro
`source_group="privado_adherido"`), conservando intacto el texto "adherido al
Programa de Ayuda a las Familias" en descripciones/FAQs (correcto y valioso, no
tocar). Tras la corrección: `ownership` quedaría publico:15 / privado:203,
alineado con el resto de zonas integradas.

Además 2 incidencias `medium`/`low` no bloqueantes: 14 emails con múltiples
direcciones concatenadas + 1 typo (`caramelo-sevilla`, coma en vez de punto);
frase de apertura compartida en 19 short_description (factual, no duplicado,
mejora opcional futura).

El resto del dataset de Sevilla está limpio: 1 sola coordenada null (Snoopy, la
ya señalada), 0 servicios fuera de enum, 0 duplicados reales, 218/218
short_description únicas, landings SEO con recuento correcto y no afectadas por
S-1 (no usan `ownership=concertado` como filtro).

**Decisión del coordinador: devolver Sevilla al investigador para aplicar la
corrección mecánica indicada (S-1), luego re-auditar solo esa incidencia antes de
integrar la pareja completa. No se integra Palma sola de forma desacoplada — se
mantiene la pareja unida para no fragmentar el flujo de checkpoint.**

### Corrección S-1 aplicada (2026-07-12)
El investigador de Sevilla corrigió exclusivamente la incidencia S-1: 174
registros (`source_group="privado_adherido"`) cambiados de `ownership:
"concertado"` a `"privado"` — solo ese campo, sin tocar texto de
descripciones/FAQs (la mención factual a la adhesión al Programa de Ayuda a las
Familias se mantiene). Resto del dataset (44 centros) sin tocar. Conteo final
verificado idéntico en JSON/CSV/SQL: publico:15 / privado:203 / concertado:0, 0
discrepancias slug-por-slug. También actualizó `docs/data-sources-sevilla.md`
(regla de mapeo ya rechazada) y `docs/sevilla-seo-report.md` (una landing que
usaba `ownership=concertado` como filtro, corregida a `source_group`). Limpió un
archivo de depuración accidental en la raíz del repo (ruido de su propio proceso,
no un entregable). Confirmado: sin SQL ejecutado, sin deploy, resto de ciudades
sin tocar.

**Re-auditando solo esta corrección antes de dar luz verde a integración.**

### Re-auditoría S-1 (2026-07-12): SEVILLA SIGUE RECHAZADA — nueva incidencia critical

La reclasificación de `ownership` quedó **correcta en JSON y CSV** (174/174
verificados, recuento final publico:15/privado:203/concertado:0, texto de
descripciones/FAQs intacto, 44 centros restantes sin tocar, docs coherentes,
`tsc --noEmit` limpio, Madrid/Barcelona/Valencia/Zaragoza/Murcia sin cambios
inesperados).

**Pero el find/replace del investigador rompió la sintaxis del SQL**
(`insert-sevilla-centers.sql`): en las 174 tuplas corregidas, el terminador
`'concertado'),` quedó mal sustituido por `'privado'))` (paréntesis de cierre de
más, sin la coma separadora) en vez de `'privado'),`. 173 de esas 174 tuplas
quedan sin separador respecto a la siguiente fila del `VALUES` — el archivo no
parsearía en Postgres. Clasificado como **critical** por el auditor (no
corregible de forma trivial por él, requiere tocar 174 líneas).

**Remediación exacta indicada por el auditor**: reemplazar en las 174 filas
afectadas el terminador `'draft'))` por `'draft'),`, EXCEPTO en la última fila de
la lista `VALUES` (`el-patio-pio-sevilla`), que debe terminar en `'draft')` (un
solo paréntesis, sin coma) justo antes de `ON CONFLICT (slug) DO UPDATE SET`.
Verificar después: exactamente 217 tuplas terminadas en `),` y 1 en `)`, y que el
bloque completo parsea.

Palma confirmada sin cambios, sigue con veredicto "aprobado con observaciones
menores" de la auditoría original.

**Relanzando investigador de Sevilla, tarea acotada solo a reparar el SQL (no
tocar JSON/CSV, ya correctos).**

### Reparación SQL aplicada (2026-07-12)
174 terminadores `'draft'))` corregidos: 173 → `'draft'),` (tuplas intermedias) +
1 → `'draft')` (última tupla, `el-patio-pio-sevilla`, línea 427, antes de
`ON CONFLICT`). Verificado: 217 tuplas con `),` + 1 con `)` = 218 total (coincide
con cabecera "218 centros"), paréntesis balanceados (770=770) en todo el archivo.
JSON/CSV/rollback confirmados sin tocar. Sin validador SQL real disponible en el
entorno (sin conexión a BD) — verificación por conteo estructural exacto e
inspección visual de apertura/cierre, suficiente para confirmar sintaxis válida.
Confirmado: sin SQL ejecutado, sin deploy, resto de ciudades sin tocar.

**Lanzando re-auditoría final acotada antes de integrar.**

### Veredicto final Sevilla (2026-07-12): APROBADO
Reparación del SQL verificada correcta: 217 tuplas con `),` + 1 con `)` = 218
total, paréntesis balanceados (770=770), muestreo de 6 tuplas al azar confirma
patrón exacto, 0 terminadores rotos residuales, resto del SQL intacto
(BEGIN/COMMIT/INSERT INTO cities/ON CONFLICT), JSON/CSV/rollback confirmados sin
cambios. Recuento final: 218 centros aprobados, 0 excluidos adicionales. Única
incidencia pendiente: `medium` no bloqueante (14 emails con direcciones
concatenadas, mejora futura). Madrid/Barcelona/Valencia confirmadas sin diff.

**PAREJA 2 (Sevilla + Palma) — AMBAS APROBADAS. Lanzando integrador.**

### Pareja 2 — INTEGRACIÓN COMPLETADA (2026-07-12)

- 9 landings creadas: Sevilla `guarderias-en-sevilla` (203), `escuelas-
  infantiles-en-sevilla` (15), `guarderias-con-comedor-en-sevilla` (9),
  `escuelas-infantiles-con-comedor-en-sevilla` (15), `guarderias-bilingues-en-
  sevilla` (7), `guarderias-con-ingles-en-sevilla` (7), `guarderias-con-patio-
  exterior-en-sevilla` (6). Palma: `guarderias-en-palma` (54), `escuelas-
  infantiles-en-palma` (21). Confirmado NO se crearon las landings condicionadas
  excluidas por el auditor (comedor/madrugadores en Palma, distrito/barrio en
  ninguna).
- `src/data/mock-cities.ts`: Palma añadida (Sevilla ya existía).
- `npx tsc --noEmit`, `npm run lint`: sin errores. `npm run build`: éxito, 680
  páginas (mismo nº que Pareja 1 — sin Supabase local conectado, comportamiento
  esperado hasta ejecutar el SQL en producción).
- SQL verificado consistente con datasets (Sevilla 218/218 slugs, Palma 75/75
  slugs), ambos `status='draft'`.
- `git diff`: Madrid/Barcelona/Valencia sin cambios (verificado línea por línea).

**TOTAL PAREJA 2: 293 centros integrados en código (218 Sevilla + 75 Palma), 9
landings, SQL listo para ejecución manual, nada ejecutado, nada desplegado.**

**TOTAL ACUMULADO (Parejas 1+2): 404 centros nuevos, 16 landings nuevas, 4
ciudades (Zaragoza, Murcia, Sevilla, Palma) integradas en código, ninguna
publicada en Supabase todavía.**

**Avanzando automáticamente a Pareja 3 (Málaga + Alicante), última pareja de la
expansión — sin esperar aprobación salvo decisión real de arquitectura/negocio.**

Pareja 3: Málaga completada, Alicante en curso.

**Pareja 2 (Sevilla + Palma) — INTEGRACIÓN COMPLETADA (2026-07-12).**

### Resultado integración Pareja 2
- 7 landings creadas/reemplazadas en `src/data/mock-seo-pages.ts` para Sevilla
  (`guarderias-en-sevilla` 203, `escuelas-infantiles-en-sevilla` 15,
  `guarderias-con-comedor-en-sevilla` 9, `escuelas-infantiles-con-comedor-en-
  sevilla` 15, `guarderias-bilingues-en-sevilla` 7, `guarderias-con-ingles-en-
  sevilla` 7, `guarderias-con-patio-exterior-en-sevilla` 6) + 2 landings nuevas
  para Palma (`guarderias-en-palma` 54, `escuelas-infantiles-en-palma` 21), cada
  una con `sections` (1-2 bloques H2) + FAQs propias (3-5) desde el commit
  inicial. Los 2 placeholders "en crecimiento" de Sevilla (`guarderias-en-
  sevilla`, `escuelas-infantiles-en-sevilla`) fueron reemplazados por completo,
  no duplicados. Recuentos verificados directamente contra
  `data/enrichment/sevilla-centers.json` / `palma-centers.json` antes de
  escribir cada landing: coinciden exactamente con los aprobados por el
  auditor. NO se creó `escuelas-infantiles-con-comedor-en-palma` (12,
  condicionada) ni landing de `servicio-madrugadores` en Palma (11), conforme
  a instrucción explícita.
- `src/data/mock-cities.ts`: Palma añadida (`isFeatured: true`, mismo patrón
  que Zaragoza/Murcia). Sevilla ya existía de una ronda anterior, sin cambios
  necesarios en esa entrada.
- SQL revisado (no regenerado, ya consistente tras la reparación del auditor):
  `insert-sevilla-centers.sql` (218 filas, 217 tuplas `),` + 1 `)`, paréntesis
  balanceados 770=770, slugs 218/218 coinciden con el JSON, 0 `concertado`
  residual) + `rollback-sevilla-centers.sql` (218 slugs). `insert-palma-
  centers.sql` (75 filas, slugs 75/75 coinciden con el JSON, 11 menciones de
  `servicio-madrugadores` confirmadas) + `rollback-palma-centers.sql` (75
  slugs). Ambos `status='draft'`, sin ejecutar.
- `/guarderias`, `/escuelas-infantiles`, sitemap.ts confirmados dinámicos/city-
  aware por diseño (iteran `getCities()` + `getSeoPageBySlug` /
  `getAllSeoPages()` + `getCenters()`), sin cambios de código necesarios.
- `npx tsc --noEmit`: sin errores. `npm run lint`: sin errores. `npm run
  build`: éxito, 680 páginas generadas (mismo número que Pareja 1, ya que sin
  Supabase conectado localmente `getCenters()` cae al mock reducido — Sevilla/
  Palma reales solo se materializarán tras ejecutar el SQL en Supabase).
- `git diff` verificado línea por línea (rangos de hunk confirmados con
  offsets): únicas modificaciones son los 2 placeholders de Sevilla
  reemplazados y el bloque nuevo añadido al final del archivo; Madrid,
  Barcelona y Valencia sin ninguna línea añadida/modificada/eliminada
  (las únicas coincidencias textuales de "Madrid"/"Barcelona"/"Valencia" en el
  diff son menciones comparativas dentro del contenido nuevo de Sevilla/
  Zaragoza, no ediciones a esas ciudades).
- No se ha ejecutado SQL. No se ha hecho deploy. No se ha activado indexación.

**TOTAL PAREJA 2: 293 centros integrados en código (218 Sevilla + 75 Palma), 9
landings (7 nuevas/reemplazadas Sevilla + 2 nuevas Palma), SQL listo para
ejecución manual, nada ejecutado, nada desplegado.**

### Málaga — investigación completada (2026-07-12), pendiente auditoría

- Ámbito: término municipal de Málaga capital, `D_MUNICIPIO === "Málaga"` sobre
  fuente oficial Junta de Andalucía, excluye los 66 municipios restantes de la
  provincia (Torremolinos, Benalmádena, Alhaurín de la Torre, Marbella, Mijas,
  Fuengirola, Vélez-Málaga, etc.).
- Dataset final: 152 centros. 0 excluidos del listado oficial (todos superaron
  gate mínimo). 1 incidencia documentada aparte: "Escuela Municipal Infantil
  Colores de Málaga" mencionada en fuente municipal pero sin código de centro ni
  contacto verificable en el CSV oficial — no incluida en ningún dataset,
  documentada como pista de enriquecimiento futuro.
- Servicios confirmados: 20/152 (13.2%). Indexables: 25/152 (16.4%).
- **Lección de Sevilla aplicada correctamente y con creces**: 0 centros con
  `ownership: concertado` en todo el dataset. El investigador detectó
  proactivamente que 4 de las 10 filas marcadas "Público" en la fuente oficial
  cruda eran en realidad privados con financiación parcial (Novaschool x2, 5
  Chupetes x2) — verificados individualmente en su propia web y reclasificados a
  `privado`. Incluso un centro que se autodenomina "concertado" en su propio
  marketing (Pequeño Picasso) fue clasificado correctamente como `privado` tras
  verificar que es adhesión a programa de ayudas, no concierto formal. Solo 6/152
  confirmados como titularidad pública genuina.
- Landings recomendadas: `/guarderias-en-malaga` (146). Servicio: comedor (15),
  horario-ampliado (11), verano-campamentos (10), ingles (9),
  orientacion-pedagogica (7). En el límite: uniformes (6), cocina-propia (5),
  psicomotricidad (5). NO recomendada: escuelas-infantiles-en-malaga (solo 6,
  bajo umbral 10), bilingües (solo 2), ninguna de distrito/barrio (0 centros con
  `district` estructurado pese a fuerte identidad de búsqueda por distrito en
  Málaga — brecha documentada para futuro enriquecimiento).
- 9 archivos entregados en rutas estándar.
- Confirmado por el investigador: sin SQL ejecutado, sin deploy, resto de
  ciudades sin tocar.

### Alicante — investigación completada (2026-07-12), pendiente auditoría

- Ámbito: municipio de Alicante capital, `localidad === "ALACANT"` sobre fuente
  oficial Generalitat Valenciana, excluye San Vicente del Raspeig, El Campello,
  Sant Joan d'Alacant y resto de área metropolitana.
- Dataset final: 37 centros (5 públicos: 3 Generalitat + 2 municipales Patronato
  Municipal de Educación Infantil; 32 privados). **0 excluidos** (100% con
  teléfono y coordenadas de fuente oficial).
- Servicios confirmados: 21/37 (56.8%, mismo % que indexables).
- Landings recomendadas: `/guarderias-en-alicante` (32). Servicio: bilingües
  (11), horario-ampliado (9), comedor (7), cocina-propia (7, valorar fusión con
  comedor). NO recomendada `/escuelas-infantiles-en-alicante` (solo 5, bajo
  umbral 10 — oferta pública de primer ciclo reducida en Alicante, resultado
  honesto no forzado). Ninguna landing de distrito/barrio (0 centros con zona
  confirmada en fuente oficial).
- Incidencias documentadas por el investigador: 4 privados con web mencionada por
  terceros pero error HTTP/DNS al verificar directamente — dejados sin
  `services` en vez de usar fuente secundaria no primaria; 0 centros con
  `district`/`neighborhood_barrio` (sin callejero oficial verificable); 2 centros
  con discrepancia menor de dirección exacta entre Generalitat y fuente
  secundaria, documentada en notes_internal; 1 long_description algo corta
  (424 caracteres) por falta de dato adicional confirmado, no rellenada
  artificialmente.
- 9 archivos entregados en rutas estándar.
- Confirmado por el investigador: sin SQL ejecutado, sin deploy, resto de
  ciudades sin tocar.

**Pareja 3 (Málaga + Alicante) completa — última pareja de la expansión.
Lanzando auditor, con atención reforzada a verificación de sintaxis SQL (lección
del incidente de Sevilla) y confirmación de que 0 centros usan `ownership:
concertado` incorrectamente en ambas zonas.**

### Veredicto auditoría — Málaga: APROBADO CON OBSERVACIONES MENORES
Ownership: 0 `concertado` confirmado (146 privado, 6 público) — lección de
Sevilla aplicada correctamente desde el origen. Las 4 reclasificaciones
Público→privado (Novaschool x2, 5 Chupetes x2) verificadas independientemente por
el auditor con fuentes externas (CIF de empresa privada, cuota €300-700/mes) —
correctas. SQL verificado con 35 valores/tupla en el 100% de las 152 filas —
**el fallo de sintaxis de Sevilla NO se reproduce aquí**. Única incidencia
`medium` (M1): 11 centros con campo `email` "sucio" (múltiples correos
concatenados, 1 truncado) — no bloqueante pero el auditor recomienda corregirlo
antes del INSERT para no publicar `mailto:`/JSON-LD inválidos. Otras 2 `medium`
no bloqueantes (apertura de frase compartida en 26 centros, `data_conflicts` no
poblado pese a tener el razonamiento documentado en quality report). 152/152
aprobados, 0 excluidos adicionales.

### Veredicto auditoría — Alicante: APROBADO
Sin incidencias `critical`/`high`/`medium` bloqueantes. Ámbito geográfico
impecable (0 contaminación de municipios vecinos, verificado por el auditor).
`ownership`: 0 `concertado` (32 privado, 5 público). Landing de escuela-infantil
correctamente NO recomendada (5 centros reales, bajo umbral, resultado honesto
verificado). 37/37 aprobados, 0 excluidos adicionales. Solo 2 observaciones
`low`/`medium` no bloqueantes (trazabilidad de `data_conflicts`, confidence_level
ligeramente optimista en 4 centros sin servicios verificados).

**Aplicando corrección mecánica M1 (emails Málaga) antes de integrar.**

### Corrección M1 aplicada (2026-07-12)
11 emails corregidos en Málaga (formato: primer email válido, trim; caso especial
`maypi-malaga` usa el valor verificado externamente por el auditor
`maypi.s.l.1@gmail.com`, no el truncado). El investigador detectó y corrigió
también una duplicación del mismo problema dentro del texto de las FAQs (10/11
centros), no solo en el campo estructurado — captura extra no pedida
explícitamente pero correcta para consistencia interna. Verificado: JSON válido,
CSV 152 filas/19 columnas, SQL 152 tuplas con paréntesis balanceados (171=171),
0 patrones de email sucio residuales en todo el archivo (verificado con regex
genérico, no solo los 11 casos conocidos). 141 centros restantes sin tocar.
Confirmado: sin SQL ejecutado, sin deploy, resto de ciudades sin tocar.

**PAREJA 3 (Málaga + Alicante) — AMBAS APROBADAS (Málaga con corrección M1 ya
aplicada). Lanzando integrador — última pareja de la expansión.**

### Pareja 3 — INTEGRACIÓN COMPLETADA (2026-07-12)

- 14 landings creadas: Málaga `guarderias-en-malaga` (152), comedor (15),
  horario-ampliado (11), ingles (9), verano-campamentos (10),
  orientacion-pedagogica (7), uniforme (6), cocina-propia (5), psicomotricidad
  (5). Alicante: `guarderias-en-alicante` (37), bilingues (11),
  horario-ampliado (9), comedor (7), cocina-propia (7, verificado solapamiento
  bajo — solo 3/7 coinciden, conjuntos suficientemente distintos, ambas creadas).
- **Hallazgo propio del integrador, corregido sin forzar landing rechazada**:
  detectó que el placeholder preexistente `escuelas-infantiles-en-malaga` (6
  centros, bajo umbral) se habría vuelto indexable automáticamente al ejecutar el
  SQL, porque el gate de "página de ciudad pura" compara el TOTAL de centros de
  la ciudad (152) contra el umbral, no el recuento del tipo específico (6).
  Marcó esa entrada como `disabled: true` (campo ya soportado, documentado) en
  vez de forzar la landing que el auditor había rechazado explícitamente. No tocó
  la función compartida de indexabilidad (afectaría a todas las ciudades).
- `src/data/mock-cities.ts`: Alicante pasada a `isFeatured: true` (Málaga ya lo
  estaba desde el scaffold original).
- `npx tsc --noEmit`, `npm run lint`: sin errores. `npm run build`: éxito, 680
  páginas.
- SQL verificado con script (no solo confiado al informe): Málaga 152 tuplas,
  paréntesis balanceados 478=478, 0 `ownership='concertado'` real. Alicante 37
  tuplas, 188=188. Ambos `status='draft'`.
- Madrid/Barcelona/Valencia verificadas con comparación byte a byte de sus 28
  entradas en `mock-seo-pages.ts`: idénticas antes y después.

**TOTAL PAREJA 3: 189 centros integrados en código (152 Málaga + 37 Alicante), 14
landings, SQL listo para ejecución manual.**

## EXPANSIÓN NACIONAL — 6 ZONAS NUEVAS COMPLETADAS (2026-07-12)

**TOTAL ACUMULADO: 593 centros nuevos (111 + 293 + 189), 37 landings nuevas (7 +
9 + 14 + 7 landings generales de ciudad ya contadas dentro de esos totales),
6 ciudades integradas en código (Zaragoza, Murcia, Sevilla, Palma, Málaga,
Alicante). Sumando Madrid, Barcelona y Valencia: 9 zonas totales del proyecto.
Ningún SQL ejecutado, ningún deploy, ninguna variable de producción tocada.**

**Validación técnica final consolidada (2026-07-12): `npx tsc --noEmit` limpio,
`npm run lint` limpio, `npm run build` éxito (680 páginas, incluye 27 landings
`/[slug]` + 619 fichas `/centro/[slug]`). `git diff` verificado independientemente
por el coordinador (no solo confiado a los agentes): 0 líneas que mencionen
Madrid/Barcelona/Valencia en los diffs de `mock-cities.ts` y `mock-seo-pages.ts`.
Solo 3 archivos tracked modificados en todo el proyecto (`.gitignore`,
`mock-cities.ts`, `mock-seo-pages.ts`); el resto son 60 archivos nuevos sin
trackear (9 por zona × 6 zonas + 6 archivos de docs/agents). EXPANSIÓN DE 6 ZONAS
CERRADA CON ÉXITO.**

**CAMBIO DE ORGANIZACIÓN PARA LA PRÓXIMA RONDA (2026-07-12)**: el usuario pidió
explícitamente pasar de parejas (2 investigadores simultáneos) a **tríos (3
investigadores simultáneos)** para la siguiente tanda de 6 zonas. Esto duplica el
paralelismo de investigación; el resto del flujo (auditoría, integración) se
adapta en consecuencia — el auditor deberá revisar 3 zonas a la vez en vez de 2.

### Research exhaustivo Granada/Castellón/Valladolid/Jerez COMPLETADO (2026-07-12)

**HALLAZGO CRÍTICO que requiere decisión del usuario antes de confirmar lista de
6**: las 4 candidatas tienen riesgo de gratuidad del sistema público 0-3 años, el
mismo patrón que ya descartó Galicia/Cantabria/Euskadi/Asturias/Navarra en el
research original — pero en 2 de los 4 casos (Valladolid: Castilla y León,
gratuidad TOTAL ya vigente desde curso 2024-25; Castellón: Comunidad Valenciana,
gratuidad universal ya vigente desde 2024-25, listados de mercado ya muestran
precios en 0€) el riesgo está **totalmente consumado**, no en fase de
implementación. Granada y Jerez (Andalucía, Decreto 76/2025) tienen gratuidad
**progresiva**, con cobertura parcial (67.000 niños en 2025-26, 93,4% en
2026-27) — persiste algo de valor comercial residual en comedor/horario
ampliado.

**Puntuación final (0-100):**

| # | Ciudad | Pts | Centros est. | Riesgo gratuidad |
|---|---|---|---|---|
| 1 | Granada | 74 | 35-45 | Progresiva (Andalucía, Decreto 76/2025) |
| 2 | Valladolid | 71 | 40-52 | **TOTAL, ya consumada** (Castilla y León, 2024-25) |
| 3 | Jerez de la Frontera | 58 | 20-28 | Progresiva (Andalucía) + renta muy baja/paro muy alto |
| 4 | Castellón de la Plana | 53 | 20-28 | **Universal, ya consumada** (Com. Valenciana, 2024-25) |

**Recomendación del research**: Granada y Valladolid sí entrarían (mejor
equilibrio pese al riesgo); Jerez dudosa (valor comercial estructuralmente débil,
independiente del SEO); Castellón no recomendada (candidata más débil en casi
todos los criterios, gratuidad ya consumada Y visible en pricing de mercado real).

Nota de contexto: Valencia y Alicante ya están integradas pese a tener sus
propias políticas de bonificación parcial de la Comunidad Valenciana — el
research señala que el criterio de "descartar por gratuidad" ya se toleró
parcialmente ahí, lo cual es relevante para decidir si aplicar el mismo rasero
aquí o no.

**DECISIÓN DEL USUARIO (2026-07-12): lista de 6 confirmada tal cual**, aceptando
el riesgo de gratuidad en 4 de las 6 (mismo criterio ya tolerado parcialmente con
Valencia/Alicante). Los investigadores de Valladolid y Castellón (gratuidad ya
consumada) deberán priorizar en su keyword research y contenido las verticales
NO gratuitas (comedor, horario ampliado, bilingüe/inglés, oferta privada de alta
gama) en vez del ángulo genérico "comparar precio de guardería".

## RONDA 2 — 6 zonas nuevas confirmadas: Las Palmas, Córdoba, Granada,
## Valladolid, Jerez de la Frontera, Castellón de la Plana

**Organización en TRÍOS** (cambio explícito del usuario: de parejas de 2 a tríos
de 3 investigadores simultáneos para esta ronda):

- **Trío 1**: Las Palmas de Gran Canaria + Córdoba + Granada
- **Trío 2**: Valladolid + Jerez de la Frontera + Castellón de la Plana

El auditor revisará 3 zonas a la vez en vez de 2 por trío. El resto del flujo
(investigar → auditar → corregir si hace falta → integrar → siguiente trío) se
mantiene igual que en la Ronda 1.

### Trío 1 (Las Palmas + Córdoba + Granada): investigación en curso

3 instancias de `buscacentro-zone-researcher` lanzadas en paralelo. Instrucciones
reforzadas: Córdoba y Granada recibieron explícitamente la lección de Sevilla
sobre NO mapear adhesión a programa de subvención andaluza a `ownership:
concertado`. Granada recibió además contexto del riesgo de gratuidad progresiva
(Decreto 76/2025) para priorizar en su keyword research las verticales con
valor comercial persistente (comedor, horario ampliado, bilingüe/inglés).

**Córdoba — completada (2026-07-12), pendiente auditoría.** Ámbito: filtro
`D_MUNICIPIO === "Córdoba"`, excluye explícitamente los ~74 municipios
restantes de la provincia (incluidos los que comparten parte del nombre:
Priego de Córdoba, Villanueva de Córdoba, etc.). Dataset final: 129 centros
(116 privado + 13 público), **0 excluidos**. **0 `concertado`** — manejó
correctamente 2 casos de titularidad pública no obvia: Cigüeña Blanca (Entidad
Local Autónoma de Encinarejo, núcleo perteneciente a Córdoba desde 1957) y
Cerro Muriano (Ministerio de Defensa, gestión delegada en empresa privada
Kidsco Balance S.L. pero titularidad pública real) — ambos documentados con
el matiz explícito en fuentes/quality report/FAQs. Servicios confirmados:
16/129 (12.4%). Indexables: 29/129 (22.5%). Landings recomendadas:
`/guarderias-en-cordoba` (116), `/escuelas-infantiles-en-cordoba` (13, supera
umbral 10 — a diferencia de Málaga), `/guarderias-con-comedor-en-cordoba` (12),
`/guarderias-con-ingles-en-cordoba` (11), `/guarderias-con-horario-ampliado-en-
cordoba` (9). En el límite a vigilar: madrugadores (6), música (6),
psicomotricidad (6), bilingüe (5), patio-exterior (5). NO recomendada ninguna
de distrito/barrio (0/129 con `district`). 9 archivos entregados. Confirmado:
sin SQL ejecutado, sin deploy, resto de ciudades sin tocar.

**Trío 1 (Las Palmas + Córdoba + Granada) completo — lanzando auditor.**

### Veredicto auditoría Trío 1 (2026-07-12): LAS 3 APROBADAS CON OBSERVACIONES MENORES

Ninguna incidencia `critical`/`high` en ninguna de las 3 zonas — solo 4
observaciones `low` (aperturas de frase compartidas, infra-etiquetado de
comedor en redes públicas de Córdoba/Granada, inconsistencia de campo interno
no-schema, 1 URL de trazabilidad faltante). Ninguna requiere corrección para
aprobar.

**Puntos de atención verificados y confirmados correctos**:
- Las Palmas: Marpe Infantil y Los Jaimitos mantienen `privado` en 0-3 pese a
  concierto en otras etapas del mismo colegio — correcto, verificado en web
  propia de cada centro (concierto solo aplica a Primaria/Secundaria).
- Córdoba: Cigüeña Blanca (ELA Encinarejo) y Cerro Muriano (Defensa, gestión
  delegada en empresa privada Kidsco) mantienen `publico` — correcto, titularidad
  pública real verificada externamente, distinto del patrón de riesgo Sevilla.
- Granada: 4 privados con concierto en etapas posteriores mantienen `privado`
  en 0-3 — correcto, mismo patrón que Las Palmas.
- **0 colisiones de slug** verificadas entre las 3 zonas nuevas Y contra las 9
  zonas ya integradas (1015+204 slugs comprobados por el auditor).
- **Sintaxis SQL de Córdoba (129 filas) verificada limpia** — el incidente de
  Sevilla no se repite en ninguna de las 3.

**Recuento final**: Las Palmas 37 aprobados/3 excluidos, Córdoba 129/0, Granada
60/0. Total: **226 centros aprobados**, 0 exclusiones adicionales del auditor.

**Landings aprobadas**: Las Palmas (7), Córdoba (5 firmes + 5 en el límite a
vigilar), Granada (4). Nota del auditor: las 3 zonas aún no están cableadas al
frontend mock — correcto y esperado, es tarea del integrador siguiente.

**Lanzando integrador — Trío 1.**

### Trío 1 — INTEGRACIÓN COMPLETADA (2026-07-12)

- 16 landings creadas: Las Palmas (7), Córdoba (5, sin las 5 "en el límite"
  marcadas por el auditor), Granada (4). Todas con `sections` + FAQs completas
  desde el primer commit.
- `src/data/mock-cities.ts`: 3 ciudades añadidas (`las-palmas-de-gran-canaria`,
  `cordoba`, `granada`), cambio puramente aditivo.
- `npx tsc --noEmit`, `npm run lint`: sin errores. `npm run build`: éxito, 680
  páginas (mismo patrón que rondas anteriores — sin Supabase local, se
  materializan tras ejecutar el SQL).
- SQL de Córdoba (129 filas) re-verificado sintácticamente correcto por el
  integrador antes de darlo por bueno.
- `git diff`: Madrid/Barcelona/Valencia sin cambios.

**TOTAL TRÍO 1: 226 centros integrados en código (37+129+60), 16 landings, SQL
listo para ejecución manual.**

**Avanzando automáticamente a Trío 2 (Valladolid + Jerez de la Frontera +
Castellón de la Plana), última tanda de la Ronda 2 — sin esperar aprobación
salvo decisión real de arquitectura/negocio. Investigadores de Valladolid y
Castellón recibirán instrucción explícita de priorizar verticales no gratuitas
(comedor, horario ampliado, bilingüe/internacional) dado el riesgo de
gratuidad ya consumada detectado en el research previo.**

### Trío 2 (Valladolid + Jerez + Castellón): investigación en curso

**Valladolid — completada (2026-07-12), pendiente auditoría.** Ámbito:
`refine.municipio=VALLADOLID` (campo estructurado), excluye resto de la
provincia. Dataset final: 42 centros (13 escuela-infantil pública + 29
guardería privada). Excluidos: 4 (3 sin contacto verificable, 1 —Santa
Catalina— por prudencia ante concierto declarado pero no verificable para el
tramo 0-3). **0 `concertado`** — confirma el hallazgo del research: Castilla y
León NO tiene concierto formal de 0-3, es subvención directa (Orden EDU/95/2022).
Detectó y documentó correctamente 2 redes públicas distintas (2 autonómica
genuina + 11 municipales Ayuntamiento de Valladolid), ambas `publico`. Servicios
confirmados: 23/42 (54.8%). Landings recomendadas: `/guarderias-en-valladolid`
(29), `/escuelas-infantiles-en-valladolid` (13), ingles (6, prioridad alta por
contexto comercial), comedor guardería (6), cocina-propia (5, límite), comedor
escuela-infantil (12), servicio-madrugadores escuela-infantil (11). NO pudo
recomendar bilingüe ni horario-ampliado (solo 2 cada una) pese a ser las
verticales de mayor prioridad dada — documentado como brecha de verificación,
no como ausencia real de esos servicios. Incidencia a revisar por el auditor:
discrepancia entre fuente municipal de 2017-18 (sugiere titularidad pública vía
convenio) y registro oficial vigente (marca como privados) para 2 centros —
investigador mantuvo el dato del registro vigente, documentando la discrepancia
sin resolverla unilateralmente. 9 archivos entregados. Confirmado: sin SQL
ejecutado, sin deploy, resto de ciudades sin tocar.

**Trío 2 (Valladolid + Jerez + Castellón) completo — lanzando auditor.**

### Veredicto auditoría Trío 2 (2026-07-12)

**Valladolid: APROBADO CON OBSERVACIONES MENORES.** 42/42 aprobados. Única
observación V1 (`medium`, no bloqueante): coordenada de 1 centro
(el-despertador-infantil-2010) errónea en la propia fuente oficial JCyL
(~18km fuera del municipio), dirección/CP/municipio correctos — corrección de
coordenada sugerida, no bloqueante. Resto de decisiones del investigador
(exclusión de Santa Catalina, 0 concertado, separación de 2 redes públicas,
Pajarillos/Maestro Claudio López) confirmadas correctas.

**Jerez de la Frontera: APROBADO CON OBSERVACIONES MENORES.** 37/37 aprobados.
Solo observaciones `medium`/`low` no bloqueantes (apertura de frase compartida
en 8 centros, mitigado porque esos 7 son noindex). Decisión sobre Luna de
Caramelo confirmada correcta, servicios bajos confirmados como limitación real
de datos (no búsqueda insuficiente), 3 centros con teléfono compartido
confirmados como distintos.

**Castellón de la Plana: RECHAZADO inicialmente — 1 incidencia `high`.** Centro
`iep-bebes-castellon-de-la-plana` afirmaba en su contenido indexable que sus
servicios bilingüe/inglés estaban "confirmados en su web oficial" cuando esa
web nunca se verificó (falló por DNS) — afirmación de fuente falsa en contenido
público. El auditor verificó independientemente que el dato SÍ es cierto (el
centro migró a `international-english-school-castellon.dukeseducation.es`,
confirmado con inmersión en inglés desde 1 año) — el problema era la fuente
citada, no el dato en sí. Recomendó corregir el texto + añadir la URL real a
`source_urls_secondary` (opción preferida, dato verídico) en vez de eliminar el
servicio. 0 impacto en landings en cualquier caso (ingles/bilingue siguen ≥5
sin ese centro).

**Aplicando corrección C1 (Castellón) antes de integrar el trío completo.**

### Corrección C1 aplicada (2026-07-12)
`iep-bebes-castellon-de-la-plana` corregido en los 3 artefactos
(JSON/CSV/SQL): `source_urls_secondary` ahora referencia la URL real
verificada, `short_description`/`long_description`/FAQ reescritas para que la
afirmación de verificación esté respaldada por esa fuente. Buen criterio
adicional del investigador: evitó decir "inmersión total" (la fuente real habla
de "exposición diaria" bilingüe, más precisa) para no introducir una nueva
imprecisión al corregir la anterior; detectó y revirtió un error propio al
editar `castellon-quality-report.md` (había alterado conteos que en realidad
no debían cambiar). SQL verificado con 27 tuplas, paréntesis balanceados (el
falso desbalance inicial detectado era un apóstrofe sin escapar en un
comentario preexistente, no relacionado con la corrección). Resto de los 26
centros confirmado sin tocar. Confirmado: sin SQL ejecutado, sin deploy, resto
de ciudades sin tocar.

**Lanzando re-auditoría final acotada del Trío 2 antes de integrar.**

### Veredicto final Trío 2 (2026-07-12): LAS 3 APROBADAS

**Castellón: APROBADO.** Corrección C1 verificada correcta contra la fuente
primaria (auditor accedió él mismo a la URL). Servicios intactos, JSON/CSV/SQL
consistentes (27=27=27 slugs), SQL con paréntesis balanceados (el aparente
desbalance eran apóstrofes sin escapar en comentarios de cabecera preexistentes,
no relacionado). 26 centros restantes confirmados sin tocar. 1 observación
`low` nueva no bloqueante (2 centros con `cocina-propia` pero sin `comedor`
explícito pese a que su FAQ lo menciona — granularidad del enum, no dato
inventado). Valladolid y Jerez confirmados sin verse afectados por esta
corrección puntual.

**Recuento final Trío 2**: Valladolid 42/42, Jerez 37/37, Castellón 27/27.
**Total: 106 centros aprobados**, 0 exclusiones adicionales del auditor.

**Lanzando integrador — Trío 2, última tanda de toda la expansión nacional.**

### Trío 2 — INTEGRACIÓN COMPLETADA (2026-07-12) — ÚLTIMA DE TODA LA EXPANSIÓN

- 14 landings creadas: Valladolid (7), Jerez (1, con `sections`+FAQs completas
  pese a ser la única), Castellón (6). El integrador corrigió un detalle del
  coordinador: usó `bilingue` (7 centros reales) como filtro correcto en vez de
  `ingles`, verificado directamente contra el JSON.
- `src/data/mock-cities.ts`: 3 ciudades añadidas (`valladolid`,
  `jerez-de-la-frontera`, `castellon-de-la-plana`).
- `npx tsc --noEmit`, `npm run lint`: sin errores. `npm run build`: éxito, 680
  páginas.
- SQL de las 3 zonas re-verificado estructuralmente por el integrador (no solo
  confiado al auditor): tuplas=JSON en las 3 (42/37/27), slugs idénticos, 35
  columnas, sin sentencias destructivas.
- **0 colisiones de slug verificadas entre las 3 zonas nuevas y las 12 ya
  integradas (925 slugs comprobados).**
- Madrid/Barcelona/Valencia verificadas con comparación byte a byte (no solo
  `git diff`): identidad confirmada en sus 3 objetos de ciudad + todas sus
  landings.

**TOTAL TRÍO 2: 106 centros integrados en código (42+37+27), 14 landings.**

## RONDA 2 — 6 ZONAS NUEVAS COMPLETADAS (2026-07-12)

**TOTAL RONDA 2: 332 centros nuevos (226 Trío 1 + 106 Trío 2), 30 landings
nuevas (16 + 14), 6 ciudades integradas (Las Palmas, Córdoba, Granada,
Valladolid, Jerez, Castellón).**

## EXPANSIÓN NACIONAL COMPLETA — 15 ZONAS TOTALES

**Madrid + Barcelona + Valencia (preexistentes) + 6 zonas Ronda 1 (Zaragoza,
Murcia, Sevilla, Palma, Málaga, Alicante) + 6 zonas Ronda 2 (Las Palmas,
Córdoba, Granada, Valladolid, Jerez, Castellón) = 15 zonas.**

**TOTAL ACUMULADO Rondas 1+2: 925 centros nuevos, 67 landings nuevas. Ningún
SQL ejecutado, ningún deploy, ninguna variable de producción tocada. Madrid,
Barcelona y Valencia protegidas en todo momento (verificado independientemente
en cada pareja/trío, nunca solo confiado a los agentes).**

Validación técnica final e informe de Ronda 2 entregados (ver secciones
anteriores). Expansión de 12 zonas nuevas (925 centros, 61 landings) cerrada.

## RONDA 3 — Research exhaustivo completado, PENDIENTE confirmación del usuario

El usuario pidió generar 3 ciudades nuevas mientras se espera acceso MCP a
Search Console (para medir antes de publicar las 15 zonas ya integradas — nada
de Ronda 1/2 se publica todavía, sigue en `status='draft'`). Se lanzó research
exhaustivo sobre Salamanca, Albacete y una tercera candidata a elegir con
criterio (Cartagena, seleccionada tras descartar Toledo por menor población).

**Puntuación (0-100), research exhaustivo real (no pasada rápida):**

| # | Ciudad | Pts | Centros est. | Riesgo gratuidad |
|---|---|---|---|---|
| 1 | **Cartagena** (Murcia) | 76 | 24-26 | Parcial-bajo: solo 2-3 años, red municipal insuficiente (918 plazas/222k hab.), mismo marco ya validado con éxito en Murcia capital |
| 2 | **Albacete** | 68 | 30-40 | Parcial-medio: solo 2-3 años, solo red municipal, calendario hasta 2026-27, deja 0-2 años y todo el privado no adherido como mercado pleno |
| 3 | **Salamanca** | 56 | 25-35 | **Alto**: gratuidad TOTAL 0-3 ya consolidada desde 2024-25 (mismo patrón que ya descartó Galicia/Asturias/Euskadi/Navarra) + competencia SEO ya organizada (rankings anuales de prensa local) |

Cartagena resultó mejor candidata que las 2 originales de la lista de reserva
(puestos 13-14 de la pasada rápida) — mayor población (222.559 hab., más grande
que Córdoba/Valladolid/Jerez/Castellón, ya integradas), fuente municipal con
datos estructurados excepcionalmente accesibles, arquitectura de
barrios/pedanías con identidad SEO propia fuerte (Barrio Peral, La Concepción,
Los Dolores, etc.), y riesgo regulatorio ya conocido y validado operativamente
(mismo marco que Murcia capital).

**Nota de contexto relevante para el criterio de selección futuro**: el research
señala que la gratuidad 0-3 se está extendiendo incluso en CCAA antes
consideradas "seguras" (Andalucía anuncia 1-2 años gratis desde 2026-27,
Extremadura y Castilla-La Mancha avanzan con ayudas crecientes) — el criterio
de riesgo debería evaluarse cada vez más por grado/alcance (qué tramo de edad,
qué tipo de centro) en vez de sí/no binario.

**DECISIÓN DEL USUARIO (2026-07-12): confirmadas las 3 tal cual — Cartagena,
Albacete, Salamanca.** Lanzando investigación de centros en trío (formato ya
establecido). Nota: el usuario decidió NO publicar (SQL a `status='published'`)
ninguna de las 12 zonas de Rondas 1-2 hasta tener acceso MCP a Search Console y
observar qué tipo de landing/contenido está funcionando en Madrid/Barcelona/
Valencia — la investigación de Cartagena/Albacete/Salamanca avanza en paralelo
sin bloquear esa decisión, ya que investigar/auditar/integrar en código no
implica publicar.

### Trío 3 (Cartagena + Albacete + Salamanca): investigación en curso

**Cartagena — completada (2026-07-12), pendiente auditoría.** Ámbito: término
municipal completo (casco urbano + pedanías con vida administrativa propia:
Barrio Peral, La Concepción, Los Dolores, La Palma, Villalba, Pozo Estrecho, La
Aljorra, El Algar, Vista Alegre, Los Mateos). Dataset final: 17 centros (11
escuela-infantil pública EEIIMM municipal + 6 guardería privada). Excluidos: 5
(2 confirmados segundo ciclo 3-6 con fuente propia; 2 sin confirmación oficial
de ciclo por no figurar en listado municipal de las 11 EEIIMM; 1 apertura muy
reciente sin ficha verificable). **Incidencia manejada bien**: a diferencia de
Murcia, el campo `tipo` de la fuente CARM no distingue fiablemente primer/
segundo ciclo en Cartagena — resuelto contrastando cada candidato contra el
listado oficial municipal. Servicios confirmados: 13/17 (76.5%, muy superior al
30.8% de Murcia gracias a que el Ayuntamiento documenta servicios homogéneos
para las 11 municipales). **Hallazgo relevante que contradice la intuición
inicial**: `/escuelas-infantiles-en-cartagena` SÍ alcanza umbral (11), pero
**`/guarderias-en-cartagena` NO alcanza el umbral** (solo 6 privados
confirmados frente a 10 requeridos) — no crear todavía pese al tamaño de la
ciudad. 1 landing de servicio condicionada (comedor/horario-ampliado/
madrugadores en escuela-infantil, mismo conjunto de 11, elegir solo una).
Ninguna landing de pedanía (ninguna llega a 5). 9 archivos entregados.
Confirmado: sin SQL ejecutado, sin deploy, resto de ciudades sin tocar
(incluida Murcia capital, misma región pero zona distinta).

**Albacete — completada (2026-07-12), pendiente auditoría.** Ámbito: solo
capital, excluye Almansa, Hellín, Villarrobledo y resto de la provincia.
Dataset final: 27 centros (11 público: 7 municipal Patronato + 4 autonómico
JCCM; 16 privado). Excluidos: 6 (2 por colisión de dirección sin resolver entre
"La Noria" y "Pekeñecos" — excluidos ambos por prudencia; 2 fuera de alcance
MVP —parque de cumpleaños, uso militar exclusivo—; 2 por datos insuficientes).
Servicios confirmados: 18/27 (66.7%). Indexables: 19/27 (70.4%). **0
`concertado`** — investigó explícitamente un caso donde el centro se
autodenomina "colegio concertado" (San Cristóbal) y confirmó que el concierto
educativo no aplica al primer ciclo en ningún caso. Landings recomendadas:
`/guarderias-en-albacete` (16), `/escuelas-infantiles-en-albacete` (11),
`/guarderias-con-comedor-en-albacete` (9). Ninguna de distrito (máx. 3).
Incidencia relevante: bloqueo total de red del dominio `albacete.es` durante
toda la investigación, impidió leer el PDF oficial de centros privados —
mitigado parcialmente con fuentes cruzadas, documentado como limitación de
cobertura no resuelta. 2 correcciones de geocodificación aplicadas tras
detectar errores propios (Los Mundos de Noa apuntaba a pedanía equivocada; El
Tren Azul con dirección de prensa no localizable, corregida con fuente
cruzada). 9 archivos entregados. Confirmado: sin SQL ejecutado, sin deploy,
resto de ciudades sin tocar.

**Trío 3 (Cartagena + Albacete + Salamanca) completo — lanzando auditor.**

### Veredicto auditoría Trío 3 (2026-07-12): LAS 3 APROBADAS CON OBSERVACIONES MENORES

**Cartagena**: sin critical/high. 2 `medium` de documentación (resumen narrativo
de data-sources decía 16 en vez de 17 centros, omitía La Palma entre las EMEI
sin código CARM; mismo tipo de imprecisión en coords null). Datos reales
(JSON/CSV/SQL) correctos en ambos casos, solo la prosa desactualizada. Ámbito
geográfico verificado sin contaminación de Murcia capital. Resolución del
`tipo` CARM ambiguo verificada correcta contra fuente oficial municipal (11
EEIIMM exactas). Recuento SEO confirmado: escuelas-infantiles=11 (apta),
guarderías=6 (correctamente NO recomendada).

**Albacete**: 1 `high` resuelto por contexto (5 centros con `source_url` de
agregador de terceros por el bloqueo de red a albacete.es — no bloqueante
porque son `services:[]` y quedan noindex; acción recomendada no bloqueante:
sustituir fuente cuando se desbloquee el dominio). Resto limpio: 0
`concertado`, exclusiones conservadoras correctas (colisión La Noria/
Pekeñecos), geocodificación corregida verificada razonable.

**Salamanca**: sin critical/high. Confirmado técnicamente que la landing
municipal agregada NO es viable (`SeoPageFilters.centerType` es obligatorio en
el schema, las 90 landings existentes lo usan sin excepción) — Salamanca queda
con solo 2 landings de servicio, ninguna general de ciudad. Decisión
conservadora de descartar 14 colegios concertados sin código individual
confirmada razonable. Verificación en vivo contra API oficial JCyL confirmó al
menos 1 centro (PSN Bicos) con datos exactos.

**Recuento final**: Cartagena 17/17, Albacete 27/27, Salamanca 15/15. Total:
**59 centros aprobados**, 0 exclusiones adicionales del auditor. 0 colisiones
de slug contra las 15 zonas ya integradas (1600 slugs verificados).

**Landings aprobadas**: Cartagena (2: escuelas-infantiles + 1 de servicio, NO
guarderías), Albacete (3: guarderías, escuelas-infantiles, comedor), Salamanca
(2: comedor escuela-infantil, horario-ampliado guardería — límite exacto,
monitorizar).

**Lanzando integrador — Trío 3. Recordatorio: NO publicar (status sigue en
draft), el usuario está esperando datos de Search Console antes de publicar
cualquier zona nueva.**

### Trío 3 — INTEGRACIÓN COMPLETADA (2026-07-12)

- 7 landings creadas en `src/data/mock-seo-pages.ts`, todas con `sections`
  (1-2 bloques H2) + FAQs completas desde el primer commit, ninguna con
  contenido placeholder "en crecimiento": Cartagena
  `escuelas-infantiles-en-cartagena` (11),
  `escuelas-infantiles-con-comedor-en-cartagena` (11, elegida entre
  comedor/horario-ampliado/madrugadores por ser el servicio de mayor volumen
  de búsqueda genérico, mismo criterio que Murcia); Albacete
  `guarderias-en-albacete` (16), `escuelas-infantiles-en-albacete` (11),
  `guarderias-con-comedor-en-albacete` (9); Salamanca
  `escuelas-infantiles-con-comedor-en-salamanca` (7),
  `guarderias-con-horario-ampliado-en-salamanca` (5, límite exacto,
  contenido reforzado por no tener landing general de respaldo). NO se creó
  `guarderias-en-cartagena` (6, bajo umbral) ni ninguna landing general para
  Salamanca (8 y 7, ambas bajo umbral 10; landing municipal agregada
  descartada por requerir `centerType` obligatorio en el schema), conforme a
  instrucción explícita del auditor.
- Recuentos verificados de forma independiente contra los 3 JSON aprobados
  antes de escribir cada landing (no solo confiados al informe del auditor):
  coinciden exactamente.
- `src/data/mock-cities.ts`: 3 ciudades añadidas (`cartagena`, `albacete`,
  `salamanca`), cambio puramente aditivo.
- SQL de las 3 zonas re-verificado estructuralmente por el integrador:
  paréntesis balanceados en los 3 (59=59, 84=84, 115=115), 17/27/15 slugs
  coinciden exactamente entre JSON y SQL, `status='draft'` en las 59 filas,
  sin DELETE/DROP/TRUNCATE reales (solo mención en comentario), `ON CONFLICT
  (slug) DO UPDATE`, `INSERT INTO cities ... ON CONFLICT DO NOTHING`. Los 3
  rollbacks confirmados válidos (DELETE explícito por slug, sin tocar la fila
  de `cities`).
- `npx tsc --noEmit`: sin errores. `npm run lint`: sin errores. `npm run
  build`: éxito, 680 páginas (mismo patrón que rondas anteriores — sin
  Supabase local conectado, los datos reales de Cartagena/Albacete/Salamanca
  solo se materializarán tras ejecutar el SQL).
- **0 colisiones de slug de centro** verificadas independientemente entre
  las 20 zonas con dataset generado hasta ahora (1406 slugs comprobados por
  script, 1406 únicos). **0 slugs de landing duplicados** en
  `mock-seo-pages.ts` (97 totales, 97 únicos).
- `git diff` verificado línea por línea: únicas modificaciones son las 3
  ciudades añadidas a `mock-cities.ts` y las 7 landings añadidas al final de
  `mock-seo-pages.ts`; 0 líneas que eliminen o modifiquen contenido de
  Madrid/Barcelona/Valencia (las únicas coincidencias textuales de esos
  nombres en el diff son menciones comparativas dentro de contenido
  preexistente de otras ciudades, no ediciones a esas 3 ciudades).
- No se ha ejecutado SQL. No se ha hecho deploy. No se ha activado
  indexación.

**TOTAL TRÍO 3: 59 centros integrados en código (17 Cartagena + 27 Albacete +
15 Salamanca), 7 landings, SQL listo para ejecución manual, nada ejecutado,
nada desplegado.**

## RONDA 3 — 3 ZONAS NUEVAS COMPLETADAS (2026-07-12)

**TOTAL PROYECTO ACUMULADO: 18 zonas** (Madrid, Barcelona, Valencia + 6 Ronda 1
+ 6 Ronda 2 + 3 Ronda 3: Cartagena, Albacete, Salamanca). **984 centros nuevos**
(925 Rondas 1-2 + 59 Ronda 3), **68 landings nuevas** (61 + 7). Ningún SQL
ejecutado en ninguna ronda. Ninguna zona nueva publicada — el usuario decidió
esperar acceso MCP a Search Console y datos reales de Madrid/Barcelona/Valencia
antes de publicar nada de lo integrado (Rondas 1, 2 y 3 completas, todo en
código, nada en producción salvo las 3 ciudades originales).

## SIGUIENTE ACCIÓN EXACTA (actualizado 2026-07-13)

**MCP de Search Console CONECTADO y funcionando** (ver memoria
`project_gsc_mcp_estado_funcionando`). Primeros datos reales (28 días): el 100%
de los clics vienen de fichas de centro vía búsquedas navegacionales de nombre;
las landings genéricas están en evaluación (pos ~50 con solo 7 días indexadas);
las landings de servicio muestran señal temprana positiva (comedor Madrid pos 6,
horario-ampliado Barcelona pos 4).

**DECISIÓN DEL USUARIO (2026-07-13): publicación escalonada.** Ronda 1
(Zaragoza, Murcia, Sevilla, Palma, Málaga, Alicante — 593 centros) se publica
YA; Rondas 2+3 (391 centros restantes) en ~2 semanas tras vigilar indexación
por MCP. Racional: el motor SEO demostrado son las fichas (long tail de
nombres), y cada semana en draft es maduración perdida; el escalonado evita
multiplicar x5 el sitio de golpe con dominio joven.

Preparadas `data/migrations/publish-ronda1-centers.sql` +
`rollback-publish-ronda1-centers.sql`. **Orden de ejecución manual por el
usuario**: primero los 6 `insert-{ciudad}-centers.sql` de Ronda 1 (los INSERT
nunca se ejecutaron), después `publish-ronda1-centers.sql`. Pendiente en ~2
semanas: preparar publish de Rondas 2+3 y revisar evolución en Search Console.

**TOTAL ACUMULADO (Rondas 1+2+3): 984 centros nuevos en código, 74 landings
nuevas, 18 zonas integradas en código además de Madrid/Barcelona/Valencia (21
zonas totales).**

**Salamanca — completada (2026-07-12), pendiente auditoría.** Ámbito:
`refine.municipio=SALAMANCA`, excluye Santa Marta de Tormes, Carbajosa de la
Sagrada, Villamayor, Cabrerizos, Aldeatejada y resto de la provincia. Dataset
final: **solo 15 centros** (7 público: 3 JCyL + 4 municipales; 8 privado
adherido a gratuidad). Excluidos: 3 (El Globo Rojo — mismo patrón de prudencia
que Santa Catalina en Valladolid, concierto sin verificar alcance a 0-3; El
Globo Rojo II — sin adhesión confirmada; Coco Miel — sin código de registro
localizable pese a aparecer en listado oficial). Además 14 colegios concertados
con aula de primer ciclo descartados en bloque por falta de código de registro
individual verificable — oportunidad de enriquecimiento futuro documentada, no
inventada. Servicios confirmados: 13/15 (86.7%, la tasa más alta del proyecto
hasta ahora, aunque sobre una base muy pequeña). **CONFIRMA EL RIESGO DEL
RESEARCH: ninguna landing municipal alcanza el umbral de 10**
(`/guarderias-en-salamanca`=8, `/escuelas-infantiles-en-salamanca`=7). Solo 2
landings de servicio sobreviven: `/escuelas-infantiles-con-comedor-en-
salamanca` (7) y `/guarderias-con-horario-ampliado-en-salamanca` (5, límite
exacto). Bilingüe/inglés (1 cada uno) no alcanzan umbral pese a ser la
prioridad comercial indicada — brecha de verificación, no de demanda real. El
investigador recomienda que el integrador evalúe una landing municipal
agregada (ambos tipos, 15 centros) como alternativa si el patrón de landing
por-tipo no es viable — decisión pendiente para el integrador/coordinador. 9
archivos entregados. Confirmado: sin SQL ejecutado, sin deploy, resto de
ciudades sin tocar.

**Castellón de la Plana — completada (2026-07-12), pendiente auditoría.** Ámbito
verificado: excluyó explícitamente el municipio homónimo "CASTELLÓ" (sin "de la
Plana") de la provincia de Valencia, distinto término municipal. Incluye El
Grao/Grau de Castelló como distrito propio. Dataset final: 27 centros (6
escuela-infantil pública: 2 Generalitat + 4 municipales gestión EULEN; 21
guardería privada). **0 excluidos**. Servicios confirmados: 19/27 (70.4%,
notablemente alto). Indexables: 20/27 (74.1%). **Priorizó correctamente el
contexto de gratuidad dado**: landings de horario-ampliado (11), bilingües (10)
y comedor (11) recomendadas explícitamente como "prioridad alta" según el
contexto de valor comercial persistente indicado. Landing general
`/guarderias-en-castellon-de-la-plana` (21). NO recomendada `/escuelas-
infantiles-en-castellon-de-la-plana` (6<10). Cocina-propia y verano-campamentos
justo en el límite (5 cada una). Ninguna landing de distrito (solo El Grao con
1 centro). 9 archivos entregados. Confirmado: sin SQL ejecutado, sin deploy,
resto de ciudades sin tocar — verificado explícitamente por el investigador con
`git status`/`git diff` que solo tocó sus 9 archivos.

**Jerez de la Frontera — completada (2026-07-12), pendiente auditoría.** Ámbito:
`D_MUNICIPIO === "Jerez de la Frontera"`, incluye pedanías (Guadalcacín, Mesas
de Asta, La Barca de la Florida, Torrecera). Dataset final: 37 centros, **0
excluidos** (6 públicos red Junta genuina + 29 privados adheridos a Programa de
Ayuda a las Familias + 2 privados no adheridos). **0 `concertado`** — corrigió
correctamente un caso donde el propio centro ("Luna de Caramelo") se
automarketing como "guardería pública" en su web, pero la fuente oficial lo
registra como privado adherido — mantuvo `privado` siguiendo la fuente oficial,
no el marketing del centro (misma lección de Sevilla, aplicada también en
sentido inverso). Servicios confirmados: 4/37 (10.8%, **la tasa más baja del
proyecto hasta ahora**) — confirma la hipótesis del research sobre bajo valor
comercial de la zona. **Resultado SEO más conservador de todas las zonas
andaluzas**: solo 1 landing indexable, `/guarderias-en-jerez-de-la-frontera`
(31 centros). `/escuelas-infantiles-en-jerez-de-la-frontera` NO alcanza umbral
(6<10). Ninguna landing de servicio alcanza umbral de 5 (máximo detectado: 3).
Ninguna landing de distrito/pedanía. 9 archivos entregados. Confirmado: sin SQL
ejecutado, sin deploy, resto de ciudades sin tocar.

3 instancias de `buscacentro-zone-researcher` lanzadas en paralelo. Instrucciones
reforzadas: Valladolid recibió contexto explícito de gratuidad TOTAL ya
consumada en Castilla y León (curso 2024-25) con instrucción de priorizar
horario ampliado/comedor/bilingüe. Castellón recibió el mismo tipo de contexto
para la Comunidad Valenciana (Bono Infantil universal desde 2024-25). Jerez
recibió la lección de Sevilla sobre `ownership` (misma comunidad autónoma) y
contexto de valor comercial estructuralmente bajo (renta/paro) para que sea
realista en sus expectativas de demanda en verticales de alto valor.

**Granada — completada (2026-07-12), pendiente auditoría.** Ámbito verificado
por `cod_municipio="18087"` (nunca solo nombre textual, evita ambigüedad con la
provincia homónima). Dataset final: 60 centros, **0 excluidos** (46
guardería/privado: 33 adheridos a Programa de Ayuda a las Familias + 13 no
adheridos; 14 escuela-infantil/publico: 10 red autonómica + 4 red municipal
GranadaEduca). **0 `concertado`** — verificó correctamente que 4 centros
privados con concierto en etapas posteriores (La Asunción, San Isidoro,
Monaita, Nazaret) mantienen `privado` en el tramo 0-3 (único alcance del
proyecto), no arrastran el concierto de otras etapas. Servicios confirmados:
19/60 (31.7%). Indexables: 29/60 (48.3%). Landings recomendadas:
`/guarderias-en-granada` (46), `/escuelas-infantiles-en-granada` (14, alcanza
umbral sumando ambas redes públicas), `/guarderias-con-comedor-en-granada` (12),
`/guarderias-con-horario-ampliado-en-granada` (11) — estas 2 últimas
priorizadas explícitamente por el contexto de gratuidad progresiva dado al
investigador. NO recomendada: bilingüe (solo 3, pese a ser vertical de mayor
prioridad estratégica), distrito/barrio (solo 4/60 con `district`). 9 archivos
entregados. Confirmado: sin SQL ejecutado, sin deploy, resto de ciudades sin
tocar.

**Las Palmas de Gran Canaria — completada (2026-07-12), pendiente auditoría.**
`city_slug: las-palmas-de-gran-canaria`. Dataset final: 37 centros (11
municipales gestión TRASA/Ayuntamiento + 26 privados). Excluidos: 3, motivo
claro (2 acceso restringido/militar-protección de menores, 1 solo segundo
ciclo). Servicios confirmados: 25/37 (67.6%). Ownership: 11 público/26
privado/**0 concertado** — verificó explícitamente 2 casos límite (Marpe
Infantil y Los Jaimitos, primer ciclo dentro de colegios con concierto en otras
etapas, confirmado que el primer ciclo queda fuera de ese concierto). Landings
recomendadas: `/guarderias-en-las-palmas-de-gran-canaria` (26),
`/escuelas-infantiles-en-las-palmas-de-gran-canaria` (11), comedor guardería
(11), cocina-propia guardería (9), horario-ampliado guardería (7), comedor
escuela-infantil (11), horario-ampliado escuela-infantil (11). NO recomendadas:
bilingüe (3), patio-exterior (2), música (1), psicomotricidad (1),
actividades-extraescolares (2), distrito/barrio (solo 11/37 con barrio
confirmado). 9 archivos entregados. Confirmado: sin SQL ejecutado, sin deploy,
resto de ciudades sin tocar.

Pendiente: informe final para el usuario de la expansión ya cerrada (secciones 26
y 29 del prompt original).

### Murcia — CERRADA (investigada + auditada APROBADO + integrada, 2026-07-12)

- Ámbito: término municipal de Murcia (capital + 19 pedanías con centros:
  El Palmar, Beniaján, La Alberca, Algezares, Sangonera la Verde, Santo Ángel,
  Puente Tocinos, Cabezo de Torres, Churra, Espinardo, San Ginés, Casillas,
  Santiago y Zaraiche, Ermita de Patiño, Cobatillas, Esparragal, San José de la
  Montaña, Guadalupe, Torreagüera, Gea y Truyols). Excluidos explícitamente
  Cartagena, Molina de Segura y otros municipios de la Región de Murcia.
- Dataset final: 52 centros. Excluidos: 4 casos documentados (2 datasets
  municipales fuera de ámbito, 2 con relación de marca no confirmada).
- Servicios confirmados: 16/52 (30.8%). Indexables (`isCenterIndexable`): 16/52
  (30.8%).
- Landings recomendadas: `/guarderias-en-murcia` (38 centros soporte),
  `/escuelas-infantiles-en-murcia` (14 centros soporte). Condicional:
  landing de servicio comedor/madrugadores para escuela-infantil (7 centros,
  mismas 7 EMEI en ambos casos, recomendado crear solo una),
  `/guarderias-bilingues-en-murcia` (5 centros, justo en umbral, frágil). Ninguna
  landing de pedanía alcanza umbral de 5.
- Incidencias documentadas por el investigador (no bloqueantes, a revisar por el
  auditor): solo 9/38 privados con web oficial verificada individualmente (los
  otros 29 quedan confidence medium sin servicios asignados, no inventados); sin
  distritos formales en fuente oficial (mismo problema que Valencia, `district`
  null); servicios reales detectados sin categoría en el enum cerrado (logopedia,
  apoyo a la lactancia, metodologías con nombre propio) — documentados, no
  forzados.
- 9 archivos entregados en rutas estándar (`docs/data-sources-murcia.md`,
  `data/enrichment/murcia-centers*.json`, `data/import/murcia-centers.csv`,
  `docs/murcia-quality-report.md`, `docs/murcia-seo-report.md`,
  `data/migrations/insert-murcia-centers.sql` +
  `rollback-murcia-centers.sql`).
- Confirmado por el investigador: sin SQL ejecutado, sin deploy, Madrid/Barcelona/
  Valencia sin tocar.

### Zaragoza — CERRADA (investigada + auditada APROBADO + integrada, 2026-07-12)

- Ámbito: término municipal de Zaragoza capital (área metropolitana excluida;
  detectado y excluido activamente un registro con error de geolocalización de
  la propia fuente, Villanueva de Sijena/Huesca etiquetado como Zaragoza).
- Dataset final: 59 centros (41 guardería privada + 18 escuela-infantil pública:
  13 municipales + 4 red autonómica DGA + 1 acceso restringido Base Aérea).
  Excluidos: 1 (sin teléfono/email/web/servicio confirmado).
- Servicios confirmados: 31/59 (52.5%). Indexables (`isCenterIndexable`): 32/59
  (54%). Coordenadas verificadas: 59/59 (100%).
- Landings recomendadas: `/guarderias-en-zaragoza` (41), `/escuelas-infantiles-en-
  zaragoza` (18), `/guarderias-con-comedor-en-zaragoza` (11), `/escuelas-
  infantiles-con-comedor-en-zaragoza` (18). En el límite, no recomendada todavía:
  horario-ampliado guardería (6, esperar más enriquecimiento). Explícitamente NO
  recomendadas: bilingües (1 centro), horario-ampliado escuela-infantil (0),
  ninguna landing de distrito (máx. 3 centros/distrito, no alcanza umbral 5).
- Incidencias documentadas por el investigador (a revisar por el auditor): fuente
  oficial no incluía 8/18 centros públicos (completados con webs institucionales
  del Ayuntamiento/Gobierno de Aragón, documentado); no se pudo confirmar ningún
  `concertado` (concierto de primer ciclo en implementación normativa 2026 sin
  fuente estructurada); 28/41 privados (68%) sin servicio confirmado por falta de
  web propia verificable (quedan en dataset, no indexables); traslado temporal
  documentado de una escuela municipal (nota interna + FAQ dedicada, no omitido);
  metodología pedagógica (Montessori, etc.) documentada como texto en
  long_description, no como servicio inventado (el enum no la contempla).
- 9 archivos entregados en rutas estándar (`docs/data-sources-zaragoza.md`,
  `data/enrichment/zaragoza-centers*.json`, `data/import/zaragoza-centers.csv`,
  `docs/zaragoza-quality-report.md`, `docs/zaragoza-seo-report.md`,
  `data/migrations/insert-zaragoza-centers.sql` +
  `rollback-zaragoza-centers.sql`).
- Confirmado por el investigador: sin SQL ejecutado, sin deploy, Madrid/Barcelona/
  Valencia sin tocar.

**Pareja 1 (Zaragoza + Murcia) — AUDITORÍA COMPLETADA (2026-07-12): AMBAS APROBADAS.**

### Veredicto auditoría — Zaragoza: APROBADO
Sin incidencias critical/high, solo 2 observaciones low (informe dice "8 distritos"
vs 11 valores reales — irrelevante, ninguno alcanza umbral; short_description de
La Piraña no menciona el traslado temporal, pero FAQ + nota interna sí lo
reflejan). Recuento final tras auditoría: 59 aprobados / 1 excluido (sin cambios
respecto al investigador). Verificado en vivo: endpoint GA_OD_Core oficial,
41/41 privados trazables a registro real, 0 servicios fuera de enum, 0 duplicados,
59/59 short_description y 32/32 long_description únicas, 0 aperturas de 8 palabras
compartidas.

### Veredicto auditoría — Murcia: APROBADO
Sin incidencias critical/high, solo 3 observaciones low (coordenada oficial CARM
de un centro ~7,8km del centroide de su pedanía declarada, pero es la coordenada
oficial de la fuente arrastrada fielmente, no inventada; enunciado de FAQ algo laxo
en 7 EMEI aunque el array de servicios es correcto; informe dice "19 pedanías" vs
20 reales — discrepancia de conteo, no de datos). Recuento final: 52 aprobados / 4
excluidos (sin cambios). Verificado en vivo: fuente CARM oficial, geografía
confirmada (0 centros de Cartagena/Molina de Segura colados), flags de servicio
del raw correctamente ignoradas (casi todas "N", el investigador usó solo webs
propias verificadas), 0 servicios fuera de enum.

### Landings aprobadas para integración

**Zaragoza**: `/guarderias-en-zaragoza` (41), `/escuelas-infantiles-en-zaragoza`
(18), `/guarderias-con-comedor-en-zaragoza` (11), `/escuelas-infantiles-con-
comedor-en-zaragoza` (18). En el límite: `/guarderias-con-horario-ampliado-en-
zaragoza` (6, recomendable esperar enriquecimiento). NO crear: bilingües (1),
EI+horario-ampliado (0), distrito (máx. 3).

**Murcia**: `/guarderias-en-murcia` (38), `/escuelas-infantiles-en-murcia` (14),
UNA landing de servicio EI+comedor-o-madrugadores (7, mismas 7 EMEI, crear solo
una). Frágil: `/guarderias-bilingues-en-murcia` (5, justo en umbral, reconfirmar
antes de publicar). NO crear: guardería+comedor (4), guardería+horario-ampliado
(4), pedanía (máx. 3).

Recordatorio del auditor: toda landing creada debe llevar `sections` (2 bloques
H2) + 4-5 FAQs propias desde el primer commit — el paso a `status='published'`
corresponde al coordinador tras esta aprobación, no a investigadores ni
integrador.

**Pareja 1 (Zaragoza + Murcia) — INTEGRACIÓN COMPLETADA (2026-07-12).**

### Resultado integración
- 7 landings creadas en `src/data/mock-seo-pages.ts` (4 Zaragoza + 3 Murcia, ver
  lista exacta arriba), cada una con `sections` (2 bloques H2) + 4-5 FAQs propias.
  Los 2 placeholders "en crecimiento" de Zaragoza fueron reemplazados por
  completo (no duplicados).
- `src/data/mock-cities.ts`: Murcia añadida (Zaragoza ya existía).
- `/guarderias`, `/escuelas-infantiles`, `/ciudades`, `sitemap.ts`, `robots.ts`,
  `[slug]/page.tsx` — confirmados dinámicos/city-aware por diseño, sin cambios
  necesarios (verificado, no forzado).
- `npx tsc --noEmit`: sin errores. `npm run lint`: sin errores. `npm run build`:
  éxito, 680 páginas generadas.
- `git diff` verificado línea por línea: únicas eliminaciones son los 2
  placeholders de Zaragoza reemplazados; Madrid/Barcelona/Valencia sin ninguna
  línea añadida/modificada/eliminada.
- SQL revisado (no regenerado, ya consistente): `insert-zaragoza-centers.sql` (59
  filas) + rollback, `insert-murcia-centers.sql` (52 filas) + rollback. Ambos
  `status='draft'`, sin ejecutar.
- Nota de proceso: el integrador intentó por error una consulta de solo-lectura
  contra Supabase para contar centros; el clasificador de auto-mode la bloqueó
  correctamente antes de ejecutarse (restricción "no tocar Supabase" respetada).

**TOTAL PAREJA 1: 111 centros integrados en código (59 Zaragoza + 52 Murcia), 7
landings, SQL listo para ejecución manual, nada ejecutado, nada desplegado.**

**Avanzando automáticamente a Pareja 2 (Sevilla + Palma), según flujo pactado —
sin esperar aprobación salvo decisión real de arquitectura/negocio.**

## Zonas pendientes

Palma (Pareja 2, EN CURSO) · Málaga, Alicante (Pareja 3) — no iniciada.

## Archivos generados

18 archivos: 9 de Murcia + 9 de Zaragoza (rutas exactas en las secciones de cada
zona arriba). Ninguno commiteado a git todavía (untracked).

## Incidencias

**INCIDENCIA BLOQUEANTE (2026-07-12) — agentes de proyecto no reconocidos por el harness**

- Los 3 agentes existen en `.claude/agents/*.md` con frontmatter YAML válido
  (`name`, `description`, `model`, `tools`), creados en una sesión previa.
- Al intentar lanzar `Agent({ subagent_type: "buscacentro-zone-researcher", ... })`
  para Zaragoza y Murcia en paralelo, el harness devolvió el mismo error en ambas
  llamadas: `Agent type 'buscacentro-zone-researcher' not found. Available agents:
  claude, claude-code-guide, Explore, general-purpose, Plan, statusline-setup`.
- Diagnóstico: la lista de tipos de agente disponibles se resuelve una vez al
  inicio de la sesión del coordinador. Como los archivos `.claude/agents/*.md` se
  crearon en una sesión anterior y esta sesión coordinadora (Opus) es una
  continuación/nueva sesión que no ha vuelto a indexar el directorio, no los ve
  todavía aunque estén correctamente en disco.
- **No se ha sustituido silenciosamente ningún agente por `general-purpose` ni por
  ningún otro tipo genérico**, conforme a instrucción explícita del usuario.
- **No se ha lanzado ninguna investigación de Zaragoza ni Murcia.**

## Siguiente acción exacta

El usuario debe reiniciar la sesión de Claude Code (cerrar y volver a abrir en
este mismo proyecto) para que el harness vuelva a indexar `.claude/agents/` y
reconozca los tres agentes. Tras reiniciar, la sesión coordinadora (Opus) debe:
1. Confirmar que `buscacentro-zone-researcher`, `buscacentro-seo-data-auditor` y
   `buscacentro-zone-integrator` aparecen en la lista de agentes disponibles.
2. Retomar exactamente desde "lanzar Pareja 1 (Zaragoza + Murcia)" — el ranking
   nacional, las 6 zonas seleccionadas y la organización de las 3 parejas ya están
   documentados arriba y no necesitan repetirse.
3. No se ha creado ningún archivo de datos de Zaragoza ni Murcia todavía, así que
   no hay riesgo de duplicación o inconsistencia al retomar.

---

## ⚠️ Advertencia: no ejecutar SQL

Ningún agente de esta red (`buscacentro-zone-researcher`,
`buscacentro-seo-data-auditor`, `buscacentro-zone-integrator`) tiene permiso para
ejecutar SQL contra Supabase ni ningún otro entorno, en ninguna fase del proceso.
Todo SQL generado queda como archivo `status='draft'` para revisión y ejecución
manual por el usuario.

## ⚠️ Advertencia: no hacer deploy

Ningún agente de esta red tiene permiso para hacer deploy, activar indexación
(`NEXT_PUBLIC_INDEXABLE`), ni modificar variables de entorno de producción, en
ninguna fase del proceso.
