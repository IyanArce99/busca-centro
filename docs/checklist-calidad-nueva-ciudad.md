# Checklist de calidad SEO al añadir una ciudad nueva

Basado en el proceso real de Madrid y Barcelona, y en los problemas detectados en la auditoría SEO de Barcelona (ver `docs/barcelona-quality-report.md`). Recorrer esta lista completa antes de dar una ciudad por "lista para indexar" — no solo antes de importarla a Supabase.

---

## 1. Fuentes de datos

- [ ] Identificar la fuente oficial equivalente al Directori de centres docents (Catalunya) o al dataset de la CAM (Madrid): registro autonómico de centros de primer ciclo de infantil (0-3 años), con API o descarga estructurada (CSV/JSON), no solo un buscador web.
- [ ] Identificar si el ayuntamiento de la ciudad publica su propio listado de escuelas infantiles/guarderías municipales (equivalente al PDF del IMEB en Barcelona).
- [ ] Documentar ambas fuentes en `docs/data-sources-[ciudad].md` siguiendo el formato de `docs/data-sources-barcelona.md`: organismo, URL, formato, licencia, campos disponibles, calidad estimada, limitaciones.
- [ ] No usar Google Maps/Places, directorios privados de terceros, ni copiar texto de webs externas.

## 2. Clasificación y alcance

- [ ] Aplicar el mismo criterio guardería/escuela-infantil que Madrid y Barcelona: red pública/municipal amplia y colegios con oferta educativa más amplia → `escuela-infantil`; centros privados pequeños sin oferta más allá de 0-3 años → `guarderia`.
- [ ] Fijar el umbral de calidad mínimo por centro antes de incluirlo en el dataset principal (no en `pending_review`): al menos teléfono o web verificable, dirección con distrito.
- [ ] Preferir 80-150 centros de calidad real sobre 300 mediocres, igual que en Barcelona.
- [ ] Documentar cuántos candidatos se evaluaron vs. cuántos entraron al dataset final, con motivo de descarte, en `docs/[ciudad]-quality-report.md`.

## 3. Contenido — el punto que falló en Barcelona la primera vez

Esta es la lección directa del incidente detectado en la auditoría: **106 de 260 centros de Barcelona (el grupo "Escola Bressol Municipal") compartían literalmente el mismo `short_description`**, cambiando solo nombre y distrito. No se detectó hasta una auditoría posterior porque se generó como plantilla de una sola pasada.

- [ ] **Antes de generar contenido en bloque para un grupo homogéneo de centros** (misma red municipal, mismo horario, mismos servicios — ej. "escuelas municipales de Valencia"), diseñar de entrada 6-8 estructuras de frase distintas y rotarlas, en vez de una sola plantilla con variables sustituidas. Aplica tanto a `short_description` como a `long_description` y FAQs.
- [ ] Verificar unicidad real tras generar: `new Set(centros.map(c => c.short_description)).size === centros.length`. Repetir el mismo check para `long_description`.
- [ ] Buscar frases de apertura compartidas de ≥8-9 palabras entre centros del mismo grupo — señal de plantilla aunque los textos completos no sean idénticos.
- [ ] No dejar ningún campo de texto largo (`long_description`) vacío en el dataset final — si un grupo de centros no tiene datos suficientes para redactar contenido único, mejor dejarlos en `pending_review` que publicarlos con descripción vacía o genérica.
- [ ] FAQs: mínimo 3-5 por centro, evitar que muchos centros compartan el mismo set exacto de preguntas.

## 4. Landings temáticas — no lanzar "en crecimiento"

Otro hallazgo de la auditoría: las landings generales de Barcelona (`guarderias-en-barcelona`, `escuelas-infantiles-en-barcelona`) se crearon con un placeholder mínimo (intro de una frase, sin `sections`, sin FAQs o con solo 1) y así quedaron indexables durante días antes de enriquecerlas.

- [ ] Las landings `/guarderias-en-[ciudad]` y `/escuelas-infantiles-en-[ciudad]` deben tener `sections` (2 bloques H2+párrafos) y al menos 4-5 FAQs **desde el primer commit que las marque potencialmente indexable**, no como parche posterior.
- [ ] Diferenciar explícitamente el enfoque de guardería (conciliación, horarios, servicios) del de escuela-infantil (etapa educativa, titularidad, proyecto pedagógico) — evitar que sean clones cambiando solo el tipo.
- [ ] Incorporar vocabulario local natural cuando exista (ej. "escola bressol"/"llar d'infants" en Catalunya) sin caer en keyword stuffing.
- [ ] Antes de crear landings de servicio/ownership (`guarderias-con-comedor-en-[ciudad]`, etc.), confirmar que el filtro alcanza el umbral real (`MIN_CENTERS_FOR_TYPE_PAGE = 5` en `src/lib/constants.ts`) contra los datos ya importados, no una estimación.

## 5. Import y SQL

- [ ] Generar el INSERT vía script (no a mano), con validación previa: slugs únicos, `type`/`ownership` dentro del enum, sin duplicados con otras ciudades.
- [ ] Insertar siempre con `status='draft'` primero (nunca `published` directo).
- [ ] Generar el rollback correspondiente en el mismo momento que el INSERT/UPDATE, no después.
- [ ] No ejecutar el SQL directamente — dejarlo listo para que lo revise y ejecute el propietario del proyecto.

## 6. Auditoría previa a publicar (antes del `UPDATE status='published'`)

Repetir contra la ciudad nueva lo mismo que se hizo para Barcelona:

- [ ] `isCenterIndexable` real: ¿qué % de centros pasa el gate? (name+slug+type+ciudad+ubicación + short_description + (servicios o long_description)).
- [ ] 0 servicios fuera del enum `CenterService` de `src/types/center.ts` (en particular, ningún valor `aula-*`).
- [ ] 0 `short_description` o `long_description` idénticos entre centros distintos.
- [ ] Todas las landings de la ciudad nueva tienen `faqs.length > 0` si van a ser indexables.
- [ ] `npm run build` limpio, sin errores de TypeScript.
- [ ] Verificar en local (`npm run dev`, no un build viejo con `next start`) que la ciudad aparece en home, `/ciudades`, `/guarderias`, `/escuelas-infantiles` y el enlace cruzado guardería↔escuela-infantil funciona.

## 7. Post-publicación

- [ ] Enviar/confirmar el sitemap en Search Console.
- [ ] Solicitar indexación manual de las 2-3 URLs más importantes (landing general de guardería y de escuela-infantil, alguna ficha destacada).
- [ ] Revisar cobertura en Search Console a los pocos días (no una semana entera de espera) para detectar errores de rastreo temprano.
- [ ] Actualizar el conteo de landings y URLs indexables en el informe de auditoría SEO global.
