let allParishes = []; // Store all parishes globally

$(document).ready(function () {
  selectProvinces();
  loadAllParishes();

  // When province changes, load cantons
  $("#datos_provincia").on("change", function () {
    let selectedProvinciaNombre = $(this).find("option:selected").text().trim();
    selectCitiesByProvincia(selectedProvinciaNombre);

    // Reset and disable tipo parroquia
    $("#datos_tipo_parroquia")
      .prop("disabled", true)
      .html("<option value=''>-- Selecciona tipo de parroquia --</option>");

    // Reset parroquias
    $("#datos_parroquias").html(
      "<option value=''>-- Selecciona una parroquia --</option>"
    );
  });

  // When canton changes, show tipo parroquia options
  $("#datos_canton").on("change", function () {
    const tipoParroquia = $("#datos_tipo_parroquia");

    if ($(this).val() !== "") {
      tipoParroquia.prop("disabled", false);
      tipoParroquia.html(`
        <option value="">-- Selecciona tipo de parroquia --</option>
        <option value="urbano">Urbano</option>
        <option value="rural">Rural</option>
      `);
    } else {
      tipoParroquia.prop("disabled", true);
      tipoParroquia.html(
        "<option value=''>-- Selecciona tipo de parroquia --</option>"
      );
    }

    // Reset parroquias
    $("#datos_parroquias").html(
      "<option value=''>-- Selecciona una parroquia --</option>"
    );
  });

  // When tipo parroquia changes, show filtered parroquias
  $("#datos_tipo_parroquia").on("change", function () {
    filterParishes();
  });
});

// Load provinces
function selectProvinces() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getProvinces",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona una provincia --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_provincia").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de provincias. Contacte al administrador."
      );
    },
  });
}

// Load cantons based on selected province
function selectCitiesByProvincia(nombreProvincia) {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getCities",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona un cantón --</option>";
      info.forEach(function (elemento) {
        if (
          elemento["itc_descripcion"].includes("Cantón de " + nombreProvincia)
        ) {
          tags += `<option value='${elemento["itc_nombre"]}'>${elemento["itc_nombre"]}</option>`;
        }
      });
      $("#datos_canton").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de cantones. Contacte al administrador."
      );
    },
  });
}

// Load all parishes and store in global variable
function loadAllParishes() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getParishes",
    type: "get",
    dataType: "json",
    success: function (info) {
      allParishes = info; // Store for filtering later
      console.log(allParishes);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de parroquias. Contacte al administrador."
      );
    },
  });
}

// Extraer código del cantón a partir del nombre del cantón:
function cantonToCode(selectedCanton) {
  // Busca la primera parroquia que tenga ese cantón y devuelve su código
  const p = allParishes.find(parroquia => {
    // Extraer parte del código que corresponde al cantón, ejemplo 'PARR-IB-URB' -> 'IB'
    const codigoParts = parroquia.itc_codigo.split('-');
    const cantonCode = codigoParts[1]; // índice 1 es el código cantón
    // Verificar si el nombre del cantón está en la descripción (minusculas)
    return parroquia.itc_descripcion.toLowerCase().includes(selectedCanton.toLowerCase());
  });
  if (p) {
    return p.itc_codigo.split('-')[1]; // devolver código cantón encontrado
  }
  return null;
}

function filterParishes() {
  const selectedCanton = $("#datos_canton").val(); // ej: "Ibarra"
  const tipoParroquia = $("#datos_tipo_parroquia").val(); // "urbano" o "rural"

  if (!selectedCanton || !tipoParroquia) {
    $("#datos_parroquias").html(
      "<option disabled selected value=''>-- Selecciona una parroquia --</option>"
    );
    return;
  }

  const cantonCode = cantonToCode(selectedCanton);
  if (!cantonCode) {
    $("#datos_parroquias").html(
      "<option disabled selected value=''>-- Cantón no encontrado --</option>"
    );
    return;
  }

  const tipoParroquiaCod =
    tipoParroquia === "urbano" ? "URB" : tipoParroquia === "rural" ? "RURAL" : "";

  const filtered = allParishes.filter(p => {
    const codigo = p.itc_codigo.toUpperCase();
    return codigo === `PARR-${cantonCode}-${tipoParroquiaCod}`;
  });

  let options = "<option disabled selected value=''>-- Selecciona una parroquia --</option>";
  filtered.forEach(p => {
    options += `<option value="${p.id_item}">${p.itc_nombre}</option>`;
  });

  $("#datos_parroquias").html(options);
}


// Filter parishes based on selected canton and tipo parroquia
/*function filterParishes() {
  const selectedCanton = $("#datos_canton").val(); // Ej: "Tulcán", "San Gabriel"
  const tipoParroquia = $("#datos_tipo_parroquia").val(); // "urbano" o "rural"

  if (!selectedCanton || !tipoParroquia) {
    $("#datos_parroquias").html(
      "<option disabled selected value=''>-- Selecciona una parroquia --</option>"
    );
    return;
  }

  // Mapa de cantones con nombres EXACTOS que vienen del select (incluyendo tildes y espacios)
  const cantonMap = {
    // Imbabura
    Ibarra: "IB",
    Otavalo: "OT",
    Cotacachi: "CO",
    "Antonio Ante": "AA", // corregí código AN a AA porque en tus datos es AA
    Pimampiro: "PI",
    Urcuquí: "UR",

    // Carchi
    Tulcán: "TU",
    Bolívar: "BO",
    Espejo: "ES",
    Montúfar: "MO",
    "San Gabriel": "SG",
  };

  const cantonPrefix = cantonMap[selectedCanton] || "";
  if (!cantonPrefix) {
    $("#datos_parroquias").html(
      "<option disabled selected value=''>-- Cantones no disponibles --</option>"
    );
    return;
  }

  const tipoParroquiaCod =
    tipoParroquia === "urbano"
      ? "URB"
      : tipoParroquia === "rural"
      ? "RURAL"
      : "";

  const filtered = allParishes.filter((p) => {
    const codigo = p.itc_codigo.toUpperCase();
    return codigo.includes(`PARR-${cantonPrefix}-${tipoParroquiaCod}`);
  });

  let options =
    "<option disabled selected value=''>-- Selecciona una parroquia --</option>";
  filtered.forEach((p) => {
    options += `<option value="${p.id_item}">${p.itc_nombre}</option>`;
  });

  $("#datos_parroquias").html(options);
}*/

// Toggle internet payment input editable or readonly
function toggleInternetPago() {
  const internet = document.getElementById("datos_internet").value;
  const pagoInternet = document.getElementById("datos_pago_internet");
  if (internet === "Sí") {
    pagoInternet.readOnly = false;
    pagoInternet.value = "0";
    pagoInternet.type = "number";
    pagoInternet.step = "0.01";
    pagoInternet.min = 0;
  } else {
    pagoInternet.readOnly = true;
    pagoInternet.value = "0";
  }
}

// Toggle TV payment input editable or readonly
function toggleTvPago() {
  const tvCable = document.getElementById("datos_tv_cable").value;
  const pagoTv = document.getElementById("datos_tv_pago");
  if (tvCable === "Sí") {
    pagoTv.readOnly = false;
    pagoTv.value = "0";
    pagoTv.type = "number";
    pagoTv.step = "0.01";
    pagoTv.min = 0;
  } else {
    pagoTv.readOnly = true;
    pagoTv.value = "0";
  }
}

// Toggle number of cellphones editable or readonly
function toggleCantidadCelulares() {
  const celular = document.getElementById("datos_celular").value;
  const cantidadCel = document.getElementById("datos_cantidad_celulare");
  if (celular === "Sí") {
    cantidadCel.readOnly = false;
    cantidadCel.value = "0";
    cantidadCel.step = 1;
    cantidadCel.min = 0;
  } else {
    cantidadCel.readOnly = true;
    cantidadCel.value = "0";
  }
}

// Add vehicle to table
function agregarVehiculo() {
  const tipo = document.getElementById("inputTipoVehiculo").value.trim();
  const estado = document.getElementById("selectEstadoVehiculo").value;

  if (!tipo) {
    alert("Ingrese el tipo de vehículo");
    return;
  }
  if (!estado) {
    alert("Seleccione el estado del vehículo");
    return;
  }

  const tbody = document.querySelector("#tablaVehiculos tbody");
  const row = document.createElement("tr");

  const tdTipo = document.createElement("td");
  tdTipo.textContent = tipo;
  const tdEstado = document.createElement("td");
  tdEstado.textContent = estado;

  // Delete button for each row
  const tdAccion = document.createElement("td");
  const btnEliminar = document.createElement("button");
  btnEliminar.textContent = "Eliminar";
  btnEliminar.className = "btn btn-danger btn-sm";
  btnEliminar.type = "button";
  btnEliminar.onclick = () => row.remove();
  tdAccion.appendChild(btnEliminar);

  row.appendChild(tdTipo);
  row.appendChild(tdEstado);
  row.appendChild(tdAccion);

  tbody.appendChild(row);

  // Clear inputs
  document.getElementById("inputTipoVehiculo").value = "";
  document.getElementById("selectEstadoVehiculo").value = "";
}

// Validate integer input: only allow whole numbers (no decimals)
function validarEnteros(event) {
  let input = event.target;

  // Remove any character that is not digit
  input.value = input.value.replace(/[^\d]/g, "");
}

// Validate decimal input: allow max 2 decimals and replace comma with dot
function validarDecimales(event) {
  let input = event.target;

  // Replace comma with dot if user types comma
  if (event.data === ",") {
    input.value = input.value.slice(0, -1) + ".";
  }

  // Regex to allow only numbers with up to 2 decimal places
  const regex = /^\d*(\.\d{0,2})?$/;
  if (!regex.test(input.value)) {
    // Remove last character if invalid
    input.value = input.value.slice(0, -1);
  }
}

// Attach validation functions to specific inputs on page load
document.addEventListener("DOMContentLoaded", () => {
  // Inputs that allow decimals (with 2 decimal places max)
  const decimalInputs = [
    "datos_pago_vivienda",
    "datos_cantidad_luz",
    "datos_tv_pago",
    "datos_pago_internet",
    "datos_pago_agua",
    "datos_pago_luz",
    "datos_gastos_viveres_alimentacion",
  ];

  decimalInputs.forEach((id) => {
    const el = document.getElementById(id);
    if (el) {
      el.addEventListener("input", validarDecimales);
    }
  });

  // Inputs that only allow integers (no decimals)
  const integerInputs = ["datos_cuarto", "datos_cantidad_celulare"];

  integerInputs.forEach((id) => {
    const el = document.getElementById(id);
    if (el) {
      el.addEventListener("input", validarEnteros);
    }
  });
});
