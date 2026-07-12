# Informe SEO — Jerez de la Frontera

Keyword research y recomendación de landings para el municipio de Jerez de la
Frontera, basado en el dataset final de 37 centros
(`data/enrichment/jerez-centers.json`). Este informe **no crea ni edita**
`src/data/mock-seo-pages.ts` — eso es competencia del integrador tras auditoría.
Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10` y
`MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 1. Contexto de demanda: un municipio con valor comercial estructuralmente bajo

Jerez de la Frontera es el municipio más poblado de la provincia de Cádiz (más de
210.000 habitantes) y uno de los mayores de Andalucía, pero presenta uno de los
niveles de renta per cápita más bajos de España entre municipios de más de
100.000 habitantes, junto con una tasa de paro estructuralmente alta. Esto no
cambia el rigor de la investigación de datos, pero sí condiciona de forma directa
la interpretación honesta del keyword research: cabe esperar que el volumen de
búsqueda en clústeres de alto valor percibido (bilingüe, premium,
internacional) sea comparativamente bajo frente a otras zonas ya integradas del
proyecto con perfil socioeconómico distinto (Málaga, Madrid, Barcelona), mientras
que el volumen en clústeres de conciliación laboral básica (horario, comedor,
adhesión al Programa de Ayuda a las Familias, gratuidad) es previsiblemente más
relevante en proporción. El dataset confirma esta hipótesis de forma indirecta:
solo 1 de 37 centros tiene `bilingue` confirmado por fuente propia (Attendis
Preschool Jerez, cadena con presencia en varias provincias, no un operador local),
frente a proporciones más altas detectadas en Málaga.

---

## 2. Keyword research — intención de búsqueda en Jerez de la Frontera

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en jerez / guarderías en jerez de la frontera | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil jerez de la frontera | Comercial/informacional | Alto |
| escuelas infantiles junta de andalucía jerez | Informacional específica (red pública autonómica), estacional (picos marzo-abril) | Medio |
| guarderías adheridas programa ayuda familias jerez | Informacional/comercial, específica del modelo andaluz de financiación a la demanda | Medio |
| guardería gratis jerez / guardería 2 años gratis jerez | Informacional/transaccional, alta relevancia actual (gratuidad del tramo de 2 años en centros de la Junta desde 2025/26) | Medio-alto |
| lista de guarderías privadas jerez | Informacional, fase de comparación | Medio |
| guarderías jerez precios | Comercial, fase de comparación — previsiblemente más sensible al precio que en zonas de mayor renta | Medio |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con comedor en jerez | Comercial, filtro de servicio | 3/31 guarderías con `comedor` confirmado |
| guarderías con patio exterior jerez | Comercial, filtro de servicio | 3/31 guarderías con `patio-exterior` confirmado |
| guarderías con horario ampliado jerez | Comercial, filtro de servicio (conciliación laboral) | 1/31 guardería con `horario-ampliado` confirmado |
| guarderías bilingües jerez | Comercial, filtro de servicio | Solo 1/31 guardería con `bilingue` confirmado en el enum estricto — muy insuficiente para landing propia |
| guarderías con psicomotricidad jerez | Informacional/comercial, nicho | 2/31 guarderías con `psicomotricidad` confirmado |
| guardería con madrugadores jerez | Comercial, filtro de servicio (conciliación laboral) | 1/31 guardería con `servicio-madrugadores` confirmado |

**Nota importante sobre el bajo soporte de servicios confirmados**: con solo 4 de
37 centros (10,8%) con algún servicio confirmado por fuente propia, ningún
clúster de servicio alcanza siquiera de lejos el umbral `MIN_CENTERS_FOR_TYPE_PAGE
= 5`. Esto es consistente con el patrón ya detectado en otras zonas de Andalucía
(la brecha entre percepción de mercado y dato verificado en fuente primaria
propia es estructural del modelo de datos abiertos de la Junta, que no recoge
servicios), pero en Jerez de la Frontera es más acusado que en Sevilla, Málaga,
Córdoba o Granada, en parte por el tamaño más reducido de la muestra (37 frente a
129 en Córdoba) y en parte por una presencia web propia más limitada entre los
centros privados de perfil más modesto.

### Nivel de titularidad y financiación pública (peculiaridad del modelo andaluz)

Igual que en Sevilla, Málaga, Córdoba y Granada, Andalucía no tiene concierto
educativo clásico en primer ciclo, sino una red pública autonómica + un Programa
de Ayuda a las Familias que bonifica plazas en centros privados "adheridos" (29
de los 31 privados de Jerez de la Frontera, una proporción de adhesión muy alta,
93,5%).

| Keyword | Intención |
|---|---|
| solicitud plaza escuela infantil junta de andalucía jerez | Informacional/transaccional, muy estacional (marzo-abril) |
| centros adheridos programa ayuda familias jerez | Informacional específica, creciente por la gratuidad 2025/26 |
| guardería gratis 2 años jerez | Informacional/transaccional, alta relevancia actual y previsiblemente de mayor peso relativo en Jerez que en zonas de mayor renta, dado el contexto socioeconómico del municipio |
| escuela infantil pública jerez de la frontera | Informacional, alta intención dado el perfil de renta del municipio (mayor sensibilidad al coste que a la oferta premium) |

---

## 3. Vocabulario local

No se detecta vocabulario local distintivo respecto al castellano estándar (a
diferencia de "escola bressol" en Cataluña o "escoles infantils" en Valencia) —
las fuentes oficiales de Andalucía usan consistentemente "escuela infantil"/
"centro de educación infantil" y "guardería", igual que en Sevilla, Málaga,
Córdoba y Granada. Vocabulario administrativo propio a incorporar de forma
natural en contenido editorial futuro:

- **"Programa de Ayuda a las Familias para el fomento de la escolarización de
  educación Infantil"** — nombre oficial del mecanismo de bonificación en centros
  privados adheridos.
- **"Escuelas Infantiles de la Junta de Andalucía"** — denominación de la red
  pública autonómica de primer ciclo.
- **"Atención socioeducativa"** — término oficial del tramo horario central
  (9:00-15:30) que incluye comedor.
- **"Aula matinal" / "aula de tarde"** — tramos horarios complementarios
  oficiales (7:30-9:00 y 15:30-17:00).
- Nombres de pedanías/núcleos de población del término municipal, relevantes
  para búsquedas hiperlocales: Guadalcacín, Mesas de Asta, La Barca de la
  Florida, Torrecera, El Torno, Estella del Marqués.
- Nombres de distrito y barrio de Jerez capital, no verificados a nivel de centro
  en este sprint pero relevantes para contenido editorial futuro: Centro,
  Santiago, San Mateo, San Miguel, La Plata, San Telmo, Montealto, La Granja,
  Federico Mayo, Ciudasol.

---

## 4. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-jerez-de-la-frontera` | type=guarderia, city=jerez-de-la-frontera | **31** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen sobrado. Nota: de los 31, solo 4 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio confirmado o long_description); el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada. |
| `/escuelas-infantiles-en-jerez-de-la-frontera` | type=escuela-infantil, city=jerez-de-la-frontera | **6** | ≥10 | **No alcanza el umbral municipal** (6 < 10). No recomendada en esta fase, a diferencia de Sevilla, Málaga o Córdoba/Granada, donde la red pública autonómica sí superaba las 10 unidades. Revisar si en próximas campañas de escolarización se amplía la red pública en Jerez de la Frontera. |

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-jerez-de-la-frontera` | type=guarderia, service=comedor | 3 | ≥5 | **No alcanza el umbral** — no recomendada de momento |
| `/guarderias-con-patio-exterior-en-jerez-de-la-frontera` | type=guarderia, service=patio-exterior | 3 | ≥5 | **No alcanza el umbral** |
| `/guarderias-con-psicomotricidad-en-jerez-de-la-frontera` | type=guarderia, service=psicomotricidad | 2 | ≥5 | **No alcanza el umbral** |
| `/guarderias-con-horario-ampliado-en-jerez-de-la-frontera` | type=guarderia, service=horario-ampliado | 1 | ≥5 | **No alcanza el umbral** |
| `/guarderias-con-madrugadores-en-jerez-de-la-frontera` | type=guarderia, service=servicio-madrugadores | 1 | ≥5 | **No alcanza el umbral** |
| `/guarderias-bilingues-en-jerez-de-la-frontera` | type=guarderia, service=bilingue | 1 | ≥5 | **No alcanza el umbral** |
| `/guarderias-con-escuela-de-padres-en-jerez-de-la-frontera` | type=guarderia, service=escuela-de-padres | 1 | ≥5 | **No alcanza el umbral** |
| Cualquier otro servicio del enum | — | 0 | ≥5 | **No recomendada ninguna** |
| `/escuelas-infantiles-con-*-en-jerez-de-la-frontera` (cualquier servicio) | type=escuela-infantil, service=* | 0 | ≥5 | **No recomendada ninguna.** Ninguna de las 6 escuelas públicas tiene servicios del enum confirmados de forma individual (solo horario homogéneo). |

**Ninguna landing de servicio alcanza el umbral mínimo en este sprint.** Es el
resultado más limitado de todas las zonas andaluzas integradas hasta ahora
(Sevilla, Málaga, Córdoba y Granada sí tenían al menos 2-3 landings de servicio
con soporte suficiente). Motivo principal: la muestra total (37 centros) es
comparativamente pequeña y la tasa de confirmación de servicios por web propia
(10,8%) es la más baja detectada hasta ahora en el proyecto.

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de centros "adheridos al Programa de Ayuda a las Familias" | `source_group=privado_adherido` (dato interno; **no** `ownership`) | 29 | ≥10 | **Concepto con soporte sobrado**, pero requiere una decisión editorial y técnica previa: el proyecto no tiene actualmente un campo filtrable en `SeoPageFilters` para "adhesión a subvención" (solo hay `ownership`, que ya no distingue este caso). Mismo comentario ya documentado para Sevilla, Málaga, Córdoba y Granada — se deja como nota para el integrador, no como landing lista para crear. |

### Landings de distrito/barrio/pedanía

| Distrito/pedanía | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Cualquier distrito administrativo de Jerez capital (Centro, Este, Norte, Noreste, Oeste, Sur) | 0 (campo `district` no poblado para el núcleo urbano; ver informe de calidad, sección 6.2) | ≥5 | **No recomendada ninguna.** El dataset no tiene el campo `district` estructurado para los 33 centros del núcleo urbano. |
| Pedanías (Mesas de Asta, Guadalcacín, La Barca de la Florida, Torrecera) | 1 centro por pedanía | ≥5 | **No recomendada.** Ninguna pedanía alcanza el umbral de 5 centros por sí sola; son núcleos de población pequeños con un único centro público cada uno. |

**No se recomienda crear ninguna landing de distrito/barrio/pedanía en esta
fase.** El dataset no tiene el campo `district` poblado para el núcleo urbano de
Jerez capital, y las pedanías identificadas tienen, como máximo, un único centro
cada una.

---

## 5. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-jerez-de-la-frontera` | 31 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-jerez-de-la-frontera` | 6 | **No crear** — por debajo del umbral municipal de 10 |
| Cualquier landing de servicio (guardería) | máximo 3 | **No crear ninguna** — ninguna alcanza el umbral de 5 |
| Cualquier landing de servicio (escuela infantil) | 0 | **No crear ninguna** |
| Landings de distrito/barrio/pedanía (cualquiera) | máximo 1 | **No crear ninguna** en esta fase |

**Con los datos actuales, Jerez de la Frontera solo tiene soporte real para UNA
única landing indexable: `/guarderias-en-jerez-de-la-frontera` (31 centros).**
Es el resultado más conservador de todas las zonas andaluzas investigadas hasta
ahora en el proyecto. No se recomienda forzar la publicación de ninguna otra
landing hasta una siguiente pasada de enriquecimiento que incremente
sustancialmente la tasa de confirmación de servicios (actualmente 10,8%, la más
baja detectada) y/o incorpore un mapeo verificado de distrito para el núcleo
urbano.

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4),
cualquier landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al
menos 4-5 FAQs propias desde el primer commit que la marque potencialmente
indexable. Para `/guarderias-en-jerez-de-la-frontera`, el contenido editorial
debería explicar honestamente el contexto socioeconómico del municipio (sin usar
lenguaje alarmista ni comparativo negativo) y el peso proporcionalmente alto de
la adhesión al Programa de Ayuda a las Familias (93,5% de los privados del
dataset), en línea con las reglas de tono del proyecto (`AGENTS.md`: evitar
reclamos no verificables, usar wording seguro).

---

## 6. Resumen de recomendaciones

1. Crear **únicamente** `/guarderias-en-jerez-de-la-frontera` (soporte sobrado,
   31 centros).
2. **No crear** `/escuelas-infantiles-en-jerez-de-la-frontera` — con 6 centros no
   alcanza el umbral municipal de 10. Revisar en una futura actualización del
   dataset si la red pública autonómica se amplía.
3. **No crear** ninguna landing de servicio en esta fase — ninguna alcanza el
   umbral mínimo de 5 centros; el máximo detectado es 3 (comedor, patio
   exterior). Es la mayor prioridad de enriquecimiento futuro: incrementar la
   tasa de confirmación de servicios por web propia, actualmente en el 10,8% del
   dataset (la más baja del proyecto hasta ahora).
4. **No crear** ninguna landing de distrito, barrio ni pedanía — el dataset no
   tiene el campo `district` poblado para el núcleo urbano, y las pedanías
   identificadas tienen como máximo un centro cada una.
5. Contenido editorial de la landing municipal debe explicar el modelo andaluz de
   financiación de primer ciclo (red pública reducida + Programa de Ayuda a las
   Familias en centros privados adheridos, con gratuidad para el tramo de 2 años
   desde 2025/26) como rasgo diferencial de Jerez de la Frontera frente a otras
   zonas ya integradas, con un tono honesto sobre el perfil socioeconómico del
   municipio, sin proyecciones de demanda infundadas en verticales de alto valor
   percibido (bilingüe/internacional), que este sprint confirma que tienen muy
   poco soporte real en el dataset (1 solo centro bilingüe confirmado, cadena con
   presencia multiprovincial, no oferta local).
