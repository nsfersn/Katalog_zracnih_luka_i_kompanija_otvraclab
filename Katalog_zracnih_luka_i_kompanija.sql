CREATE TABLE kontinenti (
    id_kontinenta INTEGER PRIMARY KEY,
    naziv VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE drzave (
    iso_drzave CHAR(2) PRIMARY KEY,
    naziv VARCHAR(80) NOT NULL UNIQUE,
    id_kontinenta INTEGER NOT NULL REFERENCES kontinenti(id_kontinenta)
);

CREATE TABLE gradovi (
    id_grada INTEGER PRIMARY KEY,
    naziv VARCHAR(80) NOT NULL,
    iso_drzave CHAR(2) NOT NULL REFERENCES drzave(iso_drzave),
    CONSTRAINT unique_grad_drzava UNIQUE (naziv, iso_drzave)
);

CREATE TABLE kategorije_luka (
    id_kategorije INTEGER PRIMARY KEY,
    naziv VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE tipovi_kompanija (
    id_tipa INTEGER PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE regije_poslovanja (
    id_regije INTEGER PRIMARY KEY,
    naziv VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE zracne_luke (
    id_luke INTEGER PRIMARY KEY,
    naziv VARCHAR(120) NOT NULL,
    id_grada INTEGER NOT NULL REFERENCES gradovi(id_grada),
    iata_kod CHAR(3) NOT NULL UNIQUE,
    icao_kod CHAR(4) NOT NULL UNIQUE,
    vremenska_zona VARCHAR(80) NOT NULL,
    id_kategorije INTEGER NOT NULL REFERENCES kategorije_luka(id_kategorije)
);

CREATE TABLE kompanije (
    id_kompanije INTEGER PRIMARY KEY,
    id_maticne_luke INTEGER NOT NULL REFERENCES zracne_luke(id_luke),
    naziv VARCHAR(120) NOT NULL,
    iata_kod CHAR(2) NOT NULL UNIQUE,
    icao_kod CHAR(3) NOT NULL UNIQUE,
    id_grada_sjedista INTEGER NOT NULL REFERENCES gradovi(id_grada),
    id_regije INTEGER NOT NULL REFERENCES regije_poslovanja(id_regije),
    web_stranica VARCHAR(150) NOT NULL,
    id_tipa INTEGER NOT NULL REFERENCES tipovi_kompanija(id_tipa),
    aktivna BOOLEAN NOT NULL
);

INSERT INTO kontinenti (id_kontinenta, naziv) VALUES
    (1, 'Europa');

INSERT INTO drzave (iso_drzave, naziv, id_kontinenta) VALUES
    ('HR', 'Hrvatska', 1),
    ('AT', 'Austrija', 1),
    ('DE', 'Njemačka', 1),
    ('GB', 'Ujedinjeno Kraljevstvo', 1),
    ('FR', 'Francuska', 1),
    ('NL', 'Nizozemska', 1),
    ('IE', 'Irska', 1),
    ('ES', 'Španjolska', 1),
    ('PT', 'Portugal', 1),
    ('CH', 'Švicarska', 1),
    ('IT', 'Italija', 1),
    ('DK', 'Danska', 1),
    ('NO', 'Norveška', 1),
    ('FI', 'Finska', 1),
    ('GR', 'Grčka', 1),
    ('BE', 'Belgija', 1),
    ('PL', 'Poljska', 1),
    ('CZ', 'Češka', 1),
    ('HU', 'Mađarska', 1),
    ('LV', 'Latvija', 1),
    ('SE', 'Švedska', 1);

INSERT INTO gradovi (id_grada, naziv, iso_drzave) VALUES
    (1, 'Zagreb', 'HR'),
    (2, 'Beč', 'AT'),
    (3, 'Frankfurt', 'DE'),
    (4, 'London', 'GB'),
    (5, 'Pariz', 'FR'),
    (6, 'Amsterdam', 'NL'),
    (7, 'Dublin', 'IE'),
    (8, 'Madrid', 'ES'),
    (9, 'Lisabon', 'PT'),
    (10, 'Zürich', 'CH'),
    (11, 'Köln', 'DE'),
    (12, 'Neu-Isenburg', 'DE'),
    (13, 'Tremblay-en-France', 'FR'),
    (14, 'Amstelveen', 'NL'),
    (15, 'Basel', 'CH'),
    (16, 'Rim', 'IT'),
    (17, 'Kopenhagen', 'DK'),
    (18, 'Oslo', 'NO'),
    (19, 'Vantaa', 'FI'),
    (20, 'Atena', 'GR'),
    (21, 'Bruxelles', 'BE'),
    (22, 'Varšava', 'PL'),
    (23, 'Prag', 'CZ'),
    (24, 'Budimpešta', 'HU'),
    (25, 'Riga', 'LV'),
    (26, 'Solna', 'SE'),
    (27, 'Fornebu', 'NO'),
    (28, 'Kifisia', 'GR'),
    (29, 'Diegem', 'BE');

INSERT INTO kategorije_luka (id_kategorije, naziv) VALUES
    (1, 'Međunarodna');

INSERT INTO tipovi_kompanija (id_tipa, naziv) VALUES
    (1, 'Putnička'),
    (2, 'Niskotarifna putnička');

INSERT INTO regije_poslovanja (id_regije, naziv) VALUES
    (1, 'Europa');

INSERT INTO zracne_luke (id_luke, naziv, id_grada, iata_kod, icao_kod, vremenska_zona, id_kategorije) VALUES
    (1, 'Zračna luka Franjo Tuđman', 1, 'ZAG', 'LDZA', 'UTC+1', 1),
    (2, 'Vienna International Airport', 2, 'VIE', 'LOWW', 'UTC+1', 1),
    (3, 'Frankfurt Airport', 3, 'FRA', 'EDDF', 'UTC+1', 1),
    (4, 'Heathrow Airport', 4, 'LHR', 'EGLL', 'UTC+0', 1),
    (5, 'Paris Charles de Gaulle Airport', 5, 'CDG', 'LFPG', 'UTC+1', 1),
    (6, 'Amsterdam Airport Schiphol', 6, 'AMS', 'EHAM', 'UTC+1', 1),
    (7, 'Dublin Airport', 7, 'DUB', 'EIDW', 'UTC+0', 1),
    (8, 'Adolfo Suárez Madrid–Barajas Airport', 8, 'MAD', 'LEMD', 'UTC+1', 1),
    (9, 'Humberto Delgado Airport', 9, 'LIS', 'LPPT', 'UTC+0', 1),
    (10, 'Zurich Airport', 10, 'ZRH', 'LSZH', 'UTC+1', 1),
    (11, 'Leonardo da Vinci–Fiumicino Airport', 16, 'FCO', 'LIRF', 'UTC+1', 1),
    (12, 'Copenhagen Airport', 17, 'CPH', 'EKCH', 'UTC+1', 1),
    (13, 'Oslo Airport Gardermoen', 18, 'OSL', 'ENGM', 'UTC+1', 1),
    (14, 'Helsinki Airport', 19, 'HEL', 'EFHK', 'UTC+2', 1),
    (15, 'Athens International Airport', 20, 'ATH', 'LGAV', 'UTC+2', 1),
    (16, 'Brussels Airport', 21, 'BRU', 'EBBR', 'UTC+1', 1),
    (17, 'Warsaw Chopin Airport', 22, 'WAW', 'EPWA', 'UTC+1', 1),
    (18, 'Václav Havel Airport Prague', 23, 'PRG', 'LKPR', 'UTC+1', 1),
    (19, 'Budapest Ferenc Liszt International Airport', 24, 'BUD', 'LHBP', 'UTC+1', 1),
    (20, 'Riga International Airport', 25, 'RIX', 'EVRA', 'UTC+2', 1);

INSERT INTO kompanije (id_kompanije, id_maticne_luke, naziv, iata_kod, icao_kod, id_grada_sjedista, id_regije, web_stranica, id_tipa, aktivna) VALUES
    (1, 1, 'Croatia Airlines', 'OU', 'CTN', 1, 1, 'https://www.croatiaairlines.com/', 1, TRUE),
    (2, 2, 'Austrian Airlines', 'OS', 'AUA', 2, 1, 'https://www.austrian.com/', 1, TRUE),
    (3, 3, 'Lufthansa', 'LH', 'DLH', 11, 1, 'https://www.lufthansa.com/', 1, TRUE),
    (4, 3, 'Condor', 'DE', 'CFG', 12, 1, 'https://www.condor.com/', 1, TRUE),
    (5, 4, 'British Airways', 'BA', 'BAW', 4, 1, 'https://www.britishairways.com/', 1, TRUE),
    (6, 5, 'Air France', 'AF', 'AFR', 13, 1, 'https://www.airfrance.com/', 1, TRUE),
    (7, 6, 'KLM', 'KL', 'KLM', 14, 1, 'https://www.klm.com/', 1, TRUE),
    (8, 7, 'Ryanair', 'FR', 'RYR', 7, 1, 'https://www.ryanair.com/', 2, TRUE),
    (9, 7, 'Aer Lingus', 'EI', 'EIN', 7, 1, 'https://www.aerlingus.com/', 1, TRUE),
    (10, 8, 'Iberia', 'IB', 'IBE', 8, 1, 'https://www.iberia.com/', 1, TRUE),
    (11, 9, 'TAP Air Portugal', 'TP', 'TAP', 9, 1, 'https://www.flytap.com/', 1, TRUE),
    (12, 10, 'SWISS', 'LX', 'SWR', 15, 1, 'https://www.swiss.com/', 1, TRUE),
    (13, 11, 'ITA Airways', 'AZ', 'ITY', 16, 1, 'https://www.ita-airways.com/', 1, TRUE),
    (14, 12, 'Scandinavian Airlines (SAS)', 'SK', 'SAS', 26, 1, 'https://www.flysas.com/', 1, TRUE),
    (15, 13, 'Norwegian Air Shuttle', 'DY', 'NAX', 27, 1, 'https://www.norwegian.com/', 2, TRUE),
    (16, 14, 'Finnair', 'AY', 'FIN', 19, 1, 'https://www.finnair.com/', 1, TRUE),
    (17, 15, 'Aegean Airlines', 'A3', 'AEE', 28, 1, 'https://www.aegeanair.com/', 1, TRUE),
    (18, 16, 'Brussels Airlines', 'SN', 'BEL', 29, 1, 'https://www.brusselsairlines.com/', 1, TRUE),
    (19, 17, 'LOT Polish Airlines', 'LO', 'LOT', 22, 1, 'https://www.lot.com/', 1, TRUE),
    (20, 18, 'Smartwings', 'QS', 'TVS', 23, 1, 'https://www.smartwings.com/', 1, TRUE),
    (21, 19, 'Wizz Air', 'W6', 'WZZ', 24, 1, 'https://www.wizzair.com/', 2, TRUE),
    (22, 20, 'airBaltic', 'BT', 'BTI', 25, 1, 'https://www.airbaltic.com/', 1, TRUE);