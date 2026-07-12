# Informe de calidad — Dataset Jerez de la Frontera (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el municipio de Jerez de la
Frontera, análogo al realizado para Madrid, Barcelona, Valencia, Zaragoza, Murcia,
Sevilla, Palma, Málaga, Alicante, Las Palmas, Córdoba y Granada. No se ha tocado
ninguna de esas ciudades, el schema, el código de la app ni Supabase. No se ha
ejecutado SQL. No se ha activado indexación real (esto es un dataset de trabajo, no
un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados (fuente oficial, primer ciclo infantil 0-3 en Jerez de la Frontera) | 37 (6 con `D_TIPO=Público` en la fuente cruda + 31 con `D_TIPO=Privado`) |
| **Centros incluidos en el dataset final** | **37** |
| Centros excluidos (motivo documentado) | 0 |
| Fuentes primarias usadas | 2 principales: "Centros de primer ciclo de educación infantil en Andalucía, con alumnado matriculado" (Junta de Andalucía, portal de datos abiertos) y Portal de Escolarización 0-3 años (Junta de Andalucía) — más webs oficiales propias de 4 centros privados |

### Composición del dataset final (37)

| `source_group` | Cantidad | Ownership | `type` |
|---|---|---|---|
| Red pública de la Junta de Andalucía | 6 | público | escuela-infantil |
| Privado adherido al Programa de Ayuda a las Familias | 29 | privado | guardería |
| Privado no adherido | 2 | privado | guardería |

### Clasificación `ownership`: contexto andaluz aplicado desde el origen, con un caso de autodescripción comercial engañosa detectado y corregido

Siguiendo el criterio ya validado en Sevilla, Málaga, Córdoba y Granada, **ningún
centro del dataset de Jerez de la Frontera usa `ownership: concertado`** —
Andalucía no tiene concierto educativo formal para el primer ciclo de infantil.

A diferencia de Córdoba (Entidad Local Autónoma + Defensa) y de Málaga (empresas
privadas mal etiquetadas como públicas), en Jerez de la Frontera **las 6 filas con
`D_TIPO="Público"` corresponden genuinamente a la red autonómica de la Junta de
Andalucía**, confirmado por el dominio de email institucional
`@juntadeandalucia.es` en las 6 (Virgen del Valle, Santa María, San Carlos,
Rocinante, Primavera, El Paje). No se ha detectado ningún caso de titularidad
pública no autonómica (ELA, Defensa, municipal) dentro del término municipal de
Jerez de la Frontera en esta fuente.

Sí se ha detectado y corregido un caso de **autodescripción comercial engañosa en
sentido inverso**: el centro privado "Luna de Caramelo" se presenta en su propia
web como "guardería pública" y "centro público, autorizado por la Junta de
Andalucía", pero en el registro oficial de la Junta de Andalucía figura con
`D_TIPO="Privado"` y adherido al Programa de Ayuda a las Familias
(`priv_adh_inf1="S"`). Se ha mantenido `ownership: privado` siguiendo
estrictamente la fuente oficial (Registro de Centros Docentes), no el marketing
propio del centro — mismo criterio que obligó a la corrección post-auditoría de
Sevilla, aplicado aquí desde el origen. Detalle completo en
`docs/data-sources-jerez.md`, fuente 3.

---

## 2. Resolución de centros excluidos

**Ningún centro del listado oficial fue excluido en este sprint.** Los 37
candidatos evaluados superaron el umbral mínimo de verificación del proyecto: los
37 tienen al menos teléfono o email confirmado directamente en la fuente oficial
de la Junta de Andalucía (36/37 con teléfono — el centro "Nazaret" solo tiene
email en el registro, sin teléfono —, 37/37 con email), además de dirección,
titularidad y coordenadas verificables en el 100% de los casos.

El archivo `data/enrichment/jerez-centers-excluded.json` existe con la estructura
estándar del proyecto pero con `centers: []`, documentando que la comprobación se
realizó y no encontró candidatos del listado oficial por debajo del umbral mínimo.

No se ha detectado ningún centro adicional mencionado en fuentes municipales o de
prensa que estuviera ausente del CSV oficial de la Junta de Andalucía y que
reuniera datos suficientes para constituir siquiera un "candidato" a evaluar.

---

## 3. Calidad de los datos (dataset final, 37 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 36 / 37 | 97,3% |
| Email | 37 / 37 | **100%** |
| Web | 4 / 37 | 10,8% |
| Coordenadas (lat/lng) | 37 / 37 | **100%** (de fuente oficial directa, sin incidencias de coordenadas erróneas detectadas) |
| Servicios confirmados (`services` no vacío) | 4 / 37 | **10,8%** |
| `schedule` estructurado | 8 / 37 | 21,6% (las 6 escuelas públicas con horario oficial homogéneo + 2 privadas con horario propio confirmado por web oficial: Sol y Luna, Luna de Caramelo) |
| `long_description` (único por centro) | 10 / 37 | 27,0% |
| FAQs (5-9 por centro) | 37 / 37 | 100% |
| `district` (pedanía) | 4 / 37 | 10,8% (Mesas de Asta, Guadalcacín, La Barca de la Florida, Torrecera; los 33 restantes están en el núcleo urbano de Jerez capital, sin distrito administrativo asignado — ver informe SEO) |

### `confidence_level`

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 10 | 6 escuelas públicas de la Junta de Andalucía (horario y proceso de admisión homogéneos verificados) + 4 centros privados con al menos un servicio confirmado por web propia |
| medium | 27 | Resto: solo datos de la fuente oficial de registro (nombre, dirección, contacto, titularidad, adhesión), sin servicio adicional confirmable por web propia |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

- **4 estructuras** para el grupo de las 6 escuelas públicas de la Junta de
  Andalucía, rotando de forma determinista por hash del código de centro.
- **4 estructuras** para el grupo de privados con servicio confirmado por web
  propia (4 centros: Attendis Preschool Jerez, Sol y Luna, Luna de Caramelo, El
  Recreo).
- **6 estructuras** para el grupo mayoritario de privados adheridos sin servicio
  confirmado (25 centros).
- **3 estructuras** para el grupo de privados no adheridos sin servicio
  confirmado (2 centros).

Verificación automatizada tras la generación:

- **`short_description`: 37/37 textualmente únicas** (comparación exacta de
  conjunto, `new Set(...).size === 37`).
- **`long_description`: 10/10 textualmente únicas** entre los centros que la
  tienen.
- Longitud de `short_description`: entre 190 y 318 caracteres (dentro del rango
  180-450 exigido).
- Slugs: 37/37 únicos, sin colisiones de nombre. Se detectaron dos centros
  llamados "Montealto"/"Montealto II" (misma zona/urbanización pero direcciones y
  códigos de centro distintos) — slugs distintos sin ambigüedad.

### Caso singular: tres centros con teléfono compartido

Pequeños pasitos (código 11012701), Baby Ilusiones (11012929) y La Ardilla Pilla
(11013089) comparten el mismo teléfono de contacto en la fuente oficial
(620565686), y dos de ellos comparten además el mismo email exacto. Se verificó
que los tres tienen código de centro, nombre y dirección postal propios y
distintos — **no se han tratado como duplicados**, pero se documenta
explícitamente en el campo `notes_internal` de cada uno, sin fusionarlos ni
excluir ninguno. Ver `docs/data-sources-jerez.md`, fuente 5.

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(4-36 meses, según fuente oficial homogénea del primer ciclo andaluz), titularidad
(diferenciando explícitamente red Junta / privado adherido / privado no
adherido), horario cuando está confirmado, servicios confirmados (comedor,
bilingüe, patio exterior, psicomotricidad, escuela de padres, horario ampliado,
madrugadores, cuando aplica) y vía de contacto. Todos los centros incluyen una
FAQ de transparencia ("¿Está verificada la información de esta ficha?"). Ninguna
FAQ afirma un servicio, horario o metodología no verificados.

---

## 4. `long_description`: criterio de inclusión

Siguiendo la instrucción explícita de no rellenar con relleno genérico, se generó
`long_description` únicamente para:

- Las **6 escuelas infantiles públicas** de titularidad de la Junta de Andalucía
  (fuente oficial homogénea y verificada: horario, comedor, proceso de admisión).
- Los **4 centros privados** con al menos un servicio confirmado por web propia
  (Attendis Preschool Jerez, Sol y Luna Escuela Infantil Jerez, Luna de Caramelo,
  El Recreo).

Los **27 centros privados restantes**, con datos limitados a nombre, dirección,
teléfono/email, titularidad y régimen de adhesión según el registro oficial, **no
llevan `long_description`** — se consideró que no había datos suficientes para
aportar valor real más allá de lo ya cubierto en `short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)):

| Resultado | Cantidad | % |
|---|---|---|
| Indexable | 10 / 37 | 27,0% |
| No indexable (noindex, follow) | 27 / 37 | 73,0% |

Los 27 no indexables son exactamente los centros privados sin servicio confirmado
ni `long_description` (solo nombre, dirección, contacto, titularidad y régimen de
adhesión según el registro oficial de la Junta de Andalucía). Es un resultado
honesto del propio gate de calidad del proyecto: los 27 quedan crawlables e
incluidos en el sitemap como `noindex, follow` hasta que se complete su
enriquecimiento en una fase posterior, en vez de forzarlos a indexar con contenido
insuficiente.

---

## 6. Riesgos y bloqueos conocidos

1. **Volumen alto de centros privados sin servicio confirmado (27 de 31, 87%)**:
   no se localizó web propia accesible y verificable para la gran mayoría de los
   centros privados individuales de Jerez de la Frontera, o la web encontrada no
   confirmaba servicios concretos del enum con claridad suficiente. No es un
   bloqueante para incluir el centro en el dataset (todos tienen al menos email de
   fuente oficial, y 36/37 también teléfono), pero sí limita su indexabilidad
   automática. Es la mayor oportunidad de enriquecimiento futuro del dataset de
   Jerez.
2. **Ausencia de campo `district` estructurado para el núcleo urbano (33/37)**:
   Jerez capital tiene 6-7 distritos administrativos propios reconocidos por el
   Ayuntamiento (Centro, Este, Norte, Noreste, Oeste, Sur), pero un mapeo código
   postal → distrito no es 1:1 verificable sin una fuente cartográfica oficial
   adicional (el callejero municipal de Jerez), y no se ha construido esa
   aproximación no verificable. Los 4 centros situados en pedanías (Mesas de
   Asta, Guadalcacín, La Barca de la Florida, Torrecera) sí llevan el nombre de
   la pedanía en el campo `district`, por ser un dato explícito y verificable de
   la propia fuente oficial (`D_LOCALIDAD` distinto de la capital). Ver informe
   SEO para el impacto de esta brecha en las landings de distrito.
3. **Bajo nivel de renta per cápita del municipio (contexto de negocio, no de
   datos)**: Jerez de la Frontera tiene una de las rentas per cápita más bajas
   de España entre municipios de más de 100.000 habitantes y una tasa de paro
   elevada. Esto no afecta al rigor de la investigación de datos, pero sí es
   relevante para el informe SEO: es previsible que la demanda de verticales de
   alto valor percibido (bilingüe/internacional) sea baja en comparación con
   otras zonas ya integradas del proyecto (Málaga, por ejemplo). Ver
   `docs/jerez-seo-report.md`.
4. **Centro "Nazaret" sin teléfono en el registro oficial**: es el único de los
   37 centros sin teléfono en la fuente oficial (solo email
   `direccion@clubnazaret.org`); se ha mantenido en el dataset por tener email
   confirmado de fuente oficial, dirección y coordenadas, cumpliendo el umbral
   mínimo del proyecto.
5. **Caso de autodescripción comercial engañosa en Luna de Caramelo** (ver
   sección 1): riesgo documentado explícitamente en vez de asumir la
   autodescripción del propio centro sobre su titularidad.
6. **Tres centros con teléfono compartido** (Pequeños pasitos / Baby Ilusiones /
   La Ardilla Pilla, ver sección 3): posible gestión por la misma persona o
   entidad, documentado en `notes_internal` sin fusionar ni excluir ninguno.
7. **Ayuntamiento de Jerez de la Frontera sin listado propio descargable de
   escuelas infantiles municipales**: a diferencia de Zaragoza o Murcia, no se ha
   localizado un listado oficial equivalente en `jerez.es`; toda la red pública
   identificada procede de la fuente 1 (Junta de Andalucía). Si en el futuro se
   localiza una fuente municipal propia, debería contrastarse contra el CSV
   oficial antes de incorporar cualquier centro nuevo.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-jerez.md` | Fuentes evaluadas, formato, licencia, campos disponibles, automatización, limitaciones |
| 2 | `data/enrichment/jerez-centers-raw.json` | Extracción sin procesar (37 filas), antes de deduplicar/normalizar |
| 3 | `data/enrichment/jerez-centers.json` | Dataset final: 37 centros verificados y humanizados |
| 4 | `data/enrichment/jerez-centers-excluded.json` | 0 centros excluidos del listado oficial (estructura estándar) |
| 5 | `data/import/jerez-centers.csv` | CSV con las mismas columnas que Madrid/Barcelona/Valencia/.../Córdoba/Granada (37 filas) |
| 6 | `docs/jerez-quality-report.md` | Este informe |
| 7 | `docs/jerez-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-jerez-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-jerez-centers.sql` | DELETE explícito por lista de 37 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución manual
   por el propietario del proyecto, con paso a `status='published'` solo tras
   auditoría, igual que en el resto de zonas ya integradas.
2. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 27
   centros privados sin servicio confirmado; explorar el callejero oficial del
   Ayuntamiento de Jerez de la Frontera para asignar `district` de forma
   verificable en el núcleo urbano; contactar con la Delegación Territorial de
   Desarrollo Educativo y Formación Profesional en Cádiz para confirmar si existe
   algún centro municipal adicional no recogido en el CSV oficial.
3. **Diseño de landings**: con 37 centros en total, hay masa suficiente para
   landings municipales generales, pero muy limitada para landings de
   servicio o distrito en esta fase — ver detalle completo en
   `docs/jerez-seo-report.md`.
