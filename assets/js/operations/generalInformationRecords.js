// generalInformationRecords.js
$(document).ready(function () {
  $("#generalRecordsTable").DataTable();
});

document.querySelectorAll("#generalRecordsTable button").forEach((btn) => {
  btn.addEventListener("click", function () {
    const id_datos_parentesco = this.dataset.id;
    const parentesco = this.innerText.trim();

    let baseURL =
      window.location.origin + "/" + window.location.pathname.split("/")[1];

    $.ajax({
      url: baseURL + "/getRelationShipId",
      type: "POST",
      data: { id_datos_parentesco: id_datos_parentesco },
      dataType: "json",
      success: function (info) {
        if (!info) return;

        // Llenar inputs del modal con los datos obtenidos
        $("#p_nombres").val(info.datos_parentesco_nombres);
        $("#p_apellidos").val(info.datos_parentesco_apellidos);
        $("#p_documento").val(info.datos_parentesco_documento);
        $("#p_celular").val(info.datos_parentesco_celular_telf);
        $("#p_etnia").val(info.etnia);
        $("#p_genero").val(info.genero);
        $("#p_educacion").val(info.nivel_educacion);
        $("#p_nacimiento").val(info.datos_parentesco_fecha_de_nacimiento);
        $("#p_edad").val(info.datos_parentesco_edad);
        $("#p_estado_civil").val(info.estado_civil);
        $("#p_discapacidad").val(info.discapacidad);
        $("#p_enfermedad").val(info.datos_parentesco_enfermedad_catastrofica);
        $("#p_trabaja").val(info.datos_parentesco_trabaja);
        $("#p_ocupacion").val(info.datos_parentesco_ocupacion);
        $("#p_ingreso").val(info.datos_parentesco_ingreso_mensual);
        $("#p_parentesco").val(info.datos_parentesco_parentesco);

        // Mostrar modal
        $("#modalParentesco").modal("show");
      },
      error: function () {
        console.log(
          "No se pudo obtener los datos del parentesco. Contacte al administrador."
        );
      },
    });
  });
});

function deleteGeneralInformation(id_dato) {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];
  $.ajax({
    url: baseURL + "/deleteGeneralInformationRecord",
    type: "POST",
    data: { id_datos_generales: id_dato },
    success: function (info) {
      console.log(info)
      alertify.success('El registro se ha eliminado con éxito.')
      window.location.href = baseURL + "/informationRecords";
    },
    error: function () {
      console.log(
        "No se pudo obtener los datos del parentesco. Contacte al administrador."
      );
    },
  });
}
