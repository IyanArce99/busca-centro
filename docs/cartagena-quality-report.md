# Informe de calidad — Cartagena (sprint v1)

Sigue el mismo formato y nivel de detalle que `docs/murcia-quality-report.md` y `docs/barcelona-quality-report.md`, aplicado al dataset de Cartagena generado en `data/enrichment/cartagena-centers.json`. Ver `docs/checklist-calidad-nueva-ciudad.md` para el criterio general aplicado.

---

## 1. Alcance y cobertura

- **Ámbito geográfico**: término municipal de Cartagena (casco urbano + pedanías con vida administrativa propia: Barrio Peral, La Concepción, Los Dolores, La Palma, Villalba, Pozo Estrecho, La Aljorra, El Algar, Vista Alegre, Los Mateos, entre otras). No incluye ningún otro municipio de la Región de Murcia (Murcia capital, Fuente Álamo, La Unión, Torre-Pacheco, etc.).
- **Candidatos evaluados inicialmente**: 19 centros con `tipo` de primer ciclo en la fuente CARM (`mapaescolar-api`) tras filtrar por `muncen=CARTAGENA`.
- **Candidatos descartados por corresponder a segundo ciclo (3-6) o no ser confirmables como primer ciclo con fuente oficial fiable**: 5 (Pipiripao, Hazim, La Gaviota, Los Dolores/Jardines — ver detalle y fuentes en `data/enrichment/cartagena-centers-excluded.json` y `docs/data-sources-cartagena.md`).
- **Centros adicionales incorporados solo desde la fuente municipal** (sin registro de primer ciclo localizado en CARM): 2 (Escuela Infantil Municipal La Aljorra y Pozo Estrecho), confirmados por el listado oficial de las 11 Escuelas Infantiles Municipales del Ayuntamiento de Cartagena.
- **Centros en dataset final**: **17**. Ninguno con `confidence_level` `low` o `unknown`.
- **1 candidato adicional evaluado y descartado por datos insuficientes**: la nueva Escuela Infantil Municipal del Parque de la Rosa (Ciudad Jardín), de apertura confirmada para septiembre de 2026, sin ficha propia con dirección exacta, contacto ni coordenadas verificables en el momento de este sprint.
- **Distribución por tipo**: 11 `escuela-infantil` (públicos, las 11 Escuelas Infantiles Municipales del Ayuntamiento de Cartagena) + 6 `guarderia` (privados).
- **Distribución geográfica interna**: 5 centros sin pedanía específica indicada (casco urbano o barrio sin dato de pedanía formal), y 12 centros repartidos por pedanía/barrio: Barrio Peral (1), La Concepción (1), La Palma (2), Pozo Estrecho (1), Los Mateos (1), Villalba (1), Virgen de la Caridad (1), Vista Alegre (1), El Algar (1), La Aljorra (1), Los Dolores (1).

## 2. Cobertura de datos de contacto

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 17 / 17 | 100% |
| Email | 17 / 17 | 100% |
| Web propia verificada | 4 / 17 | 23.5% |
| Horario confirmado | 12 / 17 | 70.6% |
| Coordenadas (lat/lon) | 15 / 17 | 88.2% |

Los 2 centros sin coordenadas (Pozo Estrecho, sin geocodificación fiable de la dirección exacta) y los 13 sin web propia verificada entran igualmente en el dataset final porque cumplen el mínimo exigido (nombre real, slug único, tipo, municipio, dirección clara, fuente principal válida, teléfono y email confirmados, `short_description` factual de 180-450 caracteres y FAQs basadas en datos confirmados). La cobertura de teléfono y email al 100% es superior a la de Murcia capital (100%/94.2%) gracias a que la fuente municipal de Cartagena aporta teléfono y email individual para las 11 EMEI, con datos más recientes que el registro CARM.

## 3. Servicios confirmados (`CenterService`)

- **Centros con al menos un servicio confirmado: 13 / 17 = 76.5%** — sensiblemente superior al 30.8% de Murcia capital, gracias a que el Ayuntamiento de Cartagena documenta de forma explícita y homogénea el horario y los servicios de las 11 escuelas infantiles municipales (`educacion.cartagena.es/escuelas_infantiles_servicios.asp` y `.../escuelas_infantiles_horario.asp`).
- Desglose de servicios asignados (solo enum cerrado de `src/types/center.ts`, ninguno inventado):

| Servicio | Nº de centros |
|---|---|
| `comedor` | 12 |
| `cocina-propia` | 11 |
| `horario-ampliado` | 11 |
| `servicio-madrugadores` | 11 |
| `bilingue` | 1 |
| `ingles` | 1 |
| `psicomotricidad` | 1 |
| `patio-exterior` | 1 |
| `catering` | 0 |
| `musica` | 0 |
| `actividades-extraescolares` | 0 |
| `verano-campamentos` | 0 |
| `orientacion-pedagogica` | 0 |
| `escuela-de-padres` | 0 |
| `uniformes` | 0 |

De estos 13, 11 son las Escuelas Infantiles Municipales (comedor + cocina propia + horario ampliado + servicio de madrugadores, confirmado por el Ayuntamiento de Cartagena para el conjunto de la red) y 2 son centros privados con web propia verificada (Nice Day: bilingüe, inglés, psicomotricidad, patio exterior; Mediterráneo Cartagena: comedor).

### Servicios mencionados en fuentes pero sin equivalente exacto en el enum

- Atención a niños con necesidades educativas especiales con apoyo de un Educador de Apoyo a la Integración / Equipo de Atención Temprana (las 11 EMEI, fuente municipal) — no tiene categoría exacta en el enum cerrado; queda reflejado en `long_description` pero no en `services`.
- Transporte escolar (mencionado para varias EMEI en su ficha individual, p. ej. Barrio Peral, La Concepción, La Milagrosa, La Palma, Pozo Estrecho, San Isidoro, Villalba, Virgen de la Caridad, Vista Alegre) — **no existe una categoría `transporte` en el enum `CenterService`** del proyecto, así que no se ha asignado ningún servicio por este concepto en ningún centro, para no forzar el enum. Se documenta aquí para que el coordinador valore si conviene ampliarlo en una futura iteración.
- Estimulación sensorial y musical, huerto propio y teatro (Nice Day, web oficial) — sin equivalente exacto, no forzado a `musica` porque el centro no confirma clases de música como actividad diferenciada, solo "aula de estimulación sensorial y musical" dentro del programa general.

## 4. Contenido editorial

- **`short_description`**: 17 / 17 centros, dentro del rango 180-450 caracteres exigido. **100% únicas** (`new Set(...).size === 17`).
- **`long_description`**: generada solo para los 12 centros con datos suficientes (11 EMEI + 1 privado con web propia verificada y con suficiente detalle de servicios, Nice Day). Los 5 centros restantes (4 privados sin web verificable con suficiente detalle + Mediterráneo Cartagena, cuya web solo confirma un servicio puntual sin más detalle editorial aprovechable) se dejan sin `long_description` en lugar de rellenar con contenido genérico. **100% únicas** entre sí (12/12).
- **Plantillas rotadas**: se diseñaron 11 estructuras de frase individuales para las 11 EMEI (cada una menciona un dato distintivo propio del centro: número de aulas, pedanía, servicio de transporte, educador de apoyo a la integración, etc., evitando que sean intercambiables entre sí más allá del nombre) más 6 estructuras adicionales para los centros privados (una por centro, con datos propios). Verificado: ninguna apertura de 6+ palabras se repite de forma literal entre los 17 `short_description`, y las `long_description` de las 11 EMEI comparten estructura de tres párrafos (identidad del centro, horario/servicios, gratuidad/matrícula) pero con datos propios y no intercambiables (nombre, dirección, pedanía, nº de aulas, dato distintivo) en cada párrafo.
- **FAQs**: 5-6 por centro, 17 / 17 centros. Las preguntas varían según el grupo (EMEI vs. privado con servicios vs. privado sin datos adicionales) y solo afirman datos confirmados por la fuente correspondiente — ninguna FAQ inventa horario, servicio o metodología no verificados.

## 5. Indexabilidad (`isCenterIndexable` real, `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`hasCore` + `short_description` no vacía + (servicios O `long_description`)):

- **Centros indexables: 13 / 17 = 76.5%**
- Los 4 centros restantes (Alevines, Pepico Paluco, El País de Nunca Jamás, La Cometa de los Dolores) tienen `hasCore` = true (nombre, slug, tipo, ciudad, dirección) y `short_description` no vacía, pero no pasan el gate de sustancia por no tener ni servicios confirmados ni `long_description` — quedarán `noindex, follow` hasta que se pueda verificar más información (web propia funcional, contacto directo con el centro).
- Este 76.5% es notablemente más alto que en Murcia (30.8%) porque en Cartagena la fuente municipal (`educacion.cartagena.es`) sí documenta de forma sistemática y homogénea horario y servicios para el bloque completo de centros públicos (11 de 17 centros del dataset), a diferencia de Murcia, donde el registro CARM no tenía flags de servicio fiables y solo 9 de 38 privados tenían web propia verificada.

## 6. Conflictos y confianza

- **0 conflictos de datos críticos detectados** (`data_conflicts` vacío en los 17 centros).
- **Confidence level**: `high` en 12 centros (11 EMEI + Nice Day, con web propia verificada), `medium` en 5 centros (privados solo con datos de la fuente CARM o con web propia de contenido limitado: Alevines, Pepico Paluco, Mediterráneo Cartagena, El País de Nunca Jamás, La Cometa de los Dolores). **0 centros en `low`/`unknown`**.
- **Deduplicación**: verificado sin duplicados por nombre, teléfono exacto ni dirección normalizada entre los 17 centros. Se detectó y resolvió correctamente un caso de nombre potencialmente ambiguo: "La Cometa de los Dolores" (centro privado, mantenido en el dataset) frente a los descartados "Los Dolores"/"Jardines" (públicos autonómicos de la misma pedanía, pero registros CARM distintos y sin confirmación de ciclo 0-3) — no son el mismo centro y no se ha fusionado ni confundido su información.
- **Caso límite documentado**: el candidato "Escuela Infantil Municipal del Parque de la Rosa" (12ª escuela municipal, apertura septiembre 2026) se evaluó y se excluyó explícitamente por falta de ficha operativa propia, no por duda sobre su legitimidad como centro — ver `data/enrichment/cartagena-centers-excluded.json`.

## 7. Limitaciones conocidas (para la auditoría previa a publicación)

- Sin distrito formal del casco urbano de Cartagena (`district = null` en los 17 centros) — ninguna fuente disponible lo incluye, igual que en Murcia y Valencia. `neighborhood_barrio` sí recoge el barrio/pedanía en 12 de los 17 centros.
- Pozo Estrecho queda sin coordenadas verificables (`latitude`/`longitude` en `null`) por no haber podido geocodificar con precisión la dirección exacta; La Aljorra usa una aproximación a nivel de calle (no de número exacto) vía Nominatim/OpenStreetMap, documentada explícitamente en el dataset.
- 13 de 17 centros no tienen web propia verificada (las 11 EMEI no tienen web individual, solo ficha institucional; 4 de los 6 privados no tienen web funcional confirmada) — la fuente municipal compensa esto para las EMEI con datos de servicio y horario de calidad equivalente a una verificación por web propia.
- La ambigüedad de ciclo (0-3 vs 3-6) detectada en la fuente CARM para Cartagena (a diferencia de Murcia, donde el filtro por `tipo` funcionó sin falsos positivos) es la incidencia más relevante de este sprint: se resolvió centro a centro contrastando con fuentes oficiales adicionales, pero implica que, si en el futuro se amplía este dataset con nuevas fuentes, conviene revalidar especialmente cualquier centro público marcado como "Escuela de Educación Infantil" que no tenga ficha propia en el listado municipal de EEIIMM.
- La nueva Escuela Infantil Municipal del Parque de la Rosa no está incluida — recomendamos revisarla en una futura actualización cuando tenga ficha operativa propia en `educacion.cartagena.es` tras su apertura (8 de septiembre de 2026).
- Ningún centro del dataset final necesita "reclamar ficha" de forma prioritaria distinta a los demás; todos parten de `is_claimed=false`, `is_verified=false`, `verification_status=unverified`, como el resto de ciudades ya integradas.
