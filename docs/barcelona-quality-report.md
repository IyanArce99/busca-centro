# Informe de calidad — Dataset Barcelona (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos, análogo al de Madrid. No se ha tocado Madrid, el schema, el código de la app ni Supabase. No se ha generado SQL. No se ha activado indexación real (esto es un dataset de trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Centros candidatos evaluados (fuente oficial, primer ciclo infantil autorizado) | 272 (Generalitat) + 106 (Ajuntament, con solapamiento) |
| **Centros incluidos en el dataset final (`centers`)** | **261** |
| Centros en `pending_review` | 0 (los 121 iniciales fueron resueltos: 109 promovidos, 3 descartados con motivo documentado, 9 eliminados a petición explícita) |
| Fuentes primarias usadas | 2 (Generalitat de Catalunya — Directori de centres docents; Ajuntament de Barcelona / IMEB — Llistat EBM), más investigación individual (web propia, registro Generalitat) para los 109 centros promovidos desde `pending_review` |

### Composición del dataset final (261)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Escola Bressol Municipal (Ajuntament de Barcelona) | 106 | público | escuela-infantil |
| Llar d'Infants (Departament d'Educació, Generalitat) | 5 | público | escuela-infantil |
| Centros con oferta educativa más amplia (colegio con sección de infantil 0-3) | 41 | privado/concertado | escuela-infantil |
| Centros privados pequeños investigados individualmente (ex `pending_review`) | 109 | privado | guarderia |

### Clasificación `type`: guardería vs. escuela infantil

Siguiendo el mismo criterio aplicado en Madrid, la distinción no es una categoría legal (ambas son primer ciclo de infantil 0-3 años autorizado), sino de perfil de centro:

- **`escuela-infantil` (152)**: centros de titularidad pública o gestión institucional consolidada — las 106 EBM municipales, las 5 Llars de la Generalitat, y los 41 colegios privados/concertados con sección de infantil dentro de una oferta educativa más amplia (hasta bachillerato).
- **`guarderia` (109)**: centros privados pequeños, de gestión individual o familiar, sin oferta educativa más allá del ciclo 0-3 — el perfil típico de "guardería de barrio".

### Ownership

| Ownership | Cantidad |
|---|---|
| Privado | 147 |
| Público | 111 |
| Concertado | 3 |

---

## 2. Resolución de los 121 centros `pending_review`

En la entrega anterior, 121 centros quedaron fuera del dataset principal por falta de datos verificables (sin web propia, o sin teléfono ni web). Se realizó una segunda fase de investigación individual centro a centro:

| Resultado | Cantidad |
|---|---|
| Promovidos al dataset principal (`type: guarderia`) | 109 |
| Descartados con motivo documentado | 3 |
| Eliminados a petición explícita (sin promoción ni descarte formal) | 9 |
| **Total resuelto** | **121** |

Los 109 promovidos incluyen, para cada centro: dirección verificada, teléfono y/o web, rango de edad, `short_description` y `long_description` individuales (no plantilla), servicios cuando fueron confirmables, y un mínimo de 3-5 FAQs específicas del centro. Ninguno se enriqueció con datos inventados; cuando un dato no pudo confirmarse (por ejemplo, horario exacto), se dejó vacío en vez de estimarlo.

---

## 3. Calidad de los datos (dataset final, 261 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 261 / 261 | 100% |
| Email | 202 / 261 | 77% |
| Web | 253 / 261 | 97% |
| Coordenadas (lat/lng) | 186 / 261 | 71% (los centros sin match directo en el dataset geolocalizado de la Generalitat no tienen coordenadas — no inventadas) |
| Servicios confirmados (`services` no vacío) | 229 / 261 | 88% |
| `schedule` estructurado | 106 / 261 | 41% (EBM, con fuente oficial; el resto documenta horario dentro de `long_description` cuando se confirmó, pero no siempre como campo estructurado) |
| `long_description` (único por centro) | 261 / 261 | **100%** |
| FAQs (mínimo 3) | 261 / 261 | 100% |

### Trabajo de humanización de contenido

Los `long_description` generados en la fase inicial (106 EBM) reutilizaban una estructura común porque describen un sistema municipal homogéneo y verificable en fuente única. En esta fase se llevó a cabo un repaso completo de humanización sobre **todo el dataset**:

- Las **106 EBM** ya contaban con texto individual por centro (verificado 106/106 únicos).
- Los **41 colegios privados/concertados** recibieron `short_description`, `long_description` y `services` individualizados (verificado 41/41 únicos en ambos campos de texto).
- Los **109 centros promovidos desde `pending_review`** (tipo `guarderia`) recibieron `long_description` individual, generado en 8 lotes de investigación y redacción independientes.
- Las **5 Llars d'infants de la Generalitat**, que habían quedado sin cubrir en los lotes anteriores por pertenecer a un `source_group` distinto, se completaron al final de este sprint.

Verificación final: **261/261 `long_description` son textualmente únicos** (sin duplicados, comprobado por comparación exacta), con longitud entre 889 y 1563 caracteres (media ~1210). Un auditor independiente confirmó, mediante lectura de una muestra de 20 textos repartidos entre los 4 `source_group`, que el contenido varía en estructura narrativa real y no es una plantilla con variables sustituidas — con la salvedad esperable de que las 106 EBM comparten temas recurrentes por describir el mismo sistema municipal (preinscripción, cocina propia, horario 8-17h), aunque con redacción propia en cada caso.

### Corrección de contenido no verificable

El mismo auditor detectó una afirmación no respaldada por fuente ni campo estructurado en `montserrat-barcelona` ("resultados de aprobados en pruebas de acceso a la universidad", sin fuente secundaria). Fue el único caso de este tipo en los 261 centros y se corrigió eliminando la frase.

---

## 4. SEO

### recommended_indexable

| Valor | Cantidad |
|---|---|
| true | 260 / 261 |
| false | 1 / 261 (`sant-francesc-xavier-barcelona` — colegio cerrado permanentemente al final del curso 2023-2024, confirmado por prensa y por el propio portal Agora de la Generalitat; se mantiene en el dataset con `verification_status: closed_permanently` para no perder el registro, pero no debe indexarse) |

### Distritos con masa suficiente (umbral ≥5-10 centros)

Los 10 distritos oficiales de Barcelona superan ampliamente el umbral de indexabilidad de landing tipo `/escuelas-infantiles-en-[distrito]-barcelona`:

| Distrito | Total centros |
|---|---|
| Eixample | 41 |
| Sarrià-Sant Gervasi | 40 |
| Sant Martí | 32 |
| Sants-Montjuïc | 30 |
| Horta-Guinardó | 26 |
| Nou Barris | 24 |
| Gràcia | 21 |
| Sant Andreu | 21 |
| Les Corts | 17 |
| Ciutat Vella | 9 |

Todos los distritos, incluido el más pequeño (Ciutat Vella, 9), superan el umbral mínimo de 5 centros para landing de tipo/distrito. Con 109 guarderías y 152 escuelas infantiles distribuidas en los 10 distritos, hay masa suficiente para landings cruzadas tipo × distrito en la mayoría de combinaciones.

### Landing pages: cada centro es también una landing

Además de las landings de categoría/distrito, cada uno de los 260 centros indexables es en sí mismo una página `/centro/[slug]` indexable — la superficie SEO dominante del dataset no son las landings agregadas (que se cuentan en decenas), sino las 260 fichas individuales, cada una ahora con contenido único y sustancial (short + long description + FAQs propias).

### Riesgos de thin content

Mitigado respecto a la entrega anterior: los 109 centros `guarderia` y los 41 colegios, que antes tenían las fichas más "delgadas" del dataset, ahora cuentan con `long_description` individual. El único contenido pendiente de profundizar es `services` para los centros sin confirmación (32/261 sin servicios estructurados) y `schedule` estructurado fuera de las EBM — ninguno de los dos bloquea indexabilidad, ambos son oportunidades de enriquecimiento futuro.

---

## 5. Archivos generados/actualizados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-barcelona.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/barcelona-centers-raw.json` | Datos brutos por fuente, antes de deduplicar (sin cambios respecto a la entrega anterior) |
| 3 | `data/enrichment/barcelona-centers.json` | Dataset final: array `centers` (261), `pending_review` vacío |
| 4 | `data/import/barcelona-centers.csv` | CSV con las columnas exactas que espera `scripts/import-centers.ts` (261 filas) |
| 5 | `data/enrichment/barcelona-extra-fields.json` | Campos ricos no soportados por el CSV/importador actual (de la entrega anterior; pendiente de regenerar con los 109 nuevos centros si se retoma el trabajo de import) |
| 6 | `docs/barcelona-quality-report.md` | Este informe |

---

## 6. Riesgos y bloqueos conocidos (sin cambios respecto a la entrega anterior)

1. **Discrepancia de enum de servicios en `scripts/import-centers.ts`**: su lista `VALID_SERVICES` es un subconjunto distinto del enum `CenterService` de `src/types/center.ts` (rechaza `cocina-propia`, entre otros, e incluye valores como `aula-0-1-anos` no válidos). Bloqueante técnico para un import real, no corregido por estar fuera del alcance de este sprint (prohibido modificar código de la app).
2. **`neighborhood_barrio`** sigue vacío para la mayoría de centros — no se geocodificó a nivel de barrio para evitar inventar precisión no confirmada.
3. **32 centros sin `services` confirmados y la mayoría sin `schedule` estructurado** fuera de las EBM — oportunidad de enriquecimiento futuro vía revisión web individual, no bloqueante para indexar.
4. **Coordenadas ausentes en 75 centros** (principalmente entre los 109 promovidos, cuyo origen no siempre incluía geolocalización oficial) — no inventadas, pendientes de geocodificación si se decide abordarlo.

---

## 7. Siguiente paso recomendado

1. **No generar SQL todavía.** Antes de importar: resolver la discrepancia de `VALID_SERVICES`, y decidir si se incorporan al schema/importador los campos ricos (`long_description`, `faqs`, coordenadas, `confidence_level`) actualmente fuera del CSV.
2. **Diseño de landing pages**: con 260 fichas de centro indexables más ~10-30 landings de categoría/distrito, el foco de valor SEO está en las fichas individuales, ya completas. Las landings agregadas son secundarias y pueden diseñarse sobre el dataset ya cerrado.
3. **Enriquecimiento futuro** (no bloqueante): completar `services`/`schedule` estructurado para los centros que aún no los tienen, y geocodificar los 75 centros sin coordenadas.
