# Informe de calidad — Dataset Albacete capital (centros de educación infantil 0-3 años)

Sprint de investigación y generación de datos para el término municipal de
Albacete capital, análogo al realizado para el resto de zonas ya integradas. No
se ha tocado Madrid, Barcelona, Valencia ni ninguna otra ciudad, el schema, el
código de la app ni Supabase. No se ha ejecutado SQL. No se ha activado
indexación real (esto es un dataset de trabajo, no un despliegue).

---

## 1. Resumen ejecutivo

| Métrica | Valor |
|---|---|
| Candidatos evaluados en total | 33 (27 en dataset final + 6 excluidos) |
| **Centros incluidos en el dataset final** | **27** |
| Centros excluidos (motivo documentado) | 6 |
| Fuentes primarias usadas | Patronato Municipal de Escuelas Infantiles de Albacete (acceso indirecto por bloqueo de red), Junta de Comunidades de Castilla-La Mancha (admisión de Escuelas Infantiles de Titularidad Autonómica), webs oficiales propias de 11 centros privados, Directorio Común de Unidades Orgánicas del Estado (DIR3), geocodificación abierta Nominatim/OpenStreetMap |

### Composición del dataset final (27)

| Grupo | Cantidad | Ownership | `type` |
|---|---|---|---|
| Público, titularidad y gestión municipal (Patronato Municipal de Escuelas Infantiles del Ayuntamiento de Albacete) | 7 | público | escuela-infantil |
| Público, titularidad autonómica (Junta de Comunidades de Castilla-La Mancha) | 4 | público | escuela-infantil |
| Privado, con al menos un servicio confirmado por web oficial propia | 11 | privado | guardería |
| Privado, sin servicio confirmado por fuente primaria verificable | 5 | privado | guardería |

### Clasificación `type`: guardería vs. escuela infantil

Se aplicó el mismo criterio que en el resto de zonas ya integradas: titularidad
pública (municipal o autonómica) → `escuela-infantil`; centros privados de
gestión individual/empresarial → `guarderia`. En Albacete esto coincide
exactamente con la frontera público/privado: los 11 centros públicos son
`escuela-infantil`; los 16 centros privados son `guarderia`. Se incluye en este
grupo la etapa de primer ciclo del Colegio San Cristóbal, clasificada como
`guarderia`/`privado` pese a que el colegio en su conjunto tiene concierto
educativo en etapas superiores (ver nota sobre `ownership` más abajo).

### Ownership

| Ownership | Cantidad | Criterio |
|---|---|---|
| Público | 11 | 7 escuelas de titularidad y gestión municipal (Patronato Municipal de Escuelas Infantiles del Ayuntamiento de Albacete) + 4 escuelas de titularidad autonómica (Junta de Comunidades de Castilla-La Mancha) |
| Privado | 16 | Centros de gestión individual/empresarial, incluida la etapa de primer ciclo de Colegio San Cristóbal |
| Concertado | 0 | **No se ha usado el valor `concertado` para ningún centro de este dataset.** El concierto educativo en España aplica al segundo ciclo de infantil (3-6 años) y primaria en adelante — nunca al primer ciclo (0-3 años), que no es susceptible de concierto en el marco normativo estatal vigente. Aunque varios directorios de terceros etiquetan como "concertado" a Rayuela, Sonrisas, La Cometa, Pekeñecos (excluido) y el propio Colegio San Cristóbal se autodenomina "colegio concertado" en redes sociales, no se ha localizado ninguna fuente oficial que confirme un concierto real y formal para primer ciclo en ningún centro de Albacete capital. Ver detalle en `docs/data-sources-albacete.md` |

---

## 2. Resolución de centros excluidos

**6 centros fueron excluidos en este sprint**, con motivo documentado en
`data/enrichment/albacete-centers-excluded.json`:

| Centro | Motivo agregado |
|---|---|
| Escuela Infantil La Noria | Colisión de dirección exacta con Pekeñecos, sin poder confirmar identidad inequívoca ni con web propia sólida |
| Escuela Infantil Pekeñecos | Misma colisión de dirección con La Noria, sin web oficial propia localizada |
| Colegio Pemán — Escuela Infantil (0-3) | Web propia con fallo de acceso en las páginas internas de la etapa de primer ciclo; datos insuficientes para alcanzar el umbral mínimo de verificación específico de esa etapa |
| Centro de Ocio Infantil Veo Veo | Fuera del alcance MVP: parque infantil de ocio/animación de cumpleaños, no centro de educación infantil reglada |
| Escuela Infantil Kidsco B.A. Albacete (Base Aérea) | Uso exclusivo para hijos de personal militar, sin matriculación abierta a la población general |
| Escuelas Infantiles ABC | Solo dirección y teléfono de una única fuente no oficial, sin ninguna corroboración cruzada ni dato adicional |

**Motivo agregado**: 2 de 6 exclusiones (33%) son por ambigüedad de identidad de
centro (riesgo de duplicado), 2 de 6 (33%) son por quedar fuera del alcance MVP
del proyecto (ocio infantil / uso militar restringido), y 2 de 6 (33%) son por
no alcanzar el umbral mínimo de verificación de datos.

---

## 3. Calidad de los datos (dataset final, 27 centros)

### Cobertura de campos

| Campo | Centros con dato | % |
|---|---|---|
| Teléfono | 26 / 27 | 96.3% |
| Email | 22 / 27 | 81.5% |
| Web | 11 / 27 | 40.7% |
| Coordenadas (lat/lng) | 27 / 27 | **100%** (geocodificación abierta Nominatim/OpenStreetMap de la dirección postal confirmada) |
| Servicios confirmados (`services` no vacío) | 18 / 27 | **66.7%** |
| `schedule` estructurado | 10 / 27 | 37.0% |
| `long_description` (único por centro) | 14 / 27 | 51.9% |
| FAQs (3-6 por centro) | 27 / 27 | 100% |
| `district` (barrio/distrito administrativo) | 21 / 27 | 77.8% |

### confidence_level

| Valor | Cantidad | Criterio |
|---|---|---|
| high | 11 | Centros con servicio confirmado, horario confirmado y/o web oficial propia verificada con múltiples datos citables |
| medium | 16 | Centros con datos base (nombre, dirección, teléfono/email, titularidad) confirmados por al menos una fuente fiable, pero sin servicios adicionales o con datos de agregadores de terceros no citables como fuente de servicios |
| low / unknown | 0 | Ninguno entra en el dataset final |

### Unicidad de contenido (lección de Barcelona aplicada desde el inicio)

Siguiendo la lección documentada en `docs/checklist-calidad-nueva-ciudad.md`
sobre el incidente de plantilla única en Barcelona, para Albacete se diseñaron
estructuras de frase distintas por grupo homogéneo:

- **3-4 estructuras** para el grupo de 7 escuelas municipales del Patronato.
- **3 estructuras** para el grupo de 4 escuelas de titularidad autonómica.
- **8+ estructuras** para el grupo de 16 centros privados, variando según
  disponibilidad de horario, servicios y trayectoria del centro.

Verificación automatizada tras la generación (script Node ejecutado sobre el
JSON final):

- **`short_description`: 27/27 textualmente únicas** (`new Set(...).size === 27`).
- **`long_description`: 14/14 textualmente únicas** entre los centros que la tienen.
- Slugs: 27/27 únicos, sin colisiones, verificado por script.
- 0 servicios fuera del enum `CenterService` de `src/types/center.ts`.
- 0 valores de `ownership`/`type` fuera de sus enums respectivos.
- 0 centros con `confidence_level` "low" o "unknown".

### FAQs

Las FAQs se generan a partir de datos confirmados únicamente: ubicación, edades
(0-36 meses para red municipal/privada; 0-24 meses para la red autonómica, que
solo admite los tramos 0-1-2 años según su propio proceso de admisión),
titularidad, horario cuando está confirmado (10 de 27), servicio destacado
confirmado (comedor, bilingüe/inglés u horario ampliado, según disponibilidad) y
vía de contacto. Cada ficha lleva entre 3 y 6 FAQs, respetando el límite máximo
de 6 indicado por el coordinador. Ninguna FAQ afirma un servicio, horario o
metodología no verificados.

---

## 4. `long_description`: criterio de inclusión

Se generó `long_description` para **14 centros** con al menos uno de estos datos
reales confirmados: servicio(s) concreto(s) del enum, horario propio, o enfoque
pedagógico declarado en fuente oficial propia (incluye el caso de Escuela
Infantil Ludus, con `long_description` basada en horario propio y enfoque
pedagógico declarado, aunque sin servicios concretos del enum).

Los **13 centros restantes** (Escuela Infantil Ensanche, Hermanos Falcó, San
Pablo, San Pedro-Mortero, El Tren Azul, Virgen de los Llanos, Los Girasoles,
Escuela Infantil Carrusel, Escuelas Infantiles Aire Libre I y II, Guardería
Tulgarita, Escuela Infantil La Escuelita, Escuela Infantil Rayuela), con datos
limitados a nombre, dirección, teléfono/email, titularidad y, en algún caso, un
único servicio (comedor), **no llevan `long_description`** — se consideró que no
había datos suficientes para aportar valor real más allá de lo ya cubierto en
`short_description` y las FAQs.

---

## 5. Indexabilidad (`isCenterIndexable`, gate real de `src/lib/centers.ts`)

Aplicando el gate real del proyecto (`name+slug+type+ciudad+ubicación` +
`short_description` + (`services.length>0` O `long_description`)), verificado
con un script que recalcula el gate exacto sobre el JSON final:

| Resultado | Cantidad | % |
|---|---|---|
| Indexable (`recommended_indexable`) | 19 / 27 | **70.4%** |
| No indexable (noindex, follow) | 8 / 27 | 29.6% |

Los 8 no indexables son exactamente los centros sin servicio confirmado ni
`long_description`: 3 de las 4 escuelas de titularidad autonómica (El Tren Azul,
Virgen de los Llanos, Los Girasoles — El Pilar sí es indexable por tener
horario-ampliado confirmado y `long_description`) y 5 centros privados sin
fuente primaria propia verificable (Aire Libre I, Aire Libre II, Tulgarita, La
Escuelita, Rayuela).

---

## 6. Riesgos y bloqueos conocidos

1. **Bloqueo total del dominio `albacete.es` (y todos sus subdominios,
   incluyendo `escuelas-infantiles.albacete.es`)**: todas las peticiones
   directas devolvieron error de conexión (`ECONNREFUSED`) durante toda esta
   investigación. Esto impidió leer directamente el PDF oficial
   "LISTADO_DE_GUARDERIAS.pdf" (centros privados de educación infantil
   autorizados), que habría sido la fuente más completa y fiable para el
   mercado privado. **Es la principal limitación de este sprint**: no se puede
   garantizar que los 16 centros privados localizados agoten el 100% del
   mercado privado autorizado de Albacete capital. Es la primera vez en la
   serie de zonas investigadas del proyecto que un bloqueo de red impide el
   acceso a la fuente municipal completa (en Castelló de la Plana el bloqueo
   fue parcial, sustituible por otras fuentes equivalentes).
2. **9 de 27 centros (33%) sin servicio confirmado por fuente primaria
   verificable**: no se localizó web propia accesible con contenido citable, o
   la web encontrada devolvió error (HTTP 503 en Aire Libre I, HTTP 404 en
   páginas internas de Colegio Pemán, fallo DNS en Primeros Pasitos — este
   último quedó finalmente fuera del dataset por no alcanzar el umbral mínimo
   ni siquiera con datos base suficientes tras el fallo repetido de acceso).
   Es la principal oportunidad de enriquecimiento futuro del dataset de
   Albacete.
3. **Escuela Infantil Primeros Pasitos — no incluida en el dataset final ni en
   excluidos explícitos**: se detectó como candidato (web propia con dominio
   confirmado, pero con fallo de acceso DNS persistente durante toda la
   investigación) y finalmente no se incluyó en el dataset por no poder
   alcanzar de forma fiable el umbral mínimo de verificación combinando
   snippets de búsqueda sin datos de contacto propios verificables con
   suficiente detalle (sin teléfono ni email confirmados de forma
   independiente). Se documenta aquí como caso límite para una futura fase de
   enriquecimiento, y no se ha forzado su inclusión en el archivo de excluidos
   porque no llegó a evaluarse contra fuente suficiente para un motivo de
   exclusión específico más allá de "datos insuficientes", que es el mismo
   fondo aplicado a Colegio Pemán y ABC.
4. **Ningún centro con `ownership = concertado`**: ver nota extensa en
   `docs/data-sources-albacete.md` y en la sección 1 de este informe — el
   primer ciclo de educación infantil no es susceptible de concierto educativo
   en el marco normativo estatal vigente, independientemente de que el colegio
   que lo aloja (San Cristóbal, Pemán) tenga concierto en etapas superiores.
5. **`district` confirmado solo para 21/27 centros (77.8%)**, vía
   geocodificación abierta Nominatim/OpenStreetMap de la dirección postal — no
   es una fuente oficial de división administrativa municipal, pero sí una
   fuente geográfica abierta y verificable, consistente con los 5-6 distritos
   administrativos reales de Albacete documentados en el informe SEO. 6
   centros quedan sin distrito por no poder geocodificar con precisión
   suficiente la vía exacta (direcciones tipo "s/n" en vías no siempre
   indexadas con nombre completo en OpenStreetMap).
6. **Corrección de coordenadas de "Los Mundos de Noa"**: una primera consulta
   de geocodificación con el nombre corto de la vía ("Avenida Guardia Civil")
   devolvió coordenadas en la pedanía de Aguas Nuevas, un núcleo de población
   separado de la ciudad de Albacete. Se detectó la inconsistencia, se
   reintentó con el nombre completo oficial de la vía ("Avenida de la Guardia
   Civil") y se obtuvo la ubicación correcta en el distrito de San Antonio
   Abad, dentro de la capital. Documentado como incidencia resuelta.
7. **Corrección de dirección de "Escuela Infantil El Tren Azul"**: la dirección
   citada en notas de prensa ("Alcázar de Toledo, s/n") no se localizó como vía
   propia en la geocodificación abierta; se confirmó mediante fuente adicional
   (centroseducacion.com, que cita el código de centro oficial 02008993) que la
   dirección correcta y más precisa es "Plaza Francisco Jareño, s/n", en el
   mismo Polígono de San Antón. Documentado como incidencia resuelta.

---

## 7. Archivos generados

| # | Archivo | Contenido |
|---|---|---|
| 1 | `docs/data-sources-albacete.md` | Fuentes evaluadas, formato, licencia, campos disponibles, incidencia de bloqueo de red, limitaciones |
| 2 | `data/enrichment/albacete-centers-raw.json` | Extracción sin procesar (33 filas candidatas), antes de normalizar/enriquecer |
| 3 | `data/enrichment/albacete-centers.json` | Dataset final: 27 centros verificados y humanizados |
| 4 | `data/enrichment/albacete-centers-excluded.json` | 6 centros excluidos con motivo documentado |
| 5 | `data/import/albacete-centers.csv` | CSV con las mismas columnas que el resto de zonas ya integradas (27 filas) |
| 6 | `docs/albacete-quality-report.md` | Este informe |
| 7 | `docs/albacete-seo-report.md` | Keyword research y recomendación de landings |
| 8 | `data/migrations/insert-albacete-centers.sql` | INSERT con `status='draft'`, `ON CONFLICT (slug) DO UPDATE` |
| 9 | `data/migrations/rollback-albacete-centers.sql` | DELETE explícito por lista de 27 slugs |

---

## 8. Siguiente paso recomendado

1. **No ejecutar el SQL todavía** — queda pendiente de revisión y ejecución
   manual por el propietario del proyecto, con paso a `status='published'` solo
   tras auditoría, igual que en el resto de zonas ya integradas.
2. **Reintentar el acceso al dominio `albacete.es`** en una fase futura, cuando
   el bloqueo de red se resuelva, para leer directamente el PDF oficial de
   guarderías privadas autorizadas y confirmar si existen centros privados
   adicionales no localizados en este sprint por otras vías.
3. **Enriquecimiento futuro** (no bloqueante): completar `services` para los 9
   centros sin servicio confirmado, reintentar el acceso a las webs propias que
   fallaron (Aire Libre I: HTTP 503; Colegio Pemán: HTTP 404 en páginas
   internas; Primeros Pasitos: fallo DNS) y resolver la ambigüedad de La
   Noria/Pekeñecos contactando directamente con el Ayuntamiento o los propios
   centros.
4. **Diseño de landings**: con 27 centros en total, hay masa suficiente para
   landings municipales generales — ver detalle completo en
   `docs/albacete-seo-report.md`.
