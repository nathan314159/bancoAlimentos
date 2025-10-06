<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\GeneralInformationMod;
use App\Models\RelationshipMod;
use App\Models\GeneralInformationRelationshipMod;
use App\Models\UsersMod;
use App\Models\RolAccessMod;
use App\Models\UserRolMod;
use App\Models\ItemCatalogMod;

class GeneralInformationRecords extends BaseController
{
    protected $form;
    protected $relationship;
    protected $generalInformationRelationship;
    protected $users;
    protected $rol_access;
    protected $user_rol;
    protected $item_catalog;


    public function __construct()
    {
        $this->session = \Config\Services::session();
        $this->users = new UsersMod();
        $this->rol_access = new RolAccessMod();
        $this->user_rol = new UserRolMod();
        $this->form = new GeneralInformationMod();
        $this->relationship = new RelationshipMod();
        $this->generalInformationRelationship = new GeneralInformationRelationshipMod();
        $this->item_catalog = new ItemCatalogMod();
    }

    public function informationRecords()
    {
        echo "<script>if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }</script>";

        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));

            if (accessController("/informationRecords", $routes)) {
                $arrayFunction = ['function' => 'datos registrados'];

                // ✅ Aquí transformamos los datos crudos en estructura agrupada
                $registros_crudos = $this->form->showGeneralInformation(session('id_users'));

                $registros = [];
                foreach ($registros_crudos as $row) {
                    $id = $row->id_datos_generales;

                    if (!isset($registros[$id])) {
                        $registros[$id] = $row;
                        $registros[$id]->parentescos = [];
                    }

                    $nombreCompleto = trim("{$row->nombre_parentesco} {$row->apellido_parentesco}");
                    $registros[$id]->parentescos[] = [
                        'id_parentesco' => $row->id_datos_parentesco,
                        'nombre' => $nombreCompleto,
                        'tipo' => $row->parentesco,
                    ];
                }

                $data['registros'] = array_values($registros); // lista limpia

                // Vistas
                echo view("layout/header");
                echo view("layout/aside", $arrayFunction);
                echo view("generalInformationRecords/body", $data);
                echo view("layout/footer", $arrayFunction);

                //print_r($registros_crudos);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }


    public function getRelationShipId()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getRelationShipId", $routes)) {
                $relationship = $this->generalInformationRelationship->getRelationShipId($this->request->getPost('id_datos_parentesco'));
                echo json_encode($relationship);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function deleteGeneralInformationRecord()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/deleteGeneralInformationRecord", $routes)) {

                $idDatosGenerales = $this->request->getPost('id_datos_generales');

                // 1. Obtener todos los id de parentescos
                $relationShipIdObjects = $this->generalInformationRelationship->getParentescosByDatosGeneralesId($idDatosGenerales);
                $relationShipIdArray = array_map(function ($item) {
                    return $item->id_datos_parentesco;
                }, $relationShipIdObjects);

                // 2. Cambiar el estado del id de datos generales a 0 
                $this->generalInformationRelationship->desactivarDatosGenerales($idDatosGenerales);

                // 3. Cambiar los estados de parentescos a 0
                if (!empty($relationShipIdArray)) {
                    $this->generalInformationRelationship->desactivarParentescos($relationShipIdArray);
                }

                // 4. Cambiar los estados de datos_generales_parentesco a 0
                $this->generalInformationRelationship->desactivarGeneralesParentescos($idDatosGenerales);

                //echo json_encode(['status' => 'ok']);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }


public function updateParentesco()
{
    $request = $this->request->getPost();
    $id = $request['id_datos_parentesco'];

    if (empty($id)) {
        return $this->response->setJSON([
            'status' => 'error',
            'message' => 'ID vacío'
        ]);
    }

    $data = [
        'datos_parentesco_nombres' => $request['datos_parentesco_nombres'],
        'datos_parentesco_apellidos' => $request['datos_parentesco_apellidos'],
        'datos_parentesco_documento' => $request['datos_parentesco_documento'],
        'datos_parentesco_celular_telf' => $request['datos_parentesco_celular_telf'],
        'etnia' => $request['etnia'],
        'genero' => $request['genero'],
        'nivel_educacion' => $request['nivel_educacion'],
        'datos_parentesco_fecha_de_nacimiento' => $request['datos_parentesco_fecha_de_nacimiento'],
        'datos_parentesco_edad' => $request['datos_parentesco_edad'],
        'estado_civil' => $request['estado_civil'],
        'datos_parentesco_discapacidad' => $request['datos_parentesco_discapacidad'],
        'datos_parentesco_enfermedad_catastrofica' => $request['datos_parentesco_enfermedad_catastrofica'],
        'datos_parentesco_trabaja' => $request['datos_parentesco_trabaja'],
        'datos_parentesco_ocupacion' => $request['datos_parentesco_ocupacion'],
        'datos_parentesco_ingreso_mensual' => $request['datos_parentesco_ingreso_mensual'],
        'datos_parentesco_parentesco' => $request['datos_parentesco_parentesco'],
    ];

    $model = new \App\Models\RelationshipMod(); // Use RelationshipMod here
    $updated = $model->update($id, $data);

    if ($updated) {
        return $this->response->setJSON(['status' => 'success']);
    } else {
        return $this->response->setJSON([
            'status' => 'error',
            'message' => 'No se pudo actualizar'
        ]);
    }
}




    public function exportExcel()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));

            if (accessController("/exportExcel", $routes)) {

                helper('filesystem');
                $datos = $this->form->showGeneralInformationDates(session('id_users'), $this->request->getPost('fechaDesde'), $this->request->getPost('fechaHasta'));

                $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
                $sheet = $spreadsheet->getActiveSheet();

                // Encabezados organizados por secciones
                $encabezados = [
                    // Datos resumen
                    'N#',
                    'Fecha de ingreso',
                    'Usuario (Nombres y Apellidos)',
                    'Usuario cédula',
                    'Usuario teléfono',
                    'Provincia',
                    'Parroquia',
                    'Comunidad',
                    'Barrio',

                    // Parentescos
                    'Nombres',
                    'Apellidos',
                    'Cédula',
                    'Celular/Teléfono',
                    'Etnia',
                    'Género',
                    'Nivel de educación',
                    'Fecha de nacimiento',
                    'Edad',
                    'Estado Civil',
                    '¿Tiene discapacidad?',
                    'Enfermedad catastrófica',
                    '¿Trabaja?',
                    'Ocupación',
                    'Ingreso',
                    'Parentesco',

                    // Vivienda
                    'Tipo de vivienda',
                    'Techo',
                    'Paredes',
                    'Piso',
                    'N# de cuartos',
                    'Combustible para cocinar',
                    'Servicio higiénico',
                    'Vivienda (alojamiento)',
                    'Pago de la vivienda',
                    '¿Paga agua?',
                    'Pago del agua',
                    '¿Paga luz?',
                    'Pago de luz',

                    // Equipamiento
                    '¿Tiene internet?',
                    'Pago internet',
                    '¿Tiene tv cable?',
                    'Pago tv cable',
                    'Eliminación de basura',
                    'Lugar de compra de víveres frecuente',
                    'Gasto en víveres incluyendo comidas preparadas',
                    'Vehículos',
                    'Estado de los vehículos',
                    '¿Tiene terrenos?',
                    '¿Tiene celular?',
                    '¿Cuántos celulares en casa?',
                    '¿Tiene plan de celular?',
                    'Observación',
                    'Resultado'
                ];

                // Estilos
                $bold = new \PhpOffice\PhpSpreadsheet\Style\Font();
                $bold->setBold(true);

                $wrapText = new \PhpOffice\PhpSpreadsheet\Style\Alignment();
                $wrapText->setWrapText(true);
                $wrapText->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_TOP);

                $fills = [
                    'resumen' => 'D9EAD3',
                    'parentesco' => 'CFE2F3',
                    'vivienda' => 'F9CB9C',
                    'equipamiento' => 'EAD1DC'
                ];

                $sectionLimits = [
                    'resumen' => [1, 9],
                    'parentesco' => [10, 25],
                    'vivienda' => [26, 41],
                    'equipamiento' => [42, 53]
                ];

                // Bordes para usar (todo borde fino negro)
                $borderStyle = [
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['rgb' => '000000'],
                        ],
                    ],
                ];

                // ---- AGREGAMOS FILA DE SECCIONES EN LA FILA 1 ----
                $secciones = [
                    'Datos Resumen' => $sectionLimits['resumen'],
                    'Parentescos' => $sectionLimits['parentesco'],
                    'Vivienda' => $sectionLimits['vivienda'],
                    'Equipamiento' => $sectionLimits['equipamiento'],
                ];

                foreach ($secciones as $nombreSeccion => [$startCol, $endCol]) {
                    $startLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($startCol);
                    $endLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($endCol);

                    // Fusionar columnas para la sección en la fila 1
                    $sheet->mergeCells("{$startLetter}1:{$endLetter}1");
                    $sheet->setCellValue($startLetter . '1', $nombreSeccion);

                    // Para obtener el fill correcto, usamos estas claves normalizadas
                    $claveFill = '';
                    switch ($nombreSeccion) {
                        case 'Datos Resumen':
                            $claveFill = 'resumen';
                            break;
                        case 'Parentescos':
                            $claveFill = 'parentesco';
                            break;
                        case 'Vivienda':
                            $claveFill = 'vivienda';
                            break;
                        case 'Equipamiento':
                            $claveFill = 'equipamiento';
                            break;
                        default:
                            $claveFill = strtolower($nombreSeccion);
                    }

                    // Estilos para la sección
                    $sheet->getStyle("{$startLetter}1")->getFont()->setBold(true);
                    $sheet->getStyle("{$startLetter}1")->getAlignment()->setHorizontal('center')->setVertical('center');
                    $sheet->getStyle("{$startLetter}1")->getFill()->setFillType('solid')->getStartColor()->setRGB($fills[$claveFill] ?? 'FFFFFF');

                    // Aplicar borde a la celda fusionada (al rango fusionado)
                    $sheet->getStyle("{$startLetter}1:{$endLetter}1")->applyFromArray($borderStyle);

                    // Ajustar altura de la fila 1 para que se vea bien
                    $sheet->getRowDimension(1)->setRowHeight(20);
                }

                // ---- ESCRIBIR ENCABEZADOS EN LA FILA 2 ----
                $colIndex = 1;
                foreach ($encabezados as $encabezado) {
                    $colLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIndex);
                    $cell = $sheet->getCell($colLetter . '2');
                    $cell->setValue($encabezado);

                    $sheet->getColumnDimension($colLetter)->setWidth(25);
                    $sheet->getStyle($colLetter . '2')->getFont()->setBold(true);
                    $sheet->getStyle($colLetter . '2')->getAlignment()->setWrapText(true)->setVertical('top');

                    foreach ($sectionLimits as $section => [$start, $end]) {
                        if ($colIndex >= $start && $colIndex <= $end) {
                            $sheet->getStyle($colLetter . '2')->getFill()->setFillType('solid')->getStartColor()->setRGB($fills[$section]);
                            break;
                        }
                    }

                    // Agregar borde a cada celda del encabezado fila 2
                    $sheet->getStyle($colLetter . '2')->applyFromArray($borderStyle);

                    $colIndex++;
                }

                $fila = 3;  // Cambiamos fila para los datos a la fila 3 (porque fila 1 y 2 están ocupadas)

                $contador = 1;

                // Array para almacenar las filas de cada id_datos_generales
                $filasPorDato = [];

                foreach ($datos as $dato) {
                    $parentescos = isset($dato->parentescos) ? $dato->parentescos : [$dato];
                    $primerParentesco = $this->form->getPrimerParentescoByDatosGeneralesId($dato->id_datos_generales);
                    $numParentescos = count($parentescos);
                    $inicioFila = $fila;
                    $finFila = $fila + $numParentescos - 1;

                    // Guardamos las filas para este id_datos_generales
                    if (!isset($filasPorDato[$dato->id_datos_generales])) {
                        $filasPorDato[$dato->id_datos_generales] = ['inicio' => $inicioFila, 'fin' => $finFila];
                    } else {
                        // Si ya existe, solo actualizar el finFila (en caso que haya más)
                        $filasPorDato[$dato->id_datos_generales]['fin'] = $finFila;
                    }

                    foreach ($parentescos as $dp) {
                        $col = 'A';

                        // Datos resumen
                        $sheet->setCellValue($col++ . $fila, $dato->id_datos_generales);
                        $sheet->setCellValue($col++ . $fila, $dato->datos_created_at);
                        $sheet->setCellValue($col++ . $fila, ($primerParentesco->datos_parentesco_nombres ?? '') . ' ' . ($primerParentesco->datos_parentesco_apellidos ?? ''));
                        $sheet->setCellValue($col++ . $fila, $primerParentesco->datos_parentesco_documento ?? '');
                        $sheet->setCellValue($col++ . $fila, $primerParentesco->datos_parentesco_celular_telf ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_provincia ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_parroquia ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_comunidades ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_barrios ?? '');

                        // Parentescos
                        $sheet->setCellValue($col++ . $fila, $dp->nombre_parentesco ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->apellido_parentesco ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_documento ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_celular_telf ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_etnia ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_genero ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_nivel_educacion ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_fecha_de_nacimiento ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_edad ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_estado_civil ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_discapacidad ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_enfermedad_catastrofica ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_trabaja ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_ocupacion ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_ingreso_mensual ?? '');
                        $sheet->setCellValue($col++ . $fila, $dp->parentesco ?? '');

                        // Vivienda
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_tipo_vivienda ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_techo ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_pared ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_piso ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_cuarto ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_combustible ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_servicios ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_vivienda ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_pago_vivienda ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_agua ? 'Sí' : 'No');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_pago_agua ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_pago_luz ? 'Sí' : 'No');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_cantidad_luz ?? '');

                        // Equipamiento
                        $sheet->setCellValue($col++ . $fila, $dato->datos_internet ? 'Sí' : 'No');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_pago_internet ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_tv_cable ? 'Sí' : 'No');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_tv_pago ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_eliminacion_basura ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->nombre_frecuencia_viveres ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_gastos_viveres_alimentacion ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_medio_transporte ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_estado_transporte ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_terrenos ? 'Sí' : 'No');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_celular ? 'Sí' : 'No');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_cantidad_celulare ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_plan_celular ? 'Sí' : 'No');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_observacion ?? '');
                        $sheet->setCellValue($col++ . $fila, $dato->datos_resultado ?? '');

                        $fila++;
                    }

                    $contador++;
                }

                // Ahora fusionamos solo para cada grupo id_datos_generales en las columnas seleccionadas
                $columnasAFusionar = array_merge(
                    range(1, 9),
                    range(26, 41),
                    range(42, 57)
                );

                foreach ($filasPorDato as $idDato => $rangos) {
                    $inicioFila = $rangos['inicio'];
                    $finFila = $rangos['fin'];

                    // Si solo hay una fila, no fusionar
                    if ($finFila <= $inicioFila) {
                        continue;
                    }

                    foreach ($columnasAFusionar as $colIndex) {
                        $colLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIndex);
                        $sheet->mergeCells("{$colLetter}{$inicioFila}:{$colLetter}{$finFila}");
                    }
                }

                // ** APLICAR BORDES A TODAS LAS CELDAS DEL RANGO USADO **
                // Desde la A1 hasta la última columna (basada en $encabezados) y última fila ($fila-1)
                $ultimaColumna = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex(count($encabezados));
                $ultimaFila = $fila - 1; // la última fila con datos

                $rangoTotal = "A1:{$ultimaColumna}{$ultimaFila}";
                $sheet->getStyle($rangoTotal)->applyFromArray($borderStyle);

                $filename = 'datos_generales_parentescos_' . date('Ymd_His') . '.xlsx';
                $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);

                header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
                header("Content-Disposition: attachment; filename=\"$filename\"");
                header('Cache-Control: max-age=0');

                $writer->save('php://output');
                exit;
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }
}
