# Informe SEO — Málaga

Keyword research y recomendación de landings para el municipio de Málaga, basado en
el dataset final de 152 centros (`data/enrichment/malaga-centers.json`). Este
informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es competencia del
integrador tras auditoría. Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10`
y `MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 1. Keyword research — intención de búsqueda en Málaga

Málaga es la sexta ciudad de España por población y capital de la Costa del Sol,
con una demanda de búsqueda propia y relevante, y una particularidad frente a otras
zonas ya integradas (Madrid, Barcelona, Valencia, Zaragoza, Murcia, Sevilla): una
presencia notable de oferta privada bilingüe/internacional, ligada al perfil
económico de la ciudad (turismo, tecnología — Parque Tecnológico de Andalucía,
población internacional residente).

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en málaga | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil málaga | Comercial/informacional | Alto |
| guarderías málaga precios | Comercial, fase de comparación | Medio |
| escuelas infantiles junta de andalucía málaga | Informacional específica (red pública autonómica), estacional (picos marzo-abril) | Medio-alto |
| guarderías adheridas programa ayuda familias málaga | Informacional/comercial, específica del modelo andaluz de financiación a la demanda | Medio |
| guardería gratis málaga / comedor gratis málaga niños | Informacional/transaccional, alta relevancia actual (gratuidad del tramo socioeducativo 1-2 años desde 2025/26) | Medio-alto |
| lista de guarderías privadas málaga | Informacional, fase de comparación | Medio |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con comedor en málaga | Comercial, filtro de servicio | 16/152 centros con `comedor` confirmado |
| guarderías bilingües málaga | Comercial, filtro de servicio (nicho de **alto valor percibido**, especialmente relevante en Málaga por el perfil internacional de la ciudad) | Solo 2 centros con `bilingue` confirmado en el enum estricto — insuficiente para landing propia por sí sola (ver nota) |
| guarderías con inglés málaga | Comercial, filtro de servicio | 10 centros con `ingles` confirmado |
| guarderías con horario ampliado málaga | Comercial, filtro de servicio (conciliación laboral) | 11 centros con `horario-ampliado` confirmado |
| guarderías con cocina propia málaga | Comercial, filtro de servicio, valor percibido en alza | 5 centros con `cocina-propia` confirmado |
| escuela infantil con campamento de verano málaga | Informacional/comercial, estacional (búsquedas pico en mayo-junio) | 10 centros con `verano-campamentos` confirmado |
| guardería con orientación pedagógica málaga | Informacional, nicho | 7 centros con `orientacion-pedagogica` confirmado |
| escuela infantil con uniforme málaga | Informacional/comercial | 6 centros con `uniformes` confirmado |

**Nota importante sobre "bilingüe" en Málaga**: pese a la fuerte percepción de
oferta internacional de la ciudad (British School of Málaga para etapas
posteriores, varios centros con nombres en inglés en el listado —"The Green Ray
Kinder", "Nany", "Kindergarten"-style—, y el propio Grupo Novaschool con modelo
"británico"), el dataset actual solo tiene **2 centros con el valor exacto
`bilingue` del enum confirmado por fuente propia** más **10 centros con `ingles`**
(que se solapan parcialmente). La percepción de mercado bilingüe es real, pero el
dato verificado en fuente primaria propia (no en descripciones comerciales de
terceros) es más limitado que la intuición inicial — solo el 8,7% de los 152
centros (13/152) tiene `bilingue` o `ingles` confirmado en total. Esto es la
principal brecha de enriquecimiento detectada para explotar el potencial SEO del
posicionamiento premium/internacional de Málaga en una fase posterior.

### Nivel de titularidad y financiación pública (peculiaridad del modelo andaluz, sin equivalente exacto en Madrid/Barcelona/Valencia)

Igual que en Sevilla, Andalucía no tiene concierto educativo clásico en primer
ciclo, sino una red pública autonómica reducida (5 centros de la Junta de
Andalucía en Málaga capital) + 1 centro de titularidad universitaria (Francisca
Luque, UMA, acceso restringido) + un Programa de Ayuda a las Familias que bonifica
plazas en centros privados "adheridos" (135 de los 146 privados de Málaga).

| Keyword | Intención |
|---|---|
| solicitud plaza escuela infantil junta de andalucía málaga | Informacional/transaccional, muy estacional (marzo-abril) |
| centros adheridos programa ayuda familias málaga | Informacional específica, creciente por la gratuidad 2025/26 |
| escuela infantil universidad de málaga guardería UMA | Informacional muy específica, nicho (solo relevante para la comunidad universitaria) |
| guarderías gratis 1 y 2 años málaga | Informacional/transaccional, alta relevancia actual |

### Nivel de distrito

Málaga tiene una identidad de búsqueda por distrito y barrio muy marcada y
reconocible (Centro, Este, Ciudad Jardín, Bailén-Miraflores, Palma-Palmilla, Cruz
de Humilladero, Carretera de Cádiz, Churriana, Campanillas, Puerto de la Torre,
Teatinos-Universidad, El Palo, Pedregalejo), con volumen de búsqueda cualitativamente
alto para consultas tipo "guardería en Teatinos" o "escuela infantil El Palo".
**Sin embargo, el dataset actual no tiene ningún dato de distrito estructurado**
(ver sección 3): 0 de 152 centros tienen `district` o `neighborhood_barrio`
asignado en un campo separado (aunque sí hay menciones puntuales dentro de
`street`, como "Bda. La Palma" o "Bda. El Palo", no extraídas a un campo propio por
falta de un mapeo sistemático verificable). Esta es la principal brecha de datos
pendiente para una futura fase de enriquecimiento con el callejero oficial del
Ayuntamiento de Málaga.

---

## 2. Vocabulario local

Igual que en Sevilla, no se detecta vocabulario local distintivo respecto al
castellano estándar (a diferencia de "escola bressol" en Cataluña o "escoles
infantils" en Valencia) — las fuentes oficiales de Andalucía usan consistentemente
"escuela infantil"/"centro de educación infantil" y "guardería". Sí hay
vocabulario administrativo propio a incorporar de forma natural en contenido
editorial futuro:

- **"Programa de Ayuda a las Familias para el fomento de la escolarización de
  educación Infantil"** — nombre oficial del mecanismo de bonificación en centros
  privados adheridos.
- **"Escuelas Infantiles de la Junta de Andalucía"** — denominación de la red
  pública autonómica de primer ciclo.
- **"Atención socioeducativa"** — término oficial del tramo horario central
  (9:00-15:30) que incluye comedor.
- **"Aula matinal" / "aula de tarde"** — tramos horarios complementarios
  oficiales (7:30-9:00 y 15:30-17:00).
- Términos propios de Málaga a considerar en contenido editorial (no en el
  dataset estructurado): nombres de distrito y barriada reconocibles (Teatinos,
  El Palo, Pedregalejo, Churriana, Campanillas, Puerto de la Torre, Ciudad Jardín)
  y la referencia al Parque Tecnológico de Andalucía (PTA) como polo de demanda de
  guarderías bilingües/internacionales cerca de Campanillas.

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-malaga` | type=guarderia, city=malaga | **146** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen muy sobrado. Nota: de los 146, solo 19 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio o long_description confirmado); el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada. |
| `/escuelas-infantiles-en-malaga` | type=escuela-infantil, city=malaga | **6** | ≥10 | **No alcanza el umbral de landing municipal (10)** pese a tener las 6 fichas individuales indexables (horario/servicios confirmados). Con solo 6 centros (5 Junta + Francisca Luque, un caso muy singular de acceso restringido), no se recomienda crear esta landing todavía como página de ciudad independiente — sería contenido correcto pero de volumen ajustado. Alternativa: cubrir el segmento "escuela infantil pública/Junta de Andalucía en Málaga" como sección dentro de `/guarderias-en-malaga` o esperar a una futura incorporación de "Colores de Málaga" (ver bloqueo documentado) antes de decidir crear la landing independiente. |

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-malaga` | type=guarderia, service=comedor | 15 | ≥5 | **Recomendada** |
| `/guarderias-con-horario-ampliado-en-malaga` | type=guarderia, service=horario-ampliado | 11 | ≥5 | **Recomendada** |
| `/guarderias-con-ingles-en-malaga` | type=guarderia, service=ingles | 9 | ≥5 | **Recomendada** |
| `/guarderias-con-campamentos-de-verano-en-malaga` | type=guarderia, service=verano-campamentos | 10 | ≥5 | **Recomendada** — buen encaje estacional (mayo-junio) |
| `/guarderias-con-orientacion-pedagogica-en-malaga` | type=guarderia, service=orientacion-pedagogica | 7 | ≥5 | **Recomendada** |
| `/guarderias-con-uniforme-en-malaga` | type=guarderia, service=uniformes | 6 | ≥5 | **Recomendada, en el límite** — revisar tras la siguiente pasada de enriquecimiento |
| `/guarderias-con-cocina-propia-en-malaga` | type=guarderia, service=cocina-propia | 5 | ≥5 | **Recomendada, justo en el umbral** — vigilar de cerca, cualquier pérdida de un centro la dejaría por debajo |
| `/guarderias-con-psicomotricidad-en-malaga` | type=guarderia, service=psicomotricidad | 5 | ≥5 | **Recomendada, justo en el umbral** — mismo comentario que la anterior |
| `/guarderias-con-musica-en-malaga` | type=guarderia, service=musica | 4 (4 guardería + 1 escuela-infantil = 5 en total, pero cruzando solo con type=guarderia son 4) | ≥5 | **No alcanza cruzando con type=guarderia** — no recomendada de momento con ese filtro exacto |
| `/guarderias-con-escuela-de-padres-en-malaga` | type=guarderia, service=escuela-de-padres | 4 | ≥5 | **No recomendada.** Justo por debajo del umbral — es el tipo de página fina que las reglas del proyecto prohíben explícitamente. |
| `/guarderias-bilingues-en-malaga` | type=guarderia, service=bilingue | 2 | ≥5 | **No recomendada.** Solo 2 centros confirmados con el valor exacto del enum, muy por debajo del umbral, pese a la alta intención de búsqueda cualitativa de este término en Málaga — ver nota de la sección 1 sobre la brecha entre percepción de mercado bilingüe y dato verificado en fuente primaria. |
| `/guarderias-con-cocina-propia-en-malaga` (repetido, ya listado arriba) | — | — | — | — |
| `/guarderias-con-patio-exterior-en-malaga` | type=guarderia, service=patio-exterior | 2 | ≥5 | **No recomendada.** Solo 2 centros confirmados. |
| `/guarderias-con-actividades-extraescolares-en-malaga` | type=guarderia, service=actividades-extraescolares | 1 | ≥5 | **No recomendada.** |
| `/escuelas-infantiles-con-*-en-malaga` (cualquier servicio) | type=escuela-infantil, service=* | máx. 1 | ≥5 | **No recomendada ninguna.** Solo 6 escuelas-infantil en total, ninguna combinación de servicio alcanza el umbral. |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de centros "adheridos al Programa de Ayuda a las Familias" | `source_group=privado_adherido` (dato interno; **no** `ownership`) | 135 | ≥10 | **Concepto con soporte muy sobrado**, pero requiere una decisión editorial y técnica previa: el proyecto no tiene actualmente un campo filtrable en `SeoPageFilters` para "adhesión a subvención" (solo hay `ownership`, que ya no distingue este caso). Mismo comentario ya documentado para Sevilla — se deja como nota para el integrador, no como landing lista para crear. |

### Landings de distrito/barrio

| Distrito/barriada | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Cualquier distrito administrativo de Málaga (Centro, Este, Ciudad Jardín, Bailén-Miraflores, Palma-Palmilla, Cruz de Humilladero, Carretera de Cádiz, Churriana, Campanillas, Puerto de la Torre, Teatinos-Universidad) | 0 (campo `district` no poblado en ningún centro) | ≥5 | **No recomendada ninguna.** El dataset no tiene el campo `district` estructurado para ningún centro. |
| Menciones puntuales dentro de `street` (Bda. La Palma, Bda. El Palo, Urb. San José, Bda. Puerto Sol, etc.) | 1 centro por mención, sin campo estructurado separado | ≥5 | **No recomendada.** Ninguna mención se repite lo suficiente ni está en un campo filtrable de forma fiable. |

**No se recomienda crear ninguna landing de distrito/barrio en esta fase**, pese a
que la intención de búsqueda cualitativa por distrito en Málaga (Teatinos, El Palo,
Pedregalejo, Churriana, Campanillas, Puerto de la Torre) es alta. Los códigos
postales periféricos detectados (29140 Churriana, 29190 Puerto de la Torre, 29196
Campanillas, 29590/29591 Campanillas) sí permiten una futura segmentación
aproximada por código postal si se decide abordarla, pero no se ha construido esa
aproximación en este sprint por no ser un mapeo verificado 1:1 centro a centro (es
la misma cautela aplicada ya en Sevilla frente a mapeos código postal → distrito no
verificables).

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-malaga` | 146 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-malaga` | 6 | **No crear todavía** — por debajo del umbral de 10 |
| `/guarderias-con-comedor-en-malaga` | 15 | Indexable por volumen (≥5) |
| `/guarderias-con-horario-ampliado-en-malaga` | 11 | Indexable por volumen (≥5) |
| `/guarderias-con-ingles-en-malaga` | 9 | Indexable por volumen (≥5) |
| `/guarderias-con-campamentos-de-verano-en-malaga` | 10 | Indexable por volumen (≥5), buen encaje estacional |
| `/guarderias-con-orientacion-pedagogica-en-malaga` | 7 | Indexable por volumen (≥5) |
| `/guarderias-con-uniforme-en-malaga` | 6 | Indexable, pero en el límite — revisar tras enriquecimiento |
| `/guarderias-con-cocina-propia-en-malaga` | 5 | Indexable, justo en el umbral — vigilar de cerca |
| `/guarderias-con-psicomotricidad-en-malaga` | 5 | Indexable, justo en el umbral — vigilar de cerca |
| `/guarderias-bilingues-en-malaga` | 2 | **No crear** — brecha de verificación, no de demanda |
| `/guarderias-con-patio-exterior-en-malaga` | 2 | **No crear** |
| `/guarderias-con-escuela-de-padres-en-malaga` | 4 | **No crear** |
| `/guarderias-con-musica-en-malaga` | 4 (cruzado con guardería) | **No crear** con ese filtro exacto |
| `/guarderias-con-actividades-extraescolares-en-malaga` | 1 | **No crear** |
| Landings de escuela-infantil por servicio (cualquiera) | máx. 1 | **No crear ninguna** |
| Landings de distrito/barrio (cualquiera) | 0 | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4), cualquier
landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al menos 4-5
FAQs propias desde el primer commit que la marque potencialmente indexable,
diferenciando explícitamente el enfoque de guardería (conciliación, horarios,
adhesión al Programa de Ayuda a las Familias) del de escuela infantil (etapa
educativa, titularidad pública/universitaria, horario y admisión homogéneos de la
Junta de Andalucía) — no crear landings clon cambiando solo el tipo. Para las
landings "en el límite" (`cocina-propia`, `psicomotricidad`, con exactamente 5
centros), recomendamos priorizar el enriquecimiento de servicios antes de
publicarlas, para no quedar por debajo del umbral si algún centro se reclasifica.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-malaga` (soporte muy sobrado, 146 centros).
2. **No crear todavía** `/escuelas-infantiles-en-malaga` — solo 6 centros, por
   debajo del umbral municipal de 10. Revisar si se incorpora "Colores de Málaga"
   (bloqueo documentado) en una fase posterior antes de reconsiderar.
3. Crear las landings de servicio con soporte sobrado: comedor (15),
   horario ampliado (11), inglés (9), campamentos de verano (10), orientación
   pedagógica (7).
4. Evaluar con cautela uniforme (6), cocina propia (5) y psicomotricidad (5) —
   soporte suficiente pero ajustado; mejor esperar a la siguiente pasada de
   enriquecimiento de servicios antes de publicarlas.
5. **No crear** landing de guardería bilingüe (2 centros confirmados) pese a la
   alta intención de búsqueda cualitativa — es una brecha de verificación de
   datos, no de demanda real; prioridad de enriquecimiento futuro dado el perfil
   internacional de Málaga.
6. **No crear** ninguna landing de escuela-infantil por servicio (máximo 1 centro
   por combinación) ni de patio exterior, escuela de padres o actividades
   extraescolares para guardería (todas por debajo de 5).
7. **No crear** ninguna landing de distrito/barrio en esta fase — el dataset no
   tiene el campo `district` poblado para ningún centro. Esta es la brecha de
   datos con mayor potencial de mejora SEO detectada, dada la fuerte identidad de
   búsqueda por distrito que tiene Málaga (Teatinos, El Palo, Pedregalejo,
   Churriana, Campanillas, Puerto de la Torre, Ciudad Jardín).
8. Contenido editorial de las landings municipales debe explicar el modelo
   andaluz de financiación de primer ciclo (red pública reducida + Programa de
   Ayuda a las Familias en centros privados adheridos, con gratuidad para 1-2 años
   desde 2025/26) como rasgo diferencial de Málaga frente a Madrid/Barcelona/
   Valencia/Zaragoza/Murcia, en vez de tratarlo como un simple "público vs.
   privado" o reutilizar sin más el copy de "concertado" de otras ciudades del
   proyecto — igual que en Sevilla, y con especial cuidado porque varios centros
   privados de Málaga usan la palabra "concertado" en su propio marketing sin
   serlo en sentido técnico.
