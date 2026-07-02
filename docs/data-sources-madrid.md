# Fuentes de datos — Madrid (sprint v1)

Documentación de las fuentes oficiales evaluadas para la importación de centros educativos infantiles en Madrid.

---

## Fuentes evaluadas

### 1. Centros educativos de la Comunidad de Madrid ⭐ PRINCIPAL USADA

| Campo         | Detalle |
|---------------|---------|
| **Nombre**    | Centros educativos de la Comunidad de Madrid |
| **Organismo** | Consejería de Educación, Ciencia y Universidades — CAM |
| **URL catálogo** | https://datos.comunidad.madrid/catalogo/dataset/centros_educativos |
| **Descarga CSV** | https://datos.comunidad.madrid/catalogo/dataset/c750856d-3166-4dac-8e80-d1b824c968b5/resource/28d60557-1d73-4281-ab08-6cfd3b2f5f83/download/centros_educativos.csv |
| **Descarga JSON** | https://datos.comunidad.madrid/catalogo/dataset/c750856d-3166-4dac-8e80-d1b824c968b5/resource/be2264df-c720-4619-ab79-aebad9b248e0/download/centros_educativos.json |
| **Formato** | CSV, JSON |
| **Separador** | Punto y coma (`;`) |
| **Codificación** | UTF-8 |
| **Actualización** | Anual. Última: **mayo 2026** |
| **Licencia** | Creative Commons Attribution (CC BY) — Open Data |
| **Descarga automatizada** | Sí — URL directa, sin login |
| **Registros totales** | 7.757 centros (toda la Comunidad) |
| **Registros en Madrid ciudad** | 1.665 centros ALTA |
| **Registros usados** | 206 centros infantiles en 7 distritos objetivo (204 tras deduplicación) |

#### Campos disponibles

| Columna | Descripción |
|---------|-------------|
| `CODIGO` | Código único del centro |
| `CENTRO` | Nombre del centro |
| `COD_TIPO` | Código numérico de tipo |
| `TIPO_ABRV` | Abreviatura del tipo (EEI, EIPR, CPR INF…) |
| `TIPO_EXT` | Descripción completa del tipo |
| `TITULARIDAD` | PÚBLICO / PRIVADO / PRIVADO CONCERTADO / PÚBLICO-TITULARIDAD PRIVADA |
| `TITULAR` | Nombre del titular |
| `NIF_TITULAR` / `NIF_CENTRO` | NIFs |
| `COD_DAT` / `DAT` | Zona de Actuación Territorial |
| `CDTPVIA` / `DOMICILIO` / `NMVIAL` | Tipo vía, nombre vía, número |
| `CDPOSTAL` | Código postal (5 dígitos) |
| `CDMUNI` / `MUNICIPIO` | Código y nombre del municipio |
| `CDDISTRITO` / `DISTRITO` | Código y nombre del distrito |
| `TELEFONO` a `TELEFONO4` | Teléfonos (múltiples) |
| `FAX` | Fax |
| `WEB` | Sitio web |
| `E_MAIL` / `E_MAIL2` | Emails |
| `UTM_X` / `UTM_Y` | Coordenadas UTM |
| `SITUACIÓN` | ALTA / BAJA |
| `FECHA CONSTITUCIÓN` | Fecha de apertura |

#### Tipos de centros infantiles identificados

| TIPO_ABRV | TIPO_EXT | Mapeo BuscaCentro |
|-----------|----------|-------------------|
| `EEI` | Escuela Infantil | type=escuela-infantil |
| `EEI-CN` | Escuela Infantil-Casa de Niños | type=escuela-infantil |
| `EIPR` | Escuela Infantil Privada | type=escuela-infantil |
| `CPR INF` | Centro Privado de Educación Infantil | type=guarderia |
| `CPR INF-PRI` | Centro Privado de Educación Infantil y Primaria | type=guarderia |

#### Calidad estimada: ⭐⭐⭐⭐⭐

- Fuente primaria oficial de la Comunidad de Madrid
- Actualización anual
- Cubre todos los centros autorizados (no solo los que tienen web)
- Incluye centros cerrados (SITUACIÓN=BAJA) — fácil de filtrar
- **Limitaciones:** Sin descripción de servicios ni horarios; sin coordenadas lat/lng (solo UTM); sin información de bilingüismo o comedor; DISTRITO pero no BARRIO

---

### 2. Escuelas Infantiles Municipales — Ayuntamiento de Madrid ⭐ USADA (enriquecimiento)

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas infantiles municipales |
| **Organismo** | Ayuntamiento de Madrid |
| **URL catálogo** | https://datos.madrid.es/dataset/202318-0-escuelas-infantiles |
| **Descarga CSV** | https://datos.madrid.es/dataset/202318-0-escuelas-infantiles/resource/202318-4-escuelas-infantiles-csv/download/202318-4-escuelas-infantiles-csv |
| **Formato** | CSV, JSON, RDF, XML, GEO |
| **Separador** | Punto y coma (`;`) |
| **Codificación** | ISO-8859-1 (Latin-1) — requiere conversión |
| **Actualización** | Periódica (no anunciada) |
| **Licencia** | Open Data — Ayuntamiento de Madrid |
| **Descarga automatizada** | Sí — URL directa |
| **Registros totales** | 78 escuelas infantiles municipales |
| **Cobertura** | Solo escuelas municipales (titularidad Ayuntamiento) |
| **Registros usados** | Como fuente de enriquecimiento (servicios, URL por centro, barrio) |

#### Campos disponibles

| Columna | Descripción |
|---------|-------------|
| `PK` | Clave primaria |
| `NOMBRE` | Nombre completo ("Escuela infantil municipal X") |
| `DESCRIPCION-ENTIDAD` | Descripción de la entidad |
| `HORARIO` | Horario de apertura |
| `EQUIPAMIENTO` | Equipamiento y servicios: "Horario ampliado. Comedor." |
| `TRANSPORTE` | Transporte público próximo |
| `DESCRIPCION` | Descripción del servicio |
| `ACCESIBILIDAD` | Indicador de accesibilidad (0/1) |
| `CONTENT-URL` | URL de la ficha en Madrid.es (por centro) |
| `NOMBRE-VIA` + `CLASE-VIAL` + `NUM` | Dirección |
| `LOCALIDAD` / `PROVINCIA` / `CODIGO-POSTAL` | Localización |
| `COD-BARRIO` / `BARRIO` | Barrio (nivel más granular que distrito) |
| `COD-DISTRITO` / `DISTRITO` | Distrito |
| `COORDENADA-X` / `COORDENADA-Y` | Coordenadas UTM |
| `LATITUD` / `LONGITUD` | Coordenadas WGS84 (utilizables en mapas) |
| `TELEFONO` / `FAX` / `EMAIL` | Contacto |
| `TIPO` | Tipo de entidad |

#### Calidad estimada: ⭐⭐⭐⭐

- Datos oficiales del Ayuntamiento para sus propios centros
- Incluye BARRIO (más granular que DISTRITO)
- Incluye coordenadas lat/lng (WGS84)
- Incluye información de servicios (comedor, horario ampliado) en campo EQUIPAMIENTO
- URL específica por centro en Madrid.es
- **Limitaciones:** Solo cubre las 78 escuelas municipales; no cubre centros privados ni concertados; codificación ISO-8859-1; no incluye EIPR ni CPR INF

---

### 3. Centros educativos en Madrid — Ayuntamiento (general) — EVALUADA, NO USADA

| Campo | Detalle |
|-------|---------|
| **Nombre** | Centros educativos en Madrid |
| **Organismo** | Ayuntamiento de Madrid |
| **URL catálogo** | https://datos.madrid.es/dataset/300614-0-centros-educativos |
| **Descarga CSV** | https://datos.madrid.es/dataset/300614-0-centros-educativos/resource/300614-1-centros-educativos-csv/download/300614-1-centros-educativos-csv |
| **Formato** | CSV, JSON, XML, RDF, GEO |
| **Codificación** | ISO-8859-1 |
| **Registros totales** | 1.643 centros educativos de todos los tipos |
| **Registros usados** | Ninguno — la fuente CAM tiene más datos sobre infantil |

#### Calidad estimada: ⭐⭐⭐

- Cubre todos los tipos de centros (universitarios, IES, colegios, etc.)
- Tiene BARRIO y lat/lng
- **Limitaciones:** No distingue bien los centros de primer ciclo; incluye universidades, academias y centros de adultos; no filtra por etapa educativa

---

### 4. datos.gob.es — Escuelas Infantiles Municipales — EVALUADA, URL 404

| Campo | Detalle |
|-------|---------|
| **Nombre** | Escuelas Infantiles Municipales |
| **Organismo** | datos.gob.es (agrega datos del Ayuntamiento) |
| **URL** | https://datos.gob.es/en/catalogo/l01280796-escuelas-infantiles-municipales |
| **Estado** | URL devuelve 404 — redirige al Ayuntamiento como fuente primaria |
| **Registros usados** | Ninguno |

---

## Archivos descargados

| Archivo | Fuente | Tamaño | Registros | Formato |
|---------|--------|--------|-----------|---------|
| `data/sources/raw/cam-centros-educativos.csv` | CAM | ~1 MB | 7.757 | UTF-8, `;` |
| `data/sources/raw/ayto-escuelas-infantiles.csv` | Ayto Madrid | ~50 KB | 78 | Latin-1, `;` |
| `data/sources/raw/ayto-centros-educativos.csv` | Ayto Madrid | ~1 MB | 1.643 | Latin-1, `;` |

---

## Script de normalización

Archivo: `scripts/normalize-cam-data.ts`

Comando: `npm run normalize:cam`

Proceso:
1. Lee `cam-centros-educativos.csv` (UTF-8)
2. Lee `ayto-escuelas-infantiles.csv` (Latin-1 → convierte a string)
3. Filtra CAM: municipio=Madrid, SITUACIÓN=ALTA, distrito en los 7 objetivo, tipo en EEI/EIPR/CPR INF/EEI-CN/CPR INF-PRI
4. Para escuelas municipales: enriquece con servicios (comedor, horario-ampliado) desde EQUIPAMIENTO del Ayuntamiento
5. Genera `short_description` neutral por tipo + titularidad + distrito
6. Genera slugs normalizados
7. Descarta duplicados de slug
8. Escribe `data/import/madrid-centers.csv`

---

## Fuentes que NO usar (recordatorio)

| Fuente | Motivo |
|--------|--------|
| Google Maps / Places API | TOS prohíbe scraping |
| Yelp / TripAdvisor | Datos no oficiales, TOS |
| Infobel / QDQ / Páginas Amarillas | Datos no verificables, TOS |
| Webs de los propios centros | No copiar textos — solo consultar para enriquecer |
| Directorios privados (Guiainfantil, etc.) | Datos no primarios, TOS |
