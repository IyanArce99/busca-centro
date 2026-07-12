# Informe SEO — Sevilla

Keyword research y recomendación de landings para el municipio de Sevilla, basado
en el dataset final de 218 centros (`data/enrichment/sevilla-centers.json`). Este
informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es competencia del
integrador tras auditoría. Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10`
y `MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 1. Keyword research — intención de búsqueda en Sevilla

Sevilla es la cuarta ciudad de España por población y capital de Andalucía, con
demanda de búsqueda propia y muy relevante (no residual respecto a
Madrid/Barcelona/Valencia). La intención de búsqueda observada se agrupa en varios
niveles:

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en sevilla | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil sevilla | Comercial/informacional | Alto |
| guarderías sevilla precios | Comercial, fase de comparación | Medio |
| escuelas infantiles junta de andalucía sevilla | Informacional específica (red pública autonómica) | Medio-alto — término muy propio del modelo andaluz, con búsqueda estacional marcada (picos en marzo-abril, coincidiendo con el plazo de admisión de la Junta) |
| guarderías adheridas junta de andalucía sevilla | Informacional/comercial, específica del programa de ayudas | Medio — término propio del modelo andaluz de financiación a la demanda, sin equivalente exacto en Madrid/Cataluña |
| guardería gratis sevilla / comedor gratis sevilla niños | Informacional/transaccional, alta relevancia actual | Medio-alto — ligado a la gratuidad del tramo socioeducativo para 1-2 años vigente desde el curso 2025/26, con cobertura mediática reciente |
| lista de guarderías privadas sevilla | Informacional, fase de comparación | Medio |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con comedor en sevilla | Comercial, filtro de servicio | 24/218 centros con `comedor` confirmado (15 escuela-infantil públicas + 9 guardería privadas) |
| guarderías bilingües sevilla | Comercial, filtro de servicio (nicho, alto valor percibido) | 7 centros con `bilingue` confirmado, todos `guarderia` privados |
| guarderías con inglés sevilla | Comercial, filtro de servicio | 7 centros con `ingles` confirmado |
| guarderías con horario ampliado sevilla | Comercial, filtro de servicio (conciliación laboral) | Solo 2 centros con `horario-ampliado` confirmado — insuficiente para landing propia |
| escuelas infantiles con patio exterior sevilla | Informacional/comercial | 6 centros con `patio-exterior` confirmado |
| escuela de padres guardería sevilla | Informacional, nicho | 6 centros con `escuela-de-padres` confirmado |

### Nivel de titularidad y financiación pública (peculiaridad del modelo andaluz, sin equivalente exacto en Madrid/Barcelona/Valencia)

Andalucía tiene un modelo de financiación de primer ciclo distinto al de otras
comunidades: no existe una red municipal amplia (como en Zaragoza o Murcia) ni un
concierto educativo clásico, sino una **red pública de titularidad autonómica**
(15 centros en Sevilla capital) más un **Programa de Ayuda a las Familias** que
bonifica plazas en centros privados "adheridos" (174 de los 203 privados de
Sevilla). Se detecta intención de búsqueda diferenciada:

| Keyword | Intención |
|---|---|
| solicitud plaza escuela infantil junta de andalucía sevilla | Informacional/transaccional, muy estacional (marzo-abril) |
| centros adheridos programa ayuda familias sevilla | Informacional específica, creciente por la gratuidad 2025/26 |
| guarderías gratis 1 y 2 años sevilla | Informacional/transaccional, alta relevancia actual |

Esta distinción público-autonómico / privado-adherido / privado-no-adherido es un
rasgo genuino del mercado sevillano (y andaluz en general) que conviene explicar en
el contenido editorial de las landings municipales, en vez de simplificarlo como
"público vs. privado" sin matices.

### Nivel de distrito/barrio

Sevilla tiene una identidad de búsqueda por distrito muy marcada y reconocible
(Triana, Los Remedios, Nervión, Macarena, Cerro-Amate, Casco Antiguo, Este-Alcosa-
Torreblanca, etc.), con volumen de búsqueda cualitativamente alto para consultas
tipo "guardería en Triana" o "escuela infantil Nervión". **Sin embargo, el dataset
actual no tiene masa suficiente por distrito/barrio para sostener honestamente
ninguna landing de zona** (ver sección 3): solo 17 de 218 centros (7.8%) tienen
`neighborhood_barrio` confirmado en fuente oficial, y ninguna barriada individual
alcanza siquiera 4 centros. Esta es la principal brecha de datos pendiente para una
futura fase de enriquecimiento con el callejero oficial del Ayuntamiento de
Sevilla.

---

## 2. Vocabulario local

No se detecta vocabulario local distintivo (a diferencia de "escola bressol" en
Cataluña o "escoles infantils" en Valencia) — las fuentes oficiales de Andalucía
usan consistentemente "escuela infantil"/"centro de educación infantil" y
"guardería" en castellano estándar. Sí hay vocabulario administrativo propio que
conviene incorporar de forma natural en contenido editorial futuro:

- **"Programa de Ayuda a las Familias para el fomento de la escolarización de
  educación Infantil"** — nombre oficial del mecanismo de bonificación en centros
  privados adheridos, con búsqueda propia creciente por la gratuidad 2025/26.
- **"Escuelas Infantiles de la Junta de Andalucía"** — denominación de la red
  pública autonómica de primer ciclo (distinta del concepto de "escuela infantil
  municipal" que sí existe en otras ciudades del estudio).
- **"Atención socioeducativa"** — término oficial del tramo horario central
  (9:00-15:30) que incluye comedor.
- **"Aula matinal" / "aula de tarde"** — tramos horarios complementarios
  oficiales (7:30-9:00 y 15:30-17:00).

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-sevilla` | type=guarderia, city=sevilla | **203** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen muy sobrado. Nota: de los 203, solo 14 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio o long_description confirmado); el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada. |
| `/escuelas-infantiles-en-sevilla` | type=escuela-infantil, city=sevilla | **15** | ≥10 | **Recomendada, indexable** por volumen. Las 15 tienen ficha individual indexable (horario, comedor y proceso de admisión confirmados por fuente oficial homogénea). |

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-sevilla` | type=guarderia, service=comedor | 9 | ≥5 | **Recomendada** |
| `/escuelas-infantiles-con-comedor-en-sevilla` | type=escuela-infantil, service=comedor | 15 | ≥5 | **Recomendada** — coincide con el 100% de la red pública, dato genuinamente diferencial (comedor incluido en el tramo socioeducativo oficial) |
| `/guarderias-bilingues-en-sevilla` | type=guarderia, service=bilingue | 7 | ≥5 | **Recomendada, superando el umbral con margen razonable** |
| `/guarderias-con-ingles-en-sevilla` | type=guarderia, service=ingles | 7 | ≥5 | **Recomendada** (valorar si conviene fusionar contenido con la de bilingües para no duplicar intención de búsqueda casi idéntica — hay solapamiento parcial de centros entre `bilingue` e `ingles`) |
| `/guarderias-con-patio-exterior-en-sevilla` | type=guarderia, service=patio-exterior | 6 | ≥5 | **Recomendada, en el límite** — revisar tras la siguiente pasada de enriquecimiento de servicios antes de publicarla, ya que el margen sobre el umbral es pequeño |
| `/guarderias-con-horario-ampliado-en-sevilla` | type=guarderia, service=horario-ampliado | 2 | ≥5 | **No recomendada.** Solo 2 centros confirmados, muy por debajo del umbral — es justo el tipo de página fina que las reglas del proyecto prohíben explícitamente. |
| `/escuelas-infantiles-con-horario-ampliado-en-sevilla` | type=escuela-infantil, service=horario-ampliado | 0 | ≥5 | **No recomendada.** Ninguna escuela pública tiene `horario-ampliado` confirmado como servicio distinto (su horario homogéneo 7:30-17:00 ya incluye aula matinal y aula de tarde dentro del marco general, no un servicio adicional aparte). |
| `/escuelas-infantiles-bilingues-en-sevilla` | type=escuela-infantil, service=bilingue | 0 | ≥5 | **No recomendada.** Ninguna de las 15 escuelas públicas tiene bilingüismo confirmado en fuente oficial. |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/escuelas-infantiles-publicas-en-sevilla` (si se decide modelar como variante de ownership) | ownership=publico | 15 | ≥10 | **Recomendada como concepto**, aunque requiere decidir primero si se modela como landing de `ownership` (no contemplado explícitamente en `SeoPageFilters`, que solo admite `ownership` opcional junto a `centerType`) o se resuelve mejor documentalmente dentro de `/escuelas-infantiles-en-sevilla`, dado que en este dataset `ownership=publico` coincide exactamente con `type=escuela-infantil`. Se deja como nota para el integrador. |
| Landing de centros "adheridos al Programa de Ayuda a las Familias" | `source_group=privado_adherido` (dato interno; **no** `ownership`, ver corrección post-auditoría 2026-07-12 — los 174 centros llevan `ownership=privado` como el resto de privados) | 174 | ≥10 | **Concepto con soporte muy sobrado (174 centros)**, pero requiere una decisión editorial y técnica previa: el proyecto no tiene actualmente un campo filtrable en `SeoPageFilters` para "adhesión a subvención" (solo hay `ownership`, que ya no distingue este caso tras la corrección). El integrador tendría que añadir un filtro nuevo o resolverlo mediante contenido editorial dentro de las landings existentes, explicando la adhesión sin implicar un "concierto" educativo que no existe en Andalucía para este ciclo. |

### Landings de distrito/barrio

| Barriada (`neighborhood_barrio` confirmado) | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Los Príncipes | 3 | ≥5 | No alcanza |
| San Diego | 2 | ≥5 | No alcanza |
| Aeropuerto Viejo | 1 | ≥5 | No alcanza |
| Santa Clara | 1 | ≥5 | No alcanza |
| Valdezorras | 1 | ≥5 | No alcanza |
| Los Bermejales | 1 | ≥5 | No alcanza |
| Juan XXIII | 1 | ≥5 | No alcanza |
| Parque Alcosa | 1 | ≥5 | No alcanza |
| Doctora Este | 1 | ≥5 | No alcanza |
| Torreblanca | 1 | ≥5 | No alcanza |
| Martínez Montañés | 1 | ≥5 | No alcanza |
| Núcleo Residencial Virgen de Gracia | 1 | ≥5 | No alcanza |
| Ntra. Sra. del Amparo | 1 | ≥5 | No alcanza |
| La Oliva | 1 | ≥5 | No alcanza |
| Resto (201 centros) | Sin barrio/distrito confirmado | — | No aplicable hasta enriquecer |

**Ningún barrio/distrito alcanza el umbral de 5 centros** en el estado actual del
dataset, porque solo 17 de 218 centros (7.8%) tienen `neighborhood_barrio`
confirmado por fuente oficial, y esos 17 están repartidos en 14 barriadas
distintas (máximo 3 en una sola). **No se recomienda crear ninguna landing de
distrito/barrio en esta fase**, pese a que la intención de búsqueda cualitativa
por distrito en Sevilla (Triana, Nervión, Los Remedios, Macarena, etc.) es alta.
Si en un sprint posterior se completa el distrito/barrio de los 201 centros
restantes mediante el callejero oficial del Ayuntamiento de Sevilla (que permite
consulta de distrito por vía y número), varios de los 11 distritos administrativos
probablemente superarían con holgura el umbral y merecerían landings propias — es
la brecha de datos con mayor potencial SEO detectada en este sprint.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-sevilla` | 203 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-sevilla` | 15 | Indexable por volumen (≥10) |
| `/guarderias-con-comedor-en-sevilla` | 9 | Indexable por volumen (≥5) |
| `/escuelas-infantiles-con-comedor-en-sevilla` | 15 | Indexable por volumen (≥5) |
| `/guarderias-bilingues-en-sevilla` | 7 | Indexable por volumen (≥5) |
| `/guarderias-con-ingles-en-sevilla` | 7 | Indexable por volumen (≥5), valorar fusión de contenido con bilingües |
| `/guarderias-con-patio-exterior-en-sevilla` | 6 | Indexable por volumen, pero en el límite — revisar tras enriquecimiento |
| `/guarderias-con-horario-ampliado-en-sevilla` | 2 | **No crear** |
| `/escuelas-infantiles-con-horario-ampliado-en-sevilla` | 0 | **No crear** |
| `/escuelas-infantiles-bilingues-en-sevilla` | 0 | **No crear** |
| Landings de distrito/barrio (cualquiera) | máx. 3 | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4),
cualquier landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al
menos 4-5 FAQs propias desde el primer commit que la marque potencialmente
indexable, diferenciando explícitamente el enfoque de guardería (conciliación,
horarios, adhesión al Programa de Ayuda a las Familias) del de escuela infantil
(etapa educativa, titularidad autonómica, horario y admisión homogéneos de la Junta
de Andalucía) — no crear landings clon cambiando solo el tipo.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-sevilla` y `/escuelas-infantiles-en-sevilla` (soporte muy
   sobrado, 203 y 15 centros respectivamente).
2. Crear `/guarderias-con-comedor-en-sevilla` y
   `/escuelas-infantiles-con-comedor-en-sevilla` (soporte sobrado, 9 y 15).
3. Crear `/guarderias-bilingues-en-sevilla` y `/guarderias-con-ingles-en-sevilla`
   (7 centros cada una, aunque valorar si conviene diferenciar bien el contenido
   editorial de ambas para evitar solapamiento de intención de búsqueda).
4. Evaluar `/guarderias-con-patio-exterior-en-sevilla` con cautela (6 centros,
   cerca del umbral) — mejor esperar a la siguiente pasada de enriquecimiento de
   servicios antes de publicarla.
5. **No crear** landing de horario ampliado (2 guardería / 0 escuela-infantil) ni
   de escuela infantil bilingüe (0 centros) — thin content garantizado.
6. **No crear** ninguna landing de distrito/barrio en esta fase — ningún
   barrio/distrito alcanza el umbral con los datos actuales, y el 92% de los
   centros del dataset no tiene barrio/distrito confirmado en ninguna fuente
   oficial consultada. Esta es la brecha de datos con mayor potencial de mejora
   SEO detectada, dada la fuerte identidad de búsqueda por distrito que tiene
   Sevilla (Triana, Nervión, Los Remedios, Macarena, etc.).
7. Contenido editorial de las landings municipales debe explicar el modelo
   andaluz de financiación de primer ciclo (red pública autonómica + Programa de
   Ayuda a las Familias en centros privados adheridos, con gratuidad para 1-2 años
   desde 2025/26) como rasgo diferencial de Sevilla frente a Madrid/Barcelona/
   Valencia/Zaragoza/Murcia, en vez de tratarlo como un simple "público vs.
   privado" o reutilizar sin más el copy de "concertado" de otras ciudades del
   proyecto.
