# Informe de calidad — Murcia (sprint v1)

Sigue el mismo formato y nivel de detalle que `docs/barcelona-quality-report.md`, aplicado al dataset de Murcia generado en `data/enrichment/murcia-centers.json`. Ver `docs/checklist-calidad-nueva-ciudad.md` para el criterio general aplicado.

---

## 1. Alcance y cobertura

- **Ámbito geográfico**: término municipal de Murcia (capital + pedanías). No incluye Cartagena, Molina de Segura, Alcantarilla ni ningún otro municipio de la Región de Murcia.
- **Candidatos evaluados**: 52 centros de primer ciclo de educación infantil (0-3 años) localizados en la fuente oficial CARM (`mapaescolar-api`) tras filtrar por `muncen=MURCIA` y `tipo` de primer ciclo.
- **Centros en dataset final**: **52 / 52** candidatos pasaron el umbral mínimo de calidad y entran en `data/enrichment/murcia-centers.json`. Ninguno quedó en `confidence_level` `low` o `unknown`.
- **Casos evaluados y descartados individualmente**: 2 datasets municipales de otros municipios (Molina de Segura, Cartagena) verificados y excluidos por ámbito antes de construir el dataset; 2 centros con posible relación de marca no confirmable como sede compartida, documentados pero mantenidos como centros independientes sin arrastrar servicios de la otra entidad. Detalle completo en `data/enrichment/murcia-centers-excluded.json`.
- **Distribución por tipo**: 38 `guarderia` (privados) + 14 `escuela-infantil` (públicos: 7 Escuelas Infantiles Municipales del Ayuntamiento de Murcia + 7 escuelas públicas de titularidad autonómica).
- **Distribución geográfica interna**: 27 centros en la capital, 25 repartidos entre 19 pedanías distintas del término municipal (La Alberca 3, El Palmar 2, Beniaján 2, Sangonera la Verde 2, y 15 pedanías más con 1 centro cada una).

## 2. Cobertura de datos de contacto

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 52 / 52 | 100% |
| Email | 49 / 52 | 94.2% |
| Web propia verificada | 9 / 52 | 17.3% |
| Horario confirmado | 10 / 52 | 19.2% |
| Coordenadas (lat/lon) | 52 / 52 | 100% |

Los 3 centros sin email (Bambino, Campanilla, Virgen de la Fuensanta) y los 43 sin web propia verificada entran igualmente en el dataset final porque cumplen el mínimo exigido (nombre real, slug único, tipo, municipio, dirección clara, fuente principal válida, teléfono confirmado, `short_description` factual de 180-450 caracteres y FAQs basadas en datos confirmados).

## 3. Servicios confirmados (`CenterService`)

- **Centros con al menos un servicio confirmado: 16 / 52 = 30.8%**
- Desglose de servicios asignados (solo enum cerrado de `src/types/center.ts`, ninguno inventado):

| Servicio | Nº de centros |
|---|---|
| `comedor` | 11 |
| `servicio-madrugadores` | 8 |
| `bilingue` | 5 |
| `ingles` | 5 |
| `cocina-propia` | 4 |
| `horario-ampliado` | 4 |
| `psicomotricidad` | 4 |
| `actividades-extraescolares` | 4 |
| `patio-exterior` | 3 |
| `musica` | 3 |
| `verano-campamentos` | 3 |
| `orientacion-pedagogica` | 3 |
| `catering` | 0 |
| `escuela-de-padres` | 0 |
| `uniformes` | 0 |

De estos 16, 7 son las Escuelas Infantiles Municipales (comedor + servicio-madrugadores, confirmado por el Ayuntamiento de Murcia para el conjunto de la red) y 9 son centros privados con web propia verificada individualmente.

### Servicios mencionados en fuentes pero sin equivalente exacto en el enum

Durante la verificación de webs oficiales se detectaron servicios reales mencionados por varios centros que **no tienen categoría exacta** en el enum cerrado `CenterService` y que, por tanto, **no se han forzado** dentro de ninguna categoría existente:

- Logopedia / apoyo al lenguaje (EMPI, Origami, Las Claras de la Flota)
- Apoyo a la lactancia materna (AEPIO)
- Metodologías específicas con nombre propio: método Gordon (EMPI), inmersión lingüística con personal nativo (Nice Day School)
- Huerto/jardín escolar como espacio diferenciado del patio (AEPIO)

Estos datos quedan reflejados en `long_description` (texto libre) pero no en el array `services`, para no distorsionar el enum del proyecto. Se documentan aquí para que el coordinador valore si conviene ampliar el enum en una futura iteración (p. ej. `logopedia` u `orientacion-pedagogica` ya cubre parcialmente el caso de apoyo psicopedagógico, pero no la logopedia especializada).

## 4. Contenido editorial

- **`short_description`**: 52 / 52 centros, longitud entre 284 y 403 caracteres (dentro del rango 180-450 exigido). **100% únicas** (`new Set(...).size === 52`).
- **`long_description`**: generada solo para los 16 centros con datos suficientes (7 EMEI + 9 privados con web propia verificada). Los 36 centros restantes se dejan sin `long_description` en lugar de rellenar con contenido genérico, según instrucción explícita. **100% únicas** entre sí (16/16), longitud entre 600 y 1500 caracteres aproximadamente.
- **Plantillas rotadas**: se diseñaron 4 estructuras de frase para las Escuelas Infantiles Municipales, 3 para los centros públicos autonómicos, 3 para privados con web verificada y 6 para privados sin datos adicionales (total 16 estructuras base), seleccionadas de forma determinista por centro para evitar tanto la repetición literal como la aleatoriedad no reproducible. Verificado: ninguna apertura de 6 palabras se repite más de 3 veces en todo el dataset (umbral usado en la auditoría de Barcelona).
- **FAQs**: 5-6 por centro, 52 / 52 centros. Las preguntas y respuestas varían según el grupo (EMEI, público autonómico, privado con servicios, privado sin datos adicionales) y solo afirman datos confirmados por la fuente correspondiente — ninguna FAQ inventa horario, servicio o metodología no verificados.

## 5. Indexabilidad (`isCenterIndexable` real, `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`hasCore` + `short_description` no vacía + (servicios O `long_description`)):

- **Centros indexables: 16 / 52 = 30.8%**
- Los 36 centros restantes tienen `hasCore` = true (nombre, slug, tipo, ciudad, dirección) y `short_description` no vacía, pero **no** pasan el gate de sustancia por no tener ni servicios confirmados ni `long_description` — se generarán como `noindex, follow` hasta que se pueda verificar más información (web propia, contacto directo con el centro, etc.), igual que el criterio aplicado en Valencia y Barcelona.
- Este 30.8% es más bajo que en Valencia (donde una proporción mayor de centros privados tenía servicios asignados desde el registro autonómico) porque la fuente CARM de Murcia **no incluye flags de servicio fiables** para centros de primer ciclo, a diferencia de otros datasets — de ahí que el criterio de calidad haya priorizado no inventar servicios sobre maximizar el ratio de indexabilidad inicial.

## 6. Conflictos y confianza

- **0 conflictos de datos críticos detectados** (`data_conflicts` vacío en los 52 centros).
- **Confidence level**: `high` en 23 centros (14 públicos + 9 privados con web verificada), `medium` en 29 centros (privados solo con datos de la fuente CARM). **0 centros en `low`/`unknown`** — ninguno entra al dataset final sin cumplir el mínimo.
- **Deduplicación**: verificado sin duplicados por nombre, teléfono exacto ni dirección normalizada entre los 52 centros. Dos casos de posible relación de marca (mismo dominio de email pero distinto código de registro CARM: "Érase Una Vez" / "El Atelier de la Luna") se mantuvieron como centros independientes sin arrastrar servicios entre ellos, documentado en el dataset de excluidos.

## 7. Limitaciones conocidas (para la auditoría previa a publicación)

- Sin distrito formal de la capital (`district = null` en los 52 centros) — ninguna fuente disponible lo incluye, igual que en Valencia. `neighborhood_barrio` sí recoge la pedanía en los 25 centros situados fuera de la capital.
- 43 de 52 centros no tienen web propia verificada — solo se ha confirmado la web oficial de 9 centros privados dentro del alcance de este sprint; ampliar esta verificación mejoraría tanto el ratio de indexabilidad como el `confidence_level` medio del dataset.
- Los flags de servicio del dataset CARM no son fiables para este tipo de centro (ver sección 3) — cualquier futura fuente adicional (p. ej. contacto directo con los 29 centros sin web) sería el siguiente paso natural para aumentar la cobertura de servicios confirmados.
- Ningún centro del dataset final necesita "reclamar ficha" de forma prioritaria distinta a los demás; todos parten de `is_claimed=false`, `is_verified=false`, `verification_status=unverified`, como el resto de ciudades ya integradas.
