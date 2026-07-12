# Informe SEO — Valladolid

Keyword research y recomendación de landings para el municipio de Valladolid, basado
en el dataset final de 42 centros (`data/enrichment/valladolid-centers.json`). Este
informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es competencia del
integrador tras auditoría. Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10`
y `MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 0. Contexto de negocio crítico: gratuidad total ya consumada en Castilla y León

A diferencia de Andalucía (gratuidad **progresiva**, en despliegue 2025/26-2026/27),
Castilla y León **ya completó** la implantación de la gratuidad total del primer
ciclo de educación infantil (0-3 años) desde el curso **2024-2025**. La Junta oferta
plazas gratuitas a todos los niños desde 0 años en centros públicos, municipales y en
centros privados adheridos, sin coste para las familias que obtienen plaza. Esto
tiene un impacto directo y ya consolidado (no en transición) en la estrategia de
contenido y priorización de landings para Valladolid:

- El componente puramente informacional de "guardería gratis en Valladolid" o
  "escuela infantil gratis Valladolid" tiene volumen de búsqueda relevante, pero
  **no tiene valor comercial diferencial** para BuscaCentro: no hay lead que capturar
  en un servicio ya gratuito y de asignación administrativa mediante proceso de
  admisión reglado (Orden EDU/95/2022).
- **No se debe enfocar el proyecto en Valladolid como comparador de precios de
  guardería** — la variable "precio de la plaza básica" ha dejado de ser un
  diferenciador real entre centros adheridos al programa de gratuidad.
- **Horario ampliado y servicio de madrugadores** siguen siendo servicios con coste
  o gestión diferenciada incluso en centros con plaza gratuita, y responden a una
  necesidad real de conciliación laboral — mantienen valor comercial pleno y son la
  vertical de mayor prioridad para landings de servicio en Valladolid.
- **Comedor**, aunque muy extendido (18 de 42 centros del dataset lo confirman,
  incluidas 12 de las 13 escuelas públicas), sigue siendo un criterio de decisión
  relevante para las familias y a menudo implica un coste adicional gestionado
  aparte del servicio educativo gratuito — mantiene valor comercial.
- **Bilingüe/inglés** sigue siendo casi exclusivamente un diferenciador de la oferta
  privada de pago (Kid's Garden, Happy Kids House, La Luna Azul Bilingüe, Árbol
  Sabio, Mamá Kokeshi, Trastes, La Casa de los Niños), sin equivalente en la red
  pública o municipal de Valladolid (0 de las 13 escuelas públicas tiene inglés o
  bilingüe confirmado) — es el diferenciador de mayor valor comercial relativo en
  esta zona.
- Por ello, este informe da **prioridad relativa clara** a las landings de servicio
  con coste o gestión diferenciada (horario ampliado, inglés/bilingüe) y a la landing
  general de guarderías privadas, frente a contenido puramente informativo sobre el
  proceso de admisión gratuito o la red pública/municipal, sin dejar de cubrir bien
  la landing municipal general, que sigue siendo la de mayor volumen de búsqueda
  genérico.

---

## 1. Keyword research — intención de búsqueda en Valladolid

Valladolid es una capital de provincia de tamaño medio-grande con fuerte identidad de
barrio (Delicias, Parquesol, Rondilla, Pilarica, Covaresa, Pajarillos, La Victoria,
Arturo Eyries, Huerta del Rey) y una red municipal de escuelas infantiles muy
reconocible ("Escuelas Infantiles Municipales del Ayuntamiento de Valladolid"), lo
que genera un patrón de búsqueda propio: alto peso de búsquedas de marca de la red
municipal (por nombre de escuela) y una demanda diferenciada por el bilingüismo en el
sector privado, dado que la red pública no lo ofrece.

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en valladolid | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil valladolid | Comercial/informacional | Alto |
| escuelas infantiles municipales valladolid | Informacional específica (red municipal del Ayuntamiento), alta relevancia local | Medio-alto |
| guarderías privadas valladolid | Comercial, fase de comparación, **alta prioridad de negocio** | Medio-alto |
| escuela infantil gratis valladolid / gratuidad 0 a 3 años valladolid | Informacional/transaccional, alta relevancia actual pero bajo valor comercial directo (ver sección 0) | Medio-alto |
| centros adheridos programa gratuidad valladolid | Informacional/comercial, específica del modelo de financiación de Castilla y León | Medio |
| lista escuelas infantiles privadas valladolid | Informacional, fase de comparación | Medio |
| admisión escuela infantil valladolid | Informacional/transaccional, estacional (proceso de admisión) | Medio |

### Nivel de servicio (intención de filtro, cruzada con ciudad) — prioridad alta por valor comercial persistente

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías bilingües valladolid | Comercial, filtro de servicio, **máxima prioridad comercial**: la red pública/municipal no ofrece bilingüismo, diferenciador exclusivo del sector privado | 2/29 guarderías con `bilingue` confirmado en el enum estricto (Kid's Garden 2, Kid's Garden 3) |
| guarderías con inglés valladolid | Comercial, filtro de servicio, alto valor comercial | 6/29 guarderías con `ingles` confirmado |
| guarderías con horario ampliado valladolid | Comercial, filtro de servicio (conciliación laboral), **valor comercial persistente pese a la gratuidad de la plaza básica** | 2/29 guarderías con `horario-ampliado` confirmado |
| guarderías con comedor en valladolid | Comercial, filtro de servicio | 6/29 guarderías con `comedor` confirmado (además de 12/13 escuelas infantiles públicas) |
| guarderías con cocina propia valladolid | Comercial, filtro de servicio, valor percibido en alza | 5/29 guarderías con `cocina-propia` confirmado |
| guarderías con patio exterior valladolid | Informacional/comercial | 3/29 guarderías con `patio-exterior` confirmado |
| escuela infantil con campamento de verano valladolid | Informacional/comercial, estacional (búsquedas pico en mayo-junio) | 3/29 guarderías con `verano-campamentos` confirmado |

### Nivel de titularidad y financiación pública (modelo de Castilla y León)

Valladolid tiene una particularidad relevante frente a Granada o Córdoba: la red
pública/municipal (13 centros: 2 autonómicos + 11 municipales) representa una parte
muy significativa del dataset (31%) y tiene una marca local fuerte y reconocible.

| Keyword | Intención |
|---|---|
| escuelas infantiles municipales valladolid / Ayuntamiento de Valladolid | Informacional específica, alta relevancia local (marca reconocible por familias de Valladolid) |
| escuela infantil cascanueces / mafalda y guille / la cometa valladolid | Informacional muy específica (búsqueda de marca), cola larga con intención de navegación directa |
| puertas abiertas escuelas infantiles valladolid | Informacional/transaccional, muy estacional (febrero-abril, según calendario oficial de puertas abiertas) |
| solicitud plaza escuela infantil valladolid junta castilla y león | Informacional/transaccional, estacional (proceso de admisión) |
| escuela infantil gratis 0 a 3 años valladolid | Informacional/transaccional, alta relevancia actual pero bajo valor comercial directo |

### Nivel de barrio/distrito

Valladolid tiene una identidad de búsqueda por barrio muy reconocible (Delicias,
Parquesol, Rondilla, Pilarica, Covaresa, Pajarillos, La Victoria, Arturo Eyries,
Huerta del Rey, Parque Alameda, Villa del Prado), con volumen de búsqueda
cualitativamente relevante para consultas tipo "escuela infantil en Parquesol" o
"guardería en Covaresa". **Sin embargo, el dataset actual solo tiene el campo
`district` poblado para las 11 escuelas infantiles municipales**, cada una en un
barrio distinto (sin ningún barrio repetido dos veces); los 31 centros restantes
(2 EEI JCyL + 29 privados) no tienen barrio estructurado por falta de un mapeo
cartográfico oficial verificable dirección → barrio. Ver sección 3 para el detalle de
por qué esto bloquea, de momento, las landings de barrio.

---

## 2. Vocabulario local

Castilla y León usa consistentemente "escuela infantil" y "guardería" en sus fuentes
oficiales, sin vocabulario regional distintivo respecto al castellano estándar (a
diferencia de "escola bressol" en Cataluña o "escoles infantils" en Valencia).
Vocabulario administrativo propio a incorporar de forma natural en contenido
editorial futuro:

- **"Programa de gratuidad de las enseñanzas de primer ciclo de educación
  infantil"** — nombre oficial del mecanismo de gratuidad total en Castilla y León,
  ya completado desde el curso 2024-2025 (a diferencia de la gratuidad progresiva
  todavía en despliegue en Andalucía).
- **"Escuelas de Educación Infantil (EEI) de titularidad de la Junta de Castilla y
  León"** — denominación de la red pública autonómica de primer ciclo (solo 2
  centros en Valladolid capital: Amanecer y La Cigüeña).
- **"Escuelas Infantiles Municipales" / Ayuntamiento de Valladolid** —
  denominación propia de Valladolid para su red pública municipal (11 centros),
  un concepto de marca local muy relevante, con mayor peso relativo que en otras
  ciudades ya integradas (Granada tiene solo 4 EIM, Valladolid tiene 11).
- **"Puertas abiertas"** — proceso anual de visitas guiadas a las escuelas
  infantiles municipales, con calendario propio por escuela, alta relevancia
  estacional (febrero-abril).
- **"Subvención directa a titulares de centros privados adheridos"** — mecanismo
  oficial de financiación de la oferta gratuita en centros privados, distinto del
  concierto educativo formal.
- Nombres de barrio reconocibles a considerar en contenido editorial (no en el
  dataset estructurado más allá de las 11 EIM): Delicias, Parquesol, Rondilla,
  Pilarica, Covaresa, Pajarillos, La Victoria, Arturo Eyries, Huerta del Rey, Parque
  Alameda, Villa del Prado, Barrio España, La Rubia.

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-valladolid` | type=guarderia, city=valladolid | **29** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen sobrado. Nota: de las 29, solo 10 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio o long_description confirmado); el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada. |
| `/escuelas-infantiles-en-valladolid` | type=escuela-infantil, city=valladolid | **13** | ≥10 | **Recomendada, indexable.** Alcanza el umbral municipal gracias a sumar la red autonómica JCyL (2) y la red municipal del Ayuntamiento (11). Buen encaje editorial: puede explicar ambas redes públicas (autonómica y municipal), con la municipal como protagonista por su peso relativo (11 de 13, 84,6%). |

### Landings de servicio (cruzadas con tipo, umbral 5) — priorizadas por valor comercial persistente

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-ingles-en-valladolid` | type=guarderia, service=ingles | 6 | ≥5 | **Recomendada.** Alcanza el umbral y es la vertical de mayor prioridad comercial (diferenciador exclusivo del sector privado frente a la red pública/municipal gratuita). |
| `/guarderias-con-comedor-en-valladolid` | type=guarderia, service=comedor | 6 | ≥5 | **Recomendada.** Alcanza el umbral por muy poco margen (6 de 29); servicio de valor comercial persistente pese a la alta cobertura de comedor en la red pública. |
| `/guarderias-con-cocina-propia-en-valladolid` | type=guarderia, service=cocina-propia | 5 | ≥5 | **Recomendada, en el límite exacto del umbral.** Se recomienda monitorizar de cerca: cualquier baja de un centro (cambio de datos, cierre) haría caer la landing por debajo del umbral. |
| `/guarderias-bilingues-en-valladolid` | type=guarderia, service=bilingue | 2 | ≥5 | **No alcanza el umbral** (2 de 29), pese a ser la vertical de mayor prioridad estratégica de negocio (diferenciador exclusivo del sector privado). Es una brecha de verificación de datos, no de demanda ni de prioridad estratégica: se recomienda enriquecimiento prioritario de este servicio en una fase posterior (contactar centros privados con nombre sugerente de proyecto bilingüe — La Luna Azul Bilingüe, Happy Kids House — para confirmar el servicio exacto del enum). |
| `/guarderias-con-horario-ampliado-en-valladolid` | type=guarderia, service=horario-ampliado | 2 | ≥5 | **No alcanza el umbral** (2 de 29), pese a ser la segunda vertical de mayor prioridad comercial (conciliación laboral). Misma recomendación de enriquecimiento prioritario. |
| `/guarderias-con-patio-exterior-en-valladolid` | type=guarderia, service=patio-exterior | 3 | ≥5 | **No alcanza el umbral.** |
| `/guarderias-con-campamentos-de-verano-en-valladolid` | type=guarderia, service=verano-campamentos | 3 | ≥5 | **No alcanza el umbral** por ahora, pese al buen encaje estacional (mayo-junio). |
| `/guarderias-con-musica-en-valladolid` / `/guarderias-con-psicomotricidad-en-valladolid` / `/guarderias-con-servicio-madrugadores-en-valladolid` / `/guarderias-con-escuela-de-padres-en-valladolid` | type=guarderia, service=* | 1 cada uno | ≥5 | **No recomendada ninguna.** |
| `/escuelas-infantiles-con-comedor-en-valladolid` | type=escuela-infantil, service=comedor | 12 | ≥5 | **Recomendada, indexable por volumen sobrado** (12 de 13 escuelas públicas). Buen contenido editorial: casi toda la red pública/municipal confirma comedor. |
| `/escuelas-infantiles-con-servicio-madrugadores-en-valladolid` | type=escuela-infantil, service=servicio-madrugadores | 11 | ≥5 | **Recomendada, indexable por volumen sobrado** (11 de 13, las 11 EIM municipales). Refuerza el mensaje de conciliación laboral en la red pública/municipal, un ángulo diferente al de "horario ampliado" de pago en el sector privado. |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de "Escuelas Infantiles Municipales de Valladolid" (Ayuntamiento) | `source_group=publico_municipal` (dato interno; **no** `ownership`) | 11 | ≥5 (tipo servicio) | **Concepto con soporte suficiente por sí solo** (11 centros, superaría incluso el umbral de tipo página), pero requiere una decisión editorial y técnica previa: el proyecto no tiene actualmente un campo filtrable en `SeoPageFilters` para "titularidad municipal vs. autonómica" dentro de `ownership=publico` (el schema solo distingue `publico`/`privado`/`concertado`). Se deja como nota de alto potencial para el integrador — es la red pública con mayor peso relativo de todas las zonas ya integradas (84,6% de los centros públicos de Valladolid son municipales) y merece una sección propia dentro de `/escuelas-infantiles-en-valladolid` como mínimo. |
| Landing de centros "adheridos al programa de gratuidad" | `source_group=privado_adherido_gratuidad` (dato interno) | 29 | ≥10 | **Concepto con soporte sobrado**, pero de bajo valor comercial diferencial (ver sección 0): la gratuidad ya no es un factor de decisión entre centros en Valladolid, todos los del dataset final participan en ella. No se recomienda como landing independiente. |

### Landings de barrio

| Barrio | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Delicias, Parquesol, Rondilla, Pilarica, Covaresa, Pajarillos, La Victoria, Arturo Eyries, Huerta del Rey, Parque Alameda, Villa del Prado, Barrio España, La Rubia | Máximo 1 por barrio (cada una de las 11 EIM está en un barrio distinto, sin repetición) | ≥5 | **No recomendada ninguna.** El campo `district` solo está poblado para las 11 escuelas infantiles municipales, una por barrio; el resto del dataset (31 de 42 centros) no tiene barrio estructurado. |

**No se recomienda crear ninguna landing de barrio en esta fase**, pese a que la
intención de búsqueda cualitativa por barrio en Valladolid (especialmente Parquesol y
Delicias, los barrios más poblados) es alta. Es la principal brecha de datos
detectada para una futura fase de enriquecimiento con el callejero oficial del
Ayuntamiento de Valladolid, que permitiría asignar barrio también a los 29 centros
privados y a las 2 escuelas JCyL.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-valladolid` | 29 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-valladolid` | 13 | Indexable por volumen (≥10) — con protagonismo editorial de la red municipal (11 de 13) |
| `/guarderias-con-ingles-en-valladolid` | 6 | Indexable por volumen (≥5), **prioridad alta por valor comercial** (diferenciador exclusivo del sector privado) |
| `/guarderias-con-comedor-en-valladolid` | 6 | Indexable por volumen (≥5) |
| `/guarderias-con-cocina-propia-en-valladolid` | 5 | Indexable en el límite exacto del umbral — monitorizar |
| `/escuelas-infantiles-con-comedor-en-valladolid` | 12 | Indexable por volumen (≥5), sobrado |
| `/escuelas-infantiles-con-servicio-madrugadores-en-valladolid` | 11 | Indexable por volumen (≥5), sobrado |
| `/guarderias-bilingues-en-valladolid` | 2 | **No crear** — brecha de verificación pese a máxima prioridad estratégica |
| `/guarderias-con-horario-ampliado-en-valladolid` | 2 | **No crear** — brecha de verificación pese a alta prioridad estratégica |
| `/guarderias-con-patio-exterior-en-valladolid` | 3 | **No crear** |
| `/guarderias-con-campamentos-de-verano-en-valladolid` | 3 | **No crear** por ahora, pese al buen encaje estacional |
| Landings de guardería por servicio restantes (música, psicomotricidad, madrugadores, escuela de padres) | 1 cada una | **No crear ninguna** |
| Landings de barrio (cualquiera) | máx. 1 | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es condición
necesaria pero no suficiente para publicar una landing. Siguiendo la lección de
Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4), cualquier landing que
se cree debe tener `sections` (2 bloques H2+párrafos) y al menos 4-5 FAQs propias
desde el primer commit que la marque potencialmente indexable, diferenciando
explícitamente el enfoque de guardería (bilingüismo, inglés, conciliación,
adhesión al programa de gratuidad) del de escuela infantil (dos redes públicas
distintas en Valladolid, con la red municipal del Ayuntamiento como protagonista por
su volumen) — no crear landings clon cambiando solo el tipo.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-valladolid` (soporte muy sobrado, 29 centros).
2. Crear `/escuelas-infantiles-en-valladolid` (13 centros, alcanza el umbral
   municipal de 10) — con contenido editorial que dé protagonismo a la red municipal
   de 11 Escuelas Infantiles Municipales del Ayuntamiento de Valladolid (84,6% de los
   centros públicos de la ciudad), complementada por las 2 escuelas de titularidad
   autonómica de la Junta de Castilla y León.
3. Crear las landings de servicio con soporte suficiente y **prioridad alta por
   valor comercial persistente** en la gratuidad ya consolidada: inglés (6),
   comedor en guardería (6), cocina propia en guardería (5, en el límite exacto —
   monitorizar), comedor en escuela infantil (12) y servicio de madrugadores en
   escuela infantil (11).
4. **No crear** de momento landings de bilingüe ni horario ampliado para guardería
   pese a ser las dos verticales de mayor prioridad estratégica de negocio en esta
   zona (diferenciadores frente a la gratuidad de la plaza básica) — ambas están por
   debajo del umbral de 5 (2 centros cada una). Es la principal oportunidad de
   enriquecimiento de datos con impacto comercial directo detectada en este sprint:
   se recomienda priorizar la verificación de estos dos servicios concretos en
   centros con nombre sugerente ya identificados (La Luna Azul Bilingüe, Happy Kids
   House, El Despertador Infantil 2010, Mamá Kokeshi) en una fase posterior.
5. **No crear** ninguna landing de guardería por patio exterior, campamentos de
   verano, música, psicomotricidad, madrugadores ni escuela de padres — todas por
   debajo del umbral de 5.
6. **No crear** ninguna landing de barrio en esta fase — el campo `district` solo
   está poblado para las 11 EIM municipales, una por barrio, sin ningún barrio con 5
   o más centros. Priorizar en una futura fase el enriquecimiento con el callejero
   oficial del Ayuntamiento de Valladolid para desbloquear landings de Parquesol y
   Delicias (los barrios de mayor población de la ciudad).
7. Contenido editorial de las landings municipales debe explicar el modelo de
   Castilla y León como caso singular frente al resto de zonas ya integradas: **la
   gratuidad total del primer ciclo (0-3 años) ya está plenamente implantada desde
   el curso 2024-2025** (no en despliegue progresivo como en Andalucía), lo que
   desplaza el eje de decisión de las familias desde el precio hacia servicios
   concretos (bilingüismo, horario ampliado, comedor) y hacia la elección entre red
   pública/municipal (gratuita, sin bilingüismo) y red privada adherida (gratuita en
   la plaza básica, con posibilidad de servicios de pago diferenciados como inglés u
   horario ampliado).
8. Dar visibilidad propia a la marca local "Escuelas Infantiles Municipales del
   Ayuntamiento de Valladolid" (11 centros, uno por barrio, proceso de "puertas
   abiertas" propio) como contenido diferencial de esta ciudad frente al resto de
   zonas ya integradas, sin mezclarla con la red autonómica de la Junta de Castilla y
   León (solo 2 centros: Amanecer y La Cigüeña).
9. Priorizar en el copy de las landings de servicio (inglés, comedor) el mensaje de
   valor comercial persistente pese a la gratuidad total ya consolidada: el precio de
   la plaza básica ha dejado de ser un factor de comparación entre centros
   adheridos, por lo que el contenido debe orientar a las familias hacia los
   servicios y el proyecto educativo concretos de cada centro, no hacia el ahorro
   económico.
