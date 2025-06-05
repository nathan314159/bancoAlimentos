<?= $this->extend("layout/template"); ?>

<?= $this->section("content"); ?>

<div class="card shadow-lg form-signin">
    <div class="card-body p-5">
        <h1 class="fs-4 card-title fw-bold mb-4">Registro</h1>
        <form method="post" action="<?php echo base_url(); ?>register" autocomplete="off">

            <?= csrf_field(); ?>
            <div class="mb-3">
                <label class="mb-2" for="nombreUsuario">Usuario</label>
                <input type="text" class="form-control" name="nombreUsuario" id="nombreUsuario" value="" required>
            </div>

            <div class="mb-3">
                <label class="mb-2" for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="" required autofocus>
            </div>

            <div class="mb-3">
                <label class="mb-2" for="apellido">Apellido</label>
                <input type="text" class="form-control" name="apellido" id="apellido" value="" required autofocus>
            </div>

            <div class="mb-3">
                <label class="mb-2" for="email">Correo electrónico</label>
                <input type="email" class="form-control" name="email" id="email" value="" required>
            </div>

            <div class="mb-3">
                <label class="mb-2" for="cedula">Cédula</label>
                <input type="text" class="form-control" name="cedula" id="cedula" value="" required>
            </div>

            <div class="mb-3">
                <label class="mb-2" for="telefono">Telefono</label>
                <input type="text" class="form-control" name="telefono" id="telefono" value="" required>
            </div>

            <div class="mb-3">
                <label class="mb-2" for="fechaNacimiento">Fecha de nacimiento</label>
                <input type="date" class="form-control" name="fechaNacimiento" id="fechaNacimiento" value="" required>
            </div>

            <div class="mb-3">
                <label class="mb-2" for="genero">Género</label>
                <select class="form-select" name="genero" id="genero" required>
                    <option value="">Seleccione...</option>
                    <option value="1">Masculino</option>
                    <option value="2">Femenino</option>
                    <option value="3">Otro</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="password">Contraseña</label>
                <input type="password" class="form-control" name="password" id="password" required>
            </div>

            <div class="mb-3">
                <label for="repassword">Confirmar contraseña</label>
                <input type="password" class="form-control" name="repassword" id="repassword" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Registrarse</button>
            </div>

        </form>

        <pre>
                <?php echo base_url('register'); ?>
        </pre>

        <pre>
            <?php print_r(session()->getFlashdata()); ?>
        </pre>


        <?php if (session()->getFlashdata('errors') !== null): ?>

            <div class="alert alert-danger my-3" role="alert">
                <?= session()->getFlashdata("errors"); ?>

            </div>
        <?php endif; ?>
    </div>

    <div class="card-footer py-3 border-0">
        <div class="text-center">
            <a href="login.html">Iniciar sesión</a>
        </div>
    </div>
</div>

<?= $this->endSection(); ?>