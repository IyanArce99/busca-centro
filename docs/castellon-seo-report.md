# Informe SEO — Castelló de la Plana

Keyword research y recomendación de landings para el municipio de Castelló de la
Plana, basado en el dataset final de 27 centros
(`data/enrichment/castellon-centers.json`). Este informe **no crea ni edita**
`src/data/mock-seo-pages.ts` — eso es competencia del integrador tras auditoría.
Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10` y
`MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 0. Contexto de negocio: gratuidad universal ya consumada en la Comunitat Valenciana

La Comunitat Valenciana implantó la gratuidad universal del tramo 2-3 años desde
el curso 2024-2025 ("Bono Infantil", aplicado directamente en el centro), con
bonificación muy alta según renta en los tramos 0-1 y 1-2 años. Este contexto ya
se detectó al integrar Valencia y Alicante, y es todavía más relevante en
Castelló de la Plana por su menor volumen de mercado (27 centros frente a 37 en
Alicante o un volumen mucho mayor en Valencia capital). **Este informe evita
enfocar el proyecto como comparador de precios genérico** y prioriza, tanto en el
keyword research como en las landings recomendadas, las verticales donde persiste
valor comercial real y diferenciación entre centros: horario ampliado (muy
extendido en la oferta privada de Castelló, con 11/21 guarderías confirmadas),
comedor/cocina propia (a menudo con coste adicional sobre la gratuidad del tramo
lectivo), bilingüe/inglés (con presencia comercial fuerte, 10/21 guarderías
confirmadas) y la oferta privada de proyecto pedagógico diferenciado (Montessori,
pedagogía respetuosa, escuelas cooperativas).

---

## 1. Keyword research — intención de búsqueda en Castelló de la Plana

Castelló de la Plana es la capital de la provincia de Castellón y la tercera
ciudad de la Comunitat Valenciana por población, con demanda de búsqueda propia y
relevante, aunque de volumen menor que Valencia o Alicante capital. La intención
de búsqueda observada se agrupa en varios niveles:

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en Castellón | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster. Nótese que en el uso coloquial y de búsqueda predomina "Castellón" sobre la forma oficial completa "Castelló de la Plana" |
| escuela infantil Castellón | Comercial/informacional | Alto |
| guarderías privadas Castellón | Informacional/comercial, fase de comparación | Medio-alto — el dataset de Castelló es mayoritariamente privado (21/27), similar a la proporción observada en Alicante |
| guarderías Castellón de la Plana | Variante con el nombre oficial completo | Medio — menor volumen que la forma corta "Castellón", pero con intención muy cualificada (usuarios que ya saben distinguir el municipio del homónimo de la provincia de Valencia) |
| escuela infantil municipal Castellón | Informacional específica | Medio — 4 escuelas municipales gestionadas por concesión (Chupetes, Biberons, Peücs, Los Duendes), demanda de nicho con intención muy cualificada |
| bono infantil guardería Castellón | Informacional/transaccional, alta relevancia actual | Medio-alto — ligado a la gratuidad ya implantada en la Comunitat Valenciana; ver contexto de negocio en sección 0 |
| guardería Grao Castellón | Informacional, fase de comparación con intención de zona | Bajo-medio — ver nivel de distrito/barrio en sección siguiente |

### Nivel de servicio (intención de filtro, cruzada con ciudad) — enfoque prioritario según instrucción del coordinador

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con horario ampliado en Castellón | Comercial, filtro de servicio (conciliación laboral) — **prioridad alta** | 11/21 guarderías con `horario-ampliado` confirmado (más 3/6 escuelas infantiles) |
| guarderías bilingües en Castellón / guardería inglés Castellón | Comercial, filtro de servicio (nicho de alto valor percibido) — **prioridad alta** | 10/21 guarderías con `bilingue` y/o `ingles` confirmado — proporción muy alta (≈48%) de la oferta privada, reflejo de un mercado con fuerte presencia de proyectos trilingües (valenciano-castellano-inglés, ej. Fabulinus) e inmersión en inglés (ej. La Jirafa, IEP Bebés) |
| guarderías con comedor en Castellón / guardería cocina propia Castellón | Comercial, filtro de servicio (valor percibido alto, a menudo con coste adicional sobre la gratuidad del tramo lectivo) — **prioridad alta** | 11/21 guarderías con `comedor` y/o `cocina-propia` confirmado (más 4/6 escuelas infantiles con comedor) |
| guarderías con patio exterior / jardín Castellón | Informacional/comercial | 3/21 guarderías — insuficiente para landing propia |
| guarderías con música / psicomotricidad Castellón | Informacional, nicho | 3-4 centros cada uno en guarderías — insuficiente para landing propia en solitario |
| escuela de verano guardería Castellón | Informacional/comercial, estacional | 5/21 guarderías con `verano-campamentos` confirmado — insuficiente para landing propia dedicada, pero aprovechable como contenido editorial estacional |

### Nivel de titularidad y financiación pública (modelo valenciano)

| Keyword | Intención |
|---|---|
| escuela infantil Generalitat Valenciana Castellón | Informacional específica (red autonómica: 2 de los 6 centros públicos) |
| escuela infantil municipal Castellón Ajuntament | Informacional específica y muy local. A diferencia de Alicante (Patronato) o Valencia (Regidoria), en Castelló de la Plana la gestión de las 4 escuelas municipales se realiza mediante **concesión de servicio público a EULEN Servicios Sociosanitarios**, un modelo de gestión propio y diferenciado que puede mencionarse como contenido editorial de contexto |

### Nivel de distrito/barrio — verificado y con resultado limitado

Castelló de la Plana tiene **6 distritos administrativos oficiales**: norte, sur,
este, oeste, centro y **El Grao** (Grau de Castelló). De estos 6, únicamente El
Grao aparece con identidad propia y verificable en la fuente oficial de datos
utilizada en este sprint (valor de `localidad` distinto, "GRAU DE CASTELLÓ"), con
**1 centro de soporte** en el dataset final (EI Mar de Somnis).

A diferencia de ciudades con pedanías/partidas rurales muy fragmentadas, Castelló
de la Plana tiene una estructura de distritos relativamente limpia y reconocible,
pero el dataset actual solo tiene una fuente verificable centro a centro para el
distrito de El Grao — el resto de los 6 distritos (norte, sur, este, oeste,
centro) no se pudo asignar de forma fiable a cada centro dentro del alcance de
esta investigación, por falta de un callejero oficial verificable y por el
bloqueo de acceso al portal `castello.es` documentado en
`docs/data-sources-castellon.md`.

**Conclusión aplicada**: con solo 1 centro de soporte confirmado, ninguna landing
de distrito/barrio alcanza ni de lejos el umbral de 5 (`MIN_CENTERS_FOR_TYPE_PAGE`).
El Grao sí tiene identidad de búsqueda reconocible ("guardería El Grao
Castellón", zona costera y con entidad propia de la ciudad) y es la principal
oportunidad de landing de distrito para una fase futura, si se logra ampliar la
cobertura de datos de distrito para el resto de centros.

---

## 2. Vocabulario local: peso del valenciano en Castelló de la Plana

A diferencia de Alicante capital (donde el uso cotidiano del valenciano es bajo,
≈17%), Castelló de la Plana tiene un peso del valenciano en el uso institucional y
educativo considerablemente mayor, más cercano al patrón de Valencia capital:

- La propia fuente oficial de la Generalitat usa profusamente terminología en
  valenciano para los centros públicos de esta ciudad: "EI 1er CICLE" (Escola
  Infantil de primer cicle) es la denominación oficial de los 6 centros públicos
  del dataset.
- Dos centros privados del dataset final tienen nombre comercial explícitamente
  en valenciano/con estructura cooperativa valenciana: "L'Om" (Escola Infantil
  L'Om, Cooperativa Valenciana) y "La Lluna-UJI" (Escola Infantil La Lluna,
  Cooperativa Valenciana) — ambas usan "escola infantil" en su propia
  denominación oficial y en su comunicación de marca (`lalluna.net`,
  `lomescolainfantil.com`).
- "Els Sentits" (nombre comercial en valenciano) también usa terminología
  valenciana en su propia web (`elssentits.com/ca`).
- Fabulinus explicita un proyecto **trilingüe** (valenciano, castellano, inglés)
  desde los 0 años, mencionando el valenciano como parte constitutiva de su
  proyecto educativo, no solo como nota de contexto.

**Conclusión aplicada**: a diferencia de Alicante, en Castelló de la Plana sí
tiene sentido mencionar de forma natural "escola infantil" como variante
editorial secundaria (no como h1/keyword principal, que debe seguir siendo
"guarderías"/"escuela infantil" en castellano por ser los términos de mayor
volumen de búsqueda real), especialmente en el contenido editorial sobre la red
pública municipal y en la descripción de los centros cooperativos que usan esa
terminología en su propia marca. No se recomienda forzarlo en todas las landings,
solo donde hay soporte real de datos (igual que la instrucción de "investigar, no
forzar" ya aplicada en Alicante y Valencia).

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-castellon-de-la-plana` | type=guarderia, city=castellon-de-la-plana | **21** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen sobrado. De los 21, 15 son actualmente `recommended_indexable` a nivel de ficha individual; el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse. |
| `/escuelas-infantiles-en-castellon-de-la-plana` | type=escuela-infantil, city=castellon-de-la-plana | **6** | ≥10 | **No recomendada por volumen en esta fase.** Solo 6 centros (2 Generalitat + 4 municipales), por debajo del umbral de 10 para landing de ciudad. Resultado honesto, coherente con lo ya observado en Alicante (5 centros) y Sevilla: la oferta de primer ciclo en Castelló de la Plana es mayoritariamente privada. Alternativa: valorar una sección editorial sobre la red pública/municipal dentro de `/guarderias-en-castellon-de-la-plana` en lugar de una landing propia de tipo con thin content garantizado. |

### Landings de servicio (cruzadas con tipo, umbral 5) — orden de prioridad según instrucción del coordinador

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-horario-ampliado-en-castellon-de-la-plana` | type=guarderia, service=horario-ampliado | **11** | ≥5 | **Recomendada, prioridad alta.** Es el servicio confirmado más frecuente del dataset (52% de las guarderías), y el de mayor valor comercial real dado el contexto de gratuidad ya consumada (conciliación laboral es el criterio de elección que sobrevive a la gratuidad del tramo lectivo). |
| `/guarderias-bilingues-en-castellon-de-la-plana` | type=guarderia, service=bilingue O ingles | **10** (7 con `bilingue`, 9 con `ingles`, 10 con al menos uno de los dos) | ≥5 | **Recomendada, prioridad alta.** Casi la mitad de la oferta privada (≈48%) tiene proyecto bilingüe o de inmersión en inglés confirmado — refleja un mercado con fuerte componente trilingüe (valenciano-castellano-inglés) y varios proyectos educativos de marca reconocible (Fabulinus, La Jirafa, IEP Bebés). |
| `/guarderias-con-comedor-en-castellon-de-la-plana` | type=guarderia, service=comedor O cocina-propia | **11** (9 con `comedor`, 5 con `cocina-propia`, 11 con al menos uno de los dos) | ≥5 | **Recomendada, prioridad alta.** Servicio con coste adicional habitual sobre la gratuidad del tramo lectivo — mantiene valor comercial real pese al Bono Infantil. |
| `/guarderias-con-cocina-propia-en-castellon-de-la-plana` | type=guarderia, service=cocina-propia | 5 | ≥5 | **Recomendada en el límite exacto del umbral.** Valorar fusionar editorialmente con la de comedor (alto solapamiento de centros e intención de búsqueda muy próxima), en línea con lo ya sugerido en Alicante. |
| `/guarderias-con-verano-campamentos-en-castellon-de-la-plana` | type=guarderia, service=verano-campamentos | 5 | ≥5 | **Recomendada en el límite exacto del umbral**, con valor estacional (búsquedas concentradas en primavera/verano). Contenido editorial más que landing permanente destacada. |
| `/guarderias-con-patio-exterior-en-castellon-de-la-plana` | type=guarderia, service=patio-exterior | 3 | ≥5 | **No recomendada.** Por debajo del umbral. |
| `/guarderias-con-musica-en-castellon-de-la-plana` | type=guarderia, service=musica | 3 | ≥5 | **No recomendada.** Por debajo del umbral. |
| `/guarderias-con-psicomotricidad-en-castellon-de-la-plana` | type=guarderia, service=psicomotricidad | 1 | ≥5 | **No recomendada.** Muy por debajo del umbral. |
| `/escuelas-infantiles-con-comedor-en-castellon-de-la-plana` | type=escuela-infantil, service=comedor | 4 | ≥5 | **No recomendada.** Por debajo del umbral (y la landing de tipo "escuela-infantil" tampoco alcanza umbral propio, ver arriba). |
| `/escuelas-infantiles-con-horario-ampliado-en-castellon-de-la-plana` | type=escuela-infantil, service=horario-ampliado | 3 | ≥5 | **No recomendada.** Por debajo del umbral. |

Nota técnica para el integrador: `SeoPageFilters` actual del proyecto filtra por
un único `service` a la vez, no por "O lógico" entre dos servicios. Los recuentos
de 10 y 11 citados arriba para bilingüe/comedor combinan `bilingue`+`ingles` y
`comedor`+`cocina-propia` respectivamente a efectos de este informe de soporte de
demanda; si el filtro técnico real de la landing solo admite un servicio, debe
usarse el recuento del servicio individual más alto de cada par (`ingles`: 9;
`comedor`: 9), ambos igualmente por encima del umbral de 5.

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de "escuelas infantiles públicas/municipales de Castelló" (concepto) | ownership=publico | 6 | ≥10 | **No recomendada por volumen** (coincide con el recuento de `type=escuela-infantil`, ya evaluado arriba). Mejor resuelto como sección editorial. |
| Landing de "Bono Infantil en guarderías de Castellón" (concepto) | No modelable con `SeoPageFilters` actual | — | — | **No recomendada como landing propia** — mismo criterio ya aplicado en Alicante: sin campo filtrable de financiación, se recomienda tratarlo como contenido editorial dentro de `/guarderias-en-castellon-de-la-plana`. |

### Landings de distrito/barrio

**No se recomienda ninguna landing de distrito/barrio en esta fase.** Solo 1 de
27 centros (EI Mar de Somnis, en El Grao) tiene distrito confirmado en fuente
oficial verificable — muy por debajo del umbral de 5. Aunque Castelló de la Plana
tiene una estructura de 6 distritos administrativos oficiales reconocible (a
diferencia de ciudades con pedanías/partidas rurales fragmentadas, que fue la
hipótesis inicial a verificar), el dataset actual no tiene base suficiente para
sostener ninguna landing de zona. El Grao es la única excepción con identidad de
búsqueda propia y algo de soporte de datos, pero 1 centro es insuficiente incluso
para el umbral de tipo (5). Es la principal brecha de datos pendiente para una
futura fase de enriquecimiento, idealmente resolviendo primero el bloqueo de
acceso a `castello.es` documentado en `docs/data-sources-castellon.md`.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-castellon-de-la-plana` | 21 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-castellon-de-la-plana` | 6 | **No crear** en esta fase (por debajo de ≥10) |
| `/guarderias-con-horario-ampliado-en-castellon-de-la-plana` | 11 | Indexable por volumen (≥5), prioridad alta |
| `/guarderias-bilingues-en-castellon-de-la-plana` | 10 (o 9 si el filtro técnico exige un único servicio) | Indexable por volumen (≥5), prioridad alta |
| `/guarderias-con-comedor-en-castellon-de-la-plana` | 11 (o 9 si el filtro técnico exige un único servicio) | Indexable por volumen (≥5), prioridad alta |
| `/guarderias-con-cocina-propia-en-castellon-de-la-plana` | 5 | Indexable en el límite exacto, valorar fusión editorial con comedor |
| `/guarderias-con-verano-campamentos-en-castellon-de-la-plana` | 5 | Indexable en el límite exacto, valor estacional |
| `/guarderias-con-patio-exterior-en-castellon-de-la-plana` | 3 | **No crear** |
| `/guarderias-con-musica-en-castellon-de-la-plana` | 3 | **No crear** |
| `/guarderias-con-psicomotricidad-en-castellon-de-la-plana` | 1 | **No crear** |
| `/escuelas-infantiles-con-comedor-en-castellon-de-la-plana` | 4 | **No crear** |
| `/escuelas-infantiles-con-horario-ampliado-en-castellon-de-la-plana` | 3 | **No crear** |
| Landings de distrito/barrio (cualquiera, incluido El Grao) | 1 confirmado (máximo) | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4),
cualquier landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al
menos 4-5 FAQs propias desde el primer commit que la marque potencialmente
indexable. Para `/escuelas-infantiles-en-castellon-de-la-plana`, aunque no se
recomienda como landing indexable por volumen en esta fase, el integrador podría
valorar crearla igualmente en `noindex, follow` (crawlable pero no indexada) si
desea mantener consistencia de navegación con el resto de ciudades del proyecto.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-castellon-de-la-plana` (soporte muy sobrado, 21
   centros).
2. **No crear** `/escuelas-infantiles-en-castellon-de-la-plana` como landing
   indexable en esta fase (solo 6 centros, por debajo del umbral de 10) — es un
   resultado honesto de la estructura real de la oferta de primer ciclo en
   Castelló de la Plana (mayoritariamente privada).
3. Priorizar, según instrucción explícita del coordinador sobre el contexto de
   gratuidad ya consumada, las 3 landings de servicio con mayor valor comercial
   real: `/guarderias-con-horario-ampliado-en-castellon-de-la-plana` (11
   centros), `/guarderias-bilingues-en-castellon-de-la-plana` (10 centros) y
   `/guarderias-con-comedor-en-castellon-de-la-plana` (11 centros).
4. Evaluar `/guarderias-con-cocina-propia-en-castellon-de-la-plana` (5 centros,
   límite exacto del umbral) con la opción de fusionar editorialmente con la de
   comedor.
5. Evaluar `/guarderias-con-verano-campamentos-en-castellon-de-la-plana` (5
   centros, límite exacto del umbral) como contenido de valor estacional más
   que como landing permanente destacada.
6. **No crear** landings de patio exterior, música, psicomotricidad ni ninguna
   landing cruzada con `escuela-infantil` por servicio — todas por debajo del
   umbral de 5, thin content garantizado.
7. **No crear** ninguna landing de distrito/barrio en esta fase — solo 1 centro
   (El Grao) con zona confirmada en fuente oficial, muy por debajo del umbral.
   Es la brecha de datos con mayor potencial de mejora SEO detectada, dada la
   estructura de 6 distritos administrativos reales y reconocibles que tiene
   Castelló de la Plana (a diferencia de la hipótesis inicial de pedanías/
   partidas rurales, que se ha descartado tras la investigación: la ciudad sí
   tiene distritos urbanos limpios, simplemente falta la fuente de datos para
   asignarlos centro a centro).
8. Mencionar con naturalidad "escola infantil"/terminología en valenciano en el
   contenido editorial, especialmente al describir la red pública (denominación
   oficial "EI 1er CICLE") y los centros cooperativos que usan esa terminología
   en su propia marca (L'Om, La Lluna-UJI, Els Sentits) — a diferencia de
   Alicante, en Castelló de la Plana sí hay soporte real de datos para esta
   mención, aunque sin forzarla como keyword principal.
9. Contenido editorial de `/guarderias-en-castellon-de-la-plana` debe explicar
   el mecanismo del Bono Infantil de la Generalitat Valenciana con el mismo
   enfoque prudente ya aplicado en Alicante (sin landing propia, solo contexto
   editorial), y diferenciar el modelo de gestión por concesión a EULEN de las 4
   escuelas municipales frente a la red autonómica de la Generalitat (2
   centros) — un matiz de gestión propio de Castelló de la Plana, distinto del
   modelo de Patronato de Alicante o de gestión directa de Valencia.
