-- za svaku naredbu potrebno zamijeniti direktorij eksportiranja, korišten psql za export
-- ZA \copy KORISTI \ ZA PUTANJA, A ZA \o KORISTI /
-- export zracnih luka CSV
\copy (SELECT zracne_luke.naziv AS naziv_luke,gradovi.naziv AS naziv_grada,gradovi.iso_drzave AS iso_drzave,drzave.naziv AS drzava,zracne_luke.iata_kod,zracne_luke.icao_kod,zracne_luke.vremenska_zona,kategorije_luka.naziv AS kategorija_luke FROM zracne_luke JOIN gradovi ON zracne_luke.id_grada = gradovi.id_grada JOIN drzave ON gradovi.iso_drzave = drzave.iso_drzave JOIN kategorije_luka ON zracne_luke.id_kategorije = kategorije_luka.id_kategorije ORDER BY id_luke ASC) TO 'dir' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8')

-- export zracnih kompanija CSV
\copy (SELECT kompanije.naziv AS naziv_kompanije, kompanije.iata_kod AS kompanija_iata, kompanije.icao_kod AS kompanija_icao, gradovi.naziv AS sjediste_grad, drzave.naziv AS sjediste_drzava, regije_poslovanja.naziv AS regija_poslovanja, zracne_luke.naziv AS maticna_luka,kompanije.web_stranica, tipovi_kompanija.naziv AS tip_kompanije, kompanije.aktivna FROM kompanije JOIN zracne_luke ON kompanije.id_maticne_luke = zracne_luke.id_luke JOIN gradovi ON kompanije.id_grada_sjedista = gradovi.id_grada JOIN regije_poslovanja ON kompanije.id_regije = regije_poslovanja.id_regije JOIN tipovi_kompanija ON kompanije.id_tipa = tipovi_kompanija.id_tipa JOIN drzave ON gradovi.iso_drzave = drzave.iso_drzave ORDER BY id_kompanije ASC) TO 'dir' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8')

-- ako se koristi \o nacin eksportiranja, mora se koristiti \t i \a prije da se maknu postgresql automatska formatiranja eksportova
-- export zracnih luka JSON
\o 'dir'
SELECT jsonb_pretty(jsonb_agg(t)) FROM (SELECT zracne_luke.naziv AS naziv_luke,gradovi.naziv AS naziv_grada,gradovi.iso_drzave AS iso_drzave,drzave.naziv AS drzava,zracne_luke.iata_kod,zracne_luke.icao_kod,zracne_luke.vremenska_zona,kategorije_luka.naziv AS kategorija_luke FROM zracne_luke JOIN gradovi ON zracne_luke.id_grada = gradovi.id_grada JOIN drzave ON gradovi.iso_drzave = drzave.iso_drzave JOIN kategorije_luka ON zracne_luke.id_kategorije = kategorije_luka.id_kategorije ORDER BY id_luke ASC) t;

-- export zracnih kompanija JSON
\o 'dir'
SELECT jsonb_pretty(jsonb_agg(t)) FROM (SELECT kompanije.naziv AS naziv_kompanije, kompanije.iata_kod AS kompanija_iata, kompanije.icao_kod AS kompanija_icao, gradovi.naziv AS sjediste_grad, drzave.naziv AS sjediste_drzava, regije_poslovanja.naziv AS regija_poslovanja, zracne_luke.naziv AS maticna_luka,kompanije.web_stranica, tipovi_kompanija.naziv AS tip_kompanije, kompanije.aktivna FROM kompanije JOIN zracne_luke ON kompanije.id_maticne_luke = zracne_luke.id_luke JOIN gradovi ON kompanije.id_grada_sjedista = gradovi.id_grada JOIN regije_poslovanja ON kompanije.id_regije = regije_poslovanja.id_regije JOIN tipovi_kompanija ON kompanije.id_tipa = tipovi_kompanija.id_tipa JOIN drzave ON gradovi.iso_drzave = drzave.iso_drzave ORDER BY id_kompanije ASC) t;