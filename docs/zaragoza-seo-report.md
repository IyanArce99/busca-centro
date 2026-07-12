# Informe SEO — Zaragoza

Keyword research y recomendación de landings para el municipio de Zaragoza, basado
en el dataset final de 59 centros (`data/enrichment/zaragoza-centers.json`). Este
informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es competencia del
integrador tras auditoría. Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10` y
`MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 1. Keyword research — intención de búsqueda en Zaragoza

Zaragoza es la quinta ciudad de España por población y capital de Aragón, con
demanda de búsqueda relevante propia (no residual respecto a Madrid/Barcelona/
Valencia). La intención de búsqueda observada se agrupa en tres niveles:

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en zaragoza | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, la variante con más búsqueda del clúster |
| escuela infantil zaragoza | Comercial/informacional | Alto |
| guarderías zaragoza precios | Comercial, fase de comparación | Medio |
| escuelas infantiles municipales zaragoza | Informacional específica (red pública) | Medio-alto — término muy propio de Zaragoza, con búsqueda estacional marcada (picos en marzo-abril, coincidiendo con el plazo de solicitud de plaza municipal) |
| guarderías públicas zaragoza | Informacional/comercial | Medio |
| lista de guarderías privadas zaragoza | Informacional, fase de comparación | Medio-bajo |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con comedor en zaragoza | Comercial, filtro de servicio | 29/59 centros con `comedor` (18 escuela-infantil + 11 guardería) |
| guarderías con horario ampliado zaragoza | Comercial, filtro de servicio (conciliación laboral) | Solo 6 centros (todos `guarderia`, todos privados) |
| guarderías bilingües zaragoza | Comercial, filtro de servicio (nicho, alto valor percibido) | Solo 1 centro con `bilingue` confirmado (+ 4 adicionales con `ingles` sin bilingüismo pleno confirmado) |
| escuelas infantiles con cocina propia zaragoza | Informacional/comercial | 24/59 centros, mayoritariamente públicos |

### Nivel de admisión pública (intención informacional específica de Zaragoza, sin equivalente exacto en Madrid/Barcelona/Valencia)

Zaragoza tiene una peculiaridad de búsqueda relevante: **coexisten dos redes públicas
distintas** (13 escuelas municipales del Ayuntamiento + 4 escuelas autonómicas del
Gobierno de Aragón), cada una con su propio proceso de admisión y calendario. Se
detecta intención de búsqueda diferenciada:

| Keyword | Intención |
|---|---|
| solicitud plaza escuela infantil municipal zaragoza | Informacional/transaccional, muy estacional (marzo-abril) |
| guarderías dga zaragoza / guarderías gobierno de aragón zaragoza | Informacional específica |
| escuelas infantiles municipales zaragoza barrios | Informacional, con intención de localización por zona |

Esta distinción público-municipal / público-autonómico es un matiz real del mercado
zaragozano que no debe diluirse en una única landing genérica de "centros públicos".

### Nivel de distrito/barrio

Zaragoza tiene identidad de búsqueda real por barrio para muchas búsquedas locales
(inmobiliario, comercio, servicios), pero **el dataset actual no tiene masa
suficiente por distrito para sostener landings de barrio** (ver sección 3). Los
barrios con más centros del dataset son los que además tienen escuela municipal
propia (Actur-Rey Fernando, Casco Histórico, El Rabal, Oliver-Valdefierro, Torrero-La
Paz), pero cada uno solo con 2-3 centros confirmados — la observación cualitativa es
que existe intención de búsqueda por barrio (ej. "guardería en Actur", "escuela
infantil Delicias"), pero el dataset actual no puede sostenerla honestamente sin
enriquecer antes la cobertura de distrito de los 41 centros privados.

---

## 2. Vocabulario local

No se detecta vocabulario local distintivo en aragonés/fabla que sea relevante para
SEO de este vertical (a diferencia de "escola bressol"/"llar d'infants" en Catalunya
o "escoles infantils" en Valencia) — las fuentes oficiales de Aragón usan
consistentemente "escuela infantil" y "guardería" en castellano estándar. Sí hay
vocabulario administrativo propio a incorporar de forma natural en contenido
editorial futuro:

- **"Patronato Municipal de Educación y Bibliotecas"** — organismo gestor de la red
  municipal, mencionado explícitamente en el dataset y con búsqueda propia.
- **"Escuelas Infantiles Municipales" (EIM)** — denominación oficial de la red
  municipal, más específica que "guarderías públicas".
- **"Red de Escuelas Infantiles del Gobierno de Aragón"** — denominación oficial de
  la red autonómica.

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-zaragoza` | type=guarderia, city=zaragoza | **41** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen. Nota: de los 41, solo 14 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio o long_description); el resto siguen siendo centros legítimos de la landing, solo que sus fichas individuales están en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada, que se basa en el conteo de centros, no en el estado individual de cada ficha. |
| `/escuelas-infantiles-en-zaragoza` | type=escuela-infantil, city=zaragoza | **18** | ≥10 | **Recomendada, indexable** por volumen. |

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-zaragoza` | type=guarderia, service=comedor | **11** | ≥5 | **Recomendada** |
| `/escuelas-infantiles-con-comedor-en-zaragoza` | type=escuela-infantil, service=comedor | **18** | ≥5 | **Recomendada** — coincide con el 100% de las escuelas públicas (municipales + DGA), dato genuinamente diferencial para esta landing |
| `/guarderias-con-horario-ampliado-en-zaragoza` | type=guarderia, service=horario-ampliado | 6 | ≥5 | **Recomendada, en el límite** — apenas supera el umbral; revisar tras el enriquecimiento pendiente de servicios (28 centros privados sin `services` confirmado todavía) antes de publicarla, ya que un solo cambio de clasificación la dejaría por debajo |
| `/guarderias-bilingues-en-zaragoza` | type=guarderia, service=bilingue | 1 | ≥5 | **No recomendada.** Solo 1 centro con `bilingue` confirmado por fuente primaria. No crear esta landing todavía — es justo el tipo de página fina que las reglas del proyecto prohíben explícitamente. Aunque hay 4 centros adicionales con `ingles` (iniciación al inglés, no bilingüismo pleno), combinarlos artificialmente para alcanzar el umbral distorsionaría el significado real del filtro. |
| `/escuelas-infantiles-con-horario-ampliado-en-zaragoza` | type=escuela-infantil, service=horario-ampliado | 0 | ≥5 | **No recomendada.** Ninguna escuela pública tiene `horario-ampliado` confirmado (su horario homogéneo es 8:30-16:30 municipal o 9:00-17:00 DGA, sin ampliación estructurada más allá de la entrada anticipada ya reflejada en el horario base). |

### Landings de titularidad

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-publicas-en-zaragoza` (si se decide crear como variante de ownership) | ownership=publico | 18 | ≥10 | **Recomendada como concepto**, aunque requiere decidir primero si se modela como landing de `ownership` (no contemplado explícitamente en `SeoPageFilters`, que solo admite `ownership` opcional junto a `centerType`) o se resuelve mejor documentalmente dentro de `/escuelas-infantiles-en-zaragoza`, dado que en este dataset `ownership=publico` coincide exactamente con `type=escuela-infantil`. Se deja como nota para el integrador, no como landing separada con filtro redundante. |

### Landings de distrito/barrio

| Distrito | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Torrero-La Paz | 3 | ≥5 | No alcanza |
| Actur-Rey Fernando | 2 | ≥5 | No alcanza |
| Casco Histórico | 2 | ≥5 | No alcanza |
| Delicias | 2 | ≥5 | No alcanza |
| El Rabal | 2 | ≥5 | No alcanza |
| Oliver-Valdefierro | 2 | ≥5 | No alcanza |
| La Almozara | 1 | ≥5 | No alcanza |
| Las Fuentes | 1 | ≥5 | No alcanza |
| San José | 1 | ≥5 | No alcanza |
| Santa Isabel | 1 | ≥5 | No alcanza |
| San Juan de Mozarrifar / Base Aérea | 1 | ≥5 | No alcanza (y de acceso restringido, no aplicable a landing pública) |
| Resto (41 centros privados) | Sin distrito confirmado | — | No aplicable hasta enriquecer |

**Ningún distrito alcanza el umbral de 5 centros** en el estado actual del dataset,
porque solo las 18 escuelas públicas tienen distrito confirmado por fuente oficial y
están repartidas en 8 distritos distintos (máximo 3 en uno solo). **No se recomienda
crear ninguna landing de distrito/barrio en esta fase.** Si en un sprint posterior se
geocodifica el distrito de los 41 centros privados (por geocodificación inversa
verificable contra los límites oficiales de los distritos de Zaragoza, nunca
inventado), varios distritos con alta densidad de centros privados observada
cualitativamente en la investigación (Casco Histórico, Delicias, Universidad/Centro,
Actur) probablemente superarían el umbral y merecerían revisarse de nuevo.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-zaragoza` | 41 | Indexable por volumen (≥10) |
| `/escuelas-infantiles-en-zaragoza` | 18 | Indexable por volumen (≥10) |
| `/guarderias-con-comedor-en-zaragoza` | 11 | Indexable por volumen (≥5) |
| `/escuelas-infantiles-con-comedor-en-zaragoza` | 18 | Indexable por volumen (≥5) |
| `/guarderias-con-horario-ampliado-en-zaragoza` | 6 | Indexable por volumen, pero en el límite — revisar tras enriquecimiento |
| `/guarderias-bilingues-en-zaragoza` | 1 | **No crear** |
| `/escuelas-infantiles-con-horario-ampliado-en-zaragoza` | 0 | **No crear** |
| Landings de distrito (cualquiera) | máx. 3 | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es condición
necesaria pero no suficiente para publicar una landing. Siguiendo la lección de
Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4), cualquier landing que
se cree debe tener `sections` (2 bloques H2+párrafos) y al menos 4-5 FAQs propias
desde el primer commit que la marque potencialmente indexable, diferenciando
explícitamente el enfoque de guardería (conciliación, horarios, servicios) del de
escuela infantil (etapa educativa, titularidad, dos redes públicas distintas) — no
crear landings clon cambiando solo el tipo.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-zaragoza` y `/escuelas-infantiles-en-zaragoza` (soporte
   sobrado, 41 y 18 centros respectivamente).
2. Crear `/guarderias-con-comedor-en-zaragoza` y
   `/escuelas-infantiles-con-comedor-en-zaragoza` (soporte sobrado, 11 y 18).
3. Evaluar `/guarderias-con-horario-ampliado-en-zaragoza` con cautela (6 centros,
   justo en el umbral) — mejor esperar a la siguiente pasada de enriquecimiento de
   servicios antes de publicarla.
4. **No crear** landing de guarderías bilingües (1 centro) ni de escuelas infantiles
   con horario ampliado (0 centros) — thin content garantizado.
5. **No crear** ninguna landing de distrito/barrio en esta fase — ningún distrito
   alcanza el umbral con los datos actuales, y el 69% de los centros del dataset
   (los 41 privados) no tiene distrito confirmado en ninguna fuente oficial.
6. Contenido editorial de las landings municipales debe explicar la coexistencia de
   las dos redes públicas (municipal y autonómica DGA) como rasgo diferencial de
   Zaragoza frente a Madrid/Barcelona/Valencia, en vez de tratarlas como un bloque
   homogéneo de "centros públicos".
