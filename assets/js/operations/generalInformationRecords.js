// generalInformationRecords.js
$(document).ready(function () {
  $("#generalRecordsTable").DataTable();
});

document.querySelectorAll("#generalRecordsTable button").forEach((btn) => {
  btn.addEventListener("click", function () {
    const parentesco = this.innerText.trim();

    // Datos simulados (solo frontend por ahora)
    const datosSimulados = {
      nombres: "Juan",
      apellidos: "Pérez",
      documento: "0102030405",
      celular: "0991234567",
      etnia: "Mestizo",
      genero: "Masculino",
      educacion: "Secundaria",
      nacimiento: "1990-05-20",
      edad: "34",
      estado_civil: "Soltero",
      discapacidad: "No",
      enfermedad: "Ninguna",
      trabaja: "Sí",
      ocupacion: "Agricultor",
      ingreso: "300.00",
      parentesco: parentesco,
    };

    // Llenar inputs del modal
    for (const [key, value] of Object.entries(datosSimulados)) {
      const input = document.getElementById(`p_${key}`);
      if (input) input.value = value;
    }

    // Mostrar modal
    $("#modalParentesco").modal("show");
  });
});
