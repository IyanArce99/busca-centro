# Informe SEO — Salamanca

Keyword research y recomendación de landings para el municipio de Salamanca, basado
en el dataset final de 15 centros (`data/enrichment/salamanca-centers.json`). Este
informe **no crea ni edita** `src/data/mock-seo-pages.ts` — eso es competencia del
integrador tras auditoría. Umbrales de referencia: `MIN_CENTERS_FOR_CITY_PAGE = 10`
y `MIN_CENTERS_FOR_TYPE_PAGE = 5` (`src/lib/constants.ts`).

---

## 0. Contexto de negocio crítico: gratuidad total ya consumada y competencia SEO local ya organizada

Igual que en Valladolid, Castilla y León **ya completó** la implantación de la
gratuidad total del primer ciclo de educación infantil (0-3 años) desde el curso
**2024-2025**. En Salamanca capital había **1.852 plazas gratuitas** registradas para
el curso 2025-2026 (411 en las 4 escuelas infantiles municipales, el resto en
centros públicos autonómicos y privados adheridos). Esto tiene el mismo impacto ya
consolidado sobre la estrategia de contenido que en Valladolid:

- El componente puramente informacional de "guardería gratis en Salamanca" tiene
  volumen de búsqueda relevante, pero **no tiene valor comercial diferencial** para
  BuscaCentro: no hay lead que capturar en un servicio ya gratuito y de asignación
  administrativa mediante proceso de admisión reglado.
- **No se debe enfocar el proyecto en Salamanca como comparador de precios de
  guardería.**
- **Horario ampliado, madrugadores y bilingüismo/inglés** siguen siendo servicios con
  valor comercial pleno, y son la vertical de mayor prioridad para landings de
  servicio.

**Diferencia clave respecto a Valladolid: Salamanca tiene competencia SEO local ya
organizada.** El research detectó agregadores de terceros con rankings anuales
actualizados (tipo "mejores guarderías de Salamanca") y prensa local (Salamancahoy,
La Gaceta de Salamanca, Tribuna de Salamanca, SalamancaTV al Día) publicando
contenido sobre educación infantil de forma recurrente desde 2024. Esto significa que
el hueco de posicionamiento genérico ("guarderías en Salamanca") es más disputado que
en otras zonas recién integradas, y refuerza la instrucción explícita de este sprint:
**priorizar la diferenciación por servicio y metodología (bilingüe/inglés, horario
muy ampliado) sobre el enfoque de comparador de precios genérico**, donde
BuscaCentro no puede competir con contenido ya posicionado y actualizado
periódicamente por medios locales.

**Limitación estructural relevante para el volumen de landings**: el dataset final de
Salamanca tiene solo **15 centros** (7 públicos + 8 privados), frente a los 42 de
Valladolid. Esto es un reflejo real del tamaño del registro oficial de centros de
primer ciclo con código propio en Salamanca capital (17 candidatos totales en la
fuente principal, frente a 46 en Valladolid), no una limitación de la investigación:
ver `docs/salamanca-quality-report.md` para el detalle de los 14 colegios concertados
con aula de primer ciclo descartados por falta de código de registro individual
verificable. Este tamaño de dataset condiciona directamente qué landings alcanzan los
umbrales del proyecto (sección 3).

---

## 1. Keyword research — intención de búsqueda en Salamanca

Salamanca es una capital de provincia de tamaño medio con fuerte identidad
universitaria y 44 barrios reconocidos, de los cuales Garrido (cerca de 40.000
habitantes, ~15% de la población total) es con diferencia el de mayor peso
demográfico.

### Nivel municipal (intención genérica de ciudad)

| Keyword | Intención | Volumen estimado (cualitativo) |
|---|---|---|
| guarderías en salamanca | Comercial/informacional, alta intención local | Alto — término genérico de ciudad, el de mayor volumen del clúster, pero con competencia SEO ya organizada (agregadores y prensa local) |
| escuela infantil salamanca | Comercial/informacional | Alto |
| escuelas infantiles municipales salamanca | Informacional específica (red municipal del Ayuntamiento/Fundación Ciudad de Saberes), alta relevancia local | Medio-alto |
| guarderías privadas salamanca | Comercial, fase de comparación, **alta prioridad de negocio** | Medio-alto |
| plazas gratuitas escuela infantil salamanca 0 a 3 años | Informacional/transaccional, alta relevancia actual pero bajo valor comercial directo (ver sección 0) | Medio-alto |
| admisión escuela infantil salamanca | Informacional/transaccional, estacional (proceso de admisión, marzo-junio según calendario oficial) | Medio |
| mejores guarderías salamanca | Comercial, pero **término ya disputado por prensa local y agregadores con contenido actualizado anualmente** | Medio (alta competencia) |

### Nivel de servicio (intención de filtro, cruzada con ciudad) — prioridad alta por valor comercial persistente, pero con soporte de dataset reducido

| Keyword | Intención | Soporte real en el dataset |
|---|---|---|
| guarderías bilingües salamanca | Comercial, filtro de servicio, **máxima prioridad comercial**: diferenciador exclusivo del sector privado frente a la red pública/municipal gratuita | 1/8 guarderías con `bilingue` confirmado (PSN Bicos) |
| guarderías con inglés salamanca | Comercial, filtro de servicio, alto valor comercial | 1/8 guarderías con `ingles` confirmado (Educa Babys) |
| guarderías con horario ampliado salamanca | Comercial, filtro de servicio (conciliación laboral), **valor comercial persistente pese a la gratuidad de la plaza básica** | 5/8 guarderías con `horario-ampliado` confirmado |
| guarderías con comedor en salamanca | Comercial, filtro de servicio | 4/8 guarderías con `comedor` confirmado (además de 7/7 escuelas infantiles públicas) |
| guarderías con psicomotricidad salamanca | Informacional/comercial | 3/8 guarderías con `psicomotricidad` confirmado |
| guarderías con servicio de madrugadores salamanca | Comercial, filtro de servicio (conciliación laboral temprana) | 2/8 guarderías + 4/7 escuelas infantiles con `servicio-madrugadores` confirmado |

### Nivel de titularidad y financiación pública (modelo de Castilla y León)

| Keyword | Intención |
|---|---|
| escuelas infantiles municipales salamanca / Fundación Ciudad de Saberes | Informacional específica, alta relevancia local (marca reconocible por familias de Salamanca) |
| escuela infantil los pizarrales / el rollo / garrido / el zurguén salamanca | Informacional muy específica (búsqueda de marca), cola larga con intención de navegación directa — el nombre de cada escuela municipal coincide con el nombre de su barrio, lo que refuerza la búsqueda local de proximidad |
| puertas abiertas escuelas infantiles municipales salamanca | Informacional/transaccional, estacional |
| admisión escuela infantil junta castilla y león salamanca | Informacional/transaccional, estacional (proceso de admisión) |

### Nivel de barrio/distrito

Salamanca tiene 44 barrios reconocibles, con Garrido como el de mayor peso
demográfico (cerca de 40.000 habitantes, subdividido en Garrido Norte, Garrido Sur,
Estación, Chinchibarra, Salesas y Labradores). Existe volumen de búsqueda cualitativo
relevante para consultas tipo "guardería en Garrido" o "escuela infantil en
Pizarrales". **Sin embargo, el dataset actual solo tiene el campo `district` poblado
para las 4 escuelas infantiles municipales**, una por barrio (Pizarrales, El Rollo,
Garrido, El Zurguén), sin ningún barrio con más de 1 centro. Ver sección 3 para el
detalle de por qué esto bloquea, de momento, las landings de barrio.

---

## 2. Vocabulario local

Castilla y León usa consistentemente "escuela infantil" y "guardería" en sus fuentes
oficiales, sin vocabulario regional distintivo. Vocabulario administrativo propio a
incorporar de forma natural en contenido editorial futuro:

- **"Programa de gratuidad de las enseñanzas de primer ciclo de educación
  infantil"** — nombre oficial del mecanismo de gratuidad total en Castilla y León,
  ya completado desde el curso 2024-2025.
- **"Escuelas de Educación Infantil (EEI) de titularidad de la Junta de Castilla y
  León"** — denominación de la red pública autonómica de primer ciclo (3 centros en
  Salamanca capital: Lazarillo de Tormes, San Bernardo, Virgen de la Vega).
- **"Escuelas Infantiles Municipales" / Fundación Salamanca Ciudad de Cultura y de
  Saberes / Ayuntamiento de Salamanca** — denominación propia de la red municipal (4
  centros, 411 plazas), con nombre de escuela coincidente con el barrio en 3 de los
  4 casos (Pizarrales, El Rollo, El Zurguén; Garrido es el cuarto).
- **"Subvención directa a titulares de centros privados adheridos"** — mecanismo
  oficial de financiación de la oferta gratuita en centros privados, distinto del
  concierto educativo formal.
- Nombres de barrio reconocibles a considerar en contenido editorial (no en el
  dataset estructurado más allá de las 4 EIM): Garrido (Norte, Sur, Estación,
  Chinchibarra, Salesas, Labradores), Pizarrales, El Rollo/Rollo-Puente Ladrillo, El
  Carmen, El Zurguén, Vidal, San Bernardo, Centro/Casco histórico, Buenos Aires,
  Capuchinos.

---

## 3. Landings recomendadas — recuento real de soporte

### Landings municipales generales

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-en-salamanca` | type=guarderia, city=salamanca | **8** | ≥10 (`MIN_CENTERS_FOR_CITY_PAGE`) | **No alcanza el umbral municipal por tipo** (8 de 10 necesarios). Con el dataset actual, no se recomienda crear esta landing de forma independiente. |
| `/escuelas-infantiles-en-salamanca` | type=escuela-infantil, city=salamanca | **7** | ≥10 | **No alcanza el umbral.** |
| Landing municipal combinada "Guarderías y escuelas infantiles en Salamanca" (si el proyecto soporta una landing de ciudad sin segmentar por tipo) | city=salamanca (ambos tipos) | **15** | ≥10 | **Recomendada, indexable por volumen** si el patrón de landings del proyecto permite una página de ciudad que agregue ambos tipos (a confirmar con el integrador según el diseño real de `src/data/mock-seo-pages.ts` y el patrón ya usado en otras ciudades con dataset ajustado). Es la única landing municipal con soporte claro en esta fase. |

**Nota importante para el integrador**: a diferencia de Valladolid, Granada o
Córdoba, **ninguna landing segmentada por tipo (`/guarderias-en-salamanca` o
`/escuelas-infantiles-en-salamanca` por separado) alcanza el umbral de 10 centros**
con el dataset actual (8 y 7 respectivamente). Antes de publicar cualquier landing
de Salamanca, se recomienda verificar contra el patrón real de páginas ya usado en
el proyecto si existe una landing de ciudad agregada (ambos tipos) que sí alcance el
umbral con los 15 centros, o esperar a una fase de enriquecimiento que incorpore
alguno de los 14 colegios concertados con aula de primer ciclo documentados en
`docs/salamanca-quality-report.md` sección 6.

### Landings de servicio (cruzadas con tipo, umbral 5)

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| `/guarderias-con-horario-ampliado-en-salamanca` | type=guarderia, service=horario-ampliado | 5 | ≥5 | **Recomendada, en el límite exacto del umbral.** Es la vertical de mayor prioridad comercial con soporte suficiente (conciliación laboral, valor persistente pese a la gratuidad). Se recomienda monitorizar de cerca: cualquier baja de un centro haría caer la landing por debajo del umbral. |
| `/guarderias-con-comedor-en-salamanca` | type=guarderia, service=comedor | 4 | ≥5 | **No alcanza el umbral** por muy poco margen (4 de 8). |
| `/guarderias-con-psicomotricidad-en-salamanca` | type=guarderia, service=psicomotricidad | 3 | ≥5 | **No alcanza el umbral.** |
| `/guarderias-bilingues-en-salamanca` | type=guarderia, service=bilingue | 1 | ≥5 | **No alcanza el umbral**, pese a ser la vertical de mayor prioridad estratégica de negocio (diferenciador exclusivo del sector privado). Brecha de verificación de datos más que de demanda: solo PSN Bicos tiene el servicio confirmado en el enum estricto. |
| `/guarderias-con-ingles-en-salamanca` | type=guarderia, service=ingles | 1 | ≥5 | **No alcanza el umbral.** Solo Educa Babys confirmado. |
| `/guarderias-con-servicio-madrugadores-en-salamanca` | type=guarderia, service=servicio-madrugadores | 2 | ≥5 | **No alcanza el umbral.** |
| `/escuelas-infantiles-con-comedor-en-salamanca` | type=escuela-infantil, service=comedor | 7 | ≥5 | **Recomendada, indexable por volumen sobrado** (7 de 7 escuelas infantiles públicas, cobertura total). Buen contenido editorial: toda la red pública/municipal confirma comedor. |
| `/escuelas-infantiles-con-servicio-madrugadores-en-salamanca` | type=escuela-infantil, service=servicio-madrugadores | 4 | ≥5 | **No alcanza el umbral** por muy poco margen (4 de 7, las 4 EIM municipales; las 3 escuelas JCyL no tienen este servicio confirmado). |

### Landings de titularidad / financiación

| Landing propuesta | Filtro | Centros de soporte | Umbral | Veredicto |
|---|---|---|---|---|
| Landing de "Escuelas Infantiles Municipales de Salamanca" (Ayuntamiento / Fundación Ciudad de Saberes) | `source_group=publico_municipal` (dato interno; **no** `ownership`) | 4 | ≥5 (tipo servicio) | **No alcanza el umbral numérico como landing independiente** (4 centros), aunque es un concepto de marca local muy reconocible (411 plazas, nombre de escuela = nombre de barrio en 3 de 4 casos). Se recomienda como sección propia dentro de `/escuelas-infantiles-en-salamanca` (si esa landing llega a crearse tras enriquecimiento) en lugar de landing independiente por ahora. |
| Landing de centros "adheridos al programa de gratuidad" | `source_group=privado_adherido_gratuidad` (dato interno) | 8 | ≥10 | **No alcanza el umbral**, y de bajo valor comercial diferencial en cualquier caso (ver sección 0): la gratuidad ya no es un factor de decisión entre centros en Salamanca. No se recomienda como landing independiente. |

### Landings de barrio

| Barrio | Centros de soporte (dataset actual) | Umbral | Veredicto |
|---|---|---|---|
| Pizarrales, El Rollo, Garrido, El Zurguén | Máximo 1 por barrio (cada una de las 4 EIM está en un barrio distinto, sin repetición) | ≥5 | **No recomendada ninguna.** |

**No se recomienda crear ninguna landing de barrio en esta fase**, pese a que la
intención de búsqueda cualitativa por barrio en Salamanca (especialmente Garrido, el
barrio más poblado de la ciudad con cerca de 40.000 habitantes) es alta. Es la
principal brecha de datos detectada para una futura fase de enriquecimiento con el
callejero oficial del Ayuntamiento de Salamanca, que permitiría asignar barrio
también a los 8 centros privados y a las 3 escuelas JCyL. Dado el tamaño reducido del
dataset actual (15 centros en total), incluso con un mapeo completo de barrio es poco
probable que ningún barrio individual alcance el umbral de 5 centros a corto plazo,
salvo que se incorporen los 14 colegios concertados con aula de primer ciclo
documentados como oportunidad de enriquecimiento.

---

## 4. Veredicto de indexabilidad por landing recomendada

| Landing | Centros de soporte | Recomendación |
|---|---|---|
| `/guarderias-en-salamanca` | 8 | **No crear** — no alcanza el umbral de 10 |
| `/escuelas-infantiles-en-salamanca` | 7 | **No crear** — no alcanza el umbral de 10 |
| Landing municipal agregada (ambos tipos) | 15 | Recomendada si el patrón del proyecto lo permite — única opción viable de landing de ciudad en esta fase |
| `/guarderias-con-horario-ampliado-en-salamanca` | 5 | Indexable en el límite exacto del umbral (≥5) — monitorizar, **prioridad alta por valor comercial** |
| `/escuelas-infantiles-con-comedor-en-salamanca` | 7 | Indexable por volumen (≥5), sobrado |
| `/guarderias-con-comedor-en-salamanca` | 4 | **No crear** — no alcanza el umbral por poco margen |
| `/escuelas-infantiles-con-servicio-madrugadores-en-salamanca` | 4 | **No crear** — no alcanza el umbral por poco margen |
| `/guarderias-bilingues-en-salamanca` | 1 | **No crear** — brecha de verificación pese a máxima prioridad estratégica |
| `/guarderias-con-ingles-en-salamanca` | 1 | **No crear** — brecha de verificación |
| `/guarderias-con-psicomotricidad-en-salamanca` / `/guarderias-con-servicio-madrugadores-en-salamanca` | 3 / 2 | **No crear ninguna** |
| Landings de barrio (cualquiera) | máx. 1 | **No crear ninguna** en esta fase |

Recordatorio explícito para el integrador: alcanzar el umbral numérico es condición
necesaria pero no suficiente para publicar una landing. Siguiendo la lección de
Barcelona (`docs/checklist-calidad-nueva-ciudad.md`, punto 4), cualquier landing que
se cree debe tener `sections` (2 bloques H2+párrafos) y al menos 4-5 FAQs propias
desde el primer commit que la marque potencialmente indexable.

---

## 5. Resumen de recomendaciones

1. **Con el dataset actual (15 centros), Salamanca es la zona con menor volumen de
   landings viables de las integradas hasta ahora.** Ninguna landing municipal
   segmentada por tipo alcanza el umbral de 10; solo 2 landings de servicio alcanzan
   o rozan el umbral de 5 (`/escuelas-infantiles-con-comedor-en-salamanca` con 7, y
   `/guarderias-con-horario-ampliado-en-salamanca` en el límite exacto con 5).
2. Si el patrón del proyecto soporta una landing de ciudad agregada (sin segmentar
   por tipo), se recomienda crear una landing general "Guarderías y escuelas
   infantiles en Salamanca" con los 15 centros como soporte — verificar con el
   integrador si esta variante de landing existe en el patrón actual antes de
   asumirla.
3. Crear `/escuelas-infantiles-con-comedor-en-salamanca` (7 centros, sobrado) como
   contenido diferencial sobre la red pública/municipal, que confirma comedor en el
   100% de sus centros.
4. Crear con monitorización activa `/guarderias-con-horario-ampliado-en-salamanca` (5
   centros, límite exacto del umbral) por ser la vertical de mayor prioridad
   comercial con soporte mínimo suficiente.
5. **No crear** de momento landings de bilingüe ni inglés para guardería pese a ser
   las dos verticales de mayor prioridad estratégica de negocio en esta zona — ambas
   tienen solo 1 centro confirmado cada una. Es la principal oportunidad de
   enriquecimiento de datos con impacto comercial directo: se recomienda priorizar
   la verificación de estos dos servicios en los 14 colegios concertados con aula de
   primer ciclo aún sin ficha individual (varios de ellos, por su perfil de colegio
   privado/concertado generalista, son candidatos plausibles a ofrecer inglés como
   parte de su proyecto educativo, pero esto debe verificarse individualmente, nunca
   asumirse).
6. **No crear** ninguna landing de barrio en esta fase — el campo `district` solo
   está poblado para las 4 EIM municipales, una por barrio, sin ningún barrio con 5
   o más centros. Priorizar en una futura fase el enriquecimiento con el callejero
   oficial del Ayuntamiento de Salamanca para desbloquear una eventual landing de
   Garrido (el barrio de mayor población de la ciudad, ~40.000 habitantes) si se
   incorporan suficientes centros privados adicionales con dirección verificada en
   esa zona.
7. **No enfocar el contenido editorial de Salamanca como comparador de precios**: la
   gratuidad total del primer ciclo (0-3 años) ya está plenamente implantada desde
   el curso 2024-2025. Además, dado que Salamanca tiene competencia SEO local ya
   organizada (prensa local y agregadores con contenido de "mejores guarderías"
   actualizado anualmente), el contenido de BuscaCentro debe diferenciarse
   explícitamente por rigor de fuente (datos verificados contra registro oficial,
   no opiniones ni rankings) y por el ángulo de servicios concretos (horario
   ampliado, bilingüismo), no por intentar competir en el mismo terreno de
   "ranking" editorial.
8. Dar visibilidad propia, dentro del contenido editorial de una futura landing
   municipal, a la marca local "Escuelas Infantiles Municipales de Salamanca"
   (Fundación Salamanca Ciudad de Cultura y de Saberes, 4 centros, 411 plazas, cada
   escuela en un barrio con nombre coincidente), sin mezclarla con la red autonómica
   de la Junta de Castilla y León (3 centros: Lazarillo de Tormes, San Bernardo,
   Virgen de la Vega).
