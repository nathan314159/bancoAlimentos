<style>
    body {
        background: url('assets/img/vegan_food.jpeg') no-repeat center center;
        background-size: cover;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body.modal-open {
        padding-right: 0 !important;
        overflow-y: scroll;
    }

    .login-card {
        background-color: rgba(255, 255, 255, 0.96);
        border-radius: 1rem;
        padding: 2.5rem;
    }

    .login-card h3 {

        font-weight: 700;
    }




   .login-card label {

        font-weight: 500;
    }

    .login-card .form-control {

        padding: 0.75rem 1rem;
        border-radius: 0.5rem;
    }

    .login-card .btn {

        padding: 0.75rem;
        border-radius: 0.5rem;
    }
</style>


<body>

    <div class="container h-100 d-flex align-items-center justify-content-center">
        <div class="row w-100">
            <div class="col-md-8 col-lg-6 mx-auto">

                <div class="card shadow border-0 login-card">
                    <div class="card-body px-5 py-4">
                        <div class="text-center mb-4">
                            <h4 class="font-weight-bold text-primary">Bienvenido</h4>
                            <p class="text-muted"><b>Iniciar sesión</b></p>
                        </div>

                        <form method="post" action="<?= base_url('/enterUser') ?>">
                            <div class="form-group">
                                <label for="users_email"><b>Email</b></label>
                                <input type="text" class="form-control" id="users_email" name="users_email" placeholder="Email...">
                            </div>

                            <div class="form-group">
                                <label for="users_contrasenia"><b>Contraseña</b></label>
                                <input type="password" class="form-control" id="users_contrasenia" name="users_contrasenia" placeholder="Contraseña...">
                            </div>

                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="customCheck">
                                <label class="form-check-label" for="customCheck">Recordar</label>
                            </div>

                            <button type="button" class="btn btn-primary btn-block" id="btnLogin" onclick="enterUser();">
                                Iniciar sesión
                            </button>
                        </form>

                        <?php if (session()->getFlashdata('errors')): ?>
                            <div class="alert alert-danger mt-3" role="alert">
                                <?= session()->getFlashdata("errors"); ?>
                            </div>
                        <?php endif; ?>

                        <hr>
                        <div class="text-center">
                            <a class="small text-primary" href="#" data-toggle="modal" data-target="#forgotPasswordModal">
                                ¿Olvidaste tu contraseña?
                            </a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="register.html">Crear cuenta!</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="forgotPasswordModalLabel">¿Olvidaste tu contraseña?</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <p class="mb-3">Por razones de seguridad, el cambio de clave debe ser solicitado al administrador del sistema.</p>
                    <p class="text-muted small">Contáctalo directamente por los canales oficiales para realizar el procedimiento.</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary px-4" data-dismiss="modal">Entendido</button>
                </div>
            </div>
        </div>
    </div>



    <!-- Bootstrap core JavaScript-->
    <script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<?php echo base_url(); ?>assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<?php echo base_url(); ?>assets/js/sb-admin-2.min.js"></script>

</body>

</html>