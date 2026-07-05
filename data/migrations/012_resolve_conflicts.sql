-- 012_resolve_conflicts.sql
-- Resuelve conflictos de datos pendientes: acepta el valor propuesto (fuente
-- municipal ayto/CAM para teléfonos; web oficial+directorios para la calle de
-- Nemomarlin), actualiza el campo real, marca el conflicto como resolved y
-- actualiza verified_at. Generado: 2026-07-05. Revisar antes de ejecutar.
-- Sin DELETE / DROP / TRUNCATE.

BEGIN;

-- AFUERA III B: phone: 915516439 -> 915528554
UPDATE centers SET phone = '915528554', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"915516439","proposed":"915528554"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '0e00f2d0-538b-4991-97df-88a6bbc966c6';

-- PEDAGOGIA WALDORF DE ARAVACA: phone: 917402047 -> 913071210
UPDATE centers SET phone = '913071210', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"917402047","proposed":"913071210"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '7cce9d1a-4a72-456c-9019-4f2157443aa3';

-- ALICIA II: phone: 915503774 -> 915484132
UPDATE centers SET phone = '915484132', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"915503774","proposed":"915484132"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'ebde4f53-c43e-46ab-9e18-004bd974d395';

-- MAMA QUECA II: phone: 913887424 -> 913814463
UPDATE centers SET phone = '913814463', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913887424","proposed":"913814463"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '3746a619-9c08-433e-bf15-51a32d8db0ae';

-- ANDAL II: phone: 915523229 -> 915514858
UPDATE centers SET phone = '915514858', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"915523229","proposed":"915514858"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'b9cb3561-1f71-4873-b2f2-e1d35a0e79e2';

-- CARANA VALDEMARIN: phone: 609483989 -> 913573789
UPDATE centers SET phone = '913573789', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"609483989","proposed":"913573789"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'c442d882-1877-49d4-8ac2-3d2ec1039740';

-- CASITA MARAVILLAS: phone: 663932715 -> 916494353
UPDATE centers SET phone = '916494353', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"663932715","proposed":"916494353"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '73ea21b4-8232-4572-8c3e-84723bde2b76';

-- CASITA MARAVILLAS BABY: phone: 692807137 -> 916494353
UPDATE centers SET phone = '916494353', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"692807137","proposed":"916494353"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '5d8654b0-8f87-410e-a593-36c594400195';

-- CASITA MARAVILLAS NEBULOSAS: phone: 692807137 -> 911726059
UPDATE centers SET phone = '911726059', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"692807137","proposed":"911726059"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '14c7c3a5-c2b3-4f2d-bdb5-5c43fe938c2a';

-- CHIQUI TIN ALCANTARA: phone: 914028151 -> 915933096
UPDATE centers SET phone = '915933096', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914028151","proposed":"915933096"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'eb42112b-a9d9-4586-b60d-f0c7434889b7';

-- COCOLAN CVE: phone: 914739382 -> 914660840
UPDATE centers SET phone = '914660840', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914739382","proposed":"914660840"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'd92d9646-333c-4f58-bdce-5cff334edb33';

-- DIABOLO: phone: 669440272 -> 911301510
UPDATE centers SET phone = '911301510', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"669440272","proposed":"911301510"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'b44b6862-5b7b-4a04-84f4-d89ab51d5020';

-- DOMO: phone: 660492189 -> 911383601
UPDATE centers SET phone = '911383601', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"660492189","proposed":"911383601"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '42be7897-cacc-4673-baec-cd907b9d10b4';

-- EL CARMEN: phone: 913029923 -> 917634509
UPDATE centers SET phone = '917634509', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913029923","proposed":"917634509"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '282f942f-8512-451c-8db2-2b694a373478';

-- EL DUENDE TRAVIESO II: phone: 639656728 -> 915303265
UPDATE centers SET phone = '915303265', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"639656728","proposed":"915303265"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '7bf4feed-7181-4dcb-93be-ad78e0e359ef';

-- DINA CONDADO: phone: 913021746 -> 913027574
UPDATE centers SET phone = '913027574', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913021746","proposed":"913027574"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'fa73f2b1-c52c-4870-b9e1-19e0522a0f12';

-- CUCUTRAS: phone: 913002257 -> 625350143
UPDATE centers SET phone = '625350143', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913002257","proposed":"625350143"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '2613e96c-9379-4d6d-adeb-d21ceb774fd4';

-- DE PEQUES: phone: 915514433 -> 913315966
UPDATE centers SET phone = '913315966', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"915514433","proposed":"913315966"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '9038eb6c-8ab3-4614-8faf-90439fee4a8b';

-- DINA CONDADO-2: phone: 913021746 -> 913027574
UPDATE centers SET phone = '913027574', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913021746","proposed":"913027574"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '2e007e17-485f-4a2d-9056-b6e948c72c3b';

-- DONDE ESTAN LAS LLAVES: phone: 638947062 -> 915396444
UPDATE centers SET phone = '915396444', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"638947062","proposed":"915396444"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'bed55563-8a3f-4e45-96b6-20159ceecfb8';

-- ESCUELA DE EDUCACION INFANTIL DEL COMPLEJO CUZCO: phone: 656414096 -> 915835449
UPDATE centers SET phone = '915835449', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"656414096","proposed":"915835449"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '8e3ec3c2-c8ad-4c71-a0c5-218e10b48a6c';

-- MI PRIMER COLE 4: phone: 913881474 -> 913881215
UPDATE centers SET phone = '913881215', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913881474","proposed":"913881215"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '9714633c-2f9c-4d3e-80c6-7515cda502c4';

-- PASITOS MAGICOS: phone: 915521713 -> 917592288
UPDATE centers SET phone = '917592288', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"915521713","proposed":"917592288"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'e50dbc69-9f18-4868-b384-857c2e848910';

-- ROSA: phone: 913501362 -> 917344966
UPDATE centers SET phone = '917344966', data_conflicts = '{"phone":{"reason":"ayto-municipal indica teléfono diferente","status":"resolved","current":"913501362","proposed":"917344966"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'ebf1b842-9366-43ea-a76f-108f9b14b459';

-- EL BARBERILLO DE LAVAPIES: phone: 915397437 -> 910739659
UPDATE centers SET phone = '910739659', data_conflicts = '{"phone":{"reason":"ayto-municipal indica teléfono diferente","status":"resolved","current":"915397437","proposed":"910739659"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '951abe34-4a16-4f7e-8b42-73b27fe7b99d';

-- GUARDILLA INFANTIL: phone: 630205015 -> 913422147
UPDATE centers SET phone = '913422147', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"630205015","proposed":"913422147"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '4cf5b474-5847-4f5d-9b13-b45dec06a1a9';

-- EL OSITO 2: phone: 914159758 -> 914134642
UPDATE centers SET phone = '914134642', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914159758","proposed":"914134642"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '3425aacc-416b-4ff2-9d71-85cef21e5be8';

-- ESCUELA INFANTIL BILINGÜE SUS PEQUEÑOS PASOS-ARTURO SORIA: phone: 913882377 -> 914157295
UPDATE centers SET phone = '914157295', data_conflicts = '{"phone":{"reason":"cam indica teléfono diferente","status":"resolved","current":"913882377","proposed":"914157295"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'ed45e5d8-cef4-4b20-9ae2-fb41ff6090e8';

-- EL PARQUE: phone: 914132798 -> 913000058
UPDATE centers SET phone = '913000058', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914132798","proposed":"913000058"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '8fa8261d-3430-4387-955d-31459fe9ca11';

-- EL SOL: phone: 913532644 -> 913532642
UPDATE centers SET phone = '913532642', data_conflicts = '{"phone":{"reason":"ayto-municipal indica teléfono diferente","status":"resolved","current":"913532644","proposed":"913532642"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '9ca0475a-bac6-48e8-bef3-e5a3b7229d50';

-- EL TREN DE LOS NIÑOS II: phone: 913025639 -> 917660801
UPDATE centers SET phone = '917660801', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913025639","proposed":"917660801"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'b6360786-f44b-4056-8aad-975586709549';

-- EMBAJADORES: phone: 915285536 -> 914739150
UPDATE centers SET phone = '914739150', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"915285536","proposed":"914739150"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '10fd5c0a-2a91-4aa0-a4e3-3608845e9e83';

-- GARABATOS Y OCHO PATOS: phone: 914740446 -> 913163140
UPDATE centers SET phone = '913163140', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914740446","proposed":"913163140"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'b3c2a25e-7fe0-4700-b515-570ef4880e6c';

-- INTERNACIONAL VALDEMARIN: phone: 674501365 -> 635220910
UPDATE centers SET phone = '635220910', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"674501365","proposed":"635220910"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '4230f252-d7aa-43d5-b116-d3d33cf0a8e5';

-- IRIS II: phone: 917669384 -> 913882876
UPDATE centers SET phone = '913882876', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"917669384","proposed":"913882876"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '84766903-944b-49f5-b46c-d155f95b1968';

-- LA ESTRELLA INFANTIL: phone: 636492506 -> 917653087
UPDATE centers SET phone = '917653087', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"636492506","proposed":"917653087"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '61151bb2-0bee-46ea-8e7e-e093f2451934';

-- LAR: phone: 666938587 -> 917955158
UPDATE centers SET phone = '917955158', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"666938587","proposed":"917955158"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '1571c1d9-5254-4312-899d-f5cfccdc5541';

-- LITTLE CLOVERS: phone: 696991559 -> 911734262
UPDATE centers SET phone = '911734262', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"696991559","proposed":"911734262"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '78e5d5e1-3cab-4db3-b85a-87f775e88fd4';

-- LITTLE WITCH: phone: 911305715 -> 911640682
UPDATE centers SET phone = '911640682', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"911305715","proposed":"911640682"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'ebe5ec06-ad85-4ae4-90c9-dd2dcaabde60';

-- MI PRIMER COLE 2: phone: 913560066 -> 913881215
UPDATE centers SET phone = '913881215', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913560066","proposed":"913881215"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'bad591e9-7637-414d-952b-59bd44cc68fd';

-- LUIS BELLO: phone: 914132979 -> 914341779
UPDATE centers SET phone = '914341779', data_conflicts = '{"phone":{"reason":"ayto-municipal indica teléfono diferente","status":"resolved","current":"914132979","proposed":"914341779"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'a5f0a48a-102f-45ee-9170-36d984385b43';

-- MAGOS: phone: 640734319 -> 914090609
UPDATE centers SET phone = '914090609', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"640734319","proposed":"914090609"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '817f33c5-a1df-4352-b3c0-73743327a9db';

-- NAZARET: phone: 915617244 -> 913049368
UPDATE centers SET phone = '913049368', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"915617244","proposed":"913049368"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'c562b08b-221d-42c6-885a-c9ee7a8251d8';

-- MAFALDA: phone: 680366888 -> 914475258
UPDATE centers SET phone = '914475258', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"680366888","proposed":"914475258"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '421d8c3d-9eb7-4d79-ab38-b34608e5b5bf';

-- NEMOMARLIN ARGANZUELA: street: Calle de Carmen Cobeña, 4 -> Calle de Carmen Cobeña, 18
UPDATE centers SET street = 'Calle de Carmen Cobeña, 18', data_conflicts = '{"street":{"reason":"La web oficial del centro y múltiples directorios (micole.net, colesyguardes.es) indican el número 18. La DB registra el número 4. Posible error en la importación original del CSV. Requiere verificación presencial o llamada al centro.","status":"resolved","current":"Calle de Carmen Cobeña, 4","proposed":"Calle de Carmen Cobeña, 18"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'f8909853-cf9e-434e-8951-3ed004176dcb';

-- NEMOMARLIN CONDE DE ORGAZ: phone: 647830449 -> 912812424
UPDATE centers SET phone = '912812424', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"647830449","proposed":"912812424"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '2f2ccb55-1503-42f8-aa71-3a647f08ce85';

-- NEMOMARLIN PASEO DE LA HABANA: phone: 651721295 -> 911166576
UPDATE centers SET phone = '911166576', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"651721295","proposed":"911166576"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '5a2ee5b7-5694-4e9d-8020-aaa3c2f28c05';

-- NEMOMARLIN PINTOR ROSALES: phone: 914557535 -> 666593130
UPDATE centers SET phone = '666593130', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914557535","proposed":"666593130"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '7073b11f-406b-4156-b350-1fe2cf5ea6f4';

-- NEMOMARLIN RETIRO: phone: 659894650 -> 911733893
UPDATE centers SET phone = '911733893', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"659894650","proposed":"911733893"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'cb98103f-3f15-439b-be5f-e3a8641f5911';

-- OSOBUCO II: phone: 914139286 -> 914130443
UPDATE centers SET phone = '914130443', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914139286","proposed":"914130443"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'd84b45f5-b68f-4fab-8125-08076bbce188';

-- PEQUEANDO: phone: 910234712 -> 911376130
UPDATE centers SET phone = '911376130', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"910234712","proposed":"911376130"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '70262e7f-ca4b-4355-8f65-dcc1945ba6f4';

-- SAN JOSE DE CLUNY: phone: 914597103 -> 914502332
UPDATE centers SET phone = '914502332', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"914597103","proposed":"914502332"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'c755df20-7f87-4611-a806-815f4c8db1d6';

-- PROJARDIN MADIBA: phone: 628695527 -> 912774633
UPDATE centers SET phone = '912774633', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"628695527","proposed":"912774633"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'a044c23a-ea1c-4449-927e-f79001c9bda9';

-- RUIZ JIMENEZ: phone: 911694809 -> 910590901
UPDATE centers SET phone = '910590901', data_conflicts = '{"phone":{"reason":"ayto-municipal indica teléfono diferente","status":"resolved","current":"911694809","proposed":"910590901"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'f37d3024-9b20-48c2-b43f-f334a3a89f67';

-- SAN ALONSO DE OROZCO: phone: 650831333 -> 915531097
UPDATE centers SET phone = '915531097', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"650831333","proposed":"915531097"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '8490e2e8-37bf-4608-9d00-bbc817eec02b';

-- SAN MIGUEL: phone: 913820145 -> 915261184
UPDATE centers SET phone = '915261184', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"913820145","proposed":"915261184"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = 'ba9f78ff-fa1a-46ba-9258-a61fd53534f0';

-- TEO BRETON: phone: 686364244 -> 913994857
UPDATE centers SET phone = '913994857', data_conflicts = '{"phone":{"reason":"ayto-infant indica teléfono diferente","status":"resolved","current":"686364244","proposed":"913994857"}}'::jsonb, verified_at = '2026-07-05', updated_at = NOW() WHERE id = '91e6b9be-43aa-4c18-9cd5-e9d0f6e817f4';

COMMIT;

-- 57 centros con conflictos resueltos.