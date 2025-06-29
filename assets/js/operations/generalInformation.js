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
  input.value = input.value.replace(/[^\d]/g, '');
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

  decimalInputs.forEach(id => {
    const el = document.getElementById(id);
    if (el) {
      el.addEventListener("input", validarDecimales);
    }
  });

  // Inputs that only allow integers (no decimals)
  const integerInputs = [
    "datos_cuarto",
    "datos_cantidad_celulare"
  ];

  integerInputs.forEach(id => {
    const el = document.getElementById(id);
    if (el) {
      el.addEventListener("input", validarEnteros);
    }
  });
});
