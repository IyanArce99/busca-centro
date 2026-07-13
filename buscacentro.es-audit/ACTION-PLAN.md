# Plan de acción priorizado — buscacentro.es

Ordenado por impacto/esfuerzo. Basado en la auditoría del 2026-07-13, recalibrada tras corregir el bug de Madrid.

---

## 🔴 AHORA (esta semana) — desbloquear Madrid

### 1. Commit + push del fix de Madrid ⏳ ACCIÓN TUYA
- **Qué:** ya está hecho en código (paginación en `getCenters()` + `revalidate` en las 3 rutas). Falta commitear y desplegar.
- **Efecto:** el rebuild lee Supabase → los 199 centros de Madrid entran en el sitemap, las landings de Madrid pasan a `index`. También recupera trozos de otras ciudades cortadas.
- **Verificación tras deploy:** `/guarderias-en-madrid` debe dar `index, follow`; `sitemap.xml` debe contener URLs `/centro/*-madrid`.
- **Esfuerzo:** 5 min. **Impacto:** máximo.

### 2. Reenviar sitemap en Search Console
- Tras el deploy, reenviar `https://www.buscacentro.es/sitemap.xml` en GSC y usar Inspección de URL para forzar recrawl de `/guarderias-en-madrid` y `/escuelas-infantiles-en-madrid`.
- **Por qué:** el sitemap actual tiene `indexed: 0`. Acelera que Google recoja el Madrid recuperado.
- **Esfuerzo:** 10 min. **Impacto:** alto.

---

## 🟠 SEMANAS 1–3 — quick wins de alto impacto

### 3. FAQPage schema en landings de ciudad y guías de blog
- **Qué:** el contenido FAQ ya existe en texto; falta el marcado. Añadir `FAQPage` a landings de ciudad (con preguntas de intención informacional real: "¿Cuánto cuesta una guardería en Madrid?", reutilizando cifras del blog) y a las guías (2-4 P/R por post).
- **Dónde:** `src/app/[slug]/page.tsx`, `src/app/blog/[slug]/page.tsx`.
- **Esfuerzo:** medio. **Impacto:** alto (rich results + citabilidad IA). *Prioridad #1 de GEO.*

### 4. Interlinking blog ↔ landings + cifras en landings
- Desde cada landing de ciudad, 1-2 enlaces a guías relevantes; desde cada guía, enlaces a las landings que menciona.
- Incluir 1-2 frases con cifras concretas (precio, plazo) en el bloque SEO de las landings, con "ver guía completa".
- Añadir el enlace faltante a `/blog/cuanto-cuesta-una-guarderia` desde la home.
- **Esfuerzo:** medio. **Impacto:** alto (consolida entidad temática; ayuda a AI Overviews).

### 5. Reforzar la landing ganadora: guarderías con comedor en Barcelona
- Es la keyword más batible a top 3 (3-6 meses). Invertir aquí: enlaces internos hacia ella, schema `Service`, FAQ de alérgenos/menús (aparece repetidamente en su SERP).
- **Esfuerzo:** medio. **Impacto:** alto (única keyword cabeza realista a plazo corto).

### 6. Cabeceras de seguridad HTTP
- Añadir vía `next.config.ts` (`headers()`): `X-Content-Type-Options: nosniff`, `X-Frame-Options: SAMEORIGIN`, `Referrer-Policy: strict-origin-when-cross-origin`, CSP en modo `Report-Only` primero, `Permissions-Policy`.
- **Esfuerzo:** bajo-medio. **Impacto:** medio (Best Practices, confianza, superficie de ataque en formularios de leads).

---

## 🟡 MES 2 — contenido y autoridad

### 7. Ampliar la guía del cheque guardería
- Tabla de tramos de renta + cuantía, FAQPage schema, enlace al trámite oficial de la Comunidad de Madrid.
- **Esfuerzo:** bajo-medio. **Impacto:** medio (keyword informacional bien alineada).

### 8. `Organization` con `sameAs` + `logo` + `contactPoint`
- Añadir perfiles sociales (aunque haya que crearlos) y logo al schema de la home.
- **Esfuerzo:** bajo (schema). **Impacto:** medio (señal de marca/entidad).

### 9. `llms.txt`
- Archivo estático con descripción de una línea + enlaces a las guías más citables + landings principales.
- **Esfuerzo:** bajo (1-2h). **Impacto:** medio (GEO).

### 10. IndexNow
- Clave en `/{key}.txt` + helper que notifique a `api.indexnow.org` al publicar/actualizar centros (enganchado al mismo flujo que el `revalidate`).
- **Esfuerzo:** medio. **Impacto:** medio (indexación rápida en Bing para dominio joven).

### 11. Una imagen por ficha
- Empezar por las fichas ya indexables. `next/image` con width/height fijos.
- **Esfuerzo:** alto (pipeline de datos). **Impacto:** medio (atractivo SERP, rich results).

---

## 🟢 CONTINUO — monitorización y decisiones de producto

- **Vigilar en GSC** la reindexación de Madrid tras el deploy (cobertura, posiciones de las fichas que estaban en pos 40-80).
- **`lastmod` en landings SEO** del sitemap (derivado del `updatedAt` de sus centros).
- **Decisión de producto — Barcelona en catalán:** evaluar landing real `/escola-bressol-barcelona` (URL, H1, copy en catalán) antes de invertir más en la versión castellana. Es i18n, no un ajuste on-page.
- **No perseguir** "escuelas infantiles madrid" (keyword madre, SERP institucional) ni "mejores guarderías madrid" (requeriría un ranking fabricado que viola las reglas de copy). Ir a long-tail y a guía "cómo elegir".
- **Rondas 2 y 3** de ciudades (~2 semanas): ya no hay riesgo del bug de 1000 filas (paginación resuelta), pero verificar que cada ciudad nueva cruza el umbral y aparece en sitemap tras el `revalidate`.

---

## Estado del bug de Madrid

| | |
|---|---|
| Causa raíz | Límite de 1000 filas de Supabase + orden `updated_at DESC` → Madrid (199) fuera del corte |
| Fix | Paginación en `getCenters()` + `revalidate=3600` en sitemap y páginas dinámicas |
| Verificado | ✅ Sí — query directa a Supabase: Madrid 0 → 199; total 1000 → 1214 |
| Daño acumulado | Mínimo (bug <5h; sin penalización arrastrada) |
| Pendiente | **Commit + push** (acción del usuario) |
