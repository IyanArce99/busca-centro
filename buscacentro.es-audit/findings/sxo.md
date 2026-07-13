# Análisis SXO — buscacentro.es

**Fecha:** 2026-07-13
**Objetivo de negocio:** rankear #1 en Madrid, Barcelona y Valencia para búsquedas de guarderías/escuelas infantiles.
**Contexto:** sitio indexado hace ~1 mes. GSC confirma que hoy solo rankean fichas de centro (navegacional por nombre); las landings genéricas están en posición ~50 (en evaluación, no penalizadas).

**SXO Gap Score** (independiente del SEO Health Score): **34/100** — no es un problema de calidad de contenido, es un problema de correspondencia página↔intención en 2 de las 6 keywords analizadas, más una brecha de madurez de dominio que ninguna landing puede resolver en 1 mes.

---

## Metodología

Se ejecutó WebSearch para las 6 keywords objetivo (más 2 auxiliares: "guarderías en barcelona" y "guarderías en valencia" para contrastar el patrón). Se clasificó el tipo de página dominante en el top 10 de cada SERP y se comparó contra la página correspondiente de BuscaCentro, verificada en vivo:

| Keyword objetivo | URL BuscaCentro | Estado HTTP | robots | Word count aprox. | Centros listados (enlaces únicos) |
|---|---|---|---|---|---|
| guarderías en madrid | /guarderias-en-madrid | 200 | **noindex, follow** | ~1.600* | 20 |
| escuelas infantiles madrid | /escuelas-infantiles-en-madrid | 200 | **noindex, follow** | ~8.900 | 179 |
| escola bressol barcelona | /escuelas-infantiles-en-barcelona (no hay landing en catalán) | 200 | index, follow | ~14.500 | 151 |
| guarderías con comedor en barcelona | /guarderias-con-comedor-en-barcelona | 200 | index, follow | ~3.600 | 109 |
| mejores guarderías madrid | (no existe landing "mejores/ranking") | — | — | — | — |
| cheque guardería madrid | /blog/que-es-el-cheque-guarderia | 200 | index, follow | ~760 | 0 (guía) |

\*El word count bajo de `/guarderias-en-madrid` es consistente con tener solo 20 centros publicados frente a los 179 de `/escuelas-infantiles-en-madrid` — cobertura de datos desigual entre tipos de centro en Madrid, no un problema de plantilla (la plantilla es la misma componente `[slug]/page.tsx` para ambas). Esto es un hallazgo de **datos**, no de SXO, pero explica por qué esa landing en concreto está por debajo del umbral de 10 centros que exige `AGENTS.md` y quedó en `noindex`.

---

## Veredicto por keyword

### 1. "guarderías en madrid"

- **Intención dominante:** Comparar/transaccional con fuerte componente local. Mezcla de directorios de terceros (Educoland, Colesyguardes), páginas de "cómo elegir" de centros individuales que hacen SEO agresivo (Colegio San Patricio, Menagar), y la web institucional del Ayuntamiento.
- **Formato que gana el top 3:** Página de directorio/listado con capacidad de filtrado (colesyguardes.es) + guía de un centro individual posicionando su propia marca bajo la keyword genérica (colegiosanpatriciomadrid.com) + institucional (madrid.es aparece en el top 10 pero no domina el top 3).
- **Página BuscaCentro:** `/guarderias-en-madrid` — **noindex, follow**. La página NO está compitiendo porque no está indexable.
- **¿Mismatch de tipo de página?** No hay mismatch de formato — un directorio filtrable es exactamente lo que gana esta SERP. El problema es previo: la página está fuera de la carrera por decisión propia del sitio (umbral de 10 centros no alcanzado, solo 20 centros publicados en Madrid tipo guardería).
- **Severidad:** **CRITICAL** — pero es un bloqueo de datos/publicación, no de intención ni de plantilla.
- **¿Batible a top 3 en el corto plazo?** No, mientras siga en noindex. Si se resuelve la cobertura de datos y se indexa, el formato ya es correcto y compite en igualdad de condiciones de plantilla — pero aun así hay que superar autoridad de dominio de competidores con años de histórico (ver sección de madurez de dominio).
- **Recomendación:** Priorizar la carga/publicación de más centros tipo guardería en Madrid (¿es un problema real de escasez de datos, o hay centros en `draft` sin publicar, como ocurrió con la Ronda 1 de expansión?). Revisar si existen guarderías madrileñas ya auditadas en `data/migrations/` pendientes de un UPDATE `status = 'published'` similar al de Zaragoza/Murcia/Sevilla/Palma/Málaga/Alicante. Verificar `src/lib/data/seo-pages.ts` y la tabla `centers` con `city_slug = 'madrid'` y `type = 'guarderia'`.

### 2. "escuelas infantiles madrid"

- **Intención dominante:** **Confirmado** — administrativa/navegacional. La SERP la dominan webs institucionales: comunidad.madrid (posición 1), madrid.es (dos URLs distintas en el top 10: presentación de la red + escuelas infantiles de titularidad municipal), y educa2.madrid.org (EducaMadrid, direcciones de área). De los 9 resultados devueltos, 3 son .gob/.es institucionales y aparecen en las primeras posiciones.
- **Formato que gana el top 3:** Página institucional de trámite/información oficial (preinscripción, normativa, listado oficial de centros públicos), no un directorio comercial.
- **Página BuscaCentro:** `/escuelas-infantiles-en-madrid` — también **noindex, follow** pese a tener 179 centros y ~8.900 palabras (muy por encima del umbral de 10). El robots debería revisarse: con 179 centros el criterio de `isSeoPageIndexableFromCenters` debería dar indexable; si sigue en noindex hay que verificar si hay algún otro gate (p. ej. un flag global de "página en evaluación" o un problema de que la mayoría de esos 179 centros no cumplan los campos mínimos exigidos por AGENTS.md: nombre, ciudad, tipo, zona, servicios y descripción).
- **¿Mismatch de tipo de página?** **Sí, y es estructural.** Ningún directorio comercial —por bien construido que esté— puede desplazar a comunidad.madrid o madrid.es de las primeras posiciones para esta keyword exacta, porque Google interpreta la intención como trámite oficial (preinscripción, plazas públicas, normativa), no como "comparar centros privados". Este es exactamente el patrón que predice la taxonomía page-type: consulta con ambigüedad admin/comercial → Google prioriza fuente oficial cuando existe.
- **Severidad:** **HIGH** (mismatch de intención, techo de ranking realista es top 4-8, no top 3, incluso con dominio maduro).
- **¿Batible a top 3?** No de forma sostenible a "escuelas infantiles madrid" en su forma pura. Sí es batible en variantes con intención comercial más explícita y menor competencia institucional: "escuelas infantiles privadas madrid", "escuelas infantiles madrid comparar", o combinaciones con barrio/distrito donde no hay página municipal específica compitiendo con la misma fuerza.
- **Recomendación:** No sacrificar más recursos en desplazar a la SERP genérica de esta keyword madre. Redirigir la apuesta de esta landing hacia captar el tráfico de long-tail (barrio + tipo + servicio) donde BuscaCentro sí es el formato esperado. Considerar contenido tipo comparativa "pública vs. privada" que capture parte de la intención informacional sin competir directamente con el trámite oficial — recomendar `/seo content` para un análisis E-E-A-T más profundo si se decide invertir aquí.

### 3. "escola bressol barcelona"

- **Intención dominante:** Mixta con fuerte componente **navegacional/administrativa en catalán**. Domina ajuntament.barcelona.cat (portal oficial de preinscripción, dos URLs en el top 10) y centros individuales en catalán (escolabressolbarcelona.cat, roseto.cat, escolabressol-solsolet.org, escolabressolpetits.com). Ningún directorio comercial en castellano aparece en el top 10 devuelto.
- **Formato que gana el top 3:** Portal institucional del Ayuntamiento + fichas propias de centros individuales en catalán.
- **Página BuscaCentro:** No existe landing en catalán. La equivalente más cercana es `/escuelas-infantiles-en-barcelona`, cuyo título ya reconoce el término ("escoles bressol y centros 0-3 años") pero el contenido, H1 y URL son 100% en castellano.
- **¿Mismatch de tipo de página?** Sí, y es un **mismatch de idioma antes que de formato**. El término "escola bressol" no es solo una etiqueta SEO a insertar en el title — es la forma en la que la demanda real de Barcelona busca este servicio (probablemente el de mayor volumen de la ciudad, como se sospechaba). Un directorio en castellano puro no captura esta consulta aunque mencione la palabra clave en el title, porque Google evalúa coherencia de idioma en todo el documento (H1, URL, cuerpo, breadcrumbs) para queries en catalán.
- **Severidad:** **CRITICAL** para esta keyword específica.
- **¿Batible a top 3?** No en su estado actual, y no es solo cuestión de tiempo de indexación — es una barrera estructural de idioma que persistirá aunque el dominio madure. Nota: la keyword general "guarderías en barcelona" (en castellano) sí devuelve una SERP donde conviven directorios comerciales (educoland, mejorvalorados.barcelona, laguiabarcelona.com, colesyguardes.es) con el portal municipal — ahí el formato de BuscaCentro sí encaja y es batible a medio plazo.
- **Recomendación:** Si Barcelona es prioritaria, evaluar crear una landing real en catalán (`/escola-bressol-barcelona` o similar, URL, H1, meta y copy en catalán, no solo una mención de la palabra) en vez de asumir que el título bilingüe actual es suficiente. Esto es una decisión de producto/i18n, no un simple ajuste on-page — marcar para `/seo content` o decisión de negocio explícita antes de invertir.

### 4. "guarderías con comedor en barcelona"

- **Intención dominante:** Transaccional/comparar, con **SERP propia y diferenciada** — no se pliega en la genérica. Confirmado: la búsqueda devuelve resultados específicos sobre el servicio de comedor (Llar D'Infants Goi Goi tiene páginas dedicadas: `/comedor-de-guarderia-eixample-barcelona` y `/escuela-infantil-comedor-eixample-barcelona`), más directorios filtrables por distrito (colesyguardes.es/guarderias/barcelona/distrito/leixample).
- **Formato que gana el top 3:** Páginas de servicio específico de centros individuales (landing de un solo negocio optimizada para "comedor") + directorio filtrable por zona.
- **Página BuscaCentro:** `/guarderias-con-comedor-en-barcelona` — **index, follow**, 109 centros, ~3.600 palabras. Formato de directorio filtrable, que es uno de los dos formatos ganadores.
- **¿Mismatch de tipo de página?** **No.** Este es el mejor alineamiento de las 6 keywords analizadas. El formato de directorio con filtro de servicio "comedor" es exactamente lo que compite en esta SERP junto a landings de negocio individual.
- **Severidad:** **ALIGNED**.
- **¿Batible a top 3?** Sí, es la candidata más realista de las 6 para top 3 a medio plazo (3-6 meses), condicionado a madurez de dominio y enlaces — no hay mismatch de intención que lo impida estructuralmenta. El competidor a batir no es una institución sino negocios individuales con SEO de nicho, lo cual es más alcanzable para un directorio con más cobertura de centros que cualquier ficha individual.
- **Recomendación:** Es la landing prioritaria para invertir en enlaces internos, contenido adicional (reseñas de menús, FAQ sobre alérgenos/intolerancias ya que aparece repetidamente en la SERP) y señales E-E-A-T. Buen candidato para reforzar con schema adicional (`Product`/`Service` a nivel de listado) — recomendar `/seo schema`.

### 5. "mejores guarderías madrid"

- **Intención dominante:** Comparar/ranking, claramente dominada por contenido tipo "top N" con metodología aparente (aunque no siempre verificada).
- **Formato que gana el top 3:** Ranking con metodología propia: **Micole domina con 3 URLs distintas en el top 10** ("LAS 100 MEJORES... Ranking Micole 2026", "LAS 50 MEJORES... públicas", "LAS 100 MEJORES... Madrid ciudad") — señal de que Micole ha construido un sistema de rankings segmentados (privadas/públicas/por ciudad) que satura la SERP. Le siguen listados "TOP10" de dominios genéricos (losmejoresdemadrid.com) y contenido de un centro individual posicionando su propia marca bajo la keyword de ranking (menagar.com, alariaescuelasinfantiles.es).
- **Página BuscaCentro:** **No existe** ninguna landing tipo "mejores/ranking" en el sitio. Confirmado por ausencia de slug en `mock-seo-pages.ts` y `mock-guides.ts` con ese patrón.
- **¿Mismatch de tipo de página?** **Sí, por ausencia total de página candidata** — no hay página que compita, ni bien ni mal alineada.
- **Severidad:** **CRITICAL** (oportunidad perdida, no fallo de una página existente).
- **¿Batible a top 3?** No a corto plazo. Micole ya tiene el formato dominante consolidado (rankings segmentados con aparente metodología, posiblemente con años de histórico y actualización anual "2026"). BuscaCentro no tiene metodología de ranking propia ni datos verificados de reseñas (y las reglas de `AGENTS.md` prohíben explícitamente términos como "mejor guardería" o "recomendado por expertos" sin metodología real y datos verificados) — replicar el formato de Micole sin violar las reglas de contenido honesto del proyecto no es trivial ni rápido.
- **Recomendación:** No perseguir esta keyword con una landing de ranking mientras no exista una metodología real y verificable (ej. basada en datos objetivos: nº de servicios, antigüedad, ratio profesor-alumno si se dispone del dato, valoración agregada de fuentes verificadas). Es contrario a las reglas de copy del proyecto fabricar un ranking sin esa base. Alternativa más honesta y viable: una guía "cómo elegir guardería en Madrid: qué mirar" que capture parte de la intención informacional adyacente sin usar superlativos no verificados — coherente con el guide `que-es-el-cheque-guarderia` ya existente.

### 6. "cheque guardería madrid"

- **Intención dominante:** Informacional/administrativa — cómo solicitar una ayuda económica, requisitos, plazos, cuantía.
- **Formato que gana el top 3:** Artículos explicativos tipo guía/FAQ de blogs especializados en ayudas y trámites (TaxDown, Buen Consejo, Ayuda-social.es) intercalados con contenido de centros individuales posicionando su propio blog (Alaria, Escuela Nemo Marlin, Colegio Alarcón) — ninguna institución oficial (comunidad.madrid) aparece en el top 10 devuelto para esta variante específica, a diferencia de "escuelas infantiles madrid".
- **Página BuscaCentro:** `/blog/que-es-el-cheque-guarderia` — **index, follow**, formato de guía/artículo con Article schema, ~760 palabras, actualizado 2026-07-12 (muy reciente), con cifras concretas (177-283 €/mes, plazo 19 mayo-8 junio) y matiz correcto (aclara que "cheque guardería" es específico de Madrid, no genérico de España, y menciona alternativas como el Bono Infantil valenciano).
- **¿Mismatch de tipo de página?** **No.** El formato (guía informacional con Article schema) es exactamente el que gana esta SERP.
- **Severidad:** **ALIGNED**, con una salvedad de profundidad de contenido.
- **¿Batible a top 3?** Condicionalmente sí, pero el word count (~760 palabras) está muy por debajo de lo que suelen tener las guías líder de este nicho informacional (que normalmente incluyen tablas de cuantía por tramo de renta, ejemplos de cálculo, y a veces enlaces a la solicitud telemática oficial). Es la keyword con mejor alineamiento de formato pero con mayor margen de mejora en profundidad.
- **Recomendación:** Ampliar la guía con: tabla de tramos de renta y cuantía exacta de la convocatoria vigente, un apartado de preguntas frecuentes adicional (FAQPage schema, que actualmente no está presente — solo Article + Organization), y enlace directo al trámite oficial de la Comunidad de Madrid (refuerza E-E-A-T al no intentar sustituir la fuente oficial sino complementarla). Buen candidato para `/seo content`.

---

## Patrón transversal: madurez de dominio (limitación de contexto, no de SXO puro)

Aunque el foco de este análisis es el mismatch de tipo de página, hay que ser honestos sobre una variable que el SXO no puede arreglar: el dominio tiene ~1 mes de indexación. Incluso en las keywords **ALIGNED** (comedor Barcelona, cheque guardería), los competidores que aparecen en el top 10 llevan años de histórico, enlaces y señales de autoridad. GSC ya confirma el patrón esperado para un dominio joven: las fichas de centro individuales (long-tail, navegacional, baja competencia) ya rankean; las landings genéricas (alta competencia, keywords cabeza) están en posición ~50 y en evaluación normal de Google, no penalizadas.

**Esto significa:** resolver el page-type mismatch en "escuelas infantiles madrid" y "escola bressol barcelona" es necesario pero no suficiente. Incluso arreglando esos mismatches, ninguna de las 6 keywords debería esperarse en top 3 antes de varios meses de señales de autoridad acumuladas. La excepción realista de "top 3 alcanzable en plazo razonable" es **"guarderías con comedor en barcelona"**, precisamente porque su SERP está dominada por negocios individuales de nicho (autoridad de dominio baja-media) y no por instituciones ni agregadores consolidados como Micole.

---

## Resumen de severidad y prioridad de acción

| # | Keyword | Mismatch | Severidad | Batible a top 3 | Acción prioritaria |
|---|---|---|---|---|---|
| 1 | guarderías en madrid | No (formato correcto, pero noindex) | CRITICAL | No, mientras siga noindex | Investigar y resolver cobertura de datos/publicación de centros tipo guardería en Madrid |
| 2 | escuelas infantiles madrid | Sí — SERP institucional/admin | HIGH | No en forma pura; sí en variantes long-tail | Redirigir inversión a long-tail; no perseguir la keyword madre |
| 3 | escola bressol barcelona | Sí — idioma, no solo formato | CRITICAL | No sin landing dedicada en catalán | Decisión de producto: crear landing en catalán o descartar la keyword |
| 4 | guarderías con comedor en barcelona | No — mejor alineamiento del set | ALIGNED | Sí, la más realista a 3-6 meses | Priorizar enlaces internos, contenido y schema en esta landing |
| 5 | mejores guarderías madrid | Sí — página inexistente | CRITICAL | No sin metodología propia verificable | No fabricar ranking sin datos reales; considerar guía "cómo elegir" en su lugar |
| 6 | cheque guardería madrid | No — formato correcto | ALIGNED | Condicional, ampliar profundidad | Añadir FAQPage schema, tabla de tramos, enlace a trámite oficial |

---

## Limitaciones del análisis

- WebSearch no reproduce el ranking exacto de Google (posición, SERP features como Featured Snippet/PAA/AI Overview, personalización por ubicación) con la misma fidelidad que una herramienta de rank tracking o Search Console — los resultados usados son una aproximación cualitativa del top 10 orgánico, no una captura verificada posición a posición.
- No se pudo confirmar la presencia/ausencia de local pack (mapa) de forma visual para ninguna keyword — WebSearch no expone ese SERP feature directamente.
- No se auditó el contenido completo de cada competidor top 3 (profundidad real, schema, autoridad de dominio vía backlinks) — la clasificación de formato se basa en snippets de búsqueda y estructura de URL, no en fetch completo de cada competidor.
- El word count de `/guarderias-en-madrid` (~1.600) puede estar subestimado si el fetch fue parcial; se verificó que el HTML descargado es completo y corresponde a la página real (149 KB, título y H1 correctos), pero no se comparó contra una versión renderizada con JS para descartar contenido adicional inyectado client-side.
- No se tuvo acceso a Search Console en esta sesión para contrastar el dato de "posición ~50" citado por el usuario; se ha tomado como dato de contexto proporcionado, no verificado de forma independiente en este análisis.
- No existe skill `seo-sxo` instalado en este repo (carpeta `skills/seo-sxo/references/` no encontrada) — el análisis se realizó aplicando el criterio metodológico general de SXO sin las referencias de taxonomía/personas específicas del skill.

---

## Próximos pasos sugeridos

- `/seo content` para profundizar E-E-A-T en `/blog/que-es-el-cheque-guarderia` y evaluar una guía "cómo elegir guardería en Madrid" como alternativa honesta a "mejores guarderías madrid".
- `/seo schema` para añadir FAQPage a la guía del cheque guardería y reforzar schema de servicio en `/guarderias-con-comedor-en-barcelona`.
- `/seo local` si se decide competir en local pack para las keywords con fuerte componente de proximidad (todas las de "guarderías en [ciudad]").
- `/seo page` para auditar por qué `/escuelas-infantiles-en-madrid` está en noindex pese a superar el umbral de 179 centros — puede ser un problema de calidad de campos mínimos por centro, no de cantidad.
- Decisión de producto (no solo SEO): evaluar viabilidad de contenido en catalán para Barcelona antes de seguir invirtiendo en la landing en castellano para "escola bressol".
