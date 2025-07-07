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
  selectEthnicity();
  selectGenders();
  selectEducationLevel();
  selectMaritalStatus();

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

// Load ethnicity
function selectEthnicity() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getEthnicity",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Etnia --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_parentesco_etnia").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de etnias. Contacte al administrador."
      );
    },
  });
}

// Load genders
function selectGenders() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getGenders",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Género --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_parentesco_genero").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de géneros. Contacte al administrador."
      );
    },
  });
}

// Load education level
function selectEducationLevel() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getEducationLevel",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Nivel de Educación --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_parentesco_nivel_educacion").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de niveles de educación. Contacte al administrador."
      );
    },
  });
}

// Load marital status
function selectMaritalStatus() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  $.ajax({
    url: baseURL + "/getMaritalStatus",
    type: "get",
    dataType: "json",
    success: function (info) {
      let tags =
        "<option disabled selected value=''>-- Selecciona Estado Civil --</option>";
      info.forEach(function (elemento) {
        tags += `<option value='${elemento["id_item"]}'>${elemento["itc_nombre"]}</option>`;
      });
      $("#datos_parentesco_estado_civil").html(tags);
    },
    error: function () {
      console.log(
        "No se pudo obtener la lista de niveles de educación. Contacte al administrador."
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

document.addEventListener("DOMContentLoaded", function () {
  const selectTrabaja = document.getElementById("datos_parentesco_trabaja");
  const inputOcupacion = document.getElementById("datos_parentesco_ocupacion");

  selectTrabaja.addEventListener("change", function () {
    if (this.value === "1") {
      inputOcupacion.readOnly = false;
      inputOcupacion.value = "";
    } else if (this.value === "2") {
      inputOcupacion.readOnly = true;
      inputOcupacion.value = "Ninguna";
    }
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const selectDiscapacidad = document.getElementById(
    "datos_parentesco_discapacidad"
  );
  const inputDiscapacidad = document.getElementById(
    "datos_parentesco_enfermedad_catastrofica"
  );

  selectDiscapacidad.addEventListener("change", function () {
    if (this.value === "1") {
      inputDiscapacidad.readOnly = false;
      inputDiscapacidad.value = "";
    } else if (this.value === "2") {
      inputDiscapacidad.readOnly = true;
      inputDiscapacidad.value = "Ninguna";
    }
  });
});

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
    "datos_parentesco_documento",
    "datos_parentesco_celular_telf",
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
/*
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
    trabajaText: getText("datos_parentesco_trabaja"),
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
    <td>${datos.trabajaText}<input type="hidden" name="parentesco_trabaja[]" value="${datos.trabajaText}"></td>
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
*/
function addRelationship() {
  const get = (id) => document.getElementById(id);
  const getValue = (id) => get(id).value.trim();
  const getText = (id) => {
    const el = get(id);
    return el.options[el.selectedIndex]?.text || "";
  };

  const datos = {
    nombres: get("datos_parentesco_nombres"),
    apellidos: get("datos_parentesco_apellidos"),
    documento: get("datos_parentesco_documento"),
    telefono: get("datos_parentesco_celular_telf"),
    etnia: get("datos_parentesco_etnia"),
    genero: get("datos_parentesco_genero"),
    educacion: get("datos_parentesco_nivel_educacion"),
    nacimiento: get("datos_parentesco_fecha_de_nacimiento"),
    edad: get("datos_parentesco_edad"),
    estado_civil: get("datos_parentesco_estado_civil"),
    discapacidad: get("datos_parentesco_discapacidad"),
    enfermedad: get("datos_parentesco_enfermedad_catastrofica"),
    trabaja: get("datos_parentesco_trabaja"),
    ocupacion: get("datos_parentesco_ocupacion"),
    ingreso: get("datos_parentesco_ingreso_mensual"),
    parentesco: get("datos_parentesco_parentesco"),
  };

  const camposFaltantes = [];

  for (const key in datos) {
    const campo = datos[key];
    const valor = campo.value.trim();
    if (!valor) {
      camposFaltantes.push({
        id: campo.id,
        nombre: campo.labels?.[0]?.innerText || campo.id,
      });
      campo.classList.add("border", "border-danger");
      setTimeout(() => campo.classList.remove("border", "border-danger"), 3000);
    }
  }

  if (camposFaltantes.length > 0) {
    camposFaltantes.forEach((campo) => {
      alertify.error(`Falta completar: ${campo.nombre}`);
    });
    return;
  }

  // Construcción del objeto limpio
  const limpio = {
    nombres: datos.nombres.value,
    apellidos: datos.apellidos.value,
    documento: datos.documento.value,
    telefono: datos.telefono.value,
    etnia: datos.etnia.value,
    etniaText: getText("datos_parentesco_etnia"),
    genero: datos.genero.value,
    generoText: getText("datos_parentesco_genero"),
    educacion: datos.educacion.value,
    educacionText: getText("datos_parentesco_nivel_educacion"),
    nacimiento: datos.nacimiento.value,
    edad: datos.edad.value,
    estado_civil: datos.estado_civil.value,
    estado_civilText: getText("datos_parentesco_estado_civil"),
    discapacidad: datos.discapacidad.value,
    discapacidadText: getText("datos_parentesco_discapacidad"),
    enfermedad: datos.enfermedad.value,
    trabaja: datos.trabaja.value,
    trabajaText: getText("datos_parentesco_trabaja"),
    ocupacion: datos.ocupacion.value,
    ingreso: datos.ingreso.value,
    parentesco: datos.parentesco.value,
  };

  const tbody = document.querySelector("#tablaParentesco tbody");
  const row = document.createElement("tr");

  row.innerHTML = `
    <td>${limpio.nombres}<input type="hidden" name="parentesco_nombres[]" value="${limpio.nombres}"></td>
    <td>${limpio.apellidos}<input type="hidden" name="parentesco_apellidos[]" value="${limpio.apellidos}"></td>
    <td>${limpio.documento}<input type="hidden" name="parentesco_documento[]" value="${limpio.documento}"></td>
    <td>${limpio.telefono}<input type="hidden" name="parentesco_telefono[]" value="${limpio.telefono}"></td>
    <td>${limpio.etniaText}<input type="hidden" name="parentesco_etnia[]" value="${limpio.etnia}"></td>
    <td>${limpio.generoText}<input type="hidden" name="parentesco_genero[]" value="${limpio.genero}"></td>
    <td>${limpio.educacionText}<input type="hidden" name="parentesco_nivel_educacion[]" value="${limpio.educacion}"></td>
    <td>${limpio.nacimiento}<input type="hidden" name="parentesco_nacimiento[]" value="${limpio.nacimiento}"></td>
    <td>${limpio.edad}<input type="hidden" name="parentesco_edad[]" value="${limpio.edad}"></td>
    <td>${limpio.estado_civilText}<input type="hidden" name="parentesco_estado_civil[]" value="${limpio.estado_civil}"></td>
    <td>${limpio.discapacidadText}<input type="hidden" name="parentesco_discapacidad[]" value="${limpio.discapacidad}"></td>
    <td>${limpio.enfermedad}<input type="hidden" name="parentesco_enfermedad[]" value="${limpio.enfermedad}"></td>
    <td>${limpio.trabajaText}<input type="hidden" name="parentesco_trabaja[]" value="${limpio.trabajaText}"></td>
    <td>${limpio.ocupacion}<input type="hidden" name="parentesco_ocupacion[]" value="${limpio.ocupacion}"></td>
    <td>${limpio.ingreso}<input type="hidden" name="parentesco_ingreso[]" value="${limpio.ingreso}"></td>
    <td>${limpio.parentesco}<input type="hidden" name="parentesco_parentesco[]" value="${limpio.parentesco}"></td>
    <td><button type="button" class="btn btn-danger btn-sm" onclick="this.closest('tr').remove()">Eliminar</button></td>
  `;

  tbody.appendChild(row);

  // Limpiar formulario
  [
    "datos_parentesco_nombres",
    "datos_parentesco_apellidos",
    "datos_parentesco_documento",
    "datos_parentesco_celular_telf",
    "datos_parentesco_etnia",
    "datos_parentesco_genero",
    "datos_parentesco_nivel_educacion",
    "datos_parentesco_fecha_de_nacimiento",
    "datos_parentesco_edad",
    "datos_parentesco_estado_civil",
    "datos_parentesco_discapacidad",
    "datos_parentesco_enfermedad_catastrofica",
    "datos_parentesco_trabaja",
    "datos_parentesco_ocupacion",
    "datos_parentesco_ingreso_mensual",
    "datos_parentesco_parentesco",
  ].forEach((id) => {
    const campo = document.getElementById(id);
    if (campo) {
      if (id === "datos_parentesco_ocupacion") {
        campo.value = "Ninguna";
        campo.readOnly = true;
      } else {
        campo.value = "";
      }
    }
  });
}

function validarFormularioDatosGenerales() {
  const campos = document.querySelectorAll(
    `#datos_provincia,
     #datos_canton,
     #datos_tipo_parroquia,
     #datos_parroquias,
     #datos_comunidades,
     #datos_barrios,
     #datos_tipo_viviendas,
     #datos_techos,
     #datos_paredes,
     #datos_pisos,
     #datos_cuarto,
     #datos_combustibles_cocina,
     #datos_servicios_higienicos,
     #datos_viviendas,
     #datos_pago_vivienda,
     #datos_agua,
     #datos_pago_agua,
     #datos_pago_luz,
     #datos_cantidad_luz,
     #datos_internet,
     #datos_pago_internet,
     #datos_tv_cable,
     #datos_tv_pago,
     #datos_eliminacion_basura,
     #datos_lugares_mayor_frecuencia_viveres,
     #datos_gastos_viveres_alimentacion,
     #datos_medio_transporte,
     #datos_estado_transporte,
     #datos_terrenos,
     #datos_celular,
     #datos_cantidad_celulare,
     #datos_plan_celular`
  );

  let errores = 0;

  // Validar campos vacíos
  campos.forEach((campo) => {
    const valor = campo.value.trim();
    const label = campo.labels?.[0]?.innerText || campo.id;

    if (valor === "") {
      errores++;
      campo.classList.add("border", "border-danger");
      setTimeout(() => campo.classList.remove("border", "border-danger"), 3000);
      alertify.error(`El campo "${label}" es obligatorio`);
    }
  });

  // Validar tabla de parentesco
  const parentescoFilas = document.querySelectorAll(
    "#tablaParentesco tbody tr"
  );
  if (parentescoFilas.length === 0) {
    errores++;
    alertify.error(
      "Debe ingresar al menos un familiar en la tabla de parentesco"
    );
  }

  // Validar tabla de vehículos
  const vehiculoFilas = document.querySelectorAll("#tablaVehiculos tbody tr");
  if (vehiculoFilas.length === 0) {
    errores++;
    alertify.error(
      "Debe ingresar al menos un vehículo en la tabla de vehículos"
    );
  }

  // Enviar si no hay errores
  if (errores === 0) {
    const boton = document.querySelector('button[type="button"].btn-primary');
    if (boton) {
      boton.setAttribute("type", "submit");
      boton.click(); // disparamos el submit
    }
  }
}
