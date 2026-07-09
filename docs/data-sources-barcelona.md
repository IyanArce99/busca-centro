# Fuentes de datos — Barcelona (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de centros de educación infantil de primer ciclo (0-3 años) en el municipio de Barcelona. Sigue el mismo formato y nivel de rigor que `docs/data-sources-madrid.md`.

---

## Fuentes evaluadas

### 1. Directori de centres docents anual (Base 2020) — Generalitat de Catalunya ⭐ PRINCIPAL USADA

| Campo | Detalle |
|-------|---------|
| **Nombre** | Directori de centres docents anual. Base 2020 |
| **Organismo** | Departament d'Educació i Formació Professional — Generalitat de Catalunya. Fuente: Registre de Centres Docents (Direcció General de Centres Públics) |
| **URL catálogo** | https://analisi.transparenciacatalunya.cat/Educaci-/Directori-de-centres-docents-anual-Base-2020/kvmv-ahh4 |
| **API/descarga** | Dataset Socrata. Endpoint SoQL: `https://analisi.transparenciacatalunya.cat/resource/kvmv-ahh4.json` (soporta filtros `$where`, `$select`, `$limit` estilo SoQL). También exportable en CSV/XLS desde la interfaz web. |
| **Formato** | JSON (Socrata), CSV, XLS |
| **Licencia** | Términos de uso de dades obertes de la Generalitat de Catalunya (ver `attributionLink` en metadatos del dataset) |
| **Descarga automatizada** | Sí — API REST sin autenticación, filtrable por `nom_municipi`, `curs`, `einf1c`, etc. |
| **Actualización** | Anual, en octubre y enero, desde el curso 2020-2021 |
| **Curso usado** | 2025/2026 (el más reciente publicado en el momento de la investigación) |
| **Registros totales (dataset completo)** | 32.680 filas históricas (todas las comarcas y cursos desde 2020-2021) |
| **Registros en Barcelona ciudad con primer ciclo infantil (einf1c)** | 272 centros (filtro: `nom_municipi=Barcelona`, `curs=2025/2026`, `einf1c=EINF1C`) |
| **Registros usados en dataset final** | 152 (106 EBM municipales + 5 Llars d'infants Generalitat + 41 centros privados/concertados con oferta educativa más amplia). 121 adicionales documentados en `pending_review`. |

#### Campos disponibles (columnas relevantes)

| Columna (fieldName) | Descripción |
|---|---|
| `codi_centre` | Código único del centro (Registre de Centres Docents) |
| `denominaci_completa` | Nombre completo del centro |
| `codi_naturalesa` / `nom_naturalesa` | Público / Privado |
| `codi_titularitat` / `nom_titularitat` | Titularidad detallada (Corporacions Locals, Persones Físiques, Societats Mercantils, Fundacions, Cooperatives, Ordes i Congregacions Catòlics, Associacions, Societats Civils, Església Catòlica, Departament d'Educació i Formació Professional...) |
| `adre_a` | Dirección (formato abreviado: `c.`, `av.`, `pg.`, `pl.`, `ptge.`, `rbla.`) |
| `codi_postal` | Código postal |
| `tel_fon` | Teléfono (no siempre presente, especialmente en centros públicos no municipales) |
| `e_mail_centre` | Email (a menudo genérico `@xtec.cat`, correo institucional del registro, no siempre el email operativo del centro) |
| `url` | Web (a menudo un enlace genérico `xtec.cat/centres/...` del registro, no la web propia del centro) |
| `nom_dm` | **Distrito municipal** (los 10 distritos oficiales de Barcelona) |
| `codi_municipi` / `nom_municipi` | Código y nombre del municipio |
| `coordenades_geo_x` / `coordenades_geo_y` | Coordenadas WGS84 (longitud/latitud) — sistema EPSG 25831/UTM zona 31M reproyectado |
| `einf1c` | Flag: Educació Infantil 1r cicle autoritzat (0-3 anys) — **columna clave usada para filtrar** |
| `einf2c`, `epri`, `eso`, `batx`, etc. | Flags de otras etapas autorizadas — usados para distinguir centros "solo infantil 0-3" de colegios completos con sección de infantil |

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente primaria oficial de la Generalitat de Catalunya (equivalente catalán del dataset CAM usado en Madrid)
- Cubre TODOS los centros autorizados con primer ciclo de infantil en el municipio, públicos y privados
- Incluye coordenadas geográficas ya en WGS84 (no requiere conversión UTM manual)
- Incluye distrito municipal oficial
- **Limitaciones:** No incluye barrio (nivel más granular que distrito); teléfono ausente en ~33% de centros privados pequeños; email y URL a menudo son del registro genérico (`xtec.cat`), no del centro; no indica si un centro privado tiene concierto económico para el primer ciclo (en Catalunya el concierto es infrecuente para 0-3, a diferencia de Madrid); no incluye servicios (comedor, horario, idiomas) ni proyecto educativo.

---

### 2. Llistat de les Escoles Bressol Municipals de Barcelona — Ajuntament de Barcelona (IMEB) ⭐ USADA (fuente principal para centros municipales)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Llistat de les Escoles Bressol Municipals de Barcelona — Curs 2026-2027 |
| **Organismo** | Institut Municipal d'Educació de Barcelona (IMEB) — Ajuntament de Barcelona |
| **URL** | https://ajuntament.barcelona.cat/escolesbressol/sites/default/files/llistat_ebm_curs_2026_2027_def.pdf |
| **Formato** | PDF (tabla estructurada por distrito) |
| **Descarga automatizada** | Parcial — el dominio `barcelona.cat` devuelve HTTP 418 a user-agents automatizados/herramientas de fetch estándar; es descargable con `curl` u otro cliente HTTP configurando un user-agent de navegador. No hay endpoint CSV/JSON público conocido para este listado. |
| **Actualización** | Anual (cursos anteriores también publicados: 2023-2024, 2024-2025) |
| **Registros** | 106 escoles bressol municipals, organizadas por los 10 distritos de Barcelona |
| **Registros usados** | Los 106 — fuente primaria de contacto (teléfono, email institucional `@bcn.cat`, URL oficial `barcelona.cat/ebm...`) para el 100% de las EBM incluidas en el dataset final |

#### Campos disponibles

| Columna | Descripción |
|---|---|
| Districte | Distrito municipal |
| Escola Bressol Municipal | Nombre corto de la escuela (sin prefijo "Escola Bressol Municipal") |
| Adreça | Dirección con código postal |
| Enllaç a pàgina web | URL oficial `barcelona.cat/ebm[nombre]` |
| Correu electrònic | Email institucional `ebm[nombre]@bcn.cat` |
| Telèfon | Teléfono de contacto directo |

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente oficial directa del gestor de las escuelas municipales (Ajuntament de Barcelona / IMEB)
- 100% de cobertura telefónica y de email para las 106 escuelas
- Cruzado con éxito con el Directori de centres docents de la Generalitat: 103/106 coincidencias directas por nombre normalizado; 1 caso de renombramiento confirmado (Arrels, antes "El Petit Príncep"); 2 escuelas (Tramuntana, Pere Calafell) no aparecen aún en el dataset de la Generalitat curso 2025/2026 — probablemente centros de apertura muy reciente para el curso 2026-2027, marcados con `confidence_level=medium` y sin coordenadas (no inventadas).
- **Limitaciones:** Solo cubre las escuelas de titularidad municipal (Corporacions Locals); no incluye centros privados, concertados ni Llars d'infants de la Generalitat; formato PDF requiere extracción manual/semi-manual (no hay API); protegido por una regla anti-bot genérica del dominio que bloquea herramientas de fetch automatizado sin user-agent de navegador.

#### Fuente complementaria usada para horario y servicios de las EBM

Página: **"Organització de les escoles bressol municipals"** — https://ajuntament.barcelona.cat/escolesbressol/ca/organitzacio-de-lescola (IMEB). Confirma con texto explícito:
- Horario de atención: 8:00 a 17:00 h, lunes a viernes (8:00-15:00 en septiembre y julio).
- Servicio de comedor: "Totes les escoles bressol municipals disposen d'una cuina pròpia en la qual s'elaboren diàriament els menús" (todas las EBM tienen cocina propia).

Estos dos hechos, confirmados textualmente en fuente oficial, se aplicaron de forma homogénea a las 106 EBM (`schedule` y `services: ["comedor", "cocina-propia"]`). No se aplicó "horario-ampliado" ni "servicio-madrugadores" por no estar confirmados explícitamente para este servicio.

---

### 3. Guia de centres educatius de Barcelona (edubcn.cat) — Consorci d'Educació de Barcelona — EVALUADA, NO USADA COMO FUENTE DE DATOS MASIVA

| Campo | Detalle |
|-------|---------|
| **Nombre** | Guia de centres educatius de Barcelona / Cercador de centres |
| **Organismo** | Consorci d'Educació de Barcelona |
| **URL** | https://www.edubcn.cat/ca/alumnat_i_familia/informacio_general_matriculacio/consulta_de_centres_educatius |
| **Uso dado** | Referencia de contraste general sobre la organización educativa de Barcelona (delegación territorial, preinscripción). No se extrajeron registros masivos de esta fuente porque el Directori de centres docents de la Generalitat ya cubre el mismo universo de centros con datos más estructurados (API vs. buscador web). |

---

### 4. Mapa Escolar / Preinscripció (Generalitat) — EVALUADA, NO USADA COMO FUENTE DE DATOS MASIVA

| Campo | Detalle |
|-------|---------|
| **Nombre** | Mapa escolar — Oferta educativa |
| **URL** | http://mapaescolar.gencat.cat/ |
| **Uso dado** | Herramienta de consulta interactiva (mapa/buscador) sin exportación CSV/API pública conocida. Se usó como referencia de validación conceptual, no como fuente de extracción masiva. |

---

## Fuentes NO usadas (recordatorio, igual que en Madrid)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping; instrucción explícita de no usar |
| Directorios privados (micole.net, colesyguardes.es, infoguarderias, etc., equivalentes catalanes) | No consultados como fuente primaria ni secundaria en esta entrega — el dataset de la Generalitat + Ajuntament ya ofrece cobertura oficial suficiente para todos los centros incluidos |
| Redes sociales de centros | No se buscaron activamente; solo se habría usado si estuvieran enlazadas desde fuente oficial, lo cual no fue necesario dado el volumen ya cubierto por las 2 fuentes oficiales |
| Webs propias de cada uno de los 152 centros | No se visitó individualmente cada web (152 páginas) por alcance del sprint; se usaron los datos estructurados de las fuentes oficiales. Las webs de los 41 colegios completos y de las EBM SÍ están enlazadas en el dataset (`website`) para que el equipo pueda ampliar/verificar servicios en una fase posterior |

---

## Proceso de construcción del dataset

1. Se consultó la API Socrata del Directori de centres docents filtrando `nom_municipi=Barcelona`, `curs=2025/2026`, `einf1c=EINF1C` → 272 centros candidatos.
2. Se clasificaron en 3 grupos según `nom_naturalesa` / `nom_titularitat` / flags de etapa:
   - **Corporacions Locals** (105 filas) → candidatos a Escola Bressol Municipal.
   - **Departament d'Educació i Formació Professional** (5 filas) → Llars d'infants de la Generalitat, públicas no municipales.
   - **Privat**, sin `epri`/`eso`/`batx` (121 filas) → escoles bressol / llars d'infants privadas "solo infantil".
   - **Privat**, con `epri`/`eso`/`batx` (41 filas) → colegios con sección de primer ciclo de infantil.
3. Se descargó y transcribió el PDF oficial del Ajuntament (106 EBM) y se cruzó por nombre normalizado con las 105 filas "Corporacions Locals" de la Generalitat (103 coincidencias directas, 1 renombramiento resuelto manualmente, 2 sin coincidencia por ser de apertura muy reciente).
4. Se aplicó el criterio de calidad/alcance descrito en `docs/barcelona-quality-report.md` para decidir qué queda en el dataset final (152) y qué pasa a `pending_review` (121).
5. Se generaron `short_description`, `long_description` (solo EBM, 106), FAQs (todas), y `recommended_indexable` a partir exclusivamente de los hechos confirmados en estas fuentes — sin inventar servicios, horarios, precios ni coordenadas no confirmadas.

## Script de normalización

A diferencia de Madrid (que usa `scripts/normalize-cam-data.ts`), este sprint de Barcelona se construyó con scripts Node ad-hoc de un solo uso (no incorporados al repositorio, ejecutados en el entorno de investigación) que:
1. Consultan la API Socrata del dataset de la Generalitat.
2. Combinan esos datos con la transcripción manual del PDF de EBM del Ajuntament.
3. Normalizan nombres de distrito (el PDF y el dataset de la Generalitat usan formatos ligeramente distintos, p. ej. "Sants-Montjuïc" vs. "Sants - Montjuïc").
4. Generan slugs únicos, descripciones, FAQs y el cálculo de `recommended_indexable`.
5. Exportan a los formatos finales documentados en `barcelona-quality-report.md`.

Si se desea repetir o automatizar este proceso en el futuro, se recomienda formalizar estos pasos en un script versionado (p. ej. `scripts/normalize-barcelona-data.ts`), análogo al usado para Madrid.
