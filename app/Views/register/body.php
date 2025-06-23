<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Crear cuenta</title>

    <!-- Icons font CSS-->
    <link href="<?php echo base_url(); ?>assets/register/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url(); ?>assets/register/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="<?php echo base_url(); ?>assets/register/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<?php echo base_url(); ?>assets/register/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="<?php echo base_url(); ?>assets/register/css/main.css" rel="stylesheet" media="all">

    <!--ALERTIFY-->
    <link href="<?php echo base_url(); ?>/assets/css/alertify/alertify.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>/assets/css/alertify/themes/default.css" rel="stylesheet">
</head>

<body>
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title"><b>Crear cuenta</b></h2>
                    <form method="POST" action="<?= base_url('/registerUser') ?>">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="label">Nombres</label>
                                    <input class="input--style-4" type="text" name="users_nombre" id="users_nombre">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Apellidos</label>
                                    <input class="input--style-4" type="text" name="users_apellido" id="users_apellido">
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Nombre de usuario</label>
                                    <input class="input--style-4" type="text" name="users_nombreUsuario" id="users_nombreUsuario">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Cédula</label>
                                    <input class="input--style-4" type="text" name="users_cedula" id="users_cedula">
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Fecha de nacimiento</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4" type="date" name="users_fecha_de_nacimiento" id="users_fecha_de_nacimiento">
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label" for="users_genero">Género</label>
                                    <select class="input--style-4" name="users_genero" id="users_genero">
                                        <option disabled selected>Seleccione...</option>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                        <option value="3">Otro</option>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="users_email" id="users_email">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Teléfono</label>
                                    <input class="input--style-4" type="text" name="users_telefono" id="users_telefono">
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Contraseña</label>
                                    <input class="input--style-4" type="password" name="users_contrasenia" id="users_contrasenia">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Repetir contraseña</label>
                                    <input class="input--style-4" type="password" name="users_contrasenia_repeat" id="users_contrasenia_repeat">
                                </div>
                            </div>
                        </div>

                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Crear cuenta</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="<?php echo base_url(); ?>assets/register/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="<?php echo base_url(); ?>assets/register/vendor/select2/select2.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/register/vendor/datepicker/moment.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/register/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="<?php echo base_url(); ?>assets/register/js/global.js"></script>

    <!-- Alertify -->
    <script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>/assets/js/alertify/alertify.js"></script>
    <script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>/assets/js/alertify/alertify.min.js"></script>

</body>

</html>
<!-- end document-->