# Informe SEO — Alicante

Keyword research y recomendación de landings para el municipio de Alicante,
basado en el dataset final de 37 centros (`data/enrichment/alicante-centers.json`).
Este informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es
competencia del integrador tras auditoría. Umbrales de referencia:
`MIN_CENTERS_FOR_CITY_PAGE = 10` y `MIN_CENTERS_FOR_TYPE_PAGE = 5`
(`src/lib/constants.ts`).

---

## 1. Keyword research — intención de búsqueda en Alicante

Alicante es la segunda ciudad de la Comunitat Valenciana por población (tras
València) y capital de su provincia, con demanda de búsqueda propia y
relevante, aunque de menor volumen absoluto que Madrid/Barcelona/Valencia. La
intención de búsqueda observada se agrupa en varios niveles:

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en Alicante | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil Alicante | Comercial/informacional | Alto |
| guarderías Alicante precios | Comercial, fase de comparación | Medio |
| guarderías privadas Alicante | Informacional/comercial, fase de comparación | Medio-alto — el dataset de Alicante es casi enteramente privado (32/37), a diferencia de ciudades con red pública amplia |
| escuela infantil municipal Alicante | Informacional específica | Medio — solo 2 centros municipales (Els Xiquets, Siete Enanitos), demanda de nicho pero con intención muy cualificada |
| guardería bono infantil Alicante / plaza gratis 1-2 años Alicante | Informacional/transaccional, alta relevancia actual | Medio-alto — ligado al Bono Infantil de la Generalitat Valenciana (gratuidad parcial del primer ciclo), mencionado explícitamente en varias webs oficiales de centros privados de Alicante consultadas en esta investigación |
| lista guarderías Alicante centro / Alicante playa San Juan | Informacional, fase de comparación con intención de zona | Medio |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con horario ampliado en Alicante | Comercial, filtro de servicio (conciliación laboral) | 9/32 guarderías con `horario-ampliado` confirmado |
| guarderías bilingües en Alicante | Comercial, filtro de servicio (nicho, alto valor percibido, muy presente en la oferta privada de Alicante) | 11/32 guarderías con `bilingue` confirmado — es el servicio más común del dataset tras horario ampliado |
| guarderías con comedor en Alicante | Comercial, filtro de servicio | 7/32 guarderías + 3/5 escuelas infantiles con `comedor` confirmado |
| guarderías con cocina propia Alicante | Comercial, filtro de servicio (valor percibido alto en calidad alimentaria) | 7/32 guarderías con `cocina-propia` confirmado |
| guarderías con patio exterior / jardín Alicante | Informacional/comercial | 4/32 con `patio-exterior` confirmado — insuficiente para landing propia |
| guarderías con psicomotricidad / música Alicante | Informacional, nicho | 3-4 centros cada uno — insuficiente para landing propia |

### Nivel de titularidad y financiación pública (modelo valenciano, ya observado también en Valencia capital)

La Comunitat Valenciana tiene un modelo de **Bono Infantil** (ayuda económica
directa a familias para sufragar el primer ciclo de educación infantil, tanto en
centros públicos como privados autorizados) mencionado explícitamente en varias
webs propias de centros privados de Alicante consultadas en esta investigación
(Montessori, Somos Colores, Kid's Garden, entre otras). Se detecta intención de
búsqueda diferenciada:

| Keyword | Intención |
|---|---|
| bono infantil Alicante guardería | Informacional/transaccional, relevancia creciente |
| escuela infantil Generalitat Valenciana Alicante | Informacional específica (red pública autonómica: 3 de los 5 centros públicos del dataset) |
| escuela infantil municipal patronato Alicante | Informacional específica y muy local (el "Patronato Municipal de Educación Infantil" es una denominación propia del Ayuntamiento de Alicante, sin equivalente exacto en Valencia capital, donde la gestión depende directamente de la Regidoria d'Educació sin patronato autónomo) |

### Nivel de distrito/barrio

Alicante capital tiene una identidad de búsqueda por zona reconocible en el uso
coloquial (Playa de San Juan/Albufereta, Carolinas, Benalúa, Ciudad de Asís,
Garbinet, Casco Antiguo, Babel, Vistahermosa, etc.), con volumen de búsqueda
cualitativo relevante para consultas tipo "guardería Playa San Juan" o
"escuela infantil Alicante centro". **Sin embargo, el dataset actual no tiene
ningún dato de distrito/barrio confirmado** (0/37, ver `docs/alicante-quality-report.md`
sección 6): no se localizó fuente oficial verificable que permitiera asignar
esta información centro a centro dentro del alcance de esta investigación. No
es posible, por tanto, ni siquiera calcular un recuento aproximado de soporte
por zona — queda como brecha de datos pendiente para una fase posterior.

---

## 2. Vocabulario local: peso real del valenciano en Alicante capital

A diferencia de Valencia capital, donde el vocabulario en valenciano ("escola
infantil", "escoleta") tiene presencia real en el mercado (11 escoles infantils
municipals, webs institucionales bilingües), en Alicante capital el peso del
valenciano en el uso cotidiano es sustancialmente menor:

- Según datos de la Generalitat Valenciana citados en prensa, el uso del
  valenciano en la ciudad de Alicante es del **16,93%** frente al 83,07% del
  castellano; una encuesta privada de 2018 situaba el uso diario en valenciano en
  solo el **4%** de la población.
- La Acadèmia Valenciana de la Llengua (AVL) ha señalado de forma reiterada que
  el nivel y uso del valenciano "mengua generación tras generación" en el área
  metropolitana y el sur de la provincia de Alicante, un patrón sociolingüístico
  claramente distinto al de Valencia capital y su área metropolitana.
- En la búsqueda de esta investigación no se ha detectado ningún centro de
  Alicante capital (ni público ni privado) que use "escola infantil" o
  "escoleta" en su propio nombre comercial o en su web oficial — a diferencia de
  Valencia, donde el propio Ajuntament usa profusamente "Escoles Infantils
  Municipals" en su comunicación oficial.

**Conclusión aplicada**: no se recomienda usar "escola infantil"/"escoleta" como
término principal de ninguna landing de Alicante, ni como variante h1/h2 forzada.
Si se desea, puede mencionarse de forma puntual y natural en contenido editorial
como nota de contexto lingüístico de la Comunitat Valenciana, pero sin dedicarle
peso de keyword, siguiendo la instrucción de "investigar, no forzar" del
coordinador. El vocabulario administrativo relevante en Alicante es en su
mayoría en castellano: "Bono Infantil", "Patronato Municipal de Educación
Infantil", "Registre de Centres Docents".

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-alicante` | type=guarderia, city=alicante | **32** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen sobrado. De los 32, 16 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio o long_description confirmado); el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada. |
| `/escuelas-infantiles-en-alicante` | type=escuela-infantil, city=alicante | **5** | ≥10 | **No recomendada por volumen en esta fase.** Solo 5 centros (3 Generalitat + 2 municipales), por debajo del umbral de 10 para landing de ciudad. Es un resultado honesto: Alicante no tiene una red pública/municipal de primer ciclo tan amplia como Valencia (11 municipales) o Sevilla (15 autonómicas) — la oferta de primer ciclo en Alicante capital es mayoritariamente privada. Alternativa: valorar fusionar el contenido de escuela-infantil pública dentro de una sección editorial de `/guarderias-en-alicante` en vez de crear una landing propia de tipo con thin content garantizado. |

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-bilingues-en-alicante` | type=guarderia, service=bilingue | 11 | ≥5 | **Recomendada, con margen sobrado.** Es el servicio confirmado más frecuente del dataset — refleja una oferta privada de Alicante fuertemente orientada al bilingüismo/inmersión en inglés. |
| `/guarderias-con-horario-ampliado-en-alicante` | type=guarderia, service=horario-ampliado | 9 | ≥5 | **Recomendada.** |
| `/guarderias-con-comedor-en-alicante` | type=guarderia, service=comedor | 7 | ≥5 | **Recomendada.** |
| `/guarderias-con-cocina-propia-en-alicante` | type=guarderia, service=cocina-propia | 7 | ≥5 | **Recomendada como concepto**, aunque valorar si conviene fusionar editorialmente con la de comedor (alto solapamiento de centros e intención de búsqueda muy próxima: "cocina propia" suele buscarse junto a "comedor", no de forma aislada). |
| `/guarderias-con-patio-exterior-en-alicante` | type=guarderia, service=patio-exterior | 4 | ≥5 | **No recomendada.** Por debajo del umbral. |
| `/guarderias-con-musica-en-alicante` | type=guarderia, service=musica | 4 | ≥5 | **No recomendada.** Por debajo del umbral. |
| `/guarderias-con-psicomotricidad-en-alicante` | type=guarderia, service=psicomotricidad | 3 | ≥5 | **No recomendada.** Por debajo del umbral. |
| `/escuelas-infantiles-con-comedor-en-alicante` | type=escuela-infantil, service=comedor | 3 | ≥5 | **No recomendada.** Por debajo del umbral (y la landing de tipo "escuela-infantil" tampoco alcanza umbral propio, ver arriba). |
| `/escuelas-infantiles-con-horario-ampliado-en-alicante` | type=escuela-infantil, service=horario-ampliado | 3 | ≥5 | **No recomendada.** Por debajo del umbral. |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de "escuelas infantiles públicas de Alicante" (concepto) | ownership=publico | 5 | ≥10 | **No recomendada por volumen** (coincide exactamente con el recuento de `type=escuela-infantil`, ya evaluado arriba). Mejor resuelto como sección editorial dentro de contenido general sobre Alicante que como landing propia. |
| Landing de "Bono Infantil en guarderías de Alicante" (concepto) | No modelable con `SeoPageFilters` actual (no hay campo de financiación/bono) | — | — | **No recomendada como landing propia en esta fase** — el proyecto no tiene actualmente un campo filtrable para "elegibilidad Bono Infantil". Se recomienda tratarlo como contenido editorial dentro de `/guarderias-en-alicante`, explicando el mecanismo de ayuda económica de la Generalitat Valenciana sin necesidad de una landing/filtro técnico dedicado. |

### Landings de distrito/barrio

**No se recomienda ninguna landing de distrito/barrio en esta fase.** El
dataset actual no tiene ningún centro (0/37) con `neighborhood_barrio` o
`district` confirmado en fuente oficial verificable (ver
`docs/alicante-quality-report.md`, sección 6). Aunque la intención de búsqueda
cualitativa por zona en Alicante (Playa de San Juan, Carolinas, Benalúa,
Albufereta, etc.) es real, no hay base de datos actual para sostener
honestamente ninguna landing de zona. Es la principal brecha de datos
pendiente para una futura fase de enriquecimiento, idealmente mediante un
callejero oficial del Ayuntamiento de Alicante (no localizado como dataset
abierto durante esta investigación) o geocodificación inversa verificable de
las coordenadas ya disponibles (37/37 centros con lat/lng de fuente oficial).

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-alicante` | 32 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-alicante` | 5 | **No crear** en esta fase (por debajo de ≥10) |
| `/guarderias-bilingues-en-alicante` | 11 | Indexable por volumen (≥5), con buen margen |
| `/guarderias-con-horario-ampliado-en-alicante` | 9 | Indexable por volumen (≥5) |
| `/guarderias-con-comedor-en-alicante` | 7 | Indexable por volumen (≥5) |
| `/guarderias-con-cocina-propia-en-alicante` | 7 | Indexable por volumen (≥5), valorar fusión editorial con comedor |
| `/guarderias-con-patio-exterior-en-alicante` | 4 | **No crear** |
| `/guarderias-con-musica-en-alicante` | 4 | **No crear** |
| `/guarderias-con-psicomotricidad-en-alicante` | 3 | **No crear** |
| `/escuelas-infantiles-con-comedor-en-alicante` | 3 | **No crear** |
| `/escuelas-infantiles-con-horario-ampliado-en-alicante` | 3 | **No crear** |
| Landings de distrito/barrio (cualquiera) | 0 confirmados | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4),
cualquier landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al
menos 4-5 FAQs propias desde el primer commit que la marque potencialmente
indexable. Para `/escuelas-infantiles-en-alicante`, aunque no se recomienda como
landing indexable por volumen en esta fase, el integrador podría valorar
crearla igualmente en `noindex, follow` (crawlable pero no indexada) si desea
mantener consistencia de navegación con el resto de ciudades del proyecto,
revisando el umbral de nuevo si en el futuro se amplía la red pública/municipal
de primer ciclo en Alicante o se detectan más centros públicos no localizados en
este sprint.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-alicante` (soporte muy sobrado, 32 centros).
2. **No crear** `/escuelas-infantiles-en-alicante` como landing indexable en
   esta fase (solo 5 centros, por debajo del umbral de 10) — es un resultado
   honesto de la estructura real de la oferta de primer ciclo en Alicante
   capital (mayoritariamente privada), no un error de investigación.
3. Crear `/guarderias-bilingues-en-alicante` (11 centros, el servicio más común
   del dataset y con demanda de búsqueda cualitativa alta en el mercado privado
   de Alicante).
4. Crear `/guarderias-con-horario-ampliado-en-alicante` (9 centros) y
   `/guarderias-con-comedor-en-alicante` (7 centros).
5. Evaluar `/guarderias-con-cocina-propia-en-alicante` (7 centros) con la
   opción de fusionar editorialmente con la de comedor para evitar solapamiento
   de intención de búsqueda casi idéntica.
6. **No crear** landings de patio exterior, música, psicomotricidad ni ninguna
   landing cruzada con `escuela-infantil` por servicio — todas por debajo del
   umbral de 5, thin content garantizado.
7. **No crear** ninguna landing de distrito/barrio en esta fase — 0 centros con
   zona confirmada en fuente oficial. Es la brecha de datos con mayor potencial
   de mejora SEO detectada, dada la identidad de búsqueda por zona que tiene
   Alicante (Playa de San Juan, Carolinas, Benalúa, Albufereta, etc.).
8. No forzar vocabulario en valenciano ("escola infantil"/"escoleta") en el
   contenido editorial de las landings de Alicante — el peso real del valenciano
   en el uso cotidiano de la ciudad es bajo (16,93% según datos oficiales, ~4%
   de uso diario según encuesta privada de 2018), y ningún centro del dataset
   usa esa terminología en su propio nombre o web oficial.
9. Contenido editorial de `/guarderias-en-alicante` debe explicar el mecanismo
   del Bono Infantil de la Generalitat Valenciana (mencionado explícitamente en
   varias webs propias de centros privados consultadas) como rasgo relevante del
   mercado alicantino, y diferenciar el Patronato Municipal de Educación
   Infantil (2 centros municipales) de la red autonómica de la Generalitat (3
   centros) dentro del reducido grupo de oferta pública.
