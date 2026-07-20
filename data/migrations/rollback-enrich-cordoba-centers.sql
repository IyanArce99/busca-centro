-- rollback-enrich-cordoba-centers.sql
-- Rollback de enrich-cordoba-centers.sql: devuelve long_description a NULL en
-- los mismos 100 centros "finos" de Cordoba capital (identificados por slug)
-- cuya long_description fue redactada en esa migracion. Antes de ella todos
-- tenian long_description NULL, por lo que NULL restaura el estado original.
--
-- Solo actualiza: long_description (a NULL), updated_at.
-- NO toca: services, verification_status, confidence_level, verified_at, faqs,
-- short_description, pedagogical_approach, schedule ni ningun otro campo.
-- Generado: 2026-07-20. Revisar antes de ejecutar. NO ejecutado.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

-- El Tablerillo
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-tablerillo-cordoba';

-- El Nido
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-nido-cordoba';

-- El Jardincito
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-jardincito-cordoba';

-- Los Azahares
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'los-azahares-cordoba';

-- Supli
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'supli-cordoba';

-- San José
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'san-jose-cordoba';

-- María Auxiliadora
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'maria-auxiliadora-cordoba';

-- El Tren
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-tren-cordoba';

-- Mi Granja
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-granja-cordoba';

-- Cerro Muriano
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'cerro-muriano-cordoba';

-- Teddy
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'teddy-cordoba';

-- Mamá Osa
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mama-osa-cordoba';

-- Espinete
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'espinete-cordoba';

-- Giner de los Ríos
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'giner-de-los-rios-cordoba';

-- Jardinalba
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'jardinalba-cordoba';

-- La Alegría
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-alegria-cordoba';

-- Los Peques
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'los-peques-cordoba';

-- Érase una vez II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'erase-una-vez-ii-cordoba';

-- Chiquitines
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'chiquitines-cordoba';

-- Los Soletes
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'los-soletes-cordoba';

-- Jardylandia
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'jardylandia-cordoba';

-- El Patito Colorín
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-patito-colorin-cordoba';

-- Mickey
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mickey-cordoba';

-- Mi Granja II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-granja-ii-cordoba';

-- El Vial
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-vial-cordoba';

-- Cuenta Cuentos II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'cuenta-cuentos-ii-cordoba';

-- Chocolate
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'chocolate-cordoba';

-- Los Compis
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'los-compis-cordoba';

-- Mi Granja III
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-granja-iii-cordoba';

-- Mimos II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mimos-ii-cordoba';

-- Piratas
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'piratas-cordoba';

-- El Jardincito II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-jardincito-ii-cordoba';

-- Burbujas
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'burbujas-cordoba';

-- El Arbolito
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-arbolito-cordoba';

-- Goofy
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'goofy-cordoba';

-- Supli Levante
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'supli-levante-cordoba';

-- Tréboles
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'treboles-cordoba';

-- Luna Lunera
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'luna-lunera-cordoba';

-- Parvulario Fátima
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'parvulario-fatima-cordoba';

-- El Puzzle II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-puzzle-ii-cordoba';

-- Chiquitines Guay
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'chiquitines-guay-cordoba';

-- Dumbi
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'dumbi-cordoba';

-- La Cometa
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-cometa-cordoba';

-- Los Girasoles
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'los-girasoles-cordoba';

-- Acuarelas
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'acuarelas-cordoba';

-- Pasitos
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pasitos-cordoba';

-- Tom Sawyer
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'tom-sawyer-cordoba';

-- Pequeños exploradores
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pequenos-exploradores-cordoba';

-- Erase una vez III
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'erase-una-vez-iii-cordoba';

-- El Duende Travieso
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-duende-travieso-cordoba';

-- Melodías
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'melodias-cordoba';

-- DO RE MI
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'do-re-mi-cordoba';

-- San Cayetano
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'san-cayetano-cordoba';

-- Mimos
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mimos-cordoba';

-- Jesús Salvador
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'jesus-salvador-cordoba';

-- Cuenta Cuentos I
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'cuenta-cuentos-i-cordoba';

-- Fantasía
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'fantasia-cordoba';

-- Mundo de Peques
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mundo-de-peques-cordoba';

-- Pompitas
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'pompitas-cordoba';

-- Ratón Pérez
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'raton-perez-cordoba';

-- Supli Levante II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'supli-levante-ii-cordoba';

-- Babis
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'babis-cordoba';

-- Center Baby
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'center-baby-cordoba';

-- Manolo Álvaro II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'manolo-alvaro-ii-cordoba';

-- Manolo Alvaro I
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'manolo-alvaro-i-cordoba';

-- Arco Iris
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'arco-iris-cordoba';

-- Globaluna
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'globaluna-cordoba';

-- Happy Children 1
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'happy-children-1-cordoba';

-- Mis pequeños muñecos
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mis-pequenos-munecos-cordoba';

-- El Bosque
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-bosque-cordoba';

-- Dumbi II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'dumbi-ii-cordoba';

-- Chuitos
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'chuitos-cordoba';

-- El Arenal
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-arenal-cordoba';

-- Los Duendecillos
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'los-duendecillos-cordoba';

-- La Casa del Árbol
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-casa-del-arbol-cordoba';

-- La Tribu
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-tribu-cordoba';

-- Isla Fantasía
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'isla-fantasia-cordoba';

-- Mi Casita
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'mi-casita-cordoba';

-- Tutuá
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'tutua-cordoba';

-- Cuenta Cuentos III
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'cuenta-cuentos-iii-cordoba';

-- Santa Victoria 1
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'santa-victoria-1-cordoba';

-- Jesús Divino Obrero
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'jesus-divino-obrero-cordoba';

-- Virgen de la Fuensanta
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'virgen-de-la-fuensanta-cordoba';

-- Nubes de Algodón
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'nubes-de-algodon-cordoba';

-- Zaida
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'zaida-cordoba';

-- Nuestra Señora de la Piedad
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'nuestra-senora-de-la-piedad-cordoba';

-- El Bosque Encantado
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-bosque-encantado-cordoba';

-- Sonrisas
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'sonrisas-cordoba';

-- Montessori Dream
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'montessori-dream-cordoba';

-- Elefantil
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'elefantil-cordoba';

-- Gente Menuda
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'gente-menuda-cordoba';

-- San Cayetano II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'san-cayetano-ii-cordoba';

-- Do Re Mi II
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'do-re-mi-ii-cordoba';

-- La Morenita
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-morenita-cordoba';

-- Flori
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'flori-cordoba';

-- Sueños de colores
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'suenos-de-colores-cordoba';

-- El Patriarca
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-patriarca-cordoba';

-- Jardincito III
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'jardincito-iii-cordoba';

-- El Cuco
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'el-cuco-cordoba';

-- La Sierra
UPDATE centers SET long_description = NULL, updated_at = NOW() WHERE slug = 'la-sierra-cordoba';

COMMIT;
