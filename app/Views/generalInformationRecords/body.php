<div class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="formExportExcel" action="<?= base_url('/exportExcel'); ?>" method="POST">
                    <div class="form-row justify-content-center">
                        <div class="form-group col-md-6">
                            <label for="fechaDesde" class="font-weight-bold">Desde</label>
                            <input type="date" class="form-control" id="fechaDesde" name="fechaDesde" required>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="fechaHasta" class="font-weight-bold">Hasta</label>
                            <input type="date" class="form-control" id="fechaHasta" name="fechaHasta" required>
                        </div>

                        <div class="form-group col-md-12 text-center">
                            <button type="submit" id="btnExportExcel" class="btn btn-primary form-control">Exportar Excel</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>




    <div class="row justify-content-center">
        <div class="col-11">
            <table class="table table-responsive table-bordered table-striped text-center" id="generalRecordsTable">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Fecha de ingreso</th>
                        <th>Usuario - Nombres y Apellidos</th>
                        <th>Usuario - Cédula</th>
                        <th>Usuario - Teléfono</th>
                        <th>Provincia</th>
                        <th>Cantón</th>
                        <th>Tipo Parroquia</th>
                        <th>Parroquia</th>
                        <th>Comunidad</th>
                        <th>Barrio</th>
                        <th>Tipo Vivienda</th>
                        <th>Techo</th>
                        <th>Pared</th>
                        <th>Piso</th>
                        <th>Nº Cuartos</th>
                        <th>Combustible Cocina</th>
                        <th>Servicios Higiénicos</th>
                        <th>Vivienda (Alojamiento)</th>
                        <th>Pago Vivienda</th>
                        <th>Agua</th>
                        <th>Pago Agua</th>
                        <th>Luz</th>
                        <th>Cantidad Luz</th>
                        <th>Internet</th>
                        <th>Pago Internet</th>
                        <th>TV Cable</th>
                        <th>Pago TV</th>
                        <th>Eliminación Basura</th>
                        <th>Frecuencia Viveres</th>
                        <th>Gasto Alimentación</th>
                        <th>Medios Transporte</th>
                        <th>Estado Transporte</th>
                        <th>Terreno</th>
                        <th>Celular</th>
                        <th>Cantidad Celulares</th>
                        <th>Plan Celular</th>
                        <th>Parentescos</th>
                        <th>Observaciones</th>
                        <th>Resultado</th>
                        <?php if (session('rol_nombre') == 'Administrador') { ?>
                            <th>Acciones</th>
                        <?php } ?>
                    </tr>
                </thead>


                <tbody>
                    <?php $i = 1;
                    foreach ($registros as $row): ?>
                        <tr>
                            <td><?= $i++ ?><input type="hidden" value=<?= esc($row->id_users); ?>></td>
                            <td><?= esc($row->datos_created_at) ?></td>
                            <td><?= esc($row->nombre_parentesco) ?> <?= esc($row->apellido_parentesco) ?></td>
                            <td><?= esc($row->datos_parentesco_documento) ?></td>
                            <td><?= esc($row->datos_parentesco_celular_telf) ?></td>

                            <td><?= esc($row->nombre_provincia) ?></td>
                            <td><?= esc($row->datos_canton) ?></td>
                            <td><?= esc($row->datos_tipo_parroquias) ?></td>
                            <td><?= esc($row->nombre_parroquia) ?></td>
                            <td><?= esc($row->datos_comunidades) ?></td>
                            <td><?= esc($row->datos_barrios) ?></td>

                            <td><?= esc($row->nombre_tipo_vivienda) ?></td>
                            <td><?= esc($row->nombre_techo) ?></td>
                            <td><?= esc($row->nombre_pared) ?></td>
                            <td><?= esc($row->nombre_piso) ?></td>

                            <td><?= esc($row->datos_cuarto) ?></td>
                            <td><?= esc($row->nombre_combustible) ?></td>
                            <td><?= esc($row->nombre_servicios) ?></td>
                            <td><?= esc($row->nombre_vivienda) ?></td>
                            <td><?= esc($row->datos_pago_vivienda) ?></td>
                            <td><?= esc($row->datos_agua ? 'Sí' : 'No') ?></td>
                            <td><?= esc($row->datos_pago_agua) ?></td>
                            <td><?= esc($row->datos_pago_luz ? 'Sí' : 'No') ?></td>
                            <td><?= esc($row->datos_cantidad_luz) ?></td>
                            <td><?= esc($row->datos_internet ? 'Sí' : 'No') ?></td>
                            <td><?= esc($row->datos_pago_internet) ?></td>
                            <td><?= esc($row->datos_tv_cable ? 'Sí' : 'No') ?></td>
                            <td><?= esc($row->datos_tv_pago) ?></td>
                            <td><?= esc($row->nombre_eliminacion_basura) ?></td>
                            <td><?= esc($row->nombre_frecuencia_viveres) ?></td>
                            <td><?= esc($row->datos_gastos_viveres_alimentacion) ?></td>
                            <td><?= esc($row->datos_medio_transporte) ?></td>
                            <td><?= esc($row->datos_estado_transporte) ?></td>
                            <td><?= esc($row->datos_terrenos ? 'Sí' : 'No') ?></td>
                            <td><?= esc($row->datos_celular ? 'Sí' : 'No') ?></td>
                            <td><?= esc($row->datos_cantidad_celulare) ?></td>
                            <td><?= esc($row->datos_plan_celular ? 'Sí' : 'No') ?></td>
                            <td>
                                <?php foreach ($row->parentescos as $p): ?>
                                    <pre><?php print_r($p); ?></pre>

                                    <button class="btn btn-sm btn-outline-info me-1" title="<?= esc($p['nombre']) ?>" data-id="<?= esc($p['id_parentesco']) ?>">
                                        <?= esc($p['tipo']) ?>
                                    </button>
                                <?php endforeach; ?>
                            </td>
                            <td><?= esc($row->datos_observacion) ?></td>
                            <td><?php if (esc($row->datos_resultado) == 'Aprobado') { ?><span class="badge bg-success" style="color: white;">Aprobado</span><?php } else { ?><span class="badge bg-danger" style="color: white;">No aprobado</span><?php } ?></td>
                            <?php if (session('rol_nombre') == 'Administrador') { ?>
                                <td>
                                    <button class="btn btn-sm btn-danger me-1" title="Eliminar" onclick="deleteGeneralInformation(<?= esc($row->id_datos_generales) ?>)">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </button>
                                </td>
                            <?php } ?>
                        </tr>
                    <?php endforeach; ?>
                </tbody>




            </table>
        </div>

    </div>


</div>


<!-- Modal Ver Parentesco -->
<div class="modal fade" id="modalParentesco" tabindex="-1" aria-labelledby="modalParentescoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="modalParentescoLabel">Detalles del Parentesco</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formParentesco" class="row g-3">
                    <input type="hidden" id="p_id" name="id_datos_parentesco">

                    <div class="col-md-6">
                        <label class="form-label">Nombres</label>
                        <input type="text" class="form-control" id="p_nombres">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Apellidos</label>
                        <input type="text" class="form-control" id="p_apellidos">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Documento</label>
                        <input type="text" class="form-control" id="p_documento">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Celular</label>
                        <input type="text" class="form-control" id="p_celular">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Etnia</label>
                        <input type="text" class="form-control" id="p_etnia">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Género</label>
                        <input type="text" class="form-control" id="p_genero">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Nivel Educación</label>
                        <input type="text" class="form-control" id="p_educacion">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Fecha Nacimiento</label>
                        <input type="date" class="form-control" id="p_nacimiento">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Edad</label>
                        <input type="text" class="form-control" id="p_edad">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Estado Civil</label>
                        <input type="text" class="form-control" id="p_estado_civil">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Discapacidad</label>
                        <input type="text" class="form-control" id="p_discapacidad">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Enfermedad Catastrófica</label>
                        <input type="text" class="form-control" id="p_enfermedad">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Trabaja</label>
                        <input type="text" class="form-control" id="p_trabaja">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Ocupación</label>
                        <input type="text" class="form-control" id="p_ocupacion">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Ingreso Mensual</label>
                        <input type="text" class="form-control" id="p_ingreso">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Parentesco</label>
                        <input type="text" class="form-control" id="p_parentesco">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="btnUpdateParentesco">Actualizar</button>
                <button class="btn btn-danger" data-dismiss="modal">Cerrar</button>

            </div>
        </div>
    </div>
</div>