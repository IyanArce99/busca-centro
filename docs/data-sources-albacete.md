# Fuentes de datos — Albacete capital (sprint v1)

Documentación de las fuentes oficiales evaluadas para la construcción del dataset
de centros de educación infantil de primer ciclo (0-3 años) en el término
municipal de Albacete capital. Sigue el mismo formato y nivel de rigor que
`docs/data-sources-castellon.md` y el resto de zonas ya integradas.

**Ámbito exacto**: únicamente el término municipal de Albacete capital. No se ha
incluido ningún centro de otros municipios de la provincia (Almansa, Hellín,
Villarrobledo, La Roda, etc.), que tienen sus propias redes de escuelas
infantiles municipales/autonómicas totalmente distintas y fuera del alcance de
este sprint.

---

## Incidencia de bloqueo de acceso — portal municipal `albacete.es` y subdominios

**Todo el dominio `albacete.es` y sus subdominios (incluyendo
`escuelas-infantiles.albacete.es`, el portal dedicado del Patronato Municipal de
Escuelas Infantiles) devolvieron error de conexión (`ECONNREFUSED`) de forma
persistente durante toda esta investigación**, tanto para la home del portal como
para el PDF `LISTADO_DE_GUARDERIAS.pdf` (cuya existencia y título — "centros
privados de educación infantil autorizados" — se confirmó indirectamente a través
de resultados de motor de búsqueda, pero cuyo contenido no se pudo leer
directamente). Esto afecta a la misma IP para `www.albacete.es`,
`escuelas-infantiles.albacete.es` y `albacete.sedipualba.es`, lo que sugiere un
bloqueo de red del entorno de esta investigación más que una caída puntual del
servidor (mismo patrón de incidencia ya documentado para `castello.es` en
Castelló de la Plana, aunque aquí el bloqueo fue total en vez de parcial).

**Mitigación aplicada**: no se pudo completar el dataset con el PDF oficial de
guarderías privadas autorizadas del Ayuntamiento, que habría sido la fuente más
fiable y completa para el mercado privado. En su lugar, se han reconstruido los
datos de las 7 escuelas infantiles municipales y de un conjunto amplio (aunque no
garantizado como exhaustivo al 100%) de centros privados a partir de:
(a) resultados de motor de búsqueda que citan literalmente contenido de páginas
concretas de `escuelas-infantiles.albacete.es` (snippets, no acceso directo);
(b) las webs oficiales propias de cada centro privado, verificadas una a una;
(c) el Directorio Común de Unidades Orgánicas del Estado (DIR3,
`administracion.gob.es`), que sí fue accesible y confirmó de forma independiente
nombre oficial, dirección, teléfono y/o email institucional de varias escuelas
municipales y autonómicas.

**Esto se documenta como incidencia explícita y como principal limitación de
este sprint**: no se puede garantizar que las 7 escuelas municipales y los
centros privados localizados agoten el 100% del mercado privado autorizado de
Albacete capital — es posible que existan centros privados adicionales
únicamente listados en el PDF municipal no accesible. El dataset final incluye
únicamente los centros que se han podido verificar de forma independiente contra
al menos una fuente con nivel de fiabilidad suficiente (ver criterios en el
informe de calidad).

---

## Fuentes evaluadas

### 1. Patronato Municipal de Escuelas Infantiles de Albacete — Ayuntamiento de Albacete (acceso indirecto por bloqueo de red)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Patronato Municipal de Escuelas Infantiles de Albacete |
| **Organismo** | Ayuntamiento de Albacete |
| **URL portal** | https://escuelas-infantiles.albacete.es/ (bloqueado durante esta investigación, ver incidencia arriba) |
| **Acceso real usado** | Snippets de resultados de búsqueda que citan literalmente las fichas de directorio de cada escuela (`https://escuelas-infantiles.albacete.es/es/directorio/escuela-infantil-[nombre]`), contrastados con el Directorio Común de Unidades Orgánicas del Estado y con notas de prensa oficiales del Gobierno de Castilla-La Mancha y del propio Ayuntamiento |
| **Registros identificados** | 7 escuelas infantiles municipales de titularidad y gestión directa del Ayuntamiento de Albacete: Ensanche, Hermanos Falcó, San Pablo, Paseo de la Cuba, Los Almendros, Vereda (también citada como "San Pedro-Mortero" en algunas fuentes, mismo centro), San Pedro (Mortero) |
| **Calidad estimada** | ⭐⭐⭐ (acceso indirecto, no descarga estructurada; datos de dirección/teléfono/email consistentes entre múltiples fuentes independientes para las 7 escuelas) |
| **Limitaciones** | No se pudo confirmar de forma exhaustiva el listado completo de servicios de cada escuela (más allá de comedor, confirmado para todas por tener servicio de comedor mencionado en fichas de aulas) ni el horario exacto de todas (confirmado para 4 de 7: Vereda 8:00-15:30, Los Almendros y Paseo de la Cuba 7:30-16:00). No se pudo confirmar distrito/barrio oficial más allá de la localización de calle vía geocodificación abierta (ver fuente 4) |

### 2. Admisión de Escuelas Infantiles de Titularidad Autonómica (0,1,2 años) — Consejería de Educación, Formación Profesional, Actividad Física y Deportes, JCCM ⭐ PRINCIPAL A USAR (red autonómica)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Admisión de Escuelas Infantiles de Titularidad Autonómica (0, 1 y 2 años). Curso 2026/2027 |
| **Organismo** | Junta de Comunidades de Castilla-La Mancha |
| **URL** | https://educacion.castillalamancha.es/admision-de-alumnado/escuelas-infantiles |
| **Acceso** | Directo, accesible sin bloqueos |
| **Registros identificados en Albacete capital** | 4 escuelas infantiles de titularidad autonómica (JCCM): "El Tren Azul" (Plaza Francisco Jareño, s/n), "Virgen de los Llanos" (Calle San Pedro, 21), "Los Girasoles" (Calle Francisco Javier de Moya, 62), "El Pilar" (Calle Churruca, 12). (Existe una 5ª escuela autonómica de la provincia, "El Castillo", en Almansa — fuera del ámbito de este dataset, que es solo Albacete capital) |
| **Campos disponibles** | Nombre, dirección, teléfono; email institucional `@edu.jccm.es` confirmado individualmente vía snippets de búsqueda para 2 de las 4 (El Tren Azul, Virgen de los Llanos, El Pilar); horario ampliado confirmado para El Pilar (7:15-20:00) |
| **Calidad estimada** | ⭐⭐⭐⭐ (fuente oficial autonómica directamente accesible, datos de admisión anual verificables y consistentes con el Directorio Común de Unidades Orgánicas del Estado) |
| **Limitaciones** | No incluye listado de servicios adicionales (música, psicomotricidad, etc.) más allá del propio carácter de centro público de primer ciclo; no incluye coordenadas geográficas (geocodificadas de forma independiente, ver fuente 4) |

### 3. Buscador de Centros Educativos de Castilla-La Mancha — Consejería de Educación (evaluado, uso limitado)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Buscador de Centros Educativos |
| **Organismo** | Consejería de Educación, Formación Profesional, Actividad Física y Deportes, JCCM |
| **URL** | https://educacion.castillalamancha.es/centros-educativos/buscador-de-centros-educativos (redirige internamente al histórico `educa.jccm.es/es/centros`) |
| **Naturaleza** | Buscador web interactivo del Registro de Centros Docentes de Castilla-La Mancha, sin API REST ni CSV/JSON descargable de forma masiva localizado en esta investigación (a diferencia del CSV único de la Generalitat Valenciana usado con éxito en Valencia/Alicante/Castellón, Castilla-La Mancha solo ofrece un buscador puntual centro a centro) |
| **Uso en este sprint** | Consulta puntual centro a centro (vía snippets de búsqueda que citan fichas individuales del registro, formato `CENT_ID`), no descarga masiva. Confirma existencia, código de centro y régimen (público/privado) para varios centros consultados individualmente |
| **Calidad estimada** | ⭐⭐ para este sprint (fuente oficial pero sin descarga estructurada accesible; el acceso centro a centro por `CENT_ID` no permitió reconstruir un listado completo y exhaustivo de todos los centros privados de primer ciclo autorizados en Albacete capital dentro del alcance de esta investigación) |
| **Limitaciones** | Sin URL de descarga masiva localizada; requeriría consulta manual centro a centro con IDs desconocidos de antemano, inviable para cubrir el 100% del universo. Sustituido en la práctica por la combinación de fuentes 1, 2, 4 y 5 |

### 4. Nominatim / OpenStreetMap — geocodificación abierta de direcciones ⭐ USADA para coordenadas

| Campo | Detalle |
|-------|---------|
| **Nombre** | Nominatim (OpenStreetMap Foundation) |
| **URL** | https://nominatim.openstreetmap.org/search |
| **Uso** | Geocodificación de cada dirección postal confirmada (calle + número + Albacete + España) para obtener latitud/longitud verificables y, como beneficio adicional, el nombre de distrito/barrio administrativo oficial de Albacete que Nominatim resuelve internamente para varias direcciones (p. ej. "Industria, Distrito 4", "Fátima, Distrito 2", "Feria, Distrito 1") |
| **Licencia** | Open Database License (ODbL), datos de OpenStreetMap |
| **Calidad estimada** | ⭐⭐⭐⭐ para coordenadas (fuente geográfica abierta y verificable, no Google Maps ni scraping de mapas comerciales) |
| **Limitaciones** | No es una fuente oficial de la administración educativa — únicamente se ha usado para coordenadas geográficas y, de forma secundaria, para el nombre de distrito administrativo derivado de la calle, nunca para datos de centros (nombre, servicios, teléfono). Una dirección ("Avenida Guardia Civil, 46") requirió una segunda consulta con el nombre completo de la vía ("Avenida de la Guardia Civil") tras un primer resultado erróneo que apuntaba a la pedanía de Aguas Nuevas; documentado y corregido antes de incluirse en el dataset |

### 5. Webs propias de centros privados — verificación puntual de servicios (no fuente masiva)

Para cada centro privado candidato localizado (a través de resultados de motor de
búsqueda, nunca de directorios de terceros como fuente de datos en sí), se
intentó localizar y consultar la web oficial propia del centro, cuando existía y
era accesible, para confirmar datos de contacto y servicios concretos del enum
`CenterService`. Se verificaron con contenido citable directamente de la propia
web los siguientes centros:

| Centro | Web oficial | Datos confirmados |
|---|---|---|
| Escuela Infantil Mitete | mitete.es | Dirección, teléfono, email, horario 7:30-21:00, cocina propia, comedor, escuela de verano |
| Escuela Infantil Blabla | escuelablabla.com | Dirección, teléfono, email, horario 7:00-17:00, comedor, horario ampliado, inglés, música, psicomotricidad, escuela de verano, escuela de padres |
| Centro de Educación Infantil Trazos / Bambini Trazos | centrodeeducacioninfantiltrazos.com + escuelabambini.es/trazos/ | Dirección, teléfono, email, comedor con cocina propia, horario ampliado, inglés extraescolar, escuela de padres, orientación pedagógica, patio exterior |
| Escuela Bambini (sede María de Zayas) | escuelabambini.es | Dirección, teléfono, email, comedor |
| Escuela Infantil Mundo de Color | escuelainfantilmundodecolor.es | Dirección, teléfono, email, horario 7:30-16:00, comedor, cocina propia, patio exterior, psicomotricidad |
| Guardería Sonrisas | guarderiasonrisas.es | Dirección, teléfono, email, horario 7:00-21:00, comedor, bilingüe/inglés, música, psicomotricidad, patio exterior, escuela de verano, extraescolares, escuela de padres, uniformes |
| Escuela Infantil Carrusel | carruselescuelainfantil.es | Dirección, teléfono, email, comedor |
| Colegio San Cristóbal (etapa Escuela Infantil 0-3) | colegiosancristobalalbacete.com | Dirección, teléfono, email, horario 8:00-15:00, comedor, aula matinal, bilingüe (inglés y francés) |
| Escuela Infantil La Cometa | lacometaescuelainfantil.es | Dirección, teléfono, email, comedor con cocina propia, inglés, música, psicomotricidad, patio exterior |
| Los Mundos de Noa | losmundosdenoa.com | Dirección, email, pedagogía respetuosa, escuela de verano |
| Escuela Infantil Ludus | escuelainfantilludus.com | Dirección, teléfono, email, horario 8:00-15:00 |

**Centros identificados solo a través de directorios/agregadores de terceros,
sin web oficial propia accesible o verificable dentro del alcance de esta
investigación** (usados únicamente para confirmar existencia, nombre y
dirección/teléfono aproximados — nunca como fuente de servicios): Escuelas
Infantiles Aire Libre I y II, Tulgarita, La Escuelita, Escuela Infantil La Noria,
Escuela Infantil Pekeñecos, ABC, Escuela Infantil Rayuela (datos de horario y
aulas consistentes entre múltiples agregadores pero sin web propia confirmada),
Escuela Infantil Primeros Pasitos (web propia detectada pero con fallo de DNS
persistente durante la consulta), Colegio Pemán etapa 0-3 (web propia con fallo
de acceso puntual en las páginas internas de la etapa infantil).

**Criterio aplicado de forma estricta ante indicios no verificables**: ningún
servicio del enum `CenterService` se ha asignado a un centro sin cita textual
directa (o snippet de búsqueda que cite literalmente contenido) de una fuente
identificable. Los centros sin web propia verificable quedan con `services: []`
en el dataset o directamente en el archivo de excluidos si no alcanzan el umbral
mínimo del proyecto.

### 6. Directorio Común de Unidades Orgánicas del Estado (DIR3) — `administracion.gob.es`

| Campo | Detalle |
|-------|---------|
| **Uso** | Confirmación cruzada e independiente de nombre oficial, dirección y código de unidad orgánica para varias escuelas infantiles municipales y autonómicas de Albacete capital (Ensanche, Los Girasoles, El Pilar, Virgen de los Llanos), como fuente pública estatal alternativa al portal municipal bloqueado |
| **Calidad estimada** | ⭐⭐⭐ (fuente pública oficial, aunque de contenido básico — nombre, dirección, a veces sin teléfono/email) |

---

## Fuentes NO usadas (recordatorio, igual que en el resto de zonas ya integradas)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Google Places | TOS prohíbe scraping masivo; instrucción explícita de no usarlo |
| Directorios privados de terceros (Micole, Páginas Amarillas, Educoland, Educateca, Todoeduca, Infoguarderías, Cylex, QDQ, Infoisinfo, BuscarColegios, VamosAEstudiar, Guarderia.net, etc.) | Usados exclusivamente para localizar nombres candidatos, la web oficial de un centro, o triangular una dirección/teléfono ya visto en otra fuente — **nunca como fuente de verdad de un dato concreto** (servicios, horario, titularidad "concertado") ni se ha copiado su texto |
| Reseñas y valoraciones de cualquier plataforma | No usadas como fuente de ningún dato |
| Redes sociales de centros (Facebook, Instagram) | No usadas como fuente de datos estructurados |

---

## Nota específica sobre `ownership = concertado`

Varios directorios de terceros etiquetan como "concertado" a Rayuela, Sonrisas,
La Cometa y Pekeñecos, y el propio Colegio San Cristóbal se autodenomina
"colegio concertado" en sus redes sociales. Se ha investigado explícitamente esta
cuestión (ver también el contexto de negocio de gratuidad parcial en Castilla-La
Mancha aportado por el coordinador): el concierto educativo en España, incluido
el de Colegio San Cristóbal y Colegio Pemán, aplica al segundo ciclo de infantil
(3-6 años) y primaria en adelante — **nunca al primer ciclo (0-3 años), que no es
susceptible de concierto educativo en el marco normativo estatal vigente**. No se
ha localizado ninguna fuente oficial (Registro de Centros Docentes de
Castilla-La Mancha, Ayuntamiento de Albacete) que confirme un concierto educativo
real y formal para primer ciclo en ningún centro de Albacete capital. La ayuda
municipal "Cheque Escolar" (100/80/60 €/mes según renta, gestionada por el
Ayuntamiento) es una subvención a la demanda, no un concierto con el centro.
**En consecuencia, siguiendo el mismo criterio riguroso ya aplicado en todas las
zonas anteriores del proyecto, ningún centro de este dataset lleva
`ownership = concertado`**: los 4 centros mencionados y los dos colegios con
etapa de infantil concertada en ciclos superiores se han clasificado como
`privado` para su etapa de primer ciclo (0-3 años).

## Nota sobre duplicados detectados y resueltos

- **"Chiquiticos" / "Escuela Bambini" (Calle María de Zayas, 3)**: mismo centro,
  cambio de nombre comercial confirmado (misma sociedad, mismo domicilio,
  mismo teléfono). Se ha incluido una única vez en el dataset final bajo el
  nombre vigente actual, "Escuela Bambini".
- **"Centro de Educación Infantil Trazos" / "Bambini Trazos" (Calle Iris, 34)**:
  mismo centro físico, adquirido/gestionado por el grupo Bambini manteniendo el
  equipo educativo y de cocina original de Trazos (confirmado en nota de prensa
  de COPE Castilla-La Mancha y en la propia web de Bambini). Se ha incluido una
  única vez bajo el nombre vigente "Bambini Trazos".
- **"Escuela Infantil La Noria" y "Escuela Infantil Pekeñecos" (ambos en Calle
  Feria, 43)**: comparten la misma dirección postal exacta pero corresponden a
  razones sociales, teléfonos y nombres comerciales distintos según fuentes
  independientes — es habitual en el centro histórico de Albacete que varios
  locales de un mismo inmueble alberguen negocios distintos. Sin poder confirmar
  de forma inequívoca si son el mismo centro con doble denominación o dos
  centros reales en el mismo edificio, y sin web propia verificable de ninguno
  de los dos, **ambos quedan excluidos del dataset final** (ver dataset de
  excluidos) para evitar el riesgo de duplicado o de dato inventado.
