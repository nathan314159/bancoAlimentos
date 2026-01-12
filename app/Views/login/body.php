<!DOCTYPE html>
<html lang="en">

<head>
    <title>Iniciar sesión</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="<?php echo base_url(); ?>assets/login/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/login/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/login/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/login/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/login/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/login/css/util.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/login/css/main.css">
    <!--===============================================================================================-->
    <!--ALERTIFY-->
    <link href="<?php echo base_url(); ?>/assets/css/alertify/alertify.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>/assets/css/alertify/themes/default.css" rel="stylesheet">
</head>

<body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="<?php echo base_url(); ?>/resources/Versión-circular-Fondo-Blanco.png"
                        alt="Logo"
                        >
                </div>

                <form class="login100-form validate-form" method="post" action="<?= base_url('/enterUser') ?>">
                    <span class="login100-form-title">
                        Iniciar sesión
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Email válido requerido: ex@abc.xyz">
                        <input class="input100" type="text" name="users_email" id="users_email" placeholder="Email">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Contraseña válida requerida: contra_#@s3ña">
                        <input class="input100" type="password" name="users_contrasenia" id="users_contrasenia" placeholder="Contraseña">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn" id="btnLogin" onclick="enterUser();" type="button">
                            Iniciar sesión
                        </button>
                    </div>

                    <div class="text-center p-t-12">
                        <a class="txt2" href="#" data-toggle="modal" data-target="#forgotPasswordModal">
                            Olvidé mi contraseña
                        </a>
                    </div>

                    <div class="text-center p-t-136">
                        <a class="txt2" href="<?= base_url('/createAccountView') ?>">
                            Crear cuenta
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="forgotPasswordModalLabel"><b>¿Olvidaste tu contraseña?</b></h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-justify">
                    <p class="mb-3"><b>Por razones de seguridad, Banco de Alimentos te informa que el cambio de clave debe ser solicitado al administrador del sistema. Gracias por tu comprensión.</b></p>
                    <!-- <p class="text-muted"><b>Nombre de administrador:</b> Juan Alvarez</p>
                    <p class="text-muted"><b>Contacto:</b> 0900200300</p> -->
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary px-4" data-dismiss="modal"><b>Entendido</b></button>
                </div>
            </div>
        </div>
    </div>




    <!--===============================================================================================-->
    <script src="<?php echo base_url(); ?>assets/login/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="<?php echo base_url(); ?>assets/login/vendor/bootstrap/js/popper.js"></script>
    <script src="<?php echo base_url(); ?>assets/login/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="<?php echo base_url(); ?>assets/login/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="<?php echo base_url(); ?>assets/login/vendor/tilt/tilt.jquery.min.js"></script>
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>
    <!--===============================================================================================-->
    <script src="<?php echo base_url(); ?>assets/login/js/main.js"></script>

    <!-- Alertify -->
    <script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>/assets/js/alertify/alertify.js"></script>
    <script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>/assets/js/alertify/alertify.min.js"></script>

    <!-- Session control -->
    <script src="<?php echo base_url(); ?>/assets/js/operations/login.js"></script>
</body>

</html>