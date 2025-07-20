document.getElementById("formUsuario").addEventListener("submit", function (e) {
  e.preventDefault(); // Detenemos siempre, y luego enviamos manualmente si todo va bien

  let valid = true;

  const emailInput = document.getElementById("users_email");
  const telefonoInput = document.getElementById("users_telefono");

  const email = emailInput.value.trim();
  const telefono = telefonoInput.value.trim();

  // Validación de correo
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (email === "" || !emailRegex.test(email)) {
    emailInput.classList.add("is-invalid");
    valid = false;
  } else {
    emailInput.classList.remove("is-invalid");
  }

  // Validación de teléfono (no vacío y solo dígitos)
  const telefonoRegex = /^[0-9]+$/;
  if (telefono === "" || !telefonoRegex.test(telefono)) {
    telefonoInput.classList.add("is-invalid");
    valid = false;
  } else {
    telefonoInput.classList.remove("is-invalid");
  }

  if (!valid) {
    alertify.error(
      "Por favor complete correctamente los campos marcados con rojo."
    );
    return;
  }

  // Confirmación con alertify
  alertify.confirm(
    "Confirmación",
    "<b>¿Está seguro de cambiar los datos?</b><br><i>(Su sesión se cerrará después de la actualización)</i>",
    function () {
      // Si el usuario confirma, enviamos el formulario
      document.getElementById("formUsuario").submit();
    },
    function () {
      // Si el usuario cancela, no hacemos nada
      alertify.error("Se canceló la actualización.");
    }
  );
});

document
  .getElementById("formContrasenia")
  .addEventListener("submit", function (e) {
    e.preventDefault(); // Detener envío por defecto

    const passInput = document.getElementById("users_contrasenia");
    const passConfirmInput = document.getElementById(
      "users_contrasenia_confirmar"
    );

    const password = passInput.value.trim();
    const confirmPassword = passConfirmInput.value.trim();

    let valid = true;

    // Verificar mínimo 8 caracteres
    const longEnough = password.length >= 8;

    // Verificar al menos 2 caracteres especiales
    const specialChars = password.match(/[^A-Za-z0-9]/g);
    const hasTwoSpecial = specialChars && specialChars.length >= 2;

    // Validación general de contraseña
    if (!longEnough || !hasTwoSpecial) {
      passInput.classList.add("is-invalid");
      alertify.error(
        "La contraseña debe tener al menos 8 caracteres y 2 caracteres especiales."
      );
      valid = false;
    } else {
      passInput.classList.remove("is-invalid");
    }

    // Validación de confirmación de contraseña
    if (password !== confirmPassword) {
      passConfirmInput.classList.add("is-invalid");
      alertify.error("Las contraseñas no coinciden.");
      valid = false;
    } else {
      passConfirmInput.classList.remove("is-invalid");
    }

    if (!valid) return;

    // Confirmación final con alertify
    alertify.confirm(
      "Confirmación",
      "<b>¿Está seguro de cambiar su contraseña?</b><br><i>(Su sesión se cerrará después de la actualización)</i>",
      function () {
        document.getElementById("formContrasenia").submit();
      },
      function () {
        alertify.message("Actualización cancelada");
      }
    );
  });

// search document
function searchUserDocument() {
  let baseURL =
    window.location.origin + "/" + window.location.pathname.split("/")[1];

  let cedula = $("#cedula_buscar").val();

  $.ajax({
    data: { document: cedula },
    url: baseURL + "/getDocument",
    type: "post",
    dataType: "json",
    success: function (info) {
      if (info && Object.keys(info).length > 0) {
        alertify.success("Usuario encontrado.");
        // Usuario encontrado: habilitar select y botón
        $("#nuevo_rol").prop("disabled", false);
        $("button[type=submit]").prop("disabled", false);
        info.forEach(function (elemento) {
          $("#id_users").val(elemento["id_users"]);
        });
        
        // Llenar select con roles (segundo ajax)
        $.ajax({
          data: { document: cedula },
          url: baseURL + "/getRoles",
          type: "post",
          dataType: "json",
          success: function (roles) {
            let tags =
              "<option disabled selected value=''>Seleccione un rol</option>";
            roles.forEach(function (elemento) {
              tags += `<option value='${elemento["id_rol"]}'>${elemento["rol_nombre"]}</option>`;
            });
            $("#nuevo_rol").html(tags);
          },
          error: function () {
            console.log("Ha sucedido un error cargando los roles.");
          },
        });
      } else {
        // Usuario no encontrado: deshabilitar select y botón
        alertify.error("Usuario no encontrado con la cédula proporcionada.");
        $("#id_users").val('');
        $("#nuevo_rol")
          .prop("disabled", true)
          .html(
            "<option disabled selected value=''>Seleccione un rol</option>"
          );
        $("button[type=submit]").prop("disabled", true);
      }
    },
    error: function () {
      console.log("Ha sucedido un error buscando el usuario.");
    },
  });
}
