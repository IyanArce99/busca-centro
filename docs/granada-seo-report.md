# Informe SEO — Granada

Keyword research y recomendación de landings para el municipio de Granada, basado
en el dataset final de 60 centros (`data/enrichment/granada-centers.json`). Este
informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es competencia del
integrador tras auditoría. Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10`
y `MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 0. Contexto de negocio: gratuidad progresiva del primer ciclo en Andalucía (Decreto 76/2025)

Andalucía aprobó el Decreto 76/2025, de 5 de marzo, que regula los centros de
primer ciclo de educación infantil y establece una **gratuidad progresiva** del
servicio socioeducativo básico en centros de titularidad de la Junta de Andalucía:
curso 2025/26 gratuidad para el tramo de 2 años, curso 2026/27 gratuidad ampliada a
1 y 2 años (cobertura declarada del 93,4%). Esto tiene un impacto directo en la
estrategia de contenido y en la priorización de landings:

- El componente puramente informacional de "guardería gratis en Granada" gana
  volumen de búsqueda, pero **no tiene valor comercial diferencial** para
  BuscaCentro (no hay lead que capturar en un servicio ya gratuito y de
  asignación administrativa).
- **Comedor y horario ampliado siguen teniendo coste** incluso en centros
  públicos/gratuitos, y son servicios con alta intención de búsqueda vinculada a
  la conciliación laboral — mantienen valor comercial pleno.
- **Bilingüe/inglés** sigue siendo un diferenciador de pago casi exclusivo del
  sector privado, con valor comercial alto y persistente frente a la gratuidad del
  tramo básico.
- Por ello, este informe da **prioridad relativa** a las landings de servicio
  (comedor, horario ampliado, inglés) frente a contenido puramente informativo
  sobre el proceso de admisión gratuito, sin dejar de cubrir bien la landing
  general de guarderías en Granada, que sigue siendo la de mayor volumen de
  búsqueda genérico.

---

## 1. Keyword research — intención de búsqueda en Granada

Granada es una capital de provincia de tamaño medio con fuerte identidad de barrio
(Albaicín, Centro, Realejo) y una población universitaria significativa (Universidad
de Granada), lo que genera un patrón de búsqueda propio frente a Sevilla o Málaga:
mayor peso relativo de búsquedas ligadas a horarios flexibles y compatibilidad con
estudios/trabajo por turnos, y menor presencia de oferta "premium internacional"
que en Málaga.

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en granada | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster |
| escuela infantil granada | Comercial/informacional | Alto |
| escuelas infantiles municipales granada | Informacional específica (red municipal GranadaEduca), alta relevancia local | Medio-alto |
| guarderías granada precios | Comercial, fase de comparación | Medio |
| guardería gratis granada / gratuidad 1 y 2 años granada | Informacional/transaccional, alta relevancia actual (Decreto 76/2025) pero bajo valor comercial directo (ver sección 0) | Medio-alto |
| centros adheridos programa ayuda familias granada | Informacional/comercial, específica del modelo andaluz de financiación a la demanda | Medio |
| lista de guarderías privadas granada | Informacional, fase de comparación | Medio |

### Nivel de servicio (intención de filtro, cruzada con ciudad) — prioridad alta por valor comercial persistente

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías con comedor en granada | Comercial, filtro de servicio, **valor comercial persistente pese a la gratuidad del tramo básico** | 16/60 centros con `comedor` confirmado (12 guardería + 4 escuela-infantil) |
| guarderías con horario ampliado granada | Comercial, filtro de servicio (conciliación laboral), **valor comercial persistente** | 15/60 centros con `horario-ampliado` confirmado (11 guardería + 4 escuela-infantil) |
| guarderías bilingües granada | Comercial, filtro de servicio, **alto valor comercial diferencial frente a la gratuidad del tramo básico público** | Solo 3 centros con `bilingue` confirmado en el enum estricto (todos guardería) |
| guarderías con inglés granada | Comercial, filtro de servicio | 8 centros con `ingles` confirmado (4 guardería + 4 escuela-infantil) |
| guarderías con cocina propia granada | Comercial, filtro de servicio, valor percibido en alza | 7 centros con `cocina-propia` confirmado (3 guardería + 4 escuela-infantil) |
| escuela infantil con campamento de verano granada | Informacional/comercial, estacional (búsquedas pico en mayo-junio) | 3 centros con `verano-campamentos` confirmado, todos guardería |
| guardería con psicomotricidad granada | Informacional, nicho | 5 centros con `psicomotricidad` confirmado (4 guardería + 1 escuela-infantil) |

### Nivel de titularidad y financiación pública (modelo andaluz, sin equivalente exacto en Madrid/Barcelona/Valencia)

Granada tiene una particularidad frente a Sevilla y Málaga: además de la red
autonómica de la Junta de Andalucía (10 escuelas) y el Programa de Ayuda a las
Familias en centros privados, existe una **red municipal propia** (4 Escuelas
Infantiles Municipales gestionadas por la Fundación Pública Local GranadaEduca),
un actor que no aparece en el dataset de Málaga ni en el de Sevilla.

| Keyword | Intención |
|---|---|
| escuelas infantiles municipales granada / GranadaEduca | Informacional específica, alta relevancia local (marca reconocible por familias de Granada) |
| escuela infantil arlequín / duende / luna / belén granada | Informacional muy específica (búsqueda de marca), cola larga con intención de navegación directa |
| solicitud plaza escuela infantil junta de andalucía granada | Informacional/transaccional, muy estacional (marzo-abril) |
| centros adheridos programa ayuda familias granada | Informacional específica, creciente por la gratuidad 2025/26-2026/27 |
| guarderías gratis 1 y 2 años granada | Informacional/transaccional, alta relevancia actual pero bajo valor comercial directo |

### Nivel de distrito/barrio

Granada tiene una identidad de búsqueda por distrito y barrio reconocible
(Albaicín, Centro, Genil, Zaidín, Ronda, Beiro, Norte, Chana), con volumen de
búsqueda cualitativamente relevante para consultas tipo "guardería en el Zaidín" o
"escuela infantil Albaicín". **Sin embargo, el dataset actual solo tiene el campo
`district` poblado para las 4 EIM municipales** (Arlequín→Albaicín,
Duende→Realejo, Luna→Zaidín, Belén→Zaidín); los 56 centros restantes no tienen
distrito estructurado por falta de un mapeo cartográfico oficial verificable
código postal → distrito para el resto del dataset. Ver sección 3 para el detalle
de por qué esto bloquea, de momento, las landings de distrito.

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
- **"Escuelas Infantiles Municipales" / "GranadaEduca"** — denominación propia de
  Granada para su red pública municipal (Arlequín, Belén, Duende, Luna), un
  concepto de marca local relevante que no existe en Sevilla ni Málaga.
- **"Atención socioeducativa"** — término oficial del tramo horario central
  (9:00-15:30) que incluye comedor.
- **"Aula matinal" / "aula de tarde"** — tramos horarios complementarios
  oficiales.
- **"Decreto 76/2025" / "gratuidad progresiva"** — marco normativo actual, con
  fuerte interés informacional pero bajo valor comercial directo para las
  landings de servicio (ver sección 0).
- Términos propios de Granada a considerar en contenido editorial (no en el
  dataset estructurado): nombres de distrito y barrio reconocibles (Albaicín,
  Realejo, Zaidín, Genil, Ronda, Beiro, Norte, Chana) y la referencia al entorno
  universitario (Universidad de Granada) como generador de demanda específica de
  horarios flexibles/ampliados.

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-granada` | type=guarderia, city=granada | **46** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **Recomendada, indexable** por volumen sobrado. Nota: de los 46, solo 15 son actualmente `recommended_indexable` a nivel de ficha individual (con servicio o long_description confirmado); el resto son centros legítimos de la landing, con fichas individuales en `noindex` hasta enriquecerse — no afecta a la indexabilidad de la landing agregada. |
| `/escuelas-infantiles-en-granada` | type=escuela-infantil, city=granada | **14** | ≥10 | **Recomendada, indexable.** A diferencia de Málaga (solo 6 escuelas-infantil, por debajo del umbral), Granada alcanza el umbral municipal gracias a sumar la red autonómica Junta (10) y la red municipal GranadaEduca (4). Es una landing con buen encaje editorial: puede explicar ambas redes públicas (autonómica y municipal), un matiz único de Granada frente al resto de zonas de Andalucía ya integradas. |

### Landings de servicio (cruzadas con tipo, umbral 5) — priorizadas por valor comercial persistente frente a la gratuidad del tramo básico

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-comedor-en-granada` | type=guarderia, service=comedor | 12 | ≥5 | **Recomendada, prioridad alta** (valor comercial persistente) |
| `/guarderias-con-horario-ampliado-en-granada` | type=guarderia, service=horario-ampliado | 11 | ≥5 | **Recomendada, prioridad alta** (valor comercial persistente, conciliación laboral) |
| `/guarderias-con-ingles-en-granada` | type=guarderia, service=ingles | 4 | ≥5 | **No alcanza el umbral cruzado con type=guarderia** (4 de 46). Sumando las 4 escuelas-infantil con inglés confirmado se llega a 8 en total, pero cruzado estrictamente con `type=guarderia` se queda en 4 — no recomendada con ese filtro exacto por ahora. |
| `/guarderias-con-psicomotricidad-en-granada` | type=guarderia, service=psicomotricidad | 4 | ≥5 | **No alcanza el umbral** (4 de 46 guardería; el quinto centro con psicomotricidad es una escuela-infantil). |
| `/guarderias-con-cocina-propia-en-granada` | type=guarderia, service=cocina-propia | 3 | ≥5 | **No recomendada.** Solo 3 centros tipo guardería (el resto de cocina propia confirmada son las 4 escuelas-infantil). |
| `/guarderias-bilingues-en-granada` | type=guarderia, service=bilingue | 3 | ≥5 | **No recomendada.** Solo 3 centros confirmados con el valor exacto del enum, pese a la alta prioridad de negocio de este segmento (ver sección 0) — es una brecha de verificación de datos, no de demanda real ni de prioridad estratégica. |
| `/guarderias-con-patio-exterior-en-granada` | type=guarderia, service=patio-exterior | 3 | ≥5 | **No recomendada.** |
| `/guarderias-con-actividades-extraescolares-en-granada` | type=guarderia, service=actividades-extraescolares | 3 | ≥5 | **No recomendada.** |
| `/guarderias-con-campamentos-de-verano-en-granada` | type=guarderia, service=verano-campamentos | 3 | ≥5 | **No recomendada** por ahora, pese al buen encaje estacional (mayo-junio) — solo 3 centros confirmados. |
| `/guarderias-con-musica-en-granada` | type=guarderia, service=musica | 2 | ≥5 | **No recomendada.** |
| `/escuelas-infantiles-con-comedor-en-granada` | type=escuela-infantil, service=comedor | 4 | ≥5 | **No alcanza el umbral** (4 de 14 — las 4 EIM municipales; las 10 escuelas Junta de Andalucía no tienen `comedor` como servicio individual del enum, aunque su horario homogéneo incluye atención socioeducativa con comedor integrado, dato distinto al servicio estructurado). |
| `/escuelas-infantiles-con-horario-ampliado-en-granada` | type=escuela-infantil, service=horario-ampliado | 4 | ≥5 | **No alcanza el umbral** (4 de 14, mismas 4 EIM municipales). |
| `/escuelas-infantiles-con-*-en-granada` (cualquier otro servicio) | type=escuela-infantil, service=* | máx. 4 | ≥5 | **No recomendada ninguna.** Ninguna combinación alcanza el umbral de 5 dentro de `type=escuela-infantil`. |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de centros "adheridos al Programa de Ayuda a las Familias" | `source_group=privado_adherido` (dato interno; **no** `ownership`) | 33 | ≥10 | **Concepto con soporte sobrado**, pero requiere una decisión editorial y técnica previa: el proyecto no tiene actualmente un campo filtrable en `SeoPageFilters` para "adhesión a subvención" (solo hay `ownership`, que ya no distingue este caso). Mismo comentario ya documentado para Sevilla y Málaga — se deja como nota para el integrador, no como landing lista para crear. |
| Landing de "Escuelas Infantiles Municipales de Granada" (GranadaEduca) | `source_group=publico_municipal_convenio` | 4 | ≥5 (tipo servicio) / ≥10 (tipo ciudad) | **No alcanza ningún umbral por sí sola** (4 centros), pero es un contenido editorial de alto valor local (marca reconocible "GranadaEduca") que encaja mejor como sección dentro de `/escuelas-infantiles-en-granada` que como landing independiente. |

### Landings de distrito/barrio

| Distrito/barrio | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Albaicín, Realejo, Zaidín, Genil, Ronda, Beiro, Norte, Chana (distritos de Granada) | Máximo 2 (Zaidín, con Luna y Belén) | ≥5 | **No recomendada ninguna.** El campo `district` solo está poblado para las 4 EIM municipales (Arlequín→Albaicín, Duende→Realejo, Luna→Zaidín, Belén→Zaidín); el resto del dataset (56 de 60 centros) no tiene distrito estructurado. |

**No se recomienda crear ninguna landing de distrito/barrio en esta fase**, pese a
que la intención de búsqueda cualitativa por distrito en Granada (especialmente
Zaidín, el distrito más poblado, y Albaicín/Centro por su valor turístico-
residencial) es alta. Es la principal brecha de datos detectada para una futura
fase de enriquecimiento con el callejero oficial del Ayuntamiento de Granada.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-granada` | 46 | Indexable por volumen (≥10), sobrado |
| `/escuelas-infantiles-en-granada` | 14 | Indexable por volumen (≥10) — a diferencia de Málaga, Granada sí alcanza este umbral gracias a la red municipal GranadaEduca |
| `/guarderias-con-comedor-en-granada` | 12 | Indexable por volumen (≥5), **prioridad alta por valor comercial persistente** |
| `/guarderias-con-horario-ampliado-en-granada` | 11 | Indexable por volumen (≥5), **prioridad alta por valor comercial persistente** |
| `/guarderias-con-ingles-en-granada` | 4 (cruzado con guardería) | **No crear** con ese filtro exacto — por debajo del umbral |
| `/guarderias-con-psicomotricidad-en-granada` | 4 | **No crear** — por debajo del umbral |
| `/guarderias-bilingues-en-granada` | 3 | **No crear** — brecha de verificación, no de demanda ni de prioridad estratégica |
| `/guarderias-con-cocina-propia-en-granada` | 3 | **No crear** |
| `/guarderias-con-patio-exterior-en-granada` | 3 | **No crear** |
| `/guarderias-con-actividades-extraescolares-en-granada` | 3 | **No crear** |
| `/guarderias-con-campamentos-de-verano-en-granada` | 3 | **No crear** por ahora, pese al buen encaje estacional |
| `/guarderias-con-musica-en-granada` | 2 | **No crear** |
| Landings de escuela-infantil por servicio (cualquiera) | máx. 4 | **No crear ninguna** — todas por debajo de 5 |
| Landings de distrito/barrio (cualquiera) | máx. 2 | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es
condición necesaria pero no suficiente para publicar una landing. Siguiendo la
lección de Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4), cualquier
landing que se cree debe tener `sections` (2 bloques H2+párrafos) y al menos 4-5
FAQs propias desde el primer commit que la marque potencialmente indexable,
diferenciando explícitamente el enfoque de guardería (conciliación, horarios,
adhesión al Programa de Ayuda a las Familias) del de escuela infantil (dos redes
públicas distintas en Granada: autonómica Junta de Andalucía y municipal
GranadaEduca, cada una con su propio proceso de admisión) — no crear landings
clon cambiando solo el tipo.

---

## 5. Resumen de recomendaciones

1. Crear `/guarderias-en-granada` (soporte muy sobrado, 46 centros).
2. Crear `/escuelas-infantiles-en-granada` (14 centros, alcanza el umbral municipal
   de 10) — con contenido editorial que explique de forma diferenciada las dos
   redes públicas de Granada: la autonómica de la Junta de Andalucía (10 escuelas)
   y la municipal de GranadaEduca (4 escuelas), un matiz único de esta ciudad
   frente al resto de zonas de Andalucía ya integradas.
3. Crear las landings de servicio con soporte suficiente y **prioridad alta por
   valor comercial persistente** frente a la gratuidad progresiva del tramo
   básico (Decreto 76/2025): comedor (12) y horario ampliado (11).
4. **No crear** de momento landings de inglés, bilingüe, cocina propia,
   psicomotricidad, patio exterior, extraescolares, campamentos de verano ni
   música para guardería — todas por debajo del umbral de 5 al cruzar con
   `type=guarderia`. El caso de "bilingüe" merece seguimiento especial: solo 3
   centros confirmados pese a ser la vertical de mayor prioridad de negocio según
   el contexto de gratuidad — es la principal oportunidad de enriquecimiento de
   datos con impacto comercial directo.
5. **No crear** ninguna landing de escuela-infantil por servicio (máximo 4 por
   combinación, todas por debajo de 5).
6. **No crear** ninguna landing de distrito/barrio en esta fase — el campo
   `district` solo está poblado para las 4 EIM municipales. Priorizar en una
   futura fase el enriquecimiento con el callejero oficial del Ayuntamiento de
   Granada para desbloquear landings de Zaidín (el distrito con más centros
   confirmados en el dataset, aunque solo 2) y Albaicín/Centro.
7. Contenido editorial de las landings municipales debe explicar el modelo
   andaluz de financiación de primer ciclo (red pública reducida + Programa de
   Ayuda a las Familias en centros privados adheridos, con gratuidad progresiva
   para 1-2 años desde 2025/26-2026/27 según el Decreto 76/2025) como rasgo
   diferencial de Granada frente a Madrid/Barcelona/Valencia/Zaragoza/Murcia, y
   dar visibilidad propia a la marca local "GranadaEduca" para las escuelas
   infantiles municipales, sin mezclar el concierto educativo que algunos centros
   privados tienen en etapas posteriores (Primaria/Secundaria) con su régimen real
   en el primer ciclo (0-3 años), que en todos los casos del dataset es
   `ownership: privado`.
8. Priorizar en el copy de las landings de servicio (comedor, horario ampliado) el
   mensaje de valor comercial persistente: aunque el servicio socioeducativo
   básico avanza hacia la gratuidad, comedor y horario ampliado siguen teniendo
   coste y son el eje de decisión real de las familias al comparar centros.
