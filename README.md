# Katalog_zracnih_luka_i_kompanija_otvraclab
Repozitorij koji sadrži otvoreni skup podataka o zračnim kompanijama (ukupno 22 zapisa) te zračnim lukama (ukupno 20 zapisa) koje pripadaju njima. 
Sadrži CSV, JSON datoteke te dump baze podataka u SQL formatu.

Prisutne tablice u skupu podataka (opis atributa):
1. kontinenti
Tablica koja sadrži: 
    id_kontinenta (primarni ključ), 
    naziv (unique)

2. drzave
Tablica koja sadrži:
    iso_drzave (primarni ključ),
    naziv (unique)
    id_kontinenta (strani ključ, referencira kontinenti.id_kontinenta)

3. gradovi
Tablica koja sadrži:
    id_grada (primarni ključ),
    naziv,
    iso_drzave (strani ključ, referencira drzave.iso_drzave),
    unique_grad_drzava (unique constraint za naziv, iso_drzave)

4. kategorije_luka:
Tablica koja sadrži:
    id_kategorije (primarni ključ),
    naziv (unique)

5. tipovi_kompanija: 
Tablica koja sadrži:
    id_tipa (primarni ključ),
    naziv (unique)

6. regije_poslovanja:
Tablica koja sadrži:
    id_regije (primarni ključ),
    naziv (unique)

7. zracne_luke:
Tablica koja sadrži:
    id_luke (primarni ključ),
    naziv,
    id_grada (strani ključ, referencira gradovi.id_grada),
    iata_kod (unique),
    icao_kod (unique),
    vremenska_zona,
    id_kategorije (strani ključ, referencira kategorije_luka.id_kategorije)

Opis:
Informacije koje možete saznati u tablici o zračnim lukama su: naziv luke, grad gdje se nalazi, država gdje se nalazi, IATA kod, ICAO kod, kontinent, ISO države, kategorija luke te vremenska zona mjesta u kojem se nalazi luka.

8. kompanije:
Tablica koja sadrži:
    id_kompanije (primarni ključ),
    id_maticne_luke (strani ključ, referencira zracne_luke.id_luke),
    naziv,
    iata_kod (unique),
    icao_kod (unique),
    id_grada_sjedista (strani ključ, referencira gradovi.id_grada),
    id_regije (strani ključ, referencira regije_poslovanja.id_regije),
    web_stranica,
    id_tipa (strani ključ, referencira tipovi_kompanija.id_tipa),
    aktivna

Opis:
Informacije koje možete saznati u tablici o zračnim kompanijama su: naziv kompanije, država sjedišta, IATA kod, ICAO kod, grad sjedišta, glavna web-stranica kompanije, tip zračne kompanije (ako ne piše klasična u podacima to se podrazumijeva kao putnička) te regija poslovanja navedene kompanije. Također postoji 1:N veza između zračnim lukama i zračnim kompanijama uspostavljena pomoću stranog ključa zračne kompanije pod imenom id_maticne_luke (jedna zračna luka može biti matična za više kompanija). Atribut id_maticne_luke označava jednu odabranu glavnu operativnu bazu ili glavno prometno čvorište pojedine zračne kompanije radi pojednostavljenja zadatka (Ryanair npr. ima 95 operativnih baza).

Exportovi CSV i JSON fileova napravljeni pomoću alata psql naredbama u fileu repozitorija export.md .

Podaci o zračnim lukama prikupljeni su 10.11.2026. pomoću web-stranice OurAirports (https://ourairports.com/) te dostupni su u javnoj domeni.

Metapodaci:
1. Licenca: Creative Commons Attribution 4.0 International (CC-BY 4.0)
2. Naziv autora: Noah Sitar
3. Verzija skupa podataka: 2.0
4. Jezik u kojemu se nalaze podaci: hrvatski
5. Datum izrade: 10.11.2026.
6. Vrsta skupa podataka: kataloški skup podataka
7. Broj zapisa zračnih luka: 20
8. Broj zapisa zračnih kompanija: 22
9. Formati podataka: CSV, JSON, SQL
10. Izvor podataka: OurAirports