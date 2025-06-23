var verifier = 0;
function enterUser() {
  let users_email = $("#users_email").val();
  let users_contrasenia = $("#users_contrasenia").val();
  let baseURL =
    window.document.location.origin +
    "/" +
    window.location.pathname.split("/")[1];
  $.ajax({
    data: { users_email: users_email, users_contrasenia: users_contrasenia },
    url: baseURL + "/verifyUser", //File that receives the request
    type: "post", //send method
    success: function (file) {
      //Once the file receives the request, it processes it and returns it.
      if (file == 1 && verifier == 0) {
        let typeId = document.getElementById("btnLogin");
        typeId.type = "submit";
        verifier = 1;
        typeId.click();
      } else if (file == 0 && verifier == 0) {
        alertify.error("Nombre o contraseña incorrectos");
      }
    },
  });
}
