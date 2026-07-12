# Informe SEO — Las Palmas de Gran Canaria

Keyword research y recomendación de landings para el municipio de Las Palmas de
Gran Canaria, basado en el dataset final de 37 centros
(`data/enrichment/las-palmas-centers.json`). Este informe **no crea ni edita**
`src/data/mock-seo-pages.ts` — eso es competencia del integrador tras auditoría.
Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10` y
`MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 1. Keyword research — intención de búsqueda en Las Palmas de Gran Canaria

Las Palmas de Gran Canaria es la ciudad más poblada de Canarias y capital
conjunta (con Santa Cruz de Tenerife) de la comunidad autónoma, con demanda de
búsqueda propia y significativa a nivel municipal. La intención de búsqueda
observada se agrupa en varios niveles:

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en Las Palmas de Gran Canaria | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil Las Palmas de Gran Canaria | Comercial/informacional | Alto |
| guarderías Las Palmas precios | Comercial, fase de comparación | Medio |
| guarderías privadas Las Palmas de Gran Canaria | Informacional/comercial, fase de comparación | Medio-alto — el dataset es mayoritariamente privado (26/37) |
| escuelas infantiles municipales Las Palmas | Informacional específica | Medio-alto — 11 centros municipales bien identificados y con demanda de nicho cualificada (proceso de solicitud de plaza anual con cobertura mediática local) |
| bono infantil Las Palmas de Gran Canaria / bono infantil Canarias | Informacional/transaccional, relevancia creciente | Medio-alto — ligado al programa de subvención a la escolarización temprana de la Consejería de Educación de Canarias, mencionado en varias fuentes oficiales y de terceros consultadas en esta investigación |
| guarderías Las Palmas Triana / Vegueta / Ciudad Jardín / Schamann | Informacional, fase de comparación con intención de zona | Medio — intención de búsqueda por barrio real mencionada de forma recurrente en resultados de búsqueda, aunque el dataset actual solo tiene barrio confirmado para los 11 centros municipales |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con comedor en Las Palmas de Gran Canaria | Comercial, filtro de servicio | 11/26 guarderías + 11/11 escuelas infantiles con `comedor` confirmado |
| guarderías con horario ampliado en Las Palmas de Gran Canaria | Comercial, filtro de servicio (conciliación laboral) | 7/26 guarderías + 11/11 escuelas infantiles con `horario-ampliado` confirmado |
| guarderías con cocina propia Las Palmas | Comercial, filtro de servicio (valor percibido alto en calidad alimentaria) | 9/26 guarderías con `cocina-propia` confirmado |
| guarderías bilingües Las Palmas de Gran Canaria | Comercial, filtro de servicio (nicho) | 3/26 guarderías con `bilingue` confirmado — insuficiente para landing propia en esta fase |
| guarderías con patio exterior / música / psicomotricidad Las Palmas | Informacional, nicho | 1-2 centros cada uno — insuficiente para landing propia |

### Nivel de titularidad y financiación pública (modelo canario)

Canarias tiene un programa de **subvención a la escolarización temprana**
("Bono Infantil"), mencionado en fuentes oficiales de la Consejería de
Educación de Canarias y en varias webs de centros privados y directorios
consultados en esta investigación. Se detecta intención de búsqueda
diferenciada:

| Keyword | Intención |
|---|---|
| bono infantil guardería Las Palmas | Informacional/transaccional, relevancia creciente |
| escuela infantil municipal Las Palmas plazas 2026 | Informacional específica y estacional (proceso de solicitud anual, marzo) |
| escuelas infantiles TRASA Las Palmas | Informacional específica y muy local (TRASA es la empresa municipal gestora, sin equivalente exacto en otras ciudades ya integradas en el proyecto) |

### Nivel de distrito/barrio

Las Palmas de Gran Canaria tiene una identidad de búsqueda por zona reconocible
en el uso coloquial (Triana, Vegueta, Ciudad Jardín, Schamann, Guanarteme, Puerto
Isleta, Tamaraceite, Siete Palmas, Tafira, entre otros), con volumen de búsqueda
cualitativo relevante para consultas tipo "guardería Triana" o "escuela infantil
Schamann". **Sin embargo, el dataset actual solo tiene barrio confirmado para
los 11 centros municipales (29.7% del total)**; los 26 centros privados no
tienen `neighborhood_barrio` confirmado en fuente oficial verificable (ver
`docs/las-palmas-quality-report.md`, sección 6). No es posible, por tanto,
calcular un recuento de soporte por zona que cubra el dataset completo — queda
como brecha de datos pendiente para una fase posterior.

### Nivel insular (Gran Canaria completa) — fuera de alcance de este sprint

Existe también volumen de búsqueda a nivel de isla ("guarderías Gran Canaria"),
pero el alcance de este sprint es exclusivamente el municipio de Las Palmas de
Gran Canaria capital, no la isla completa (que incluye Telde, Santa Brígida,
Arucas, San Bartolomé de Tirajana y otros municipios no investigados en este
sprint). No se recomienda ninguna landing de alcance insular con los datos
actuales, que solo cubren la capital.

---

## 2. Vocabulario local: sin variante lingüística diferenciada

A diferencia de Cataluña ("escola bressol") o la Comunitat Valenciana ("escola
infantil"/"escoleta"), en Canarias el castellano es la única lengua
administrativa y de uso cotidiano en el ámbito educativo — no existe una
variante lingüística cooficial equivalente al catalán o valenciano. El
vocabulario observado en fuentes oficiales y en los propios centros de Las
Palmas de Gran Canaria es homogéneamente en castellano: "guardería", "escuela
infantil", "primer ciclo de educación infantil", "escuelas infantiles
municipales". Los resultados de búsqueda consultados en esta investigación
confirman que "guardería" y "escuela infantil" se usan de forma intercambiable
en la región, sin ninguna variante local relevante para SEO.

**Conclusión aplicada**: no se recomienda ninguna adaptación léxica regional
para las landings de Las Palmas de Gran Canaria. El contenido editorial puede
mencionar de forma natural términos administrativos propios de la zona ("Bono
Infantil", "TRASA", "Escuelas Infantiles Municipales", "Cabildo de Gran
Canaria") como rasgos distintivos reales del mercado local, sin necesidad de
adaptar el vocabulario base del servicio.

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-las-palmas-de-gran-canaria` | type=guarderia, city=las-palmas-de-gran-canaria | **26** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen sobrado. De los 26, 13 son actualmente `recommended_indexable` a nivel de ficha individual; el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse |
| `/escuelas-infantiles-en-las-palmas-de-gran-canaria` | type=escuela-infantil, city=las-palmas-de-gran-canaria | **11** | ≥10 | **Recomendada, indexable** por volumen (justo por encima del umbral). Es un caso favorable frente a Alicante (solo 5) o Sevilla: Las Palmas de Gran Canaria sí tiene una red municipal de primer ciclo amplia y bien documentada (11 escuelas, gestión TRASA), homóloga en tamaño a la de Valencia (11 escoles municipals) |

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-las-palmas-de-gran-canaria` | type=guarderia, service=comedor | 11 | ≥5 | **Recomendada**, con buen margen |
| `/guarderias-con-cocina-propia-en-las-palmas-de-gran-canaria` | type=guarderia, service=cocina-propia | 9 | ≥5 | **Recomendada**, aunque valorar si conviene fusionar editorialmente con la de comedor (alto solapamiento de centros e intención de búsqueda muy próxima) |
| `/guarderias-con-horario-ampliado-en-las-palmas-de-gran-canaria` | type=guarderia, service=horario-ampliado | 7 | ≥5 | **Recomendada** |
| `/escuelas-infantiles-con-comedor-en-las-palmas-de-gran-canaria` | type=escuela-infantil, service=comedor | 11 | ≥5 | **Recomendada**, con margen sobrado — coincide con el 100% de las escuelas municipales |
| `/escuelas-infantiles-con-horario-ampliado-en-las-palmas-de-gran-canaria` | type=escuela-infantil, service=horario-ampliado | 11 | ≥5 | **Recomendada**, con margen sobrado — coincide con el 100% de las escuelas municipales |
| `/guarderias-bilingues-en-las-palmas-de-gran-canaria` | type=guarderia, service=bilingue | 3 | ≥5 | **No recomendada.** Por debajo del umbral (a diferencia de Alicante, donde el bilingüismo es el servicio más frecuente, en Las Palmas de Gran Canaria solo 3 centros lo confirman con fuente propia dentro del alcance de esta investigación) |
| `/guarderias-con-patio-exterior-en-las-palmas-de-gran-canaria` | type=guarderia, service=patio-exterior | 2 | ≥5 | **No recomendada.** Por debajo del umbral |
| `/guarderias-con-musica-en-las-palmas-de-gran-canaria` | type=guarderia, service=musica | 1 | ≥5 | **No recomendada.** Por debajo del umbral |
| `/guarderias-con-psicomotricidad-en-las-palmas-de-gran-canaria` | type=guarderia, service=psicomotricidad | 1 | ≥5 | **No recomendada.** Por debajo del umbral |
| `/guarderias-con-actividades-extraescolares-en-las-palmas-de-gran-canaria` | type=guarderia, service=actividades-extraescolares | 2 | ≥5 | **No recomendada.** Por debajo del umbral |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de "escuelas infantiles municipales de Las Palmas de Gran Canaria" (concepto) | ownership=publico | 11 | ≥10 | **Coincide exactamente con `/escuelas-infantiles-en-las-palmas-de-gran-canaria`** (ya evaluada arriba, indexable). No se recomienda una landing adicional separada por ownership; mejor resuelto como contenido editorial dentro de esa misma landing, explicando la gestión TRASA y el proceso de solicitud anual |
| Landing de "Bono Infantil en guarderías de Las Palmas de Gran Canaria" (concepto) | No modelable con `SeoPageFilters` actual (no hay campo de financiación/bono) | — | — | **No recomendada como landing propia en esta fase** — el proyecto no tiene actualmente un campo filtrable para "elegibilidad Bono Infantil". Se recomienda tratarlo como contenido editorial dentro de `/guarderias-en-las-palmas-de-gran-canaria`, explicando el mecanismo de subvención a la demanda de la Consejería de Educación de Canarias sin necesidad de una landing/filtro técnico dedicado |

### Landings de distrito/barrio

**No se recomienda ninguna landing de distrito/barrio en esta fase.** El
dataset actual solo tiene barrio confirmado para las 11 escuelas municipales
(29.7% del total); los 26 centros privados no tienen `neighborhood_barrio`
confirmado en fuente oficial verificable (ver
`docs/las-palmas-quality-report.md`, sección 6). Aunque la intención de
búsqueda cualitativa por zona en Las Palmas de Gran Canaria (Triana, Vegueta,
Ciudad Jardín, Schamann, Guanarteme, Siete Palmas, Tamaraceite, Tafira, etc.) es
real y relevante, no hay base de datos suficiente y homogénea para sostener
honestamente ninguna landing de zona con los 37 centros actuales. Es la
principal brecha de datos pendiente para una futura fase de enriquecimiento.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-las-palmas-de-gran-canaria` | 26 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-las-palmas-de-gran-canaria` | 11 | Indexable por volumen (≥10), con margen ajustado pero suficiente |
| `/guarderias-con-comedor-en-las-palmas-de-gran-canaria` | 11 | Indexable por volumen (≥5) |
| `/guarderias-con-cocina-propia-en-las-palmas-de-gran-canaria` | 9 | Indexable por volumen (≥5), valorar fusión editorial con comedor |
| `/guarderias-con-horario-ampliado-en-las-palmas-de-gran-canaria` | 7 | Indexable por volumen (≥5) |
| `/escuelas-infantiles-con-comedor-en-las-palmas-de-gran-canaria` | 11 | Indexable por volumen (≥5), sobrado |
| `/escuelas-infantiles-con-horario-ampliado-en-las-palmas-de-gran-canaria` | 11 | Indexable por volumen (≥5), sobrado |
| `/guarderias-bilingues-en-las-palmas-de-gran-canaria` | 3 | **No crear** |
| `/guarderias-con-patio-exterior-en-las-palmas-de-gran-canaria` | 2 | **No crear** |
| `/guarderias-con-musica-en-las-palmas-de-gran-canaria` | 1 | **No crear** |
| `/guarderias-con-psicomotricidad-en-las-palmas-de-gran-canaria` | 1 | **No crear** |
| `/guarderias-con-actividades-extraescolares-en-las-palmas-de-gran-canaria` | 2 | **No crear** |
| Landings de distrito/barrio (cualquiera) | 11/37 con barrio (solo municipales) | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4),
cualquier landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al
menos 4-5 FAQs propias desde el primer commit que la marque potencialmente
indexable.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-las-palmas-de-gran-canaria` (soporte muy sobrado, 26
   centros).
2. Crear `/escuelas-infantiles-en-las-palmas-de-gran-canaria` (11 centros, por
   encima del umbral de 10) — a diferencia de Alicante o Sevilla, Las Palmas de
   Gran Canaria sí tiene una red municipal de primer ciclo con volumen suficiente
   para sostener esta landing honestamente, con contenido editorial sobre la
   gestión TRASA y el proceso de solicitud anual de plaza.
3. Crear `/guarderias-con-comedor-en-las-palmas-de-gran-canaria` (11 centros) y
   `/escuelas-infantiles-con-comedor-en-las-palmas-de-gran-canaria` (11 centros,
   100% de las municipales).
4. Crear `/guarderias-con-horario-ampliado-en-las-palmas-de-gran-canaria` (7
   centros) y `/escuelas-infantiles-con-horario-ampliado-en-las-palmas-de-gran-canaria`
   (11 centros, 100% de las municipales).
5. Evaluar `/guarderias-con-cocina-propia-en-las-palmas-de-gran-canaria` (9
   centros) con la opción de fusionar editorialmente con la de comedor para
   evitar solapamiento de intención de búsqueda casi idéntica.
6. **No crear** landings de bilingüe, patio exterior, música, psicomotricidad ni
   actividades extraescolares — todas por debajo del umbral de 5, thin content
   garantizado con los datos actuales.
7. **No crear** ninguna landing de distrito/barrio en esta fase — solo 11/37
   centros (29.7%) con zona confirmada en fuente oficial, y limitada a los
   centros municipales. Es la brecha de datos con mayor potencial de mejora SEO
   detectada, dada la identidad de búsqueda por zona que tiene Las Palmas de
   Gran Canaria (Triana, Vegueta, Ciudad Jardín, Schamann, Guanarteme, Siete
   Palmas, Tamaraceite, Tafira, etc.).
8. No se requiere ninguna adaptación léxica regional (a diferencia de Cataluña o
   la Comunitat Valenciana): el vocabulario base "guardería"/"escuela infantil"
   es el único relevante en Canarias.
9. Contenido editorial de `/guarderias-en-las-palmas-de-gran-canaria` y
   `/escuelas-infantiles-en-las-palmas-de-gran-canaria` debe explicar el
   mecanismo del "Bono Infantil" (subvención a la escolarización temprana de la
   Consejería de Educación de Canarias) como rasgo relevante del mercado local, y
   diferenciar la red de Escuelas Infantiles Municipales (gestión TRASA, 11
   centros) de la oferta privada (26 centros) dentro del contenido de cada
   landing.
