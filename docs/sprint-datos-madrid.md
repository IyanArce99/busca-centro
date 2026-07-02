# Sprint de datos — Madrid (v1)

## Objetivo

Importar 100–150 fichas reales de guarderías y escuelas infantiles en Madrid para validar el SEO local de BuscaCentro.
Ningún dato se publicará hasta pasar la revisión manual y cumplir los criterios de indexación.

---

## Ciudad objetivo

| Campo       | Valor    |
|-------------|----------|
| `city_slug` | `madrid` |
| `city_name` | `Madrid` |

La ciudad debe existir en la tabla `cities` antes de importar centros.
Si no está, el script de importación la inserta automáticamente.

---

## Barrios objetivo (7)

| Barrio           | Valor CSV (`neighborhood`) | Código postal aprox. |
|------------------|----------------------------|----------------------|
| Chamartín        | `Chamartín`                | 28002, 28016, 28043  |
| Chamberí         | `Chamberí`                 | 28003, 28010         |
| Salamanca        | `Salamanca`                | 28001, 28006         |
| Retiro           | `Retiro`                   | 28007, 28009, 28028  |
| Moncloa-Aravaca  | `Moncloa-Aravaca`          | 28008, 28015, 28040  |
| Hortaleza        | `Hortaleza`                | 28033, 28043         |
| Arganzuela       | `Arganzuela`               | 28005, 28045         |

Incluir barrios no listados está permitido si hay datos suficientes, pero las páginas SEO de barrio no se crearán hasta tener ≥ 5 centros indexables por barrio.

---

## Slugs SEO objetivo (14)

### Páginas de ciudad + tipo

| Slug                              | Condición de indexación           |
|-----------------------------------|-----------------------------------|
| `/guarderias-en-madrid`           | ≥ 10 centros tipo guardería       |
| `/escuelas-infantiles-en-madrid`  | ≥ 10 centros tipo escuela-infantil|

### Páginas de ciudad + tipo + característica

| Slug                                      | Filtro aplicado                          |
|-------------------------------------------|------------------------------------------|
| `/guarderias-privadas-en-madrid`          | tipo=guardería + ownership=privado       |
| `/escuelas-infantiles-privadas-en-madrid` | tipo=escuela-infantil + ownership=privado|
| `/guarderias-bilingues-en-madrid`         | tipo=guardería + service=bilingue        |
| `/guarderias-con-comedor-en-madrid`       | tipo=guardería + service=comedor         |
| `/guarderias-con-horario-ampliado-en-madrid` | tipo=guardería + service=horario-ampliado|

### Páginas de barrio

| Slug                                  | Barrio           | Condición        |
|---------------------------------------|------------------|------------------|
| `/guarderias-en-madrid-chamartin`     | Chamartín        | ≥ 5 indexables   |
| `/guarderias-en-madrid-chamberi`      | Chamberí         | ≥ 5 indexables   |
| `/guarderias-en-madrid-salamanca`     | Salamanca        | ≥ 5 indexables   |
| `/guarderias-en-madrid-retiro`        | Retiro           | ≥ 5 indexables   |
| `/guarderias-en-madrid-moncloa-aravaca` | Moncloa-Aravaca | ≥ 5 indexables  |
| `/guarderias-en-madrid-hortaleza`     | Hortaleza        | ≥ 5 indexables   |
| `/guarderias-en-madrid-arganzuela`    | Arganzuela       | ≥ 5 indexables   |

---

## Criterios de indexación

### Ficha de centro (`/centro/[slug]`)

Una ficha se marca `indexable = true` y `status = published` si cumple **todos** los criterios:

| Campo              | Requerido                     |
|--------------------|-------------------------------|
| `name`             | No vacío                      |
| `type`             | `guarderia` o `escuela-infantil` |
| `ownership`        | `publico`, `privado` o `concertado` |
| `neighborhood`     | No vacío                      |
| `city_slug`        | `madrid` (u otra ciudad válida)|
| `services`         | Al menos 1 servicio válido    |
| `short_description`| Mínimo 60 caracteres          |

Si no cumple todos los criterios → `status = draft`, sin índice.

### Página de barrio (`/guarderias-en-madrid-[barrio]`)

Solo se activa si hay **≥ 5 fichas indexables** en ese barrio.

### Página de ciudad (`/guarderias-en-madrid`)

Solo se activa si hay **≥ 10 fichas indexables** de ese tipo en la ciudad.

---

## Columnas del CSV de importación

Archivo: `data/import/madrid-centers-template.csv`

| Columna            | Tipo     | Obligatorio | Valores válidos / Notas                                   |
|--------------------|----------|-------------|-----------------------------------------------------------|
| `name`             | texto    | ✓           | Nombre oficial del centro                                 |
| `slug`             | texto    |             | Auto-generado si está vacío: `nombre-normalizado-madrid`  |
| `type`             | enum     | ✓           | `guarderia` \| `escuela-infantil`                         |
| `ownership`        | enum     | ✓           | `publico` \| `privado` \| `concertado`                    |
| `street`           | texto    |             | Dirección completa, con número                            |
| `postal_code`      | texto    |             | 5 dígitos. Ej: `28006`                                    |
| `neighborhood`     | texto    | ✓           | Nombre del barrio/distrito. Ej: `Salamanca`               |
| `city_slug`        | texto    | ✓           | Siempre `madrid` para este sprint                         |
| `city_name`        | texto    | ✓           | Siempre `Madrid` para este sprint                         |
| `phone`            | texto    |             | Formato libre. Ej: `913001001`                            |
| `email`            | texto    |             | Email de contacto del centro                              |
| `website`          | texto    |             | URL completa con `https://`                               |
| `age_min_months`   | número   |             | Edad mínima en meses. Ej: `4` (4 meses)                   |
| `age_max_months`   | número   |             | Edad máxima en meses. Ej: `36` (3 años) o `72` (6 años)  |
| `schedule`         | texto    |             | Horario de apertura. Ej: `L-V 7:30-20:00`                |
| `services`         | lista    |             | Separados por `\|`. Ver valores válidos abajo             |
| `short_description`| texto    | ✓*          | Mínimo 60 caracteres para ser indexable                   |
| `source_url`       | texto    | ✓           | URL donde se encontraron los datos (fuente oficial)       |
| `notes`            | texto    |             | Notas internas. No se publican. Ej: "pendiente verificar" |

`*` Obligatorio para que la ficha sea indexable.

### Valores válidos para `services` (separados por `|`)

```
comedor
horario-ampliado
bilingue
aula-0-1-anos
aula-1-2-anos
aula-2-3-anos
patio-exterior
psicomotricidad
orientacion-pedagogica
servicio-madrugadores
```

---

## Fuentes de datos recomendadas

### 1. Directorio de centros — Comunidad de Madrid (principal)

- URL: https://www.comunidad.madrid/servicios/educacion/directorio-centros-educativos
- Qué ofrece: nombre, dirección, tipo, titularidad, teléfono, email oficial
- Cómo usarlo: búsqueda por municipio "Madrid" + etapa "Infantil (1er ciclo)"
- Licencia: datos públicos de la administración

### 2. Ayuntamiento de Madrid — Sede electrónica

- URL: https://www.madrid.es/portales/munimadrid/es/Inicio/El-Ayuntamiento/Educacion/
- Qué ofrece: guarderías municipales, precios, plazas
- Fiabilidad: muy alta (fuente primaria para centros públicos)

### 3. Web propia del centro

- Cómo usarlo: una vez localizado el centro en la fuente oficial, visitar su web para completar horario, servicios y descripción
- `source_url` debe apuntar siempre a la fuente oficial, no a la web del centro
- No copiar textos literales de la web del centro — parafrasear o redactar propio

### 4. Registro de Entidades Educativas — MECD

- URL: https://www.educacion.gob.es/centros/home.do
- Qué ofrece: código de centro, titular, tipo, municipio
- Útil para: confirmar tipo y titularidad

### ⚠️ Fuentes que NO usar

- Google Maps / Google Places API
- Yelp, TripAdvisor
- Infobel, QDQ, Páginas Amarillas
- Cualquier web que prohíba scraping en sus TOS

---

## Proceso de recopilación manual

```
1. Abrir el Directorio de centros de la CAM
2. Filtrar por: municipio=Madrid, etapa=Infantil 1er ciclo
3. Exportar o copiar los resultados por barrio
4. Para cada centro:
   a. Anotar: nombre, dirección, CP, teléfono, email, web
   b. Anotar la URL de la ficha en el directorio (→ source_url)
   c. Visitar la web del centro para completar: horario, servicios, descripción
   d. Redactar short_description (60+ chars) con tono neutro
   e. Completar el CSV
5. Revisar que no haya duplicados de slug
6. Revisar el checklist de calidad antes de importar
```

---

## Checklist de revisión manual antes de importar

Ejecutar antes de `npm run import:centers`:

### Por fila CSV

- [ ] `name` no es nombre comercial inventado
- [ ] `type` y `ownership` coinciden con la fuente oficial
- [ ] `street` y `postal_code` son verificables en Google Maps (manualmente)
- [ ] `short_description` es original, no copiada de otra web
- [ ] `source_url` apunta a una fuente pública real
- [ ] `services` solo incluye servicios que aparecen en la fuente
- [ ] `neighborhood` coincide con el barrio real del CP
- [ ] Si `age_max_months` > 36: el centro tiene licencia de 0-6 años

### Del CSV completo

- [ ] Sin filas duplicadas por nombre + barrio
- [ ] Sin slugs duplicados (el script lo detecta, pero mejor prevenir)
- [ ] Mínimo 50 filas con `short_description` para activar las páginas SEO
- [ ] Al menos 5 fichas por barrio para activar las páginas de barrio

### Antes de pasar a `status = published`

- [ ] El equipo ha revisado al menos 10 fichas aleatoriamente
- [ ] Verificar que no hay textos copiados (Copyscape o revisión manual)
- [ ] Confirmar que `source_url` devuelve 200 (no está roto)
- [ ] Confirmar que ningún centro ha solicitado eliminación de datos

---

## Volumen objetivo del sprint

| Métrica                    | Mínimo | Objetivo |
|----------------------------|--------|----------|
| Centros recopilados        | 100    | 150      |
| Fichas indexables          | 50     | 80       |
| Barrios con ≥ 5 indexables | 5      | 7        |
| Páginas SEO activadas      | 10     | 14       |

---

## Pasos de importación (cuando el CSV esté listo)

```bash
# 1. Validar el CSV sin insertar nada
npm run import:centers -- --file data/import/madrid-centers.csv --dry-run

# 2. Importar solo un barrio de prueba
npm run import:centers -- --file data/import/madrid-centers.csv --neighborhood Chamberí

# 3. Importar toda Madrid una vez validado
npm run import:centers -- --file data/import/madrid-centers.csv --city madrid

# 4. Verificar en Supabase Dashboard → Table Editor → centers
#    - Filtrar por city_slug = 'madrid'
#    - Revisar que status = 'draft' en todos
#    - Revisar manualmente las fichas antes de cambiar a 'published'

# 5. Pasar fichas revisadas a published
#    UPDATE centers SET status = 'published' WHERE city_slug = 'madrid' AND <criterio>;
```
