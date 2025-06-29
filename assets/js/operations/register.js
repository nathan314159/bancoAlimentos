var verifier = 0;

function registerUser() {
  // Array of required input field IDs
  const requiredFields = [
    "users_nombre",
    "users_apellido",
    "users_nombreUsuario",
    "users_cedula",
    "users_fecha_de_nacimiento",
    "users_genero",
    "users_email",
    "users_telefono",
    "users_contrasenia",
    "users_contrasenia_repeat",
  ];

  let isValid = true;

  // Reset previous styles
  requiredFields.forEach((id) => {
    document.getElementById(id).style.border = "";
  });

  // Check for empty fields or unselected options
  requiredFields.forEach((id) => {
    const input = document.getElementById(id);
    const value = input.value.trim();

    // Check if <select> has default option selected
    if (input.tagName === "SELECT" && input.selectedIndex === 0) {
      input.style.border = "2px solid red";
      isValid = false;
    } else if (value === "") {
      input.style.border = "2px solid red";
      isValid = false;
    }
  });

  // Get password values
  const pass = document.getElementById("users_contrasenia").value.trim();
  const repeatPass = document
    .getElementById("users_contrasenia_repeat")
    .value.trim();

  // Validate password match
  if (pass !== "" && repeatPass !== "" && pass !== repeatPass) {
    alertify.error("Las contraseñas no coinciden.");
    document.getElementById("users_contrasenia").style.border = "2px solid red";
    document.getElementById("users_contrasenia_repeat").style.border =
      "2px solid red";
    isValid = false;
  }

  // Validate password strength: at least 8 characters and 2 special characters
  const specialChars = pass.match(/[^A-Za-z0-9]/g); // Match non-alphanumeric characters
  if (pass.length < 8 || !specialChars || specialChars.length < 2) {
    alertify.error(
      "La contraseña debe tener al menos 8 caracteres y 2 caracteres especiales."
    );
    document.getElementById("users_contrasenia").style.border = "2px solid red";
    isValid = false;
  }

  // If all validations pass, send data via AJAX
  if (isValid) {
    const baseURL =
      window.document.location.origin +
      "/" +
      window.location.pathname.split("/")[1];

    // Collect form data
    const data = {
      users_email: $("#users_email").val(),
      users_cedula: $("#users_cedula").val(),
    };

    // Send AJAX POST request to registerUser route
    $.ajax({
      data: data,
      url: baseURL + "/findUserMail",
      type: "post",
      success: function (response) {
        // Handle backend response
        if (response == 1 && verifier == 0) {
          alertify.success("Usuario registrado exitosamente.");
          verifier = 1;
          document.querySelector("form").submit(); // Submit form if needed
        } else {
          alertify.error("Error al registrar usuario. El usuario ya existe.");
        }
      },
      error: function () {
        // Handle AJAX or server error
        alertify.error("Error en el servidor o en la solicitud.");
      },
    });
  } else {
    // If validation fails, show error
    alertify.error("Por favor, complete todos los campos correctamente.");
  }
}
