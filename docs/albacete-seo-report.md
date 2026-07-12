# Informe SEO — Albacete capital

Keyword research y recomendación de landings para el término municipal de
Albacete capital, basado en el dataset final de 27 centros
(`data/enrichment/albacete-centers.json`). Este informe **no crea ni edita**
`src/data/mock-seo-pages.ts` — eso es competencia del integrador tras auditoría.
Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10` y
`MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 0. Contexto de negocio: gratuidad parcial en Castilla-La Mancha (plan "+EscuelaCLM")

Castilla-La Mancha implementa gratuidad únicamente para el tramo 2-3 años y
únicamente en escuelas infantiles de titularidad municipal (Decreto 34/2024,
plan "+EscuelaCLM"), con calendario de despliegue que llega a Albacete capital
desde el curso 2026-27. Esto es un contexto **notablemente distinto** al de
Comunitat Valenciana (Valencia, Alicante, Castelló de la Plana), donde la
gratuidad del tramo 2-3 años ya está consolidada de forma universal para toda la
red, pública y privada, desde 2024-25.

En Albacete:
- El tramo **0-2 años sigue siendo de pago en todo caso**, tanto en la red
  pública (municipal y autonómica) como en la privada.
- El tramo 2-3 años solo será gratuito en las **7 escuelas municipales** del
  Patronato Municipal de Escuelas Infantiles (no en las 4 autonómicas, que solo
  admiten los tramos 0, 1 y 2 años según su propio proceso de admisión, ni en
  ningún centro privado).
- Los **16 centros privados** de este dataset, que representan el 59% del
  dataset final, **mantienen valor comercial pleno** en todos los tramos de
  edad: no están afectados por la gratuidad parcial del plan autonómico.

**Conclusión aplicada en este informe**: a diferencia de Valencia/Alicante/
Castelló (donde el keyword research evita explícitamente el enfoque de
"comparador de precios" porque el mercado entero de 2-3 años ya es gratuito), en
Albacete **sí tiene sentido mantener intención de búsqueda comercial y de
comparación de precios para el mercado privado en su conjunto y para el tramo
0-2 años en particular**, pero el contenido editorial de las 7 escuelas
municipales (una vez llegue la gratuidad del tramo 2-3 en 2026-27) debe evitar
un enfoque genérico de "comparar precios" para ese subconjunto específico,
explicando en su lugar el mecanismo real (gratuidad solo 2-3 años, solo red
municipal) sin generalizarlo al resto del dataset.

---

## 1. Keyword research — intención de búsqueda en Albacete

Albacete es la capital de provincia con mayor población de Castilla-La Mancha
(por encima de Toledo y Ciudad Real), con demanda de búsqueda propia y
relevante. La intención de búsqueda observada se agrupa en varios niveles:

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en Albacete | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil Albacete | Comercial/informacional | Alto |
| guarderías privadas Albacete | Informacional/comercial, fase de comparación | Medio-alto — el dataset es mayoritariamente privado (16/27, 59%) |
| escuelas infantiles municipales Albacete | Informacional específica | Medio-alto — 7 centros del Patronato Municipal, con demanda de nicho muy cualificada (proceso de admisión anual con jornadas de puertas abiertas, cobertura de prensa local recurrente) |
| escuela infantil Junta Castilla-La Mancha Albacete | Informacional específica | Medio — 4 centros de titularidad autonómica, demanda de nicho |
| cheque escolar Albacete guardería | Informacional/transaccional, alta relevancia actual | Medio-alto — ayuda municipal a la demanda de hasta 100€/mes para centros privados autorizados, ligada directamente a decisión de compra |
| guarderías 0 a 2 años Albacete | Informacional/comercial, muy cualificada | Medio — refleja el hueco de mercado que sigue de pago pese a la gratuidad parcial anunciada para 2-3 años |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con horario ampliado en Albacete / guardería abierta hasta las 20h Albacete | Comercial, filtro de servicio (conciliación laboral) — **prioridad alta** | 6/27 centros con `horario-ampliado` confirmado, incluyendo horarios muy amplios y diferenciales (Mitete 7:30-21:00, Sonrisas 7:00-21:00, El Pilar 7:15-20:00, Tulgarita 7:15-20:00 aunque este último sin fuente primaria citable) |
| guarderías con comedor en Albacete / guardería cocina propia Albacete | Comercial, filtro de servicio (valor percibido alto) — **prioridad alta** | 16/27 centros con `comedor` confirmado (9/16 guarderías privadas + 7/11 públicas), 4/27 con `cocina-propia` específicamente citada |
| guarderías bilingües en Albacete / guardería inglés Albacete | Comercial, filtro de servicio (nicho de alto valor percibido) | 2/27 con `bilingue` confirmado (Sonrisas, Colegio San Cristóbal) + 2/27 con `ingles` (La Cometa, Blabla) — volumen insuficiente para landing propia (4 centros combinando ambos, por debajo del umbral de 5) |
| guarderías con patio exterior Albacete | Informacional/comercial | 4/27 — insuficiente para landing propia |
| guarderías con psicomotricidad / música Albacete | Informacional, nicho | 3-4 centros cada uno — insuficiente para landing propia |
| escuela de verano guardería Albacete | Informacional/comercial, estacional | 4/27 con `verano-campamentos` confirmado — insuficiente para landing propia dedicada, aprovechable como contenido editorial estacional |

### Nivel de titularidad y financiación pública (modelo de Castilla-La Mancha)

| Keyword | Intención |
|---|---|
| escuelas infantiles municipales Albacete Patronato | Informacional específica y muy local — el Patronato Municipal de Escuelas Infantiles del Ayuntamiento de Albacete es un modelo de gestión directa municipal propio, con jornadas de puertas abiertas anuales y cobertura de prensa local recurrente |
| escuela infantil Junta Castilla-La Mancha Albacete 0-2 años | Informacional específica — la red autonómica solo admite los tramos 0, 1 y 2 años (no el tramo 2-3, reservado a la red municipal en el plan de gratuidad) |
| gratuidad escuela infantil 2 3 años Albacete +EscuelaCLM | Informacional/transaccional, alta relevancia futura (calendario 2026-27) — contenido editorial de alto valor mientras se implanta, sin forzar landing propia sin campo filtrable |

### Nivel de distrito/barrio — verificado y con resultado limitado

Albacete capital tiene una estructura de **5-6 distritos administrativos
oficiales** reconocibles (Feria/Villacerrada/Carretas-Huerta de Marzo;
Fátima/Franciscanos/Santa Teresa/Vereda/San Pedro-Mortero/Pedro Lamata;
Hospital/Parque Sur/Sepulcro/Hermanos Falcó/Universidad/Medicina;
Industria/San Antonio Abad/Polígono San Antón/Estrella/Milagrosa; El
Pilar/Cañicas-Canal de María Cristina/San Pablo/Llanos del Águila), confirmados
mediante geocodificación abierta (Nominatim/OpenStreetMap) para 21 de los 27
centros del dataset final.

**Recuento real de centros por distrito/barrio geocodificado**:

| Distrito/barrio | Centros de soporte |
|---|---|
| Santa Teresa | 3 |
| Industria | 3 |
| Fátima | 2 |
| Hospital | 2 |
| Universidad | 2 |
| Carretas-Huerta Marzo | 2 |
| Franciscanos | 1 |
| Vereda | 1 |
| Pedro Lamata | 1 |
| Polígono de San Antón | 1 |
| La Estrella | 1 |
| Cañicas-Canal de María Cristina | 1 |
| San Antonio Abad | 1 |
| Sin distrito confirmado | 6 |

**Conclusión aplicada**: ningún distrito/barrio individual alcanza ni de lejos
el umbral de 5 (`MIN_CENTERS_FOR_TYPE_PAGE`) — el máximo es 3 (Santa Teresa,
Industria). Con un dataset todavía moderado (27 centros) y sin un callejero
oficial exhaustivo del Ayuntamiento (bloqueado durante esta investigación, ver
`docs/data-sources-albacete.md`), no hay base real para ninguna landing de
distrito en esta fase. Es una oportunidad de SEO de nicho a revisar si el
dataset crece en una fase futura (especialmente si se logra acceder al PDF
municipal bloqueado, que podría aportar más centros privados y, potencialmente,
más precisión de zona).

---

## 2. Vocabulario local: sin variantes lingüísticas relevantes

A diferencia de las zonas de la Comunitat Valenciana (Valencia, Alicante,
Castelló de la Plana), donde existe un vocabulario local relevante en valenciano
("escola infantil", "escola bressol"), Albacete capital es una zona
monolingüe en castellano sin cooficialidad de otra lengua, por lo que no hay
ninguna variante léxica local que aporte valor SEO adicional más allá de los
términos estándar en castellano ("guardería", "escuela infantil"). Esto
simplifica el enfoque de keyword research frente a otras zonas ya integradas del
proyecto.

Un matiz local sí relevante: el término **"Patronato Municipal de Escuelas
Infantiles"** es una entidad con nombre propio muy reconocible en búsquedas
locales sobre la red pública municipal, distinto del genérico "escuelas
infantiles públicas" — se recomienda usarlo explícitamente en el contenido
editorial sobre la red municipal.

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-albacete` | type=guarderia, city=albacete | **16** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen sobrado. De los 16, 11 son actualmente `recommended_indexable` a nivel de ficha individual; el resto son centros legítimos de la landing, en `noindex` hasta enriquecerse. |
| `/escuelas-infantiles-en-albacete` | type=escuela-infantil, city=albacete | **11** | ≥10 | **Recomendada, indexable** por volumen (justo por encima del umbral). De los 11, 8 son actualmente `recommended_indexable` a nivel de ficha individual (las 7 municipales + El Pilar de la red autonómica); las 3 escuelas autonómicas restantes (El Tren Azul, Virgen de los Llanos, Los Girasoles) quedan en `noindex` hasta enriquecerse con servicios confirmados. |

Nota: Albacete es la primera zona del proyecto (junto con Castelló de la Plana)
donde `/escuelas-infantiles-en-[ciudad]` alcanza el umbral de 10 de forma
holgada, gracias al peso comparativamente alto de la red pública (11/27, 41%
del dataset) frente a otras zonas de la Comunitat Valenciana donde la red
pública era minoritaria.

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-albacete` | type=guarderia, service=comedor | **9** | ≥5 | **Recomendada, prioridad alta.** Es el servicio confirmado más frecuente de la oferta privada, con valor comercial pleno en todos los tramos de edad (no afectado por la gratuidad parcial del plan +EscuelaCLM). |
| `/guarderias-con-horario-ampliado-en-albacete` | type=guarderia, service=horario-ampliado | 3 | ≥5 | **No recomendada por volumen en esta fase.** Aunque el horario muy ampliado (7:00/7:30 a 20:00/21:00 h) es un diferencial fuerte observado en varios centros (Mitete, Sonrisas), solo 3 guarderías privadas tienen el servicio confirmado por fuente primaria propia — varios centros con horario ampliado citado solo en agregadores de terceros (Tulgarita) se han excluido de `services` por no tener fuente primaria verificable, lo que reduce el recuento por debajo del umbral. Reevaluar si se logra confirmar el horario directamente con más centros en una fase futura. |
| `/guarderias-con-cocina-propia-en-albacete` | type=guarderia, service=cocina-propia | 4 | ≥5 | **No recomendada por volumen**, justo por debajo del umbral. Valorar fusionar editorialmente con la landing de comedor. |
| `/guarderias-con-psicomotricidad-en-albacete` | type=guarderia, service=psicomotricidad | 4 | ≥5 | **No recomendada.** Por debajo del umbral. |
| `/guarderias-con-patio-exterior-en-albacete` | type=guarderia, service=patio-exterior | 4 | ≥5 | **No recomendada.** Por debajo del umbral. |
| `/guarderias-con-verano-campamentos-en-albacete` | type=guarderia, service=verano-campamentos | 4 | ≥5 | **No recomendada.** Por debajo del umbral, aunque con valor estacional como contenido editorial. |
| `/guarderias-bilingues-en-albacete` | type=guarderia, service=bilingue O ingles | 4 (2 con `bilingue`, 2 con `ingles`) | ≥5 | **No recomendada por volumen en esta fase.** A diferencia de Castelló de la Plana o Alicante (con fuerte presencia bilingüe en la oferta privada), en Albacete el bilingüismo/inglés confirmado por fuente primaria es todavía un nicho pequeño (4/16 guarderías). |
| `/guarderias-con-musica-en-albacete` | type=guarderia, service=musica | 3 | ≥5 | **No recomendada.** Por debajo del umbral. |

**Única landing de servicio recomendada en esta fase: comedor (9 centros).**
El resto de servicios, aunque presentes en el mercado real de Albacete (según
indicios de agregadores de terceros no usados como fuente de `services`), no
alcanzan el umbral mínimo del proyecto con los datos verificados por fuente
primaria en este sprint.

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de "escuelas infantiles públicas de Albacete" (concepto) | ownership=publico | 11 | ≥10 | **Coincide con `/escuelas-infantiles-en-albacete`**, ya recomendada arriba. No se propone como landing adicional distinta. |
| Landing de "Cheque Escolar en guarderías de Albacete" (concepto) | No modelable con `SeoPageFilters` actual | — | — | **No recomendada como landing propia** — sin campo filtrable de financiación en el schema actual. Se recomienda tratarlo como contenido editorial dentro de `/guarderias-en-albacete`, con mención explícita del Cheque Escolar municipal (100/80/60 €/mes según renta) como ayuda a la demanda distinta de un concierto educativo. |
| Landing de "gratuidad 2-3 años +EscuelaCLM Albacete" (concepto) | No modelable con `SeoPageFilters` actual | — | — | **No recomendada como landing propia en esta fase** (calendario 2026-27 todavía no vigente en el momento de este sprint) — recomendado como contenido editorial de alto valor una vez se implante, dentro de la sección dedicada a las 7 escuelas municipales. |

### Landings de distrito/barrio

**No se recomienda ninguna landing de distrito/barrio en esta fase.** El
distrito/barrio con más soporte (Santa Teresa, Industria) solo alcanza 3
centros, muy por debajo del umbral de 5. Ver detalle completo en la sección 1.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-albacete` | 16 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-albacete` | 11 | Indexable por volumen (≥10), justo por encima del umbral |
| `/guarderias-con-comedor-en-albacete` | 9 | Indexable por volumen (≥5) |
| `/guarderias-con-horario-ampliado-en-albacete` | 3 | **No crear** en esta fase (por debajo de ≥5) |
| `/guarderias-con-cocina-propia-en-albacete` | 4 | **No crear** en esta fase (por debajo de ≥5) |
| `/guarderias-bilingues-en-albacete` | 4 | **No crear** en esta fase (por debajo de ≥5) |
| `/guarderias-con-psicomotricidad-en-albacete` | 4 | **No crear** |
| `/guarderias-con-patio-exterior-en-albacete` | 4 | **No crear** |
| `/guarderias-con-verano-campamentos-en-albacete` | 4 | **No crear** |
| `/guarderias-con-musica-en-albacete` | 3 | **No crear** |
| Landings de distrito/barrio (cualquiera) | 3 (máximo, Santa Teresa/Industria) | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4),
cualquier landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al
menos 4-5 FAQs propias desde el primer commit que la marque potencialmente
indexable.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-albacete` (soporte muy sobrado, 16 centros).
2. Crear `/escuelas-infantiles-en-albacete` (soporte suficiente, 11 centros) —
   Albacete es de las pocas zonas del proyecto donde esta landing alcanza el
   umbral con holgura gracias al peso relativo de la red pública.
3. Crear `/guarderias-con-comedor-en-albacete` (9 centros) como única landing de
   servicio recomendada en esta fase.
4. **No crear** el resto de landings de servicio (horario ampliado, cocina
   propia, bilingüe, psicomotricidad, patio exterior, verano-campamentos,
   música) — todas por debajo del umbral de 5 con los datos verificados por
   fuente primaria en este sprint. Reevaluar horario-ampliado y bilingüe en una
   fase futura si se amplía la cobertura de servicios confirmados (varios
   centros mencionan horario ampliado o bilingüismo solo en fuentes de
   terceros, no citables como fuente de `services` por el criterio estricto del
   proyecto).
5. **No crear** ninguna landing de distrito/barrio en esta fase — máximo 3
   centros por distrito (Santa Teresa, Industria), muy por debajo del umbral.
6. Contenido editorial de `/guarderias-en-albacete` y
   `/escuelas-infantiles-en-albacete` debe explicar con precisión el mecanismo
   de gratuidad parcial de Castilla-La Mancha (plan "+EscuelaCLM"): solo tramo
   2-3 años, solo red municipal, calendario 2026-27 — evitando generalizarlo al
   resto del dataset (16 centros privados y 4 centros de titularidad autonómica
   quedan fuera de esa gratuidad concreta) y evitando presentar el Cheque
   Escolar municipal (ayuda a la demanda para centros privados) como si fuera
   el mismo mecanismo.
7. Mencionar el Patronato Municipal de Escuelas Infantiles del Ayuntamiento de
   Albacete por su nombre propio en el contenido editorial sobre la red
   municipal, dado su reconocimiento como entidad diferenciada en búsquedas
   locales.
8. **Enriquecimiento prioritario recomendado antes de una futura Ronda de
   ampliación de este dataset**: reintentar el acceso al PDF municipal de
   guarderías privadas autorizadas (bloqueado durante este sprint) para
   confirmar si existen más centros privados no localizados, lo que podría
   activar en el futuro alguna landing de servicio o de distrito actualmente
   por debajo de umbral.
