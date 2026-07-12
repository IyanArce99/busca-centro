# Informe SEO — Cartagena (sprint v1)

Keyword research y recomendación de landings para el municipio de Cartagena, con recuento real de centros de soporte contra los umbrales de `src/lib/constants.ts` (`MIN_CENTERS_FOR_CITY_PAGE = 10`, `MIN_CENTERS_FOR_TYPE_PAGE = 5`). Este informe **no crea ni modifica** `src/data/mock-seo-pages.ts` — solo recomienda, según instrucción del proyecto; la creación de landings es competencia del integrador tras auditoría.

---

## 1. Keyword research — intención de búsqueda en Cartagena

### Búsquedas genéricas (volumen probable alto, competencia de agregadores ya posicionados)

- "guarderías en cartagena" / "guardería cartagena"
- "escuela infantil cartagena" / "escuelas infantiles cartagena"
- "escuelas infantiles municipales cartagena"
- "centros de educación infantil cartagena murcia"

Confirmado por búsqueda: los primeros resultados actuales para estas consultas son mayoritariamente agregadores de terceros (educoland.com, guarderia.net, micole.net, infoisinfo.es, qdq.com, Páginas Amarillas) y no fuentes oficiales — hay hueco para una ficha con datos verificados de fuente oficial (Ayuntamiento de Cartagena/CARM) que estos agregadores no citan de forma explícita.

### Búsquedas relacionadas con la red pública municipal (señal de demanda fuerte, específica de Cartagena)

- "escuelas infantiles municipales cartagena"
- "plazas gratuitas escuela infantil cartagena"
- "matrícula escuela infantil cartagena"
- "escuela infantil parque de la rosa cartagena" (búsqueda emergente por la apertura de la 12ª escuela en septiembre de 2026)

**Dato relevante para el enfoque SEO**: a diferencia de Murcia capital (donde la red municipal se declaró "completa" con demanda insatisfecha), en Cartagena el Ayuntamiento ha comunicado de forma proactiva y reciente (nota oficial `cartagena.es`, julio 2026) que **supera las 1.000 plazas gratuitas** en su red municipal, con una nueva escuela (Parque de la Rosa) que añade 12ª escuela y aumenta la oferta. Esto genera un volumen de búsqueda informacional alto en torno a "plazas gratuitas", "matrícula" y "escuela infantil municipal cartagena" que las fichas de cada EMEI (con horario, servicios y contacto propio verificado) pueden capturar directamente, y es un contraste relevante con Murcia: aquí la narrativa SEO no es "demanda insatisfecha empuja hacia lo privado" sino "oferta pública amplia y gratuita, bien documentada, con alta cobertura territorial en pedanías".

### Búsquedas por servicio (intención más específica, más cercana a conversión)

- "guarderías con comedor cartagena"
- "escuela infantil bilingüe cartagena" / "guardería inglés cartagena"
- "guarderías horario ampliado cartagena"

Confirmado por búsqueda: existe oferta real en el segmento privado bilingüe (Nice Day, con inmersión en inglés por personal nativo) y en comedor/horario ampliado dentro de la red municipal (11 de 11 EMEI lo confirman), pero el volumen de centros privados con servicios verificados es aún reducido (solo 2 de 6) — ver limitación en la sección 2.2.

### Búsquedas por pedanía (long-tail, relevante para SEO local)

Ejemplos con presencia real en el dataset: "guardería barrio peral cartagena", "escuela infantil villalba cartagena", "guardería la palma cartagena", "escuela infantil pozo estrecho", "guardería la aljorra", "escuela infantil los dolores cartagena". Igual que en Murcia, el término municipal de Cartagena es muy extenso y con pedanías con identidad de búsqueda propia — una familia de Pozo Estrecho o La Aljorra no suele buscar "guardería en Cartagena" sino "guardería en Pozo Estrecho"/"guardería en La Aljorra", aunque administrativamente sea el mismo municipio. El research previo del coordinador ya señalaba que estas pedanías tienen presencia SEO propia.

---

## 2. Landings recomendadas (con recuento real de soporte)

### 2.1 Landing municipal general — resultado desigual entre tipos

| Landing propuesta | Filtro | Centros de soporte | Umbral (`MIN_CENTERS_FOR_CITY_PAGE`) | Veredicto |
|---|---|---|---|---|
| `/escuelas-infantiles-en-cartagena` | `type=escuela-infantil`, `city=cartagena` | **11** | 10 | **Indexable por volumen.** Cumple, aunque con menor margen que Murcia (14) o Valencia. |
| `/guarderias-en-cartagena` | `type=guarderia`, `city=cartagena` | **6** | 10 | **No alcanza el umbral.** Faltan 4 centros privados adicionales verificados para llegar a 10. |

**Recomendación**: crear únicamente `/escuelas-infantiles-en-cartagena` en esta fase, con `sections` (2 bloques H2+párrafos) y 4-5 FAQs desde el primer commit potencially indexable, centrada en la red pública municipal (gratuidad, proceso de admisión, cobertura territorial en pedanías) — es el ángulo editorial más fuerte y mejor documentado de Cartagena. **No crear `/guarderias-en-cartagena` todavía**: con solo 6 centros privados no alcanza el umbral de 10 centros exigido para páginas de ciudad; sería una landing de contenido fino (thin content) si se lanzara ahora. Recomendamos revisar de nuevo cuando se amplíe la cobertura de centros privados verificados (hay más centros privados de primer ciclo en Cartagena que los 6 confirmados con fuente CARM válida; una ampliación futura del sprint podría intentar localizar más candidatos, o esperar a que la próxima actualización del registro CARM incorpore más centros).

**Matiz importante para el redactor**: de los 11 centros de soporte de `/escuelas-infantiles-en-cartagena`, los 11 son individualmente indexables (100%, ver `docs/cartagena-quality-report.md`) — a diferencia de Murcia, donde solo 16/52 fichas individuales pasaban el gate de indexabilidad. Esto hace de Cartagena un caso especialmente sólido para la landing de escuela infantil: toda la lista de centros que aparecería en ella tiene ficha completa y sustantiva.

### 2.2 Landings de servicio a nivel municipal

| Landing propuesta | Filtro | Centros de soporte | Umbral (`MIN_CENTERS_FOR_TYPE_PAGE`) | Veredicto |
|---|---|---|---|---|
| `/escuelas-infantiles-con-comedor-en-cartagena` | `service=comedor`, `type=escuela-infantil` | 11 | 5 | **Alcanza ampliamente.** |
| `/escuelas-infantiles-con-horario-ampliado-en-cartagena` | `service=horario-ampliado`, `type=escuela-infantil` | 11 | 5 | **Alcanza ampliamente.** |
| `/escuelas-infantiles-con-madrugadores-en-cartagena` | `service=servicio-madrugadores`, `type=escuela-infantil` | 11 | 5 | **Alcanza ampliamente.** |
| `/guarderias-bilingues-en-cartagena` | `service=bilingue`, `type=guarderia` | 1 | 5 | No alcanza, muy lejos. |
| `/guarderias-con-comedor-en-cartagena` | `service=comedor`, `type=guarderia` | 1 | 5 | No alcanza. |

**Recomendación**: de las 5 landings de servicio evaluadas, las 3 asociadas a `escuela-infantil` (comedor, horario ampliado, madrugadores) alcanzan el umbral **con el mismo conjunto casi idéntico de 11 centros** (las 11 EMEI comparten los tres servicios de forma homogénea, confirmado por la fuente municipal). Igual que se concluyó en el informe de Murcia para un caso equivalente, **no recomendamos crear las tres por separado**: aportaría escaso valor diferencial tener tres landings con prácticamente el mismo listado de 11 centros. Sugerimos priorizar una única landing de servicio para `escuela-infantil` (recomendación: `/escuelas-infantiles-con-comedor-en-cartagena`, por ser el servicio con mayor volumen de búsqueda genérico) y dejar horario-ampliado/madrugadores como contenido dentro de la landing general de `/escuelas-infantiles-en-cartagena` en vez de landings independientes, salvo que el integrador detecte volumen de búsqueda específico que lo justifique.

Ninguna landing de servicio para `guarderia` alcanza el umbral (máximo 1 centro por servicio) — no recomendadas en esta fase.

### 2.3 Landings de pedanía/barrio — NO RECOMENDADAS por ahora

| Pedanía/barrio | Centros | Umbral (`MIN_CENTERS_FOR_TYPE_PAGE`) | Veredicto |
|---|---|---|---|
| La Palma | 2 | 5 | No alcanza |
| Resto de pedanías/barrios individuales (Barrio Peral, La Concepción, Pozo Estrecho, Los Mateos, Villalba, Virgen de la Caridad, Vista Alegre, El Algar, La Aljorra, Los Dolores) | 1 cada una | 5 | No alcanza |

Ninguna pedanía o barrio alcanza individualmente el umbral de 5 centros exigido para páginas de tipo/segmento, ni siquiera la pedanía con más centros (La Palma, con 2: la EMEI La Palma y el privado "El País de Nunca Jamás"). El propio Ayuntamiento de Cartagena distribuye deliberadamente una única escuela infantil municipal por pedanía en la mayoría de los casos, lo que hace estructuralmente improbable alcanzar 5 centros por pedanía en el corto plazo salvo que se amplíe mucho la cobertura de centros privados por zona.

**Recomendación**: no crear landings de pedanía en esta fase, igual que se concluyó para Murcia. El volumen de búsqueda long-tail por pedanía puede capturarse mediante las fichas individuales de cada centro (que ya incluyen el nombre de la pedanía en `neighborhood_barrio`/`pedania`, `short_description`, `long_description` y FAQs) sin necesidad de una landing dedicada. Si en una futura iteración se amplía sustancialmente el número de centros privados verificados por pedanía, reevaluar.

---

## 3. Resumen de recomendación de landings

| # | Landing | Centros soporte | Cumple umbral | Prioridad |
|---|---|---|---|---|
| 1 | `/escuelas-infantiles-en-cartagena` | 11 | Sí (≥10) | Alta |
| 2 | `/guarderias-en-cartagena` | 6 | **No** (<10) | No crear todavía |
| 3 | `/escuelas-infantiles-con-comedor-en-cartagena` (elegir esta u otra del mismo grupo de servicio; mismo conjunto de 11 centros) | 11 | Sí (≥5) | Media |

**Total de landings recomendadas: 1 firme (municipal general de escuela infantil) + 1 condicionada (servicio, a elegir una del grupo homogéneo) + 0 de guardería general (no alcanza umbral) + 0 de pedanía.**

Este resultado es estructuralmente distinto al de Murcia (donde ambas landings municipales generales se crearon): en Cartagena, la landing de `guarderia` **no debe crearse todavía** por no alcanzar el umbral mínimo de calidad de contenido (thin content), a pesar de que sí existe demanda de búsqueda genérica para "guarderías en Cartagena". Esto es un hallazgo relevante para el coordinador: ampliar la cobertura de centros privados de primer ciclo en Cartagena (actualmente solo 6 confirmados) es la prioridad de investigación más clara para desbloquear esa landing en una futura actualización.

---

## 4. Notas para el integrador

- Todas las cifras de este informe están calculadas directamente sobre `data/enrichment/cartagena-centers.json` (17 centros), no son estimaciones.
- El recuento de soporte de cada landing de servicio bajará automáticamente si, tras la auditoría del coordinador, algún centro pasa de `draft` a excluido — recomendamos recalcular antes de crear cualquier landing.
- La landing `/guarderias-en-cartagena` queda deliberadamente sin recomendar en este sprint: no forzar su creación con 6 centros para no repetir el problema de contenido fino detectado en auditorías previas del proyecto.
- Ninguna landing ha sido creada por este agente (no se ha tocado `src/data/mock-seo-pages.ts`), conforme a la instrucción del proyecto.
