CREATE TABLE zracne_luke (
 id_luke INTEGER PRIMARY KEY,
 naziv VARCHAR(120) NOT NULL,
 grad VARCHAR(80) NOT NULL,
 drzava VARCHAR(80) NOT NULL,
 iso_drzave CHAR(2) NOT NULL,
 iata_kod CHAR(3) NOT NULL UNIQUE,
 icao_kod CHAR(4) NOT NULL UNIQUE,
 kontinent VARCHAR(40) NOT NULL,
 vremenska_zona VARCHAR(80) NOT NULL,
 kategorija VARCHAR(40) NOT NULL,
 medunarodna BOOLEAN NOT NULL
);

CREATE TABLE kompanije (
 id_kompanije INTEGER PRIMARY KEY,
 id_maticne_luke INTEGER NOT NULL REFERENCES zracne_luke(id_luke),
 naziv VARCHAR(120) NOT NULL,
 iata_kod CHAR(2) NOT NULL UNIQUE,
 icao_kod CHAR(3) NOT NULL UNIQUE,
 drzava VARCHAR(80) NOT NULL,
 sjediste VARCHAR(80) NOT NULL,
 regija_poslovanja VARCHAR(40) NOT NULL,
 web_stranica VARCHAR(150) NOT NULL,
 tip_kompanije VARCHAR(50) NOT NULL,
 aktivna BOOLEAN NOT NULL
);

INSERT INTO zracne_luke (id_luke, naziv, grad, drzava, iso_drzave, iata_kod, icao_kod, kontinent, vremenska_zona, kategorija, medunarodna) VALUES
  (1, 'Zračna luka Franjo Tuđman', 'Zagreb', 'Hrvatska', 'HR', 'ZAG', 'LDZA', 'Europa', 'UTC+1', 'Međunarodna', TRUE),
  (2, 'Vienna International Airport', 'Beč', 'Austrija', 'AT', 'VIE', 'LOWW', 'Europa', 'UTC+1', 'Međunarodna', TRUE),
  (3, 'Frankfurt Airport', 'Frankfurt', 'Njemačka', 'DE', 'FRA', 'EDDF', 'Europa', 'UTC+1', 'Međunarodna', TRUE),
  (4, 'Heathrow Airport', 'London', 'Ujedinjeno Kraljevstvo', 'GB', 'LHR', 'EGLL', 'Europa', 'UTC+0', 'Međunarodna', TRUE),
  (5, 'Paris Charles de Gaulle Airport', 'Pariz', 'Francuska', 'FR', 'CDG', 'LFPG', 'Europa', 'UTC+1', 'Međunarodna', TRUE),
  (6, 'Amsterdam Airport Schiphol', 'Amsterdam', 'Nizozemska', 'NL', 'AMS', 'EHAM', 'Europa', 'UTC+1', 'Međunarodna', TRUE),
  (7, 'Dublin Airport', 'Dublin', 'Irska', 'IE', 'DUB', 'EIDW', 'Europa', 'UTC+0', 'Međunarodna', TRUE),
  (8, 'Adolfo Suárez Madrid–Barajas Airport', 'Madrid', 'Španjolska', 'ES', 'MAD', 'LEMD', 'Europa', 'UTC+1', 'Međunarodna', TRUE),
  (9, 'Humberto Delgado Airport', 'Lisabon', 'Portugal', 'PT', 'LIS', 'LPPT', 'Europa', 'UTC+0', 'Međunarodna', TRUE),
  (10, 'Zurich Airport', 'Zürich', 'Švicarska', 'CH', 'ZRH', 'LSZH', 'Europa', 'UTC+1', 'Međunarodna', TRUE);

INSERT INTO kompanije (id_kompanije, id_maticne_luke, naziv, iata_kod, icao_kod, drzava, sjediste, regija_poslovanja, web_stranica, tip_kompanije, aktivna) VALUES
  (1, 1, 'Croatia Airlines', 'OU', 'CTN', 'Hrvatska', 'Zagreb', 'Europe', 'https://www.croatiaairlines.com/', 'Putnička', TRUE),
  (2, 2, 'Austrian Airlines', 'OS', 'AUA', 'Austrija', 'Beč', 'Europe', 'https://www.austrian.com/', 'Putnička', TRUE),
  (3, 3, 'Lufthansa', 'LH', 'DLH', 'Njemačka', 'Köln', 'Europe', 'https://www.lufthansa.com/', 'Putnička', TRUE),
  (4, 3, 'Condor', 'DE', 'CFG', 'Njemačka', 'Neu-Isenburg', 'Europe', 'https://www.condor.com/', 'Putnička', TRUE),
  (5, 4, 'British Airways', 'BA', 'BAW', 'Ujedinjeno Kraljevstvo', 'London', 'Europe', 'https://www.britishairways.com/', 'Putnička', TRUE),
  (6, 5, 'Air France', 'AF', 'AFR', 'Francuska', 'Tremblay-en-France', 'Europe', 'https://www.airfrance.com/', 'Putnička', TRUE),
  (7, 6, 'KLM', 'KL', 'KLM', 'Nizozemska', 'Amstelveen', 'Europe', 'https://www.klm.com/', 'Putnička', TRUE),
  (8, 7, 'Ryanair', 'FR', 'RYR', 'Irska', 'Dublin', 'Europe', 'https://www.ryanair.com/', 'Niskotarifna', TRUE),
  (9, 7, 'Aer Lingus', 'EI', 'EIN', 'Irska', 'Dublin', 'Europe', 'https://www.aerlingus.com/', 'Putnička', TRUE),
  (10, 8, 'Iberia', 'IB', 'IBE', 'Španjolska', 'Madrid', 'Europe', 'https://www.iberia.com/', 'Putnička', TRUE),
  (11, 9, 'TAP Air Portugal', 'TP', 'TAP', 'Portugal', 'Lisabon', 'Europe', 'https://www.flytap.com/', 'Putnička', TRUE),
  (12, 10, 'SWISS', 'LX', 'SWR', 'Švicarska', 'Basel', 'Europe', 'https://www.swiss.com/', 'Putnička', TRUE);