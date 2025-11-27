<div class="container">
    <h3 class="mb-4 text-center"><b>Formulario para datos generales y parentescos</b></h3>


    <form id="datosForm" action="<?php echo base_url('/insertGeneralInformation'); ?>" method="POST">

        <hr>
        <div class="form-row">
            <div class="form-group col-md-12">
                <div class="form-check">
                    <!-- valor por defecto si NO se marca -->
                    <input type="hidden" id="datos_consentimiento_hidden" name="datos_consentimiento" value="1">

                    <input class="form-check-input" type="checkbox" id="datos_consentimiento" name="datos_consentimiento" required onchange="toggleFormulario()">
                    <label class="form-check-label font-weight-bold" for="datos_consentimiento">
                        Declaro que he sido informado(a) sobre el objetivo de esta encuesta y doy mi consentimiento para proporcionar mis datos personales de manera voluntaria.
                    </label>
                </div>
            </div>
        </div>
        <hr>
        <div id="formularioCompleto" style="display:none;">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="datos_provincia" class="font-weight-bold">Provincia</label>
                    <select class="form-control" id="datos_provincia" name="datos_provincia">
                        <option value="">-- Selecciona una provincia --</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_canton" class="font-weight-bold">Cantón</label>
                    <select class="form-control" id="datos_canton" name="datos_canton">
                        <option value="" disabled selected>-- Selecciona un cantón --</option>
                    </select>
                </div>

                <!-- Nuevo select: Tipo de Parroquia -->
                <div class="form-group col-md-4">
                    <label for="datos_tipo_parroquia" class="font-weight-bold">Tipo de Parroquia</label>
                    <select class="form-control" id="datos_tipo_parroquia" name="datos_tipo_parroquia" disabled>
                        <option value="" disabled selected>-- Selecciona un cantón --</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parroquias" class="font-weight-bold">Parroquia</label>
                    <select class="form-control" id="datos_parroquias" name="datos_parroquias" disabled>
                        <option value="" disabled selected>-- Selecciona una parroquia --</option>
                    </select>
                </div>
            </div>

            <hr>

            <div class="form-group col-md-12 mt-3 table-responsive">
                <label class="font-weight-bold">Lista de familiares ingresados</label>
            </div>
            <div class="form-group col-md-12 mt-3 table-responsive">
                <table class="table table-bordered" id="tablaParentesco">
                    <thead class="thead-dark">
                        <tr>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Documento</th>
                            <th>Teléfono</th>
                            <th>Etnia</th>
                            <th>Género</th>
                            <th>Nivel Educación</th>
                            <th>Fecha Nacimiento</th>
                            <th>Edad</th>
                            <th>Estado Civil</th>
                            <th>Discapacidad</th>
                            <th>Enf. Catastrófica</th>
                            <th>¿Trabaja?</th>
                            <th>Ocupación</th>
                            <th>Ingreso Mensual</th>
                            <th>Parentesco</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>



            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="datos_parentesco_nombres" class="font-weight-bold">Nombres</label>
                    <input type="text" class="form-control" id="datos_parentesco_nombres" name="datos_parentesco_nombres">
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_apellidos" class="font-weight-bold">Apellidos</label>
                    <input type="text" class="form-control" id="datos_parentesco_apellidos" name="datos_parentesco_apellidos">
                </div>

                <!-- NUEVO CAMPO: Condición de movilidad humana -->
                <div class="form-group col-md-4">
                    <label for="datos_parentesco_movilidad" class="font-weight-bold">Movilidad</label>
                    <select id="datos_parentesco_movilidad" class="form-control" onchange="toggleTipoDocumento()">
                        <option value="">Seleccione</option>
                        <option value="Ecuatoriano">Ecuatoriano</option>
                        <option value="Extranjero">Extranjero</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_documento" class="font-weight-bold">Documento</label>
                    <input type="number" class="form-control" id="datos_parentesco_documento" name="datos_parentesco_documento" disabled>
                </div>


                <div class="form-group col-md-4">
                    <label for="datos_parentesco_celular_telf" class="font-weight-bold">Celular/Teléfono</label>
                    <input type="number" class="form-control" id="datos_parentesco_celular_telf" name="datos_parentesco_celular_telf">
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_etnia" class="font-weight-bold">Etnia</label>
                    <select class="form-control" id="datos_parentesco_etnia" name="datos_parentesco_etnia">
                        <option value="" disabled selected>-- Selecciona Etnia --</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_genero" class="font-weight-bold">Género</label>
                    <select class="form-control" id="datos_parentesco_genero" name="datos_parentesco_genero">
                        <option value="" disabled selected>-- Selecciona Género --</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_nivel_educacion" class="font-weight-bold">Nivel de Educación</label>
                    <select class="form-control" id="datos_parentesco_nivel_educacion" name="datos_parentesco_nivel_educacion">
                        <option value="" disabled selected>-- Selecciona Nivel de Educación --</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_fecha_de_nacimiento" class="font-weight-bold">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" id="datos_parentesco_fecha_de_nacimiento" name="datos_parentesco_fecha_de_nacimiento">
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_edad" class="font-weight-bold">Edad</label>
                    <input type="number" class="form-control" id="datos_parentesco_edad" name="datos_parentesco_edad" min="0">
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_estado_civil" class="font-weight-bold">Estado Civil</label>
                    <select class="form-control" id="datos_parentesco_estado_civil" name="datos_parentesco_estado_civil">
                        <option value="" disabled selected>-- Selecciona Estado Civil --</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_discapacidad" class="font-weight-bold">Discapacidad</label>
                    <select class="form-control" id="datos_parentesco_discapacidad" name="datos_parentesco_discapacidad">
                        <option value="" disabled selected>-- Selecciona --</option>
                        <option value="1">Sí</option>
                        <option value="2">No</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_enfermedad_catastrofica" class="font-weight-bold">Enfermedad Catastrófica</label>
                    <input type="text" class="form-control" id="datos_parentesco_enfermedad_catastrofica" name="datos_parentesco_enfermedad_catastrofica" value="Ninguna" readonly>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_trabaja" class="font-weight-bold">¿Trabaja?</label>
                    <select class="form-control" id="datos_parentesco_trabaja" name="datos_parentesco_trabaja">
                        <option value="" disabled selected>-- Selecciona --</option>
                        <option value="1">Sí</option>
                        <option value="2">No</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_ocupacion" class="font-weight-bold">Ocupación</label>
                    <input type="text" class="form-control" id="datos_parentesco_ocupacion" name="datos_parentesco_ocupacion" value="Ninguna" readonly>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_ingreso_mensual" class="font-weight-bold">Ingreso Mensual</label>
                    <input type="number" step="0.01" class="form-control" id="datos_parentesco_ingreso_mensual" name="datos_parentesco_ingreso_mensual">
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_parentesco_parentesco" class="font-weight-bold">Parentesco</label>
                    <input type="text" class="form-control" id="datos_parentesco_parentesco" name="datos_parentesco_parentesco">
                </div>

                <div class="form-group col-md-12 text-left mt-3">
                    <button type="button" class="btn btn-primary" onclick="addRelationship()">Añadir</button>
                </div>

            </div>

            <hr>



            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="datos_comunidades" class="font-weight-bold">Comunidad</label>
                    <input type="text" class="form-control" id="datos_comunidades" name="datos_comunidades">
                </div>
                <div class="form-group col-md-6">
                    <label for="datos_barrios" class="font-weight-bold">Barrio</label>
                    <input type="text" class="form-control" id="datos_barrios" name="datos_barrios">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-3">
                    <label for="datos_tipo_viviendas" class="font-weight-bold">Tipo de vivienda</label>
                    <select class="form-control" id="datos_tipo_viviendas" name="datos_tipo_viviendas">
                        <option value="">-- Selecciona Tipo de Vivienda --</option>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label for="datos_techos" class="font-weight-bold">Tipo de techo</label>
                    <select class="form-control" id="datos_techos" name="datos_techos">
                        <option value="">-- Selecciona Tipo de Techo --</option>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label for="datos_paredes" class="font-weight-bold">Tipo de pared</label>
                    <select class="form-control" id="datos_paredes" name="datos_paredes">
                        <option value="">-- Selecciona Tipo de Pared --</option>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label for="datos_pisos" class="font-weight-bold">Tipo de piso</label>
                    <select class="form-control" id="datos_pisos" name="datos_pisos">
                        <option value="">-- Selecciona Tipo de Piso --</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="datos_cuarto" class="font-weight-bold">¿Cuántos cuartos?</label>
                    <input type="number" step="1" min="0" class="form-control" id="datos_cuarto" name="datos_cuarto" value="0">
                </div>
                <div class="form-group col-md-4">
                    <label for="datos_combustibles_cocina" class="font-weight-bold">Combustible para cocina</label>
                    <select class="form-control" id="datos_combustibles_cocina" name="datos_combustibles_cocina">
                        <option value="">-- Selecciona Tipo de combustibles cocina --</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="datos_servicios_higienicos" class="font-weight-bold">Servicios higiénicos</label>
                    <select class="form-control" id="datos_servicios_higienicos" name="datos_servicios_higienicos">
                        <option value="">-- Selecciona Tipo de Servicios Higiénicos --</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="datos_viviendas" class="font-weight-bold">Vivienda</label>
                    <select class="form-control" id="datos_viviendas" name="datos_viviendas">
                        <option value="">-- Selecciona Vivienda --</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="datos_pago_vivienda" class="font-weight-bold">Pago de la vivienda</label>
                    <input type="number" step="0.01" min="0" class="form-control" id="datos_pago_vivienda" name="datos_pago_vivienda" value="0">
                </div>
                <div class="form-group col-md-4">
                    <label for="datos_agua" class="font-weight-bold">Servicio de agua</label>
                    <select class="form-control" id="datos_agua" name="datos_agua">
                        <option value="">-- Selecciona Tipo Servicio de Agua --</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="datos_pago_agua" class="font-weight-bold">Pago de agua</label>
                    <input type="number" step="0.01" min="0" class="form-control" id="datos_pago_agua" name="datos_pago_agua" value="0">
                </div>
                <div class="form-group col-md-4">
                    <label for="datos_pago_luz" class="font-weight-bold">Pago de luz</label>
                    <input type="number" step="0.01" min="0" class="form-control" id="datos_pago_luz" name="datos_pago_luz" value="0">
                </div>
                <div class="form-group col-md-4">
                    <label for="datos_cantidad_luz" class="font-weight-bold">Cantidad de luz consumida</label>
                    <input type="number" class="form-control" id="datos_cantidad_luz" name="datos_cantidad_luz" value="0">
                </div>
            </div>

            <div class="form-row">
                <!-- Select Sí/No for internet service -->
                <div class="form-group col-md-4">
                    <label for="datos_internet" class="font-weight-bold">¿Posee servicio de internet?</label>
                    <select class="form-control" id="datos_internet" name="datos_internet" onchange="toggleInternetPago()">
                        <option value="">-- Seleccione --</option>
                        <option value="Sí">Sí</option>
                        <option value="No">No</option>
                    </select>
                </div>

                <!-- Internet payment input (editable if Yes, readonly if No) -->
                <div class="form-group col-md-4">
                    <label for="datos_pago_internet" class="font-weight-bold">Pago de internet</label>
                    <input type="number" step="0.01" min="0" class="form-control" id="datos_pago_internet" name="datos_pago_internet" value="0" readonly>
                </div>

                <!-- Select Sí/No for TV cable -->
                <div class="form-group col-md-4">
                    <label for="datos_tv_cable" class="font-weight-bold">¿Posee TV por cable?</label>
                    <select class="form-control" id="datos_tv_cable" name="datos_tv_cable" onchange="toggleTvPago()">
                        <option value="">-- Seleccione --</option>
                        <option value="Sí">Sí</option>
                        <option value="No">No</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <!-- TV cable payment input (editable if Yes, readonly if No) -->
                <div class="form-group col-md-4">
                    <label for="datos_tv_pago" class="font-weight-bold">Pago de TV por cable</label>
                    <input type="number" step="0.01" min="0" class="form-control" id="datos_tv_pago" name="datos_tv_pago" value="0" readonly>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_eliminacion_basura" class="font-weight-bold">Eliminación de basura</label>
                    <select class="form-control" id="datos_eliminacion_basura" name="datos_eliminacion_basura">
                        <option value="">-- Selecciona Tipo Eliminación de Basura --</option>
                    </select>
                </div>

                <div class="form-group col-md-4">
                    <label for="datos_lugares_mayor_frecuencia_viveres" class="font-weight-bold">Lugares frecuentes de compra de víveres</label>
                    <select class="form-control" id="datos_lugares_mayor_frecuencia_viveres" name="datos_lugares_mayor_frecuencia_viveres">
                        <option value="">-- Selecciona Donde Compra los Víveres --</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="datos_gastos_viveres_alimentacion" class="font-weight-bold">Gastos en alimentación</label>
                    <input type="number" step="0.01" min="0" class="form-control" id="datos_gastos_viveres_alimentacion" name="datos_gastos_viveres_alimentacion" value="0">
                </div>
                <!-- 
            <div class="form-group col-md-3">
                <label for="datos_medio_transporte" class="font-weight-bold">Medio de transporte</label>
                <select class="form-control" id="datos_medio_transporte" name="datos_medio_transporte">
                    <option value="">-- Selecciona Tipo Medio de Transporte --</option>
                </select>
            </div>

            <div class="form-group col-md-3">
                <label for="datos_estado_transporte" class="font-weight-bold">Estado del transporte</label>
                <select class="form-control" id="datos_estado_transporte" name="datos_estado_transporte">
                    <option value="">-- Selecciona el Estado del Transporte --</option>
                </select>
            </div>
            -->

                <!-- Vehicles table -->
                <div class="form-group col-md-12 mt-3">
                    <label class="font-weight-bold">Vehículos</label>
                    <table class="table table-bordered" id="tablaVehiculos" name="tablaVehiculos">
                        <thead>
                            <tr>
                                <th>Tipo de vehículo</th>
                                <th>Estado</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Rows will be added dynamically -->
                        </tbody>
                    </table>
                    <!-- Inputs to add vehicles -->
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label for="datos_medio_transporte" class="font-weight-bold">Tipo de vehículo</label>
                            <select class="form-control" id="datos_medio_transporte">
                                <option value="">-- Selecciona Tipo Medio de Transporte --</option>
                            </select>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="datos_estado_transporte" class="font-weight-bold">Estado del transporte</label>
                            <select class="form-control" id="datos_estado_transporte">
                                <option value="">-- Selecciona el Estado del Transporte --</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-success" onclick="agregarVehiculo()">Agregar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <!-- Select Sí/No for terrenos -->
                <div class="form-group col-md-4">
                    <label for="datos_terrenos" class="font-weight-bold">¿Posee terrenos?</label>
                    <select class="form-control" id="datos_terrenos" name="datos_terrenos">
                        <option value="">-- Seleccione --</option>
                        <option value="Sí">Sí</option>
                        <option value="No">No</option>
                    </select>
                </div>

                <!-- Select Sí/No for celular -->
                <div class="form-group col-md-4">
                    <label for="datos_celular" class="font-weight-bold">¿Posee celular?</label>
                    <select class="form-control" id="datos_celular" name="datos_celular" onchange="toggleCantidadCelulares()">
                        <option value="">-- Seleccione --</option>
                        <option value="Sí">Sí</option>
                        <option value="No">No</option>
                    </select>
                </div>

                <!-- Number of cellphones (editable if Yes, readonly if No) -->
                <div class="form-group col-md-4">
                    <label for="datos_cantidad_celulare" class="font-weight-bold">Cantidad de celulares</label>
                    <input type="number" step="1" min="0" class="form-control" id="datos_cantidad_celulare" name="datos_cantidad_celulare" value="0" readonly>
                </div>
            </div>

            <div class="form-row">
                <!-- Select Sí/No for celular plan -->
                <div class="form-group col-md-6">
                    <label for="datos_plan_celular" class="font-weight-bold">¿Tiene plan de celular?</label>
                    <select class="form-control" id="datos_plan_celular" name="datos_plan_celular">
                        <option value="">-- Seleccione --</option>
                        <option value="Sí">Sí</option>
                        <option value="No">No</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <!-- Campo para poner observacion -->
                <div class="form-group col-md-12">
                    <label for="datos_observacion" class="font-weight-bold">Observaciones</label>
                    <textarea class="form-control" id="datos_observacion" name="datos_observacion" rows="3" placeholder="Escriba las observaciones aquí..."></textarea>
                </div>
            </div>

            <div class="form-row">

                <!-- Resultado automático del sistema -->
                <input type="text" class="form-control" id="datos_resultado_sistema"
                    name="datos_resultado_sistema"
                    value="<?= $dato['datos_resultado_sistema'] ?? 'Pendiente' ?>" readonly>


                <!-- Select Resultado -->
                <div class="form-group col-md-6">
                    <label for="datos_resultado" class="font-weight-bold">Resultado</label>
                    <select class="form-control" id="datos_resultado" name="datos_resultado">
                        <option value="Aprobado">Aprobado</option>
                        <option value="No aprobado" selected>No aprobado</option>
                    </select>
                </div>

                <!-- Criterio centrado -->
                <div class="form-group col-md-6 d-flex align-items-end justify-content-center">
                    <div class="w-100 text-center font-weight-bold" id="criterioMensaje">
                        Criterio
                    </div>
                </div>
            </div>


            <button type="button" class="btn btn-primary mt-3" onclick="validarFormularioDatosGenerales()">Enviar</button>
        </div>
    </form>

</div>