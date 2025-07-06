let allParishes = []; // Store all parishes globally

$(document).ready(function () {
  selectProvinces();
  loadAllParishes();
  selectTypesHousing();
  selectRoofTypes();
  selectWallTypes();
  selectFloorTypes();
  selectCookingFuel();
  selectHygienicServices();
  selectHousing();
  selectWaterServices();
  selectGarbageRemoval();
  selectFrequentShopPlaces();
  selectVehiclesTypes();
  selectTransportStatus();

  // When province changes, load cantons
  $("#datos_provincia").on("change", function () {
    let selectedProvinciaNombre = $(this).find("option:selected").text().trim();
    selectCitiesByProvincia(selectedProvinciaNombre);

    // Reset y desactiva tipo de parroquia
    $("#datos_tipo_parroquia")
      .prop("disabled", true)
      .html("<option value=''>-- Selecciona tipo de parroquia --</option>");

    // Reset y desactiva parroquias
    $("#datos_parroquias")
      .prop("disabled", true)
      .html("<option value=''>-- Selecciona una parroquia --</option>");
  });

  // When canton changes, show tipo parroquia options
  $("#datos_canton").on("change", function () {
    const tipoParroquia = $("#datos_tipo_parroquia");

    if ($(this).val() !== "") {
      tipoParroquia.prop("disabled", false).html(`
      <option value="">-- Selecciona tipo de parroquia --</option>
      <option value="urbano">Urbano</option>
      <option value="rural">Rural</option>
    `);
    } else {
      tipoParroquia
        .prop("disabled", true)
        .html("<option value=''>-- Selecciona tipo de parroquia --</option>");
    }

    // Reset y desactiva parroquias
    $("#datos_parroquias")
      .prop("disabled", true)
      .html("<option value=''>-- Selecciona una parroquia --</option>");
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
  const p = allParishes.find((parroquia) => {
    // Extraer parte del código que corresponde al cantón, ejemplo 'PARR-IB-URB' -> 'IB'
    const codigoParts = parroquia.itc_codigo.split("-");
    const cantonCode = codigoParts[1]; // índice 1 es el código cantón
    // Verificar si el nombre del cantón está en la descripción (minusculas)
    return parroquia.itc_descripcion
      .toLowerCase()
      .includes(selectedCanton.toLowerCase());
  });
  if (p) {
    return p.itc_codigo.split("-")[1]; // devolver código cantón encontrado
  }
  return null;
}

function filterParishes() {
  const selectedCanton = $("#datos_canton").val();
  const tipoParroquia = $("#datos_tipo_parroquia").val();

  if (!selectedCanton || !tipoParroquia) {
    $("#datos_parroquias")
      .prop("disabled", true)
      .html(
        "<option disabled selected value=''>-- Selecciona una parroquia --</option>"
      );
    return;
  }

  const cantonLower = selectedCanton.toLowerCase();
  const tipoLower =
    tipoParroquia.toLowerCase() === "urbano" ? "urbana" : "rural";

  const filtered = allParishes.filter((p) => {
    const desc = p.itc_descripcion?.toLowerCase() || "";
    return (
      desc.includes(`parroquia ${tipoLower}`) && desc.includes(cantonLower)
    );
  });

  let options =
    "<option disabled selected value=''>-- Selecciona una parroquia --</option>";
  filtered.forEach((p) => {
    options += `<option value="${p.id_item}">${p.itc_nombre}</option>`;
  });

  $("#datos_parroquias").prop("disabled", false).html(options);
}

// Load types of housing
function selectTypesHousing() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getTypesHousing",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo de Vivienda --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_tipo_viviendas").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de tipos de vivienda. Contacte al administrador."
      );
    },
  });
}

// Load Roof Types
function selectRoofTypes() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getRoofTypes",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo de Techo --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_techos").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de tipos de techo. Contacte al administrador."
      );
    },
  });
}

// Load Wall Types
function selectWallTypes() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getWallTypes",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo de Pared --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_paredes").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de tipos de pared. Contacte al administrador."
      );
    },
  });
}

// Load Floor Types
function selectFloorTypes() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getFloorTypes",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo de Piso --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_pisos").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de tipos de piso. Contacte al administrador."
      );
    },
  });
}

// Load Cooking Fuel
function selectCookingFuel() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getCookingFuel",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo de combustibles cocina --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_combustibles_cocina").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de tipos de combustibles cocina. Contacte al administrador."
      );
    },
  });
}

// Load Hygienic Services
function selectHygienicServices() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getHygienicServices",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo de Servicios Higiénicos --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_servicios_higienicos").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de tipos de servicios higiénicos. Contacte al administrador."
      );
    },
  });
}

// Load Housing
function selectHousing() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getHousing",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Vivienda --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_viviendas").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de viviendas. Contacte al administrador."
      );
    },
  });
}

// Load Water Services
function selectWaterServices() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getWaterServices",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo Servicio de Agua --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_agua").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de servicios de agua. Contacte al administrador."
      );
    },
  });
}

// Load Garbage Removal
function selectGarbageRemoval() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getGarbageRemoval",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo Eliminación de Basura --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_eliminacion_basura").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de eliminación de basura. Contacte al administrador."
      );
    },
  });
}

// Load Frequent Shop Places
function selectFrequentShopPlaces() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getFrequentShopPlaces",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Donde Compra los Víveres --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_lugares_mayor_frecuencia_viveres").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista donde compra los víveres. Contacte al administrador."
      );
    },
  });
}

// Load Vehicles Types
function selectVehiclesTypes() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getVehiclesTypes",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Tipo de Medio de Transporte --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["itc_nombre"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_medio_transporte").html(tags);
      $("#datos_medio_transporte2").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de tipo de vehículos. Contacte al administrador."
      );
    },
  });
}

// Load Transport Status
function selectTransportStatus() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getTransportStatus",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona el Estado de Transporte --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["itc_nombre"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_estado_transporte").html(tags);
      $("#datos_estado_transporte2").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de estados de transporte. Contacte al administrador."
      );
    },
  });
}

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
  const tipo = document.getElementById("datos_medio_transporte").value.trim();
  const estado = document.getElementById("datos_estado_transporte").value;

  if (!tipo) {
    alertify.error("Ingrese el tipo de vehículo");
    return;
  }
  if (!estado) {
    alertify.error("Seleccione el estado del vehículo");
    return;
  }

  const tbody = document.querySelector("#tablaVehiculos tbody");
  const row = document.createElement("tr");

  // Celdas visibles
  const tdTipo = document.createElement("td");
  tdTipo.textContent = tipo;

  const tdEstado = document.createElement("td");
  tdEstado.textContent = estado;

  const tdAcciones = document.createElement("td");
  tdAcciones.innerHTML =
    '<button type="button" class="btn btn-danger btn-sm" onclick="eliminarFila(this)">Eliminar</button>';

  // Inputs ocultos para enviar con POST
  const inputTipo = `<input type="hidden" name="datos_medio_transporte[]" value="${tipo}">`;
  const inputEstado = `<input type="hidden" name="datos_estado_transporte[]" value="${estado}">`;

  // Agregar inputs ocultos dentro de celdas
  tdTipo.innerHTML += inputTipo;
  tdEstado.innerHTML += inputEstado;

  // Armar fila
  row.appendChild(tdTipo);
  row.appendChild(tdEstado);
  row.appendChild(tdAcciones);
  tbody.appendChild(row);
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
    "datos_parentesco_ingreso_mensual",
  ];

  decimalInputs.forEach((id) => {
    const el = document.getElementById(id);
    if (el) {
      el.addEventListener("input", validarDecimales);
    }
  });

  // Inputs that only allow integers (no decimals)
  const integerInputs = [
    "datos_cuarto",
    "datos_cantidad_celulare",
    "datos_parentesco_edad",
  ];

  integerInputs.forEach((id) => {
    const el = document.getElementById(id);
    if (el) {
      el.addEventListener("input", validarEnteros);
    }
  });
});

// Add relationship
function addRelationship() {
  const get = (id) => document.getElementById(id).value.trim();
  const getText = (id) => {
    const el = document.getElementById(id);
    return el.options[el.selectedIndex]?.text || "";
  };

  const datos = {
    nombres: get("datos_parentesco_nombres"),
    apellidos: get("datos_parentesco_apellidos"),
    documento: get("datos_parentesco_documento"),
    telefono: get("datos_parentesco_celular_telf"),
    etnia: get("datos_parentesco_etnia"),
    etniaText: getText("datos_parentesco_etnia"),
    genero: get("datos_parentesco_genero"),
    generoText: getText("datos_parentesco_genero"),
    educacion: get("datos_parentesco_nivel_educacion"),
    educacionText: getText("datos_parentesco_nivel_educacion"),
    nacimiento: get("datos_parentesco_fecha_de_nacimiento"),
    edad: get("datos_parentesco_edad"),
    estado_civil: get("datos_parentesco_estado_civil"),
    estado_civilText: getText("datos_parentesco_estado_civil"),
    discapacidad: get("datos_parentesco_discapacidad"),
    discapacidadText: getText("datos_parentesco_discapacidad"),
    enfermedad: get("datos_parentesco_enfermedad_catastrofica"),
    trabaja: get("datos_parentesco_trabaja"),
    ocupacion: get("datos_parentesco_ocupacion"),
    ingreso: get("datos_parentesco_ingreso_mensual"),
    parentesco: get("datos_parentesco_parentesco"),
  };

  if (!datos.nombres || !datos.apellidos || !datos.documento) {
    alert(
      "Por favor llena al menos los campos obligatorios: nombres, apellidos y documento."
    );
    return;
  }

  const tbody = document.querySelector("#tablaParentesco tbody");
  const row = document.createElement("tr");

  row.innerHTML = `
    <td>${datos.nombres}<input type="hidden" name="parentesco_nombres[]" value="${datos.nombres}"></td>
    <td>${datos.apellidos}<input type="hidden" name="parentesco_apellidos[]" value="${datos.apellidos}"></td>
    <td>${datos.documento}<input type="hidden" name="parentesco_documento[]" value="${datos.documento}"></td>
    <td>${datos.telefono}<input type="hidden" name="parentesco_telefono[]" value="${datos.telefono}"></td>
    <td>${datos.etniaText}<input type="hidden" name="parentesco_etnia[]" value="${datos.etnia}"></td>
    <td>${datos.generoText}<input type="hidden" name="parentesco_genero[]" value="${datos.genero}"></td>
    <td>${datos.educacionText}<input type="hidden" name="parentesco_nivel_educacion[]" value="${datos.educacion}"></td>
    <td>${datos.nacimiento}<input type="hidden" name="parentesco_nacimiento[]" value="${datos.nacimiento}"></td>
    <td>${datos.edad}<input type="hidden" name="parentesco_edad[]" value="${datos.edad}"></td>
    <td>${datos.estado_civilText}<input type="hidden" name="parentesco_estado_civil[]" value="${datos.estado_civil}"></td>
    <td>${datos.discapacidadText}<input type="hidden" name="parentesco_discapacidad[]" value="${datos.discapacidad}"></td>
    <td>${datos.enfermedad}<input type="hidden" name="parentesco_enfermedad[]" value="${datos.enfermedad}"></td>
    <td>${datos.trabaja}<input type="hidden" name="parentesco_trabaja[]" value="${datos.trabaja}"></td>
    <td>${datos.ocupacion}<input type="hidden" name="parentesco_ocupacion[]" value="${datos.ocupacion}"></td>
    <td>${datos.ingreso}<input type="hidden" name="parentesco_ingreso[]" value="${datos.ingreso}"></td>
    <td>${datos.parentesco}<input type="hidden" name="parentesco_parentesco[]" value="${datos.parentesco}"></td>
    <td><button type="button" class="btn btn-danger btn-sm" onclick="this.closest('tr').remove()">Eliminar</button></td>
  `;

  tbody.appendChild(row);

  console.log(datos);

  // Clean form
  document
    .querySelectorAll(".form-row input, .form-row select")
    .forEach((el) => (el.value = ""));
}
