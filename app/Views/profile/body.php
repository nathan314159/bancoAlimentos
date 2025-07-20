<div class="container">
    <h3 class="mb-4 text-center"><b>Datos de perfil</b></h3>
    <hr>

    <div class="row">
        <!-- Formulario de datos de usuario -->
        <div class="col-md-6">
            <div class="card shadow border-primary">
                <div class="card-body">
                    <h5 class="card-title text-primary text-center mb-3"><b>Datos del Usuario</b></h5>
                    <form id="formUsuario" action="<?php echo base_url('/updateProfile'); ?>" method="POST">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="users_nombre" class="font-weight-bold">Nombre</label>
                                <input type="text" class="form-control" id="users_nombre" name="users_nombre"
                                    value="<?= $user->users_nombre ?>" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="users_apellido" class="font-weight-bold">Apellido</label>
                                <input type="text" class="form-control" id="users_apellido" name="users_apellido"
                                    value="<?= $user->users_apellido ?>" disabled>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="users_nombreUsuario" class="font-weight-bold">Usuario</label>
                                <input type="text" class="form-control" id="users_nombreUsuario" name="users_nombreUsuario"
                                    value="<?= $user->users_nombreUsuario ?>" required disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="users_cedula" class="font-weight-bold">Cédula</label>
                                <input type="text" class="form-control" id="users_cedula" name="users_cedula"
                                    value="<?= $user->users_cedula ?>" disabled>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="users_email" class="font-weight-bold">Correo electrónico</label>
                                <input type="email" class="form-control" id="users_email" name="users_email"
                                    value="<?= $user->users_email ?>">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="users_telefono" class="font-weight-bold">Teléfono</label>
                                <input type="number" class="form-control" id="users_telefono" name="users_telefono"
                                    value="<?= $user->users_telefono ?>" step="1" oninput="this.value = this.value.replace(/[^0-9]/g, '')">

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="users_fecha_de_nacimiento" class="font-weight-bold">Fecha de nacimiento</label>
                                <input type="date" class="form-control" id="users_fecha_de_nacimiento" name="users_fecha_de_nacimiento"
                                    value="<?= $user->users_fecha_de_nacimiento ?>" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="users_genero" class="font-weight-bold">Género</label>
                                <input type="text" class="form-control" id="users_genero" name="users_genero"
                                    value="<?= $user->users_genero ?>" disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="users_rol" class="font-weight-bold">Rol</label>
                            <input type="text" class="form-control" id="users_rol" name="users_rol"
                                value="<?= $user->rol_nombre ?>" disabled>
                        </div>

                        <button type="submit" class="btn btn-success mt-3 btn-block">Guardar Datos</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Formulario solo para contraseña -->
        <div class="col-md-6">
            <div class="card shadow border-secondary">
                <div class="card-body">
                    <h5 class="card-title text-secondary text-center mb-3"><b>Actualizar Contraseña</b></h5>
                    <form id="formContrasenia" action="<?php echo base_url('/updateProfilePassword'); ?>" method="POST">
                        <div class="form-group">
                            <label for="users_contrasenia" class="font-weight-bold">Nueva Contraseña</label>
                            <input type="password" class="form-control" id="users_contrasenia" name="users_contrasenia" required>
                        </div>
                        <div class="form-group">
                            <label for="users_contrasenia_confirmar" class="font-weight-bold">Repetir Contraseña</label>
                            <input type="password" class="form-control" id="users_contrasenia_confirmar" name="users_contrasenia_confirmar" required>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3 btn-block">Actualizar Contraseña</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br>
    <?php if (session('rol_nombre') == 'Administrador') { ?>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow border-danger">
                    <div class="card-body">
                        <h5 class="card-title text-danger text-center mb-3"><b>Gestión de Usuario</b></h5>
                        <form id="formAdminGestion" action="<?= base_url('/updateRolUser') ?>" method="POST">
                            <div class="form-row align-items-end">
                                <div class="form-group col-md-6">
                                    <label for="cedula_buscar" class="font-weight-bold">Cédula del Usuario</label>
                                    <input type="text" class="form-control" id="cedula_buscar" name="cedula_buscar" placeholder="Ingrese la cédula" required>
                                    <input type="hidden" class="form-control" id="id_users" name="id_users" required>
                                </div>
                                <div class="form-group col-md-2">
                                    <button type="button" class="btn btn-info btn-block" id="btnBuscarCedula" onclick="searchUserDocument()">Buscar</button>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="nuevo_rol" class="font-weight-bold">Seleccione Rol</label>
                                    <select class="form-control" id="nuevo_rol" name="nuevo_rol" required disabled>
                                        <option value="" selected disabled>Seleccione un rol</option>
                                    </select>
                                </div>
                            </div>

                            <input type="hidden" name="user_id_actualizar" id="user_id_actualizar">

                            <button type="submit" class="btn btn-danger mt-3 btn-block" disabled>Actualizar Datos</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br>
    <?php } ?>

</div>