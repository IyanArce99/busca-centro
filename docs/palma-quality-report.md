# Informe de calidad — Palma (sprint v1)

Sigue el mismo formato y nivel de detalle que `docs/murcia-quality-report.md` y `docs/barcelona-quality-report.md`, aplicado al dataset de Palma generado en `data/enrichment/palma-centers.json`. Ver `docs/checklist-calidad-nueva-ciudad.md` para el criterio general aplicado.

---

## 1. Alcance y cobertura

- **Ámbito geográfico**: término municipal de Palma (capital + barrios/pedanías del mismo término municipal: Son Ferriol, S'Arenal (Palma), Es Coll d'en Rabassa, Can Pastilla, Establiments, Es Pil·larí, Sant Jordi, Ciutat Jardí, Es Secar de la Real, El Terreno, Son Espanyolet). No incluye Calvià, Marratxí, Llucmajor (cuyo propio S'Arenal es administrativamente distinto) ni ningún otro municipio de Mallorca, ni el resto de las Illes Balears.
- **Candidatos evaluados**: 79 centros de primer ciclo de educación infantil (0-3 años) localizados en la fuente oficial GestIB (Govern de les Illes Balears) tras filtrar por municipio y tipo de centro de primer ciclo.
- **Centros en dataset final**: **75 / 79** candidatos pasaron el umbral mínimo de calidad y entran en `data/enrichment/palma-centers.json`. Ninguno quedó en `confidence_level` `low` o `unknown`.
- **Candidatos excluidos**: **4** — 2 escuelas municipales nuevas (Son Dameto Dalt, Son Gibert) autorizadas pero no operativas a fecha de este sprint (apertura prevista curso 2026-2027), y 2 centros privados (Ikigai, Little Rainbow) sin ningún dato de contacto verificable (ni teléfono, ni email, ni web propia). Detalle completo en `data/enrichment/palma-centers-excluded.json`, que incluye también 1 fuente de datos alternativa evaluada y descartada.
- **Distribución por tipo**: 54 `guarderia` (privados) + 21 `escuela-infantil` (14 públicos: 11 EIEL municipales del Patronat Municipal d'Escoles d'Infants + Verge de la Salut + Paula Torres [Conselleria d'Educació] + Virgen de Loreto; 7 concertados `CCEI`).
- **Distribución por titularidad**: 54 `privado`, 14 `publico`, 7 `concertado`.
- **Distribución geográfica interna**: 61 centros en la capital, 14 repartidos entre 11 barrios/pedanías distintas del término municipal (Son Ferriol 3, Es Secar de la Real 2, y 9 zonas más con 1 centro cada una: Es Coll d'en Rabassa, Ciutat Jardí, Can Pastilla, El Terreno, Establiments, Sant Jordi, Es Pil·larí, S'Arenal, Son Espanyolet).

## 2. Cobertura de datos de contacto

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 70 / 75 | 93.3% |
| Email | 74 / 75 | 98.7% |
| Web propia verificada | 6 / 75 | 8.0% |
| Horario confirmado | 14 / 75 | 18.7% |
| Coordenadas (lat/lon) | 72 / 75 | 96.0% |

Los 5 centros sin teléfono y el único centro sin email entran igualmente en el dataset final porque cumplen el mínimo exigido (nombre real, slug único, tipo, municipio, dirección clara, fuente principal válida, al menos teléfono o email confirmado, `short_description` factual de 180-450 caracteres y FAQs basadas en datos confirmados). Los 3 centros sin coordenadas (Gianni Rodari, Mama Osa, Sa Capçaneta) se mantienen en el dataset porque cumplen el resto de requisitos mínimos; se dejó deliberadamente `latitude`/`longitude` en `null` en vez de forzar una aproximación no verificada a nivel de barrio o ciudad.

## 3. Servicios confirmados (`CenterService`)

- **Centros con al menos un servicio confirmado: 18 / 75 = 24.0%**
- Desglose de servicios asignados (solo enum cerrado de `src/types/center.ts`, ninguno inventado):

| Servicio | Nº de centros |
|---|---|
| `comedor` | 14 |
| `cocina-propia` | 4 |
| `verano-campamentos` | 3 |
| `patio-exterior` | 3 |
| `horario-ampliado` | 2 |
| `psicomotricidad` | 2 |
| `ingles` | 2 |
| `uniformes` | 2 |
| `actividades-extraescolares` | 2 |
| `bilingue` | 1 |
| `musica` | 1 |
| `orientacion-pedagogica` | 1 |
| `catering` | 0 |
| `servicio-madrugadores` | 0 |
| `escuela-de-padres` | 0 |

De estos 18, 11 son las Escuelas Infantiles Municipales (EIEL) del Patronat Municipal d'Escoles d'Infants (comedor confirmado para el conjunto de la red vía la página oficial de calendario y horario), 1 es Verge de la Salut (cocina propia, titularidad Conselleria) y 6 son centros privados/concertados con web propia verificada individualmente.

**Nota sobre `servicio-madrugadores` vs `horario-ampliado`**: las 11 EIEL municipales tienen un servicio de acogida matinal (7:30-8:30 h) y de tarde (15:00-16:00 h) confirmado por la fuente oficial, pero **no se ha asignado el servicio `servicio-madrugadores`** porque ese enum se reservó para la interpretación de "franja de entrada muy temprana antes del horario lectivo estándar" ya usada en otras ciudades, y el matiz aquí (acogida de solo 1 hora, de solicitud previa y con justificación documentada) se consideró más ajustado a describirlo en `schedule` (texto libre) que a forzarlo dentro del array `services`. El coordinador puede revisar este criterio si prefiere mapear también estas 11 EIEL a `servicio-madrugadores`.

### Servicios mencionados en fuentes pero sin equivalente exacto en el enum

Durante la verificación de webs oficiales se detectaron datos reales mencionados por varios centros que **no tienen categoría exacta** en el enum cerrado `CenterService` y que, por tanto, **no se han forzado** dentro de ninguna categoría existente:

- Metodología Montessori / formación específica de la dirección (Koala Polígon, Angelets de Llum — que además cita Waldorf, Reggio Emilia, Pikler y Pestalozzi)
- "Comedor ecológico" como variante específica del comedor estándar (Angelets de Llum)
- Asesoramiento pedagógico semanal con el Equip d'Atenció Primerenca — EAP (Mama Osa): se consideró próximo a `orientacion-pedagogica` pero no se asignó por no tratarse de orientación a las familias sino de un servicio de apoyo temprano especializado distinto
- Agenda digital para comunicación con familias (Mama Osa, Koala Polígon)
- Convocatoria de ayudas de comedor escolar sin confirmación de que el servicio de comedor esté incluido en todas las unidades del primer ciclo (Nuestra Señora de la Providencia — Son Ferriol): por esta ambigüedad **no se asignó `comedor`** a este centro, solo `uniformes`, que sí está confirmado sin ambigüedad

Estos datos quedan reflejados en `long_description` (texto libre) cuando aporta valor, pero no en el array `services`, para no distorsionar el enum del proyecto.

## 4. Contenido editorial

- **`short_description`**: 75 / 75 centros, longitud entre 268 y 448 caracteres (dentro del rango 180-450 exigido). **100% únicas** (`new Set(...).size === 75`).
- **`long_description`**: generada solo para los 18 centros con datos suficientes (11 EIEL + Verge de la Salut + 6 privados/concertados con web propia verificada), longitud entre 674 y 999 caracteres (dentro del rango 600-1500 exigido). Los 57 centros restantes se dejan sin `long_description` en lugar de rellenar con contenido genérico. **100% únicas** entre sí (18/18).
- **Plantillas rotadas**: se diseñaron 4 estructuras de frase para las EIEL municipales, 1 específica para Verge de la Salut (caso único con datos propios), 1 para el resto de públicos sin datos adicionales, 3 para privados/concertados con web verificada y 6 para privados/concertados sin datos adicionales (total 15 estructuras base), seleccionadas de forma determinista por índice dentro de cada grupo homogéneo para evitar tanto la repetición literal como la aleatoriedad no reproducible.
- **FAQs**: 5-6 por centro, 75 / 75 centros. Las preguntas y respuestas varían según el grupo (EIEL, Verge de la Salut, otro público, privado/concertado con servicios verificados, privado/concertado sin datos adicionales) y solo afirman datos confirmados por la fuente correspondiente — ninguna FAQ inventa horario, servicio o metodología no verificados.

## 5. Indexabilidad (`isCenterIndexable` real, `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`hasCore` + `short_description` no vacía + (servicios O `long_description`)):

- **Centros indexables: 18 / 75 = 24.0%**
- Los 57 centros restantes tienen `hasCore` = true (nombre, slug, tipo, ciudad, dirección) y `short_description` no vacía, pero **no** pasan el gate de sustancia por no tener ni servicios confirmados ni `long_description` — quedarán `noindex, follow` hasta que se pueda verificar más información (web propia, contacto directo con el centro, etc.), igual que el criterio aplicado en Valencia, Barcelona y Murcia.
- Este 24.0% es similar al de Murcia (30.8%) por el mismo motivo estructural: la fuente oficial de Palma (GestIB) no incluye flags de servicio fiables para centros de primer ciclo, y solo se pudo verificar la web propia de una fracción reducida de los 61 centros privados/concertados dentro del alcance de este sprint.

## 6. Conflictos y confianza

- **0 conflictos de datos críticos detectados** (`data_conflicts` vacío en los 75 centros).
- **Confidence level**: `high` en 18 centros (11 EIEL + Verge de la Salut + 6 privados/concertados con web verificada), `medium` en 57 centros (privados/concertados solo con datos de la fuente GestIB). **0 centros en `low`/`unknown`** — ninguno entra al dataset final sin cumplir el mínimo.
- **Deduplicación**: verificado sin duplicados por nombre, teléfono exacto ni dirección normalizada entre los 75 centros. 3 casos de sedes múltiples de la misma marca o entidad (Baberitos / Baberitos Tenis; Momo / Wabi Sabi / Nanai, que comparten CIF; dos sedes de "Nuestra Señora de la Providencia") se mantuvieron como centros independientes, cada uno con código de registro oficial (`codiOficial`) propio, sin arrastrar servicios entre sedes de la misma marca — mismo criterio aplicado en Murcia.

## 7. Limitaciones conocidas (para la auditoría previa a publicación)

- Sin distrito formal de la capital (`district = null` en los 75 centros) — ninguna fuente disponible lo incluye, igual que en Valencia y Murcia. `neighborhood_barrio` sí recoge el barrio/pedanía en los 14 centros situados fuera de la capital estricta.
- 69 de 75 centros no tienen web propia verificada — solo se ha confirmado la web oficial de 6 centros privados/concertados dentro del alcance de este sprint; ampliar esta verificación mejoraría tanto el ratio de indexabilidad como el `confidence_level` medio del dataset.
- 3 centros sin coordenadas (Gianni Rodari, Mama Osa, Sa Capçaneta) por no haber obtenido una geocodificación fiable a nivel de calle; requerirían una verificación manual adicional (por ejemplo, contacto directo con el centro) antes de publicarse con coordenadas.
- Edad mínima fijada en 0 meses en todo el dataset por no existir ninguna fuente que confirme una cifra distinta específica para Palma (a diferencia de Murcia, donde el Ayuntamiento confirmó explícitamente 4 meses para su red municipal).
- 2 escuelas infantiles municipales nuevas (Son Dameto Dalt, Son Gibert) quedan fuera del dataset por no estar operativas a fecha de este sprint; si abren en el curso 2026-2027 como está previsto, sería el primer candidato a incorporar en una futura actualización de este dataset.
- El listado del REMEC (Registro Municipal de Ayudas a la Escolarización) del PMEI, distribuido como PDF descargable en `palmaescolesinfants.cat`, no se ha podido consultar íntegramente dentro de este sprint; podría aportar datos adicionales de contexto (no de contacto) para las EIEL.
- Ningún centro del dataset final necesita "reclamar ficha" de forma prioritaria distinta a los demás; todos parten de `is_claimed=false`, `is_verified=false`, `verification_status=unverified`, como el resto de ciudades ya integradas.
