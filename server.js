const express = require("express");
const { Pool } = require("pg");
require("dotenv").config();
const path = require("path");

const app = express();

const pool = new Pool({
  user: process.env.USER,
  host: process.env.HOST,
  database: process.env.DB,
  password: process.env.DB_PASSWORD,
  port: process.env.PORT,
});

app.use(express.static(path.join(__dirname)));

app.get("/data/kompanije", async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT kompanije.naziv AS naziv_kompanije, kompanije.iata_kod AS kompanija_iata, kompanije.icao_kod AS kompanija_icao, gradovi.naziv AS sjediste_grad, drzave.naziv AS sjediste_drzava, regije_poslovanja.naziv AS regija_poslovanja, zracne_luke.naziv AS maticna_luka,kompanije.web_stranica, tipovi_kompanija.naziv AS tip_kompanije, kompanije.aktivna FROM kompanije JOIN zracne_luke ON kompanije.id_maticne_luke = zracne_luke.id_luke JOIN gradovi ON kompanije.id_grada_sjedista = gradovi.id_grada JOIN regije_poslovanja ON kompanije.id_regije = regije_poslovanja.id_regije JOIN tipovi_kompanija ON kompanije.id_tipa = tipovi_kompanija.id_tipa JOIN drzave ON gradovi.iso_drzave = drzave.iso_drzave ORDER BY id_kompanije ASC`
    );
    res.json(result.rows);
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: "ERROR: DATA FETCH" });
  }
});

app.get("/data/luke", async (req, res) => {
  try {
    const result = await pool.query(
      `SELECT zracne_luke.naziv AS naziv_luke,gradovi.naziv AS naziv_grada,gradovi.iso_drzave AS iso_drzave,drzave.naziv AS drzava,zracne_luke.iata_kod,zracne_luke.icao_kod,zracne_luke.vremenska_zona,kategorije_luka.naziv AS kategorija_luke FROM zracne_luke JOIN gradovi ON zracne_luke.id_grada = gradovi.id_grada JOIN drzave ON gradovi.iso_drzave = drzave.iso_drzave JOIN kategorije_luka ON zracne_luke.id_kategorije = kategorije_luka.id_kategorije ORDER BY id_luke ASC`
    );
    res.json(result.rows);
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: "ERROR: DATA FETCH" });
  }
});

app.listen(process.env.SERVER_PORT, () => {
  console.log("LISTENING PORT: ", process.env.SERVER_PORT);
});
