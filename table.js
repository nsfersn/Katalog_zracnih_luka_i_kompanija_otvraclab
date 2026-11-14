const podaci = [
  {
    grad: "Zagreb",
    naziv: "Zračna luka Franjo Tuđman",
    drzava: "Hrvatska",
    iata_kod: "ZAG",
    icao_kod: "LDZA",
    kontinent: "Europa",
    iso_drzave: "HR",
    kategorija: "Međunarodna",
    vremenska_zona: "UTC+1",
  },
  {
    grad: "Beč",
    naziv: "Vienna International Airport",
    drzava: "Austrija",
    iata_kod: "VIE",
    icao_kod: "LOWW",
    kontinent: "Europa",
    iso_drzave: "AT",
    kategorija: "Međunarodna",
    vremenska_zona: "UTC+1",
  },
  {
    grad: "Frankfurt",
    naziv: "Frankfurt Airport",
    drzava: "Njemačka",
    iata_kod: "FRA",
    icao_kod: "EDDF",
    kontinent: "Europa",
    iso_drzave: "DE",
    kategorija: "Međunarodna",
    vremenska_zona: "UTC+1",
  },
];

let filteredData = podaci;

function showTable(data) {
  const header = document.getElementById("table-head-row");
  const body = document.getElementById("table-body");
  header.innerHTML = "";
  body.innerHTML = "";

  if (data.length === 0) {
    const row = document.createElement("tr");
    const cell = document.createElement("td");
    cell.textContent = "Nema pronađenih podataka.";
    row.appendChild(cell);
    body.appendChild(row);
    return;
  }

  const attr = Object.keys(data[0]);

  for (const attribute of attr) {
    const th = document.createElement("th");
    th.textContent = attribute;
    header.appendChild(th);
  }

  for (const entry of data) {
    const row = document.createElement("tr");
    for (const attribute of attr) {
      const td = document.createElement("td");
      if (entry[attribute] !== null && entry[attribute] !== undefined)
        td.textContent = entry[attribute];
      else td.textContent = "";
      row.appendChild(td);
    }
    body.appendChild(row);
  }
}

function filterData(data, text, attribute) {
  const res = [];

  text = text.toLowerCase().trim();
  for (const entry of data) {
    if (attribute === "all") {
      for (const key of Object.keys(entry)) {
        const val = String(entry[key]).toLowerCase();
        if (val.includes(text)) {
          res.push(entry);
          break;
        }
      }
    } else {
      const val = String(entry[attribute]).toLowerCase();
      if (val.includes(text)) res.push(entry);
    }
  }

  return res;
}

function fillAttributes(data) {
  const select = document.getElementById("search-attribute");
  select.innerHTML = '<option value="all">Sva polja (wildcard)</option>';
  if (data.length === 0) return;
  const attr = Object.keys(data[0]);
  for (const attribute of attr) {
    const opt = document.createElement("option");
    opt.value = attribute;
    opt.textContent = attribute;
    select.appendChild(opt);
  }
}

function downloadFile(content, name, type) {
  const blob = new Blob([content], { type: type });
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = name;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  URL.revokeObjectURL(url);
}

function downloadJSON() {
  const content = JSON.stringify(filteredData);
  downloadFile(content, "podaci.json", "application/json");
}

function generateCSV() {
  if (filteredData.length === 0) {
    alert("Niste odabrali podatke za preuzeti.");
    return;
  }
  let csv = [];
  const rows = document.querySelectorAll("#data-table tr");
  for (let i = 0; i < rows.length; i++) {
    const columns = rows[i].querySelectorAll("td", "th");
    let csvRow = [];
    for (let j = 0; j < columns.length; j++) {
      let val = columns[j].textContent;
      val = val.replaceAll('"', '""');
      csvRow.push('"' + val + '"');
    }
    csv.push(csvRow.join(","));
  }
  return csv.join("\r\n");
}

function downloadCSV() {
  if (filteredData.length === 0) return;
  const content = generateCSV();
  downloadFile(content, "podaci.csv", "text/csv");
}

const form = document.getElementById("filter-form");
const textField = document.getElementById("search-value");
const attrField = document.getElementById("search-attribute");
const exportCSV = document.getElementById("export-csv");
const exportJSON = document.getElementById("export-json");

form.addEventListener("submit", function (event) {
  event.preventDefault();
  const text = textField.value;
  const attribute = attrField.value;
  filteredData = filterData(podaci, text, attribute);
  showTable(filteredData);
});

form.addEventListener("reset", function () {
  filteredData = podaci;
  showTable(podaci);
});

exportCSV.addEventListener("click", function (event) {
  event.preventDefault();
  downloadCSV();
});

exportJSON.addEventListener("click", function (event) {
  event.preventDefault();
  downloadJSON();
});

showTable(podaci);
fillAttributes(podaci);
