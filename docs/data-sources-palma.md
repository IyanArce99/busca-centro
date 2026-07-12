# Fuentes de datos — Palma (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset de centros de educación infantil de primer ciclo (0-3 años) en el **municipio de Palma** (término municipal de Palma de Mallorca, que incluye la capital y sus barrios/pedanías: Son Ferriol, S'Arenal (Palma), Es Coll d'en Rabassa, Can Pastilla, Establiments, Es Pil·larí, Sant Jordi, Ciutat Jardí, Es Secar de la Real, El Terreno, Son Espanyolet, etc.). **No incluye** otros municipios de la isla de Mallorca (Calvià, Marratxí, Llucmajor —cuya propia zona de S'Arenal es administrativamente distinta de S'Arenal (Palma)—, etc.) ni el resto de las Illes Balears (Menorca, Eivissa, Formentera). Sigue el mismo formato y nivel de rigor que `docs/data-sources-barcelona.md`, `docs/data-sources-valencia.md` y `docs/data-sources-murcia.md`.

---

## Fuentes evaluadas

### 1. Directorio de centros educativos — Oferta Educativa (GestIB), Govern de les Illes Balears ⭐ PRINCIPAL A USAR

| Campo | Detalle |
|-------|---------|
| **Nombre** | Directorio de centros ("llistaCentresDirectori") del sistema GestIB, que alimenta la herramienta pública "Oferta Educativa de les Illes Balears" (`caib.es/sites/escolaritzaciocurs/ca/oferta_educativa_de_les_illes_balears/`) |
| **Organismo** | Govern de les Illes Balears, Conselleria d'Educació i Universitats (a través del sistema de gestión académica GestIB / IBSTEAM) |
| **Endpoint usado** | `https://www3.caib.es/xestibback/external/llistes/llistaCentresDirectori.json` — JSON público, sin autenticación, accedido directamente desde el frontend de la propia herramienta oficial de consulta de oferta educativa (`www3.caib.es/xestibback/external/ofertaEducativa`) |
| **Formato** | JSON, un único array con **todos** los centros educativos activos de las Illes Balears (todos los niveles, todas las islas), sin paginación — 984 registros en el momento de la investigación |
| **Descarga automatizada** | Sí — confirmado con `curl` sin autenticación ni cabeceras especiales (HTTP 200, ~941 KB) |
| **Registros totales (Illes Balears, todos los niveles/islas)** | 984 centros activos |
| **Registros en Palma (municipi="Palma" o municipi que termina en "(Palma)"), cualquier tipo** | Ver el filtro exacto abajo |
| **Registros de primer ciclo de infantil en Palma** | **79 centros candidatos** tras filtrar por tipo de centro (`CEI`, `EIEL`, `EI1`, `EI`, `CCEI`) y `actiu=true`; **77 tras excluir 2 centros nuevos aún no operativos** (Son Dameto Dalt, Son Gibert); **75 en el dataset final** tras excluir 2 centros adicionales sin ningún dato de contacto verificable (Ikigai, Little Rainbow) |

#### Campos disponibles (columnas del JSON, por centro)

| Campo | Descripción |
|---|---|
| `codiOficial` | Código oficial de centro (8 dígitos, empieza por `07` para la provincia/isla de Illes Balears — Mallorca) |
| `nomCentre` | Nombre propio del centro (en mayúsculas) |
| `nomTipusCentreAbreujat` | Abreviatura del tipo de centro. Los tipos relevantes para primer ciclo de infantil (0-3) identificados por su nombre completo dentro del propio dataset son: `CEI` (Centre d'Educació Infantil, privado), `EIEL` (Escola Infantil d'Educació Local — municipal), `EI1` (Escola Infantil, primer cicle), `EI` (Escola Infantil, pública autonómica), `CCEI` (Centre Concertat d'Educació Infantil). Se descartaron sistemáticamente el resto de tipos (`CEIP`, `IES`, `CPFP`, conservatorios, escuelas de música/danza, EOI, etc.) por no ser de primer ciclo de infantil |
| `esPublic` | Booleano. **No es fiable por sí solo para distinguir titularidad real**: las 11 EIEL municipales tienen `esPublic=false` en este dataset a pesar de ser gestionadas por un organismo público (Patronat Municipal d'Escoles d'Infants), mientras que `EI`/`EI1` (Paula Torres, Verge de la Salut) sí tienen `esPublic=true`. La titularidad real se determinó cruzando `nomTipusCentreAbreujat` con la fuente 2 (ver más abajo) |
| `adreca`, `cp`, `municipi`, `localitat` | Dirección, código postal, municipio y localidad. `municipi` es el campo usado para filtrar Palma — incluye tanto `"Palma"` (capital) como variantes `"<barrio> (Palma)"` para las pedanías/barrios periféricos del mismo término municipal (confirmado: 29 valores distintos de `municipi` terminan en `"(Palma)"`, todos dentro del término municipal) |
| `telefon`, `email`, `web` | Teléfono, email y web. `web` está presente solo en 22 de los 79 candidatos, y en la mayoría de los casos de las EIEL apunta a `www.palmaescolesinfants.cat` (ficha genérica del Patronato, no web propia del centro) |
| `coordenadaX`, `coordenadaY` | Presentes en el esquema pero **vacíos (`null`) en el 100% de los 79 candidatos de Palma** — no se pudo usar como fuente de coordenadas, ver geocodificación complementaria más abajo |
| `actiu` | Booleano que indica si el centro está activo. Se filtró estrictamente por `actiu=true` |
| `codiTitularitat`, `titularitat`, `cif` | Presentes en el esquema pero vacíos (`null`) en la práctica totalidad de los registros de primer ciclo; no se han podido usar de forma sistemática |

**No incluye de forma fiable:** servicios reales del centro (comedor, horario ampliado, idiomas), coordenadas geográficas, ni distrito/barrio formal de la capital. Tampoco distingue de forma fiable titularidad pública/privada/concertada sin cruzar con el tipo de centro.

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente primaria oficial del Govern de les Illes Balears (Conselleria d'Educació i Universitats), a través del sistema oficial de gestión académica GestIB — equivalente funcional al Directori de centres docents catalán, al dataset CARM de Murcia y al Registre de Centres Docents de la Generalitat Valenciana
- Cubre todos los centros autorizados de primer ciclo de infantil del municipio (capital y barrios/pedanías), públicos, concertados y privados, sin necesidad de paginación
- Incluye teléfono en 70 de 79 candidatos y email en 74 de 79
- **Limitaciones:**
  - No hay filtro de servidor por municipio o tipo: hay que descargar el array completo (984 registros de todas las Illes Balears) y filtrar localmente
  - Sin coordenadas geográficas en ningún registro de primer ciclo de Palma — se recurrió a geocodificación complementaria (ver fuente 4)
  - `esPublic` no distingue correctamente la titularidad real de las escuelas municipales (ver arriba); fue necesario cruzar con la fuente 2
  - Sin distrito/barrio formal de la capital (solo distingue barrios periféricos vía el sufijo `"(Palma)"` en `municipi`, no aplicable a los centros situados en la propia capital)
  - No indica edad mínima exacta por centro; no hay ninguna fuente que confirme una edad mínima distinta a "0 a 3 años" de forma genérica (a diferencia de Murcia, donde el Ayuntamiento confirmó explícitamente 4 meses para las EMEI) — se ha usado 0 meses como edad mínima en todo el dataset de Palma por no tener una cifra más precisa confirmada

---

### 2. Patronat Municipal d'Escoles d'Infants (PMEI) — Ajuntament de Palma ⭐ A USAR (para las 11-12 escuelas municipales, como complemento del punto 1)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Patronat Municipal d'Escoles d'Infants (PMEI), organismo autónomo del Ajuntament de Palma |
| **URL principal** | `https://palmaescolesinfants.cat/es/` (dominio oficial del Patronato, enlazado también desde `palma.es`, la web institucional del Ayuntamiento) |
| **URLs complementarias usadas** | `https://palmaescolesinfants.cat/es/escuelas-infantiles/` (listado de las 12 escuelas con dirección, teléfono y email), `https://palmaescolesinfants.cat/es/calendario-y-horario/` (horario general de la red), `https://palmaescolesinfants.cat/es/escuelas-infantiles/escuela-infantil-verge-de-la-salut/` (ficha individual) |
| **Sede física** | Plaça Nova de la Ferreria, 2, planta baja, 07002 Palma. Tel. 971 225 994. Email: escolesinfants@pmei.palma.cat |
| **Formato** | HTML — páginas de listado y fichas individuales |
| **Descarga automatizada** | No — datos incorporados manualmente tras lectura de las páginas, cruzados por nombre/dirección/teléfono con los registros de tipo `EIEL`/`EI1` de la fuente 1 (coincidencia de teléfono y dirección verificada centro a centro) |
| **Registros** | El PMEI declara gestionar **12 escuelas** para niños de 0 a 3 años. De ellas, **11 se identificaron con tipo `EIEL`** en la fuente 1 y se marcan en el dataset con `source_group=eiel`: Son Roca, S'Arenal, Santa Catalina, Ciutat Antiga, Santa Creu, Maria Mut i Mandilego, Can Alonso, Son Fuster Nou, Son Ferriol, Es Molinar, Son Espanyolet. La duodécima, **Verge de la Salut**, tiene tipo `EI1` y titularidad de la Conselleria d'Educació (ver fuente 3) — se marca por separado (`source_group=conselleria_public`) porque, aunque el PMEI gestiona su admisión/matrícula/cuotas, no es de titularidad municipal |

#### Datos aportados por esta fuente y usados en el dataset

- **Horario confirmado para las 11 escuelas EIEL**: horario general de 8:30 a 15:00 h (con entrada progresiva hasta las 9:30 h), que incluye comedor; servicio de acogida matinal de 7:30 a 8:30 h y servicio de tarde de 15:00 a 16:00 h, ambos de solicitud previa con justificación documentada (fuente: `calendario-y-horario`, texto literal citado en el dataset)
- **Servicio de comedor confirmado** para las 11 escuelas EIEL, incluido en el horario general gratuito de 8:30 a 15:00 h
- **Edades atendidas**: "0 a 3 años" de forma genérica para las 12 escuelas del PMEI; no se ha localizado una cifra más precisa en meses (ni en esta fuente ni en ninguna otra consultada), por lo que se ha usado 0 meses como edad mínima en el dataset, sin forzar una cifra no confirmada
- **Datos de contacto (teléfono, email, dirección) de las 12 escuelas**, cruzados y coincidentes con la fuente 1

#### Calidad estimada: ⭐⭐⭐⭐

- Fuente oficial directa del Ayuntamiento de Palma, con teléfonos y direcciones que coinciden con los de la fuente 1 para las 11-12 escuelas, lo que da alta confianza cruzada
- Aporta horario y confirmación de comedor aplicable de forma homogénea a las 11 escuelas EIEL (mismo patrón que el usado en Murcia para sus 7 EMEI)
- **Limitaciones:** no hay ficha individual con datos operativos detallados por escuela más allá de contacto básico (salvo Verge de la Salut, que sí tiene ficha propia con horario diferenciado); el listado del REMEC (Registro Municipal de Ayudas a la Escolarización) mencionado en el propio sitio se distribuye como PDF descargable y no se ha podido consultar su contenido íntegro dentro de este sprint

---

### 3. Webs oficiales de centros privados/concertados individuales — USADAS PUNTUALMENTE PARA VERIFICAR SERVICIOS

| Campo | Detalle |
|-------|---------|
| **Uso dado** | Para 6 de los 61 centros privados/concertados (aquellos con web propia identificable y funcional en el momento de la consulta), se accedió directamente a su sitio web oficial para confirmar servicios reales del enum `CenterService` |
| **Centros verificados con web propia funcional** | Angelets de Llum (angeletsdellum.com), Mama Osa (mamaosa.es), Koala Polígon (escoletakoala.es), Nuestra Señora de la Providencia — Son Ferriol (ceiprovidenciasonferriol.com), Siervas de Jesús - Sagrado Corazón (cei-siervasdejesuspalma.com), Sant Francesc d'Assís (santfrancesc.fundacionxafer.org) |
| **Criterio aplicado** | Solo se asignó un servicio del enum `CenterService` cuando la propia web del centro lo mencionaba explícitamente en texto verificado (nunca por inferencia). En al menos un caso (Sant Francesc d'Assís) se descartó una primera lectura automatizada de la página que "detectó" todas las categorías posibles del enum de forma sospechosamente completa; se volvió a comprobar el HTML crudo con `curl`+`grep` y solo se confirmaron los servicios con evidencia textual literal (menús de navegación con enlaces a circulares/PDF propios del centro: comedor, uniformes, actividades extraescolares) |
| **Webs con certificado caducado, dominio mal configurado o error de conexión** | `www.eipaulatorres.org` (error de certificado SSL — dominio compartido con infraestructura de la CAIB, no se pudo verificar contenido), `www.proyectoswabisabi.com` (dominio sin configurar, sin contenido real — descartada como fuente para Nanai, Momo y Wabi Sabi, que comparten el mismo email y CIF pero se mantienen como 3 centros independientes con código de registro `codiOficial` propio cada uno, sin arrastrar servicios entre ellos), `www.escoletaropit` (URL sin TLD válido en la fuente oficial, no resuelve) |
| **Los 55 centros privados/concertados restantes** | No se localizó una web propia funcional y verificable, o la web encontrada (cuando existía) no detallaba servicios con suficiente claridad textual dentro del alcance de este sprint. Estos centros entran en el dataset final solo con los datos de la fuente 1 (nombre, dirección, teléfono y/o email, tipo, titularidad) y sin servicios asignados |

#### Calidad estimada: ⭐⭐⭐ (complementaria, no sistemática)

- Aporta datos reales y verificables centro a centro, pero no es una fuente estructurada ni completa
- **Limitación relevante:** no se ha podido verificar la web propia de los 55 centros privados/concertados restantes dentro del alcance de este sprint; ampliar esta verificación en una futura iteración mejoraría tanto el ratio de indexabilidad como el `confidence_level` medio del dataset

---

### 4. Geocodificación complementaria — Nominatim / OpenStreetMap ⭐ USADA PARA COORDENADAS

| Campo | Detalle |
|-------|---------|
| **Motivo de uso** | La fuente 1 (GestIB) no incluye coordenadas geográficas en ningún registro de primer ciclo de Palma (`coordenadaX`/`coordenadaY` vacíos en el 100% de los 79 candidatos) |
| **Servicio usado** | API pública de geocodificación de Nominatim (OpenStreetMap), `nominatim.openstreetmap.org/search`, con `User-Agent` identificado y límite de 1 petición por segundo respetado |
| **Método** | Geocodificación de la dirección completa (calle + código postal + "Palma, Illes Balears, Spain") de cada uno de los 79 candidatos, con reintentos con variantes de la consulta cuando la primera no obtuvo resultado |
| **Resultado** | 72 de 75 centros del dataset final obtuvieron coordenadas con precisión de calle. **3 centros quedan sin coordenadas** (Gianni Rodari, Mama Osa, Sa Capçaneta): no se encontró una coincidencia fiable a nivel de calle exacta pese a varios intentos con distintas variantes de la dirección; se descartó deliberadamente usar una aproximación a nivel de barrio o el centro de la ciudad, por instrucción expresa de no aproximar coordenadas |
| **Nota sobre Sa Capçaneta** | Un intento de geocodificación devolvió coordenadas a nivel de barrio (Sant Jordi, Palma) en vez de la calle exacta (Carrer de Ca's Quitxero); se descartó ese resultado por no cumplir el estándar de precisión exigido, dejando el campo `latitude`/`longitude` en `null` |

#### Calidad estimada: ⭐⭐⭐⭐ (para geocodificación, no para descubrimiento de centros)

- Servicio público y gratuito de uso puntual, no es scraping masivo de Google Maps (instrucción expresa del proyecto) — usado solo para obtener coordenadas de direcciones ya confirmadas por la fuente oficial 1, nunca para descubrir centros nuevos

---

## Fuentes evaluadas y descartadas

| Fuente | Motivo de descarte |
|--------|---------------------|
| **"Directori de centres educatius de les Illes Balears" (recurso JSON/CSV, portal `intranet.caib.es/opendatacataleg`)** | Evaluado en primer lugar por ser el dataset con nombre más directo en el catálogo oficial de datos abiertos. Descartado como fuente de extracción: tanto el recurso JSON como el CSV publicados solo exponen una muestra de **100 filas** de un total muy superior (todas las Illes Balears, todos los niveles), sin paginación funcional documentada en el portal. El recurso CSV tiene `datastore_active=true` en la API CKAN (lo que en teoría permitiría consultar todo el contenido vía `datastore_search`), pero el datastore está corrupto: el delimitador `;` del CSV original no se parseó correctamente al indexarlo, y `datastore_search` devuelve 0 registros reales con columnas ilegibles. Se optó por el endpoint de la fuente 1, que sí devuelve el directorio completo sin paginación |
| **Mapa de vacantes 0-3 (`caib.es/sites/escolaritzacio03/ca/mapa_de_vacants/`)** | Herramienta interactiva de consulta de plazas vacantes por municipio y curso escolar, útil como referencia de contexto (mencionada en el informe SEO) pero no diseñada para extracción de listado de centros; no se ha usado como fuente de datos de centros |
| **Micole ("25 mejores guarderías privadas de Palma" y fichas individuales)** | No usado como fuente de ningún dato ni de descubrimiento sistemático de centros, según instrucción explícita del proyecto — solo apareció incidentalmente en resultados de búsqueda; nunca se ha copiado texto ni tomado datos estructurados de esta web |
| **Páginas Amarillas, Educoland, Guiacolegios, Buscocolegio, Todoeduca, Colegios.es, Educateca, otros directorios/agregadores privados** | No usados como fuente de ningún dato — solo aparecieron incidentalmente en resultados de búsqueda al intentar localizar la web oficial de un centro concreto o contrastar puntualmente un dato de titularidad; nunca se ha copiado texto ni tomado datos estructurados de ellos |
| **Google Maps / Google Places** | No usado para scraping masivo, según instrucción del proyecto. Se usó puntualmente `WebSearch` genérico (no Google Maps) para localizar la URL de la web oficial de algunos centros y para contrastar la situación operativa de Son Dameto Dalt / Son Gibert |
| **Reseñas y valoraciones de usuarios (cualquier plataforma)** | No usadas como fuente de ningún dato, servicio ni descripción |

---

## Proceso de construcción del dataset (ejecutado en este sprint)

1. Se descargó el JSON completo de `www3.caib.es/xestibback/external/llistes/llistaCentresDirectori.json` (984 registros, todas las Illes Balears, todos los niveles educativos).
2. Se filtró por `municipi === "Palma"` **o** `municipi` terminado en `" (Palma)"` (barrios/pedanías del mismo término municipal) — **no** solo por `"Palma"` exacto, que habría excluido incorrectamente 14 centros situados en Son Ferriol, S'Arenal, Es Coll d'en Rabassa, Can Pastilla, Establiments, Es Pil·larí, Sant Jordi, Ciutat Jardí, Es Secar de la Real, El Terreno y Son Espanyolet (todos dentro del término municipal de Palma).
3. Sobre ese subconjunto, se filtró por `nomTipusCentreAbreujat` en `{CEI, EIEL, EI1, EI, CCEI}` (tipos correspondientes a primer ciclo de infantil según la leyenda propia del directorio oficial) y `actiu=true` → **79 centros candidatos**.
4. Se comprobó ausencia de duplicados por nombre, teléfono exacto y dirección normalizada: se detectaron 3 pares de centros que comparten teléfono/email/CIF por pertenecer a la misma marca o entidad (Baberitos/Baberitos Tenis; Momo/Wabi Sabi/Nanai; y dos sedes distintas de "Nuestra Señora de la Providencia"), pero cada uno tiene `codiOficial` (código de registro autorizado) propio y distinto — se mantuvieron como centros independientes, sin arrastrar servicios entre sedes de la misma marca, mismo criterio aplicado en Murcia.
5. Se excluyeron explícitamente **2 centros nuevos** de la red municipal (Son Dameto Dalt, Son Gibert): autorizados por el Consell de Govern el 30/12/2025, con código de centro asignado en el directorio oficial, pero sin teléfono ni email operativos y con cobertura de prensa (Última Hora, enero-febrero 2026) que confirma que las obras estaban terminándose para abrir en el curso 2026-2027 (septiembre 2026) — no hay confirmación de que estuvieran operativos a fecha de este sprint (julio 2026). Documentado en `data/enrichment/palma-centers-excluded.json`.
6. Se clasificaron por `nomTipusCentreAbreujat`: `EIEL` (11, todas cruzadas con el listado del PMEI) y `EI`/`EI1` de titularidad Conselleria (Paula Torres, Verge de la Salut) → `type=escuela-infantil`, `ownership=publico`; `CCEI` (7) → `type=escuela-infantil`, `ownership=concertado` (confirmado que en Illes Balears sí existe régimen de concierto/conveni para primer ciclo de infantil, a diferencia de lo observado en Murcia); `CEI` (54, privados puros) → `type=guarderia`, `ownership=privado`. Virgen de Loreto (`EIEL` mas no listada entre las 12 escuelas del PMEI en su propia web oficial) se mantuvo como `escuela-infantil`/`publico` pero sin arrastrar el horario/comedor confirmado específicamente para las 11 EIEL del PMEI.
7. Se geocodificaron las 79 direcciones vía Nominatim/OpenStreetMap (uso puntual, no scraping masivo); 72 de los 75 centros finales obtuvieron coordenadas con precisión de calle. 3 quedan sin coordenadas por no alcanzar esa precisión (ver fuente 4).
8. Para 6 centros privados/concertados con web propia funcional localizada, se consultó dicha web para confirmar servicios reales del enum `CenterService`, sin inferir ni copiar texto; en un caso (Sant Francesc d'Assís) se descartó una primera extracción sospechosamente completa y se volvió a verificar contra el HTML crudo.
9. Se excluyeron **2 centros adicionales** (Ikigai, Little Rainbow) por no tener ni teléfono ni email ni web propia en ninguna fuente consultada — no alcanzan el mínimo de contacto verificable exigido para el dataset final.
10. Se generaron `short_description` (180-450 caracteres), `long_description` (solo para los 18 centros con datos suficientes: 11 EIEL + Verge de la Salut + 6 privados/concertados con web verificada) y FAQs (5-6 por centro) de forma editorial original, con 4-6 estructuras de frase rotadas por grupo homogéneo (EIEL, Verge de la Salut, otros públicos, privados con web verificada, privados sin datos adicionales) para garantizar unicidad. Verificado: 75/75 `short_description` únicas, 18/18 `long_description` únicas.
11. Se asignó `confidence_level`: `high` a los 18 centros con horario/servicios confirmados por fuente propia (11 EIEL + Verge de la Salut + 6 privados/concertados verificados); `medium` a los 57 restantes (solo datos de la fuente 1: nombre, dirección, tipo, titularidad, y teléfono y/o email). Ningún centro del dataset final quedó en `low`/`unknown`.

## Limitación estructural pendiente (igual que en Valencia y Murcia)

No existe ninguna fuente oficial disponible con distritos formales de la capital de Palma para estos centros. El campo `district` queda `null` en los 75 centros. Sí se ha podido rellenar `neighborhood_barrio` con el nombre del barrio/pedanía para los 14 centros situados fuera de la capital estricta (Son Ferriol 3, Es Secar de la Real 2, Es Coll d'en Rabassa 1, Ciutat Jardí 1, Can Pastilla 1, El Terreno 1, Establiments 1, Sant Jordi 1, Es Pil·larí 1, S'Arenal 1, Son Espanyolet 1), quedando `null` para los 61 centros situados en la propia capital (según el valor `municipi="Palma"` de la fuente oficial, sin más granularidad).
