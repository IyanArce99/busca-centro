# Informe SEO — Córdoba

Keyword research y recomendación de landings para el municipio de Córdoba, basado en
el dataset final de 129 centros (`data/enrichment/cordoba-centers.json`). Este
informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es competencia del
integrador tras auditoría. Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10`
y `MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 1. Keyword research — intención de búsqueda en Córdoba

Córdoba capital es una ciudad de aproximadamente 320.000 habitantes, capital de
provincia y con un perfil demográfico y económico distinto al de Sevilla o Málaga:
menor renta per cápita media, menor presión de oferta bilingüe/internacional que
Málaga, pero una identidad de barrio y distrito muy marcada (Centro histórico,
Levante, Sur, Poniente, Fuensanta, Ciudad Jardín, Fátima, Vista Alegre, etc.) y una
combinación singular de red pública: Junta de Andalucía, una Entidad Local Autónoma
(Encinarejo) y una escuela infantil del Ministerio de Defensa (Cerro Muriano) sin
equivalente exacto en ninguna otra zona ya integrada del proyecto.

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en córdoba | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil córdoba | Comercial/informacional | Alto |
| escuelas infantiles junta de andalucía córdoba | Informacional específica (red pública autonómica), estacional (picos marzo-abril) | Medio-alto |
| guarderías adheridas programa ayuda familias córdoba | Informacional/comercial, específica del modelo andaluz de financiación a la demanda | Medio |
| guardería gratis córdoba / comedor gratis córdoba niños | Informacional/transaccional, alta relevancia actual (gratuidad del tramo socioeducativo 1-2 años desde 2025/26) | Medio-alto |
| lista de guarderías privadas córdoba | Informacional, fase de comparación | Medio |
| guarderías córdoba precios | Comercial, fase de comparación | Medio |

### Nivel de servicio (intención de filtro, cruzada con ciudad)

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con inglés córdoba | Comercial, filtro de servicio | 11/129 centros con `ingles` confirmado |
| guarderías con comedor en córdoba | Comercial, filtro de servicio | 12/129 centros con `comedor` confirmado |
| guarderías con horario ampliado córdoba | Comercial, filtro de servicio (conciliación laboral) | 9/129 centros con `horario-ampliado` confirmado |
| guarderías con psicomotricidad córdoba | Informacional/comercial, nicho | 6/129 centros con `psicomotricidad` confirmado |
| guarderías con música córdoba | Informacional, nicho | 6/129 centros con `musica` confirmado |
| guarderías bilingües córdoba | Comercial, filtro de servicio | Solo 5/129 centros con `bilingue` confirmado en el enum estricto — insuficiente para landing propia por sí sola (ver nota) |
| guarderías con madrugadores córdoba | Comercial, filtro de servicio (conciliación laboral) | 6/129 centros con `servicio-madrugadores` confirmado |
| guardería con cocina propia córdoba | Comercial, filtro de servicio, valor percibido en alza | 3/129 centros con `cocina-propia` confirmado |

**Nota sobre "bilingüe" en Córdoba**: el dataset actual tiene 5 centros con el
valor exacto `bilingue` del enum confirmado por fuente propia (Jugando en Azahara,
Garabatos, Garabatos 2, Snoopy, Kid's Garden) más 11 centros con `ingles` (con
solapamiento parcial). En total, 12/129 (9,3%) de los centros tiene `bilingue` o
`ingles` confirmado. Es una proporción similar a la detectada en Málaga (8,7%),
confirmando que la brecha entre percepción de mercado "bilingüe" y dato verificado
en fuente primaria propia es un patrón recurrente en Andalucía, no específico de
una ciudad — la principal oportunidad de enriquecimiento futuro para este clúster
de búsqueda.

### Nivel de titularidad y financiación pública (peculiaridad del modelo andaluz, con un matiz propio de Córdoba)

Igual que en Sevilla y Málaga, Andalucía no tiene concierto educativo clásico en
primer ciclo, sino una red pública autonómica + un Programa de Ayuda a las
Familias que bonifica plazas en centros privados "adheridos" (105 de los 116
privados de Córdoba). Córdoba añade un matiz único en el proyecto hasta ahora: una
Entidad Local Autónoma (Encinarejo) y una escuela infantil del Ministerio de
Defensa (Cerro Muriano) dentro de su término municipal.

| Keyword | Intención |
|---|---|
| solicitud plaza escuela infantil junta de andalucía córdoba | Informacional/transaccional, muy estacional (marzo-abril) |
| centros adheridos programa ayuda familias córdoba | Informacional específica, creciente por la gratuidad 2025/26 |
| escuela infantil cerro muriano defensa | Informacional muy específica, nicho (solo relevante para personal militar/civil de Defensa) |
| escuela infantil encinarejo córdoba | Informacional muy específica, nicho local (núcleo de Encinarejo) |
| guarderías gratis 1 y 2 años córdoba | Informacional/transaccional, alta relevancia actual |

---

## 2. Vocabulario local

Igual que en Sevilla y Málaga, no se detecta vocabulario local distintivo respecto
al castellano estándar (a diferencia de "escola bressol" en Cataluña o "escoles
infantils" en Valencia) — las fuentes oficiales de Andalucía usan consistentemente
"escuela infantil"/"centro de educación infantil" y "guardería". Vocabulario
administrativo propio a incorporar de forma natural en contenido editorial futuro:

- **"Programa de Ayuda a las Familias para el fomento de la escolarización de
  educación Infantil"** — nombre oficial del mecanismo de bonificación en centros
  privados adheridos.
- **"Escuelas Infantiles de la Junta de Andalucía"** — denominación de la red
  pública autonómica de primer ciclo.
- **"Atención socioeducativa"** — término oficial del tramo horario central
  (9:00-15:30) que incluye comedor.
- **"Aula matinal" / "aula de tarde"** — tramos horarios complementarios
  oficiales (7:30-9:00 y 15:30-17:00).
- **"Entidad Local Autónoma"** — figura administrativa propia de Andalucía,
  relevante para explicar el caso singular de Encinarejo dentro del término
  municipal de Córdoba.
- Términos propios de Córdoba a considerar en contenido editorial (no en el
  dataset estructurado): nombres de distrito y barrio reconocibles (Centro
  histórico, Levante, Sur, Poniente, Fuensanta, Ciudad Jardín, Fátima, Vista
  Alegre, Sector Sur, Parque Figueroa —coincide con el nombre de una de las
  escuelas públicas—, Villarrubia, Alcolea, Cerro Muriano, Encinarejo).

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-cordoba` | type=guarderia, city=cordoba | **116** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen muy sobrado. Nota: de los 116, solo 16 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio confirmado); el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada. |
| `/escuelas-infantiles-en-cordoba` | type=escuela-infantil, city=cordoba | **13** | ≥10 | **Recomendada, indexable** por volumen (13 ≥ 10), a diferencia de Málaga (6, insuficiente) y más cerca del caso de Sevilla. Nota importante: de las 13, 2 son casos singulares (Encinarejo, Defensa) que conviene explicar editorialmente para no dar la impresión de que toda la red es homogénea. |

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-cordoba` | type=guarderia, service=comedor | 12 | ≥5 | **Recomendada** |
| `/guarderias-con-ingles-en-cordoba` | type=guarderia, service=ingles | 11 | ≥5 | **Recomendada** |
| `/guarderias-con-horario-ampliado-en-cordoba` | type=guarderia, service=horario-ampliado | 9 | ≥5 | **Recomendada** |
| `/guarderias-con-madrugadores-en-cordoba` | type=guarderia, service=servicio-madrugadores | 6 | ≥5 | **Recomendada, en el límite** — revisar tras la siguiente pasada de enriquecimiento |
| `/guarderias-con-musica-en-cordoba` | type=guarderia, service=musica | 6 | ≥5 | **Recomendada, en el límite** |
| `/guarderias-con-psicomotricidad-en-cordoba` | type=guarderia, service=psicomotricidad | 6 | ≥5 | **Recomendada, en el límite** |
| `/guarderias-bilingues-en-cordoba` | type=guarderia, service=bilingue | 5 | ≥5 | **Recomendada, justo en el umbral** — vigilar de cerca, cualquier pérdida de un centro la dejaría por debajo |
| `/guarderias-con-patio-exterior-en-cordoba` | type=guarderia, service=patio-exterior | 5 | ≥5 | **Recomendada, justo en el umbral** — mismo comentario que la anterior |
| `/guarderias-con-cocina-propia-en-cordoba` | type=guarderia, service=cocina-propia | 3 | ≥5 | **No alcanza el umbral** — no recomendada de momento |
| `/guarderias-con-catering-en-cordoba` | type=guarderia, service=catering | 2 | ≥5 | **No recomendada** |
| `/guarderias-con-orientacion-pedagogica-en-cordoba` | type=guarderia, service=orientacion-pedagogica | 2 | ≥5 | **No recomendada** |
| `/guarderias-con-verano-campamentos-en-cordoba` | type=guarderia, service=verano-campamentos | 2 | ≥5 | **No recomendada** |
| `/guarderias-con-escuela-de-padres-en-cordoba` | type=guarderia, service=escuela-de-padres | 1 | ≥5 | **No recomendada.** Muy por debajo del umbral — es el tipo de página fina que las reglas del proyecto prohíben explícitamente. |
| `/escuelas-infantiles-con-*-en-cordoba` (cualquier servicio) | type=escuela-infantil, service=* | 0 | ≥5 | **No recomendada ninguna.** Ningún centro de tipo escuela-infantil tiene servicios del enum confirmados (las 13 públicas no tienen ficha individual con servicios propios verificados, solo horario homogéneo). |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de centros "adheridos al Programa de Ayuda a las Familias" | `source_group=privado_adherido` (dato interno; **no** `ownership`) | 105 | ≥10 | **Concepto con soporte muy sobrado**, pero requiere una decisión editorial y técnica previa: el proyecto no tiene actualmente un campo filtrable en `SeoPageFilters` para "adhesión a subvención" (solo hay `ownership`, que ya no distingue este caso). Mismo comentario ya documentado para Sevilla y Málaga — se deja como nota para el integrador, no como landing lista para crear. |

### Landings de distrito/barrio

| Distrito/barrio | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Cualquier distrito administrativo de Córdoba (Centro, Sur, Norte-Sierra, Poniente-Guadalquivir, Levante, Poniente Sur, Periurbano Este, Periurbano Oeste-Sierra) | 0 (campo `district` no poblado en ningún centro) | ≥5 | **No recomendada ninguna.** El dataset no tiene el campo `district` estructurado para ningún centro. |
| Núcleos periféricos identificables por código postal (Villarrubia 14710, Cerro Muriano 14350, Encinarejo 14711, Alcolea 14193) | 1 centro por núcleo (salvo Villarrubia, con 2: Virgen del Carmen y El Arbolito) | ≥5 | **No recomendada.** Ningún núcleo periférico alcanza el umbral de 5 centros por sí solo. |

**No se recomienda crear ninguna landing de distrito/barrio en esta fase**, pese a
que la intención de búsqueda cualitativa por zona en Córdoba (Levante, Sur,
Poniente, Fuensanta, Ciudad Jardín, Fátima) es previsiblemente alta. Los códigos
postales periféricos detectados (14193 Alcolea, 14350 Cerro Muriano, 14610,
14710/14711 Villarrubia/Encinarejo) sí permiten una futura segmentación aproximada
por código postal si se decide abordarla, pero no se ha construido esa
aproximación en este sprint por no ser un mapeo verificado 1:1 centro a centro (es
la misma cautela ya aplicada en Sevilla y Málaga frente a mapeos código postal →
distrito no verificables).

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-cordoba` | 116 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-cordoba` | 13 | Indexable por volumen (≥10) |
| `/guarderias-con-comedor-en-cordoba` | 12 | Indexable por volumen (≥5) |
| `/guarderias-con-ingles-en-cordoba` | 11 | Indexable por volumen (≥5) |
| `/guarderias-con-horario-ampliado-en-cordoba` | 9 | Indexable por volumen (≥5) |
| `/guarderias-con-madrugadores-en-cordoba` | 6 | Indexable, en el límite — revisar tras enriquecimiento |
| `/guarderias-con-musica-en-cordoba` | 6 | Indexable, en el límite |
| `/guarderias-con-psicomotricidad-en-cordoba` | 6 | Indexable, en el límite |
| `/guarderias-bilingues-en-cordoba` | 5 | Indexable, justo en el umbral — vigilar de cerca |
| `/guarderias-con-patio-exterior-en-cordoba` | 5 | Indexable, justo en el umbral — vigilar de cerca |
| `/guarderias-con-cocina-propia-en-cordoba` | 3 | **No crear** — por debajo del umbral |
| `/guarderias-con-catering-en-cordoba` | 2 | **No crear** |
| `/guarderias-con-orientacion-pedagogica-en-cordoba` | 2 | **No crear** |
| `/guarderias-con-verano-campamentos-en-cordoba` | 2 | **No crear** |
| `/guarderias-con-escuela-de-padres-en-cordoba` | 1 | **No crear** |
| Landings de escuela-infantil por servicio (cualquiera) | 0 | **No crear ninguna** |
| Landings de distrito/barrio (cualquiera) | 0 | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4), cualquier
landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al menos 4-5
FAQs propias desde el primer commit que la marque potencialmente indexable,
diferenciando explícitamente el enfoque de guardería (conciliación, horarios,
adhesión al Programa de Ayuda a las Familias) del de escuela infantil (etapa
educativa, titularidad pública autonómica/ELA/estatal, horario y admisión
homogéneos de la Junta de Andalucía para la mayoría de los centros, con matiz
explícito para los dos casos singulares de Encinarejo y Cerro Muriano) — no crear
landings clon cambiando solo el tipo. Para las landings "en el límite" (madrugadores,
música, psicomotricidad con 6 centros; bilingüe y patio exterior con exactamente 5
centros), recomendamos priorizar el enriquecimiento de servicios antes de
publicarlas, para no quedar por debajo del umbral si algún centro se reclasifica.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-cordoba` (soporte muy sobrado, 116 centros).
2. Crear `/escuelas-infantiles-en-cordoba` (13 centros, por encima del umbral
   municipal de 10) — con contenido editorial que explique con claridad los tres
   subgrupos de titularidad pública (Junta de Andalucía, Entidad Local Autónoma de
   Encinarejo, Ministerio de Defensa) para no dar la impresión de una red
   homogénea cuando no lo es.
3. Crear las landings de servicio con soporte sobrado: comedor (12), inglés (11),
   horario ampliado (9).
4. Evaluar con cautela madrugadores (6), música (6), psicomotricidad (6), bilingüe
   (5) y patio exterior (5) — soporte suficiente pero ajustado; mejor esperar a la
   siguiente pasada de enriquecimiento de servicios antes de publicarlas,
   especialmente las dos que están justo en el umbral mínimo de 5.
5. **No crear** landing de cocina propia (3), catering (2), orientación
   pedagógica (2), campamentos de verano (2) ni escuela de padres (1) — todas por
   debajo de 5.
6. **No crear** ninguna landing de escuela-infantil por servicio (0 centros de ese
   tipo con servicios confirmados en el enum).
7. **No crear** ninguna landing de distrito/barrio en esta fase — el dataset no
   tiene el campo `district` poblado para ningún centro. Esta es la brecha de
   datos con mayor potencial de mejora SEO detectada, dada la identidad de
   búsqueda por zona que previsiblemente tiene Córdoba (Levante, Sur, Poniente,
   Fuensanta, Ciudad Jardín, Fátima).
8. Contenido editorial de las landings municipales debe explicar el modelo
   andaluz de financiación de primer ciclo (red pública reducida + Programa de
   Ayuda a las Familias en centros privados adheridos, con gratuidad para 1-2 años
   desde 2025/26) como rasgo diferencial de Córdoba frente a Madrid/Barcelona/
   Valencia/Zaragoza/Murcia, igual que en Sevilla y Málaga, y con la
   particularidad adicional de mencionar de forma correcta y sin ambigüedad los
   dos casos singulares de titularidad pública no autonómica del municipio
   (Encinarejo y Cerro Muriano), sin tratarlos como si fueran parte de la red
   municipal del Ayuntamiento de Córdoba, que no gestiona directamente ninguna
   escuela infantil de primer ciclo según la investigación de fuentes de este
   sprint.
