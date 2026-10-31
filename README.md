# Katalog_zracnih_luka_i_kompanija_otvraclab
Repozitorij koji sadrži otvoreni skup podataka o zračnim kompanijama (ukupno 12 zapisa) te zračnim lukama (ukupno 10 zapisa) koje pripadaju njima. 
Sadrži CSV, JSON datoteke te dump baze podataka u SQL formatu.

Informacije koje možete pronaći u tablici o zračnim kompanijama su: naziv kompanije, država sjedišta, IATA kod, ICAO kod, grad sjedišta, glavna web-stranica kompanije, tip zračne kompanije (ako ne piše klasična u podacima to se podrazumijeva za putničke) te regija poslovanja navedene kompanije. Također postoji 1:N veza između zračnim lukama i zračnim kompanijama uspostavljena pomoću stranog ključa zračne kompanije pod imenom id_maticne_luke (jedna zračna luka može biti matična za više kompanija). Atribut id_maticne_luke označava jednu odabranu glavnu operativnu bazu ili glavno prometno čvorište pojedine zračne kompanije radi pojednostavljenja zadatka (Ryanair npr. ima 95 operativnih baza).

Informacije koje možete pronaći u tablici o zračnim lukama su: naziv luke, grad gdje se nalazi, država gdje se nalazi, IATA kod, ICAO kod, kontinent, ISO države, kategorija luke te vremenska zona mjesta u kojem se nalazi luka.

Podaci o zračnim lukama prikupljeni su 31.10.2026. pomoću web-stranice OurAirports (https://ourairports.com/) te dostupni su u javnoj domeni.

Metapodaci:
1. Licenca: Creative Commons Attribution 4.0 International (CC-BY 4.0)
2. Naziv autora: Noah Sitar
3. Verzija skupa podataka: 1.0
4. Jezik u kojemu se nalaze podaci: hrvatski
5. Datum izrade: 31.10.2026.
6. Vrsta skupa podataka: kataloški skup podataka
7. Broj tablica: 2
8. Broj zapisa: 22 (10 luka + 12 kompanija)
9. Formati podataka: CSV, JSON, SQL
10. Izvor podataka: OurAirports