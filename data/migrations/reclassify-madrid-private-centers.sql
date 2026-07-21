-- reclassify-madrid-private-centers.sql
-- Reclasifica los centros PRIVADOS de Madrid de type='escuela-infantil' a
-- type='guarderia', alineando Madrid con el criterio del resto del catalogo.
--
-- MOTIVO
-- En todas las demas ciudades el criterio es binario y consistente:
--     escuela-infantil = publico      guarderia = privado
--   Cordoba  13 publicos / 116 privados
--   Granada  14 publicos /  46 privados
--   Sevilla  15 publicos / 203 privados
-- Madrid es la unica excepcion: 179 'escuela-infantil' frente a 20 'guarderia',
-- pese a que los 179 son centros privados de nombre comercial (Alaria Nursery
-- School, Alegre Koala, Casita Maravillas, Chiqui, Allegra...).
--
-- IMPACTO SEO
-- /guarderias-en-madrid solo lista 20 de 199 centros y tiene 1.110 palabras,
-- frente a las 5.800 de /guarderias-en-valencia (139 fichas) o las 4.035 de
-- /guarderias-en-cordoba (116 fichas). "Guarderia" es ademas el termino
-- coloquial que usan las familias al buscar. Tras el cambio esa landing pasa a
-- listar ~162 centros, y las landings de servicio (comedor, bilingues, horario
-- ampliado) dejan de filtrar sobre 20 centros para hacerlo sobre ~162.
--
-- ALCANCE
-- Solo toca Madrid, solo filas con type='escuela-infantil' Y ownership='privado'.
--   - No toca los centros publicos: /escuelas-infantiles-en-madrid se queda con
--     los 34 publicos, por encima del umbral de 10, asi que sigue indexable y
--     no se pierde ninguna URL.
--   - No toca los concertados: un centro con concierto es legitimamente una
--     escuela infantil y no hay precedente de concertados en el resto del
--     catalogo.
--   - No toca ningun otro campo mas que type y updated_at.
--
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.


-- ============================================================
-- PASO 1 — Verificacion previa (solo lectura, ejecutar antes)
-- ============================================================
-- Debe devolver el reparto actual de Madrid. Lo esperado:
--   escuela-infantil + privado   ~145   <- estas son las que se van a cambiar
--   escuela-infantil + publico     34
--   guarderia        + privado     17
--   (posibles filas de concertados, que NO se tocan)

SELECT type, ownership, COUNT(*)
FROM centers
WHERE city_slug = 'madrid'
GROUP BY type, ownership
ORDER BY type, ownership;


-- ============================================================
-- PASO 2 — Reclasificacion
-- ============================================================

BEGIN;

UPDATE centers
SET type       = 'guarderia',
    updated_at = NOW()
WHERE city_slug = 'madrid'
  AND type      = 'escuela-infantil'
  AND ownership = 'privado';

COMMIT;


-- ============================================================
-- PASO 3 — Verificacion posterior (solo lectura)
-- ============================================================
-- Tras el COMMIT, el reparto de Madrid deberia quedar asi:
--   guarderia        + privado   ~162   (17 previas + ~145 reclasificadas)
--   escuela-infantil + publico     34
--   (concertados igual que antes)

SELECT type, ownership, COUNT(*)
FROM centers
WHERE city_slug = 'madrid'
GROUP BY type, ownership
ORDER BY type, ownership;


-- ============================================================
-- ROLLBACK (descomentar y ejecutar solo si hay que revertir)
-- ============================================================
-- Devuelve a 'escuela-infantil' los centros reclasificados, EXCLUYENDO los 17
-- que ya eran guarderia+privado antes de esta migracion (capturados de
-- /guarderias-privadas-en-madrid el 2026-07-20) para no arrastrarlos por error.
--
-- BEGIN;
--
-- UPDATE centers
-- SET type       = 'escuela-infantil',
--     updated_at = NOW()
-- WHERE city_slug = 'madrid'
--   AND type      = 'guarderia'
--   AND ownership = 'privado'
--   AND slug NOT IN (
--     'afuera-iii-b-madrid',
--     'alaria-aravaca-nursery-school-madrid',
--     'alaria-nuevos-ministerios-nursery-school-madrid',
--     'boreal-dreaming-together-madrid',
--     'can-ta-chimutri-sol-y-luna-madrid',
--     'colegio-madrid-fsm-sotillo-madrid',
--     'escuela-infantil-brains-madrid-madrid',
--     'escuela-montessori-madrid-madrid',
--     'international-montessori-kindergarten-madrid',
--     'lar-madrid',
--     'los-nidos-de-manoteras-madrid',
--     'micos-mi-primer-cole-madrid',
--     'pipos-madrid',
--     'preschool-fem-madrid',
--     'ramon-y-cajal-madrid',
--     'reina-de-los-angeles-madrid',
--     'todo-ninos-nursery-madrid'
--   );
--
-- COMMIT;
