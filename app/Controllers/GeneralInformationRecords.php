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
                        'tipo' => $row->parentesco
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


    // public function exportExcel()
    // {
    //     helper('filesystem');
    //     $datos = $this->form->showGeneralInformation(session('id_users'));

    //     $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
    //     $sheet = $spreadsheet->getActiveSheet();

    //     // Encabezados
    //     $encabezados = [
    //         // Datos Generales
    //         'Provincia',
    //         'Cantón',
    //         'Tipo Parroquia',
    //         'Parroquia',
    //         'Comunidad',
    //         'Barrio',
    //         'Tipo Vivienda',
    //         'Techo',
    //         'Pared',
    //         'Piso',
    //         'Nº Cuartos',
    //         'Viviendas',
    //         'Pago Vivienda',
    //         'Agua',
    //         'Pago Agua',
    //         'Luz',
    //         'Cantidad Luz',
    //         'Internet',
    //         'Pago Internet',
    //         'TV Cable',
    //         'Pago TV',
    //         'Eliminación Basura',
    //         'Frecuencia Víveres',
    //         'Gasto Alimentación',
    //         'Medios Transporte',
    //         'Estado Transporte',
    //         'Terreno',
    //         'Celular',
    //         'Cantidad Celulares',
    //         'Plan Celular',
    //         'Observaciones',
    //         'Resultado',

    //         // Parentesco
    //         'Nombre',
    //         'Apellidos',
    //         'Parentesco',
    //         'Documento',
    //         'Celular/Teléfono',
    //         'Etnia',
    //         'Género',
    //         'Nivel Educación',
    //         'Fecha Nacimiento',
    //         'Edad',
    //         'Estado Civil',
    //         'Discapacidad',
    //         'Enfermedad Catastrófica',
    //         'Trabaja',
    //         'Ocupación',
    //         'Ingreso Mensual'
    //     ];

    //     // Escribir encabezados
    //     $col = 'A';
    //     foreach ($encabezados as $encabezado) {
    //         $sheet->setCellValue($col . '1', $encabezado);
    //         $col++;
    //     }

    //     $fila = 2;
    //     foreach ($datos as $dato) {
    //         // Si tienes múltiples parentescos por dato general:
    //         $parentescos = isset($dato->parentescos) ? $dato->parentescos : [$dato]; // fallback si viene plano

    //         foreach ($parentescos as $dp) {
    //             $col = 'A';

    //             // Datos Generales
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_provincia ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_canton ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_tipo_parroquias ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_parroquia ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_comunidades ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_barrios ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_tipo_vivienda ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_techo ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_pared ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_piso ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_cuarto ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_viviendas ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_pago_vivienda ?? '');
    //             $sheet->setCellValue($col++ . $fila, isset($dato->datos_agua) ? ($dato->datos_agua ? 'Sí' : 'No') : '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_pago_agua ?? '');
    //             $sheet->setCellValue($col++ . $fila, isset($dato->datos_pago_luz) ? ($dato->datos_pago_luz ? 'Sí' : 'No') : '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_cantidad_luz ?? '');
    //             $sheet->setCellValue($col++ . $fila, isset($dato->datos_internet) ? ($dato->datos_internet ? 'Sí' : 'No') : '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_pago_internet ?? '');
    //             $sheet->setCellValue($col++ . $fila, isset($dato->datos_tv_cable) ? ($dato->datos_tv_cable ? 'Sí' : 'No') : '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_tv_pago ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_eliminacion_basura ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->nombre_frecuencia_viveres ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_gastos_viveres_alimentacion ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_medio_transporte ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_estado_transporte ?? '');
    //             $sheet->setCellValue($col++ . $fila, isset($dato->datos_terrenos) ? ($dato->datos_terrenos ? 'Sí' : 'No') : '');
    //             $sheet->setCellValue($col++ . $fila, isset($dato->datos_celular) ? ($dato->datos_celular ? 'Sí' : 'No') : '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_cantidad_celulare ?? '');
    //             $sheet->setCellValue($col++ . $fila, isset($dato->datos_plan_celular) ? ($dato->datos_plan_celular ? 'Sí' : 'No') : '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_observacion ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dato->datos_resultado ?? '');

    //             // Datos Parentesco
    //             $sheet->setCellValue($col++ . $fila, $dp->nombre_parentesco ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->apellido_parentesco ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->parentesco ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_documento ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_celular_telf ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_etnia ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_genero ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_nivel_educacion ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_fecha_de_nacimiento ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_edad ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_estado_civil ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_discapacidad ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_enfermedad_catastrofica ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_trabaja ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_ocupacion ?? '');
    //             $sheet->setCellValue($col++ . $fila, $dp->datos_parentesco_ingreso_mensual ?? '');

    //             $fila++;
    //         }
    //     }

    //     // Descargar Excel
    //     $filename = 'datos_generales_parentescos_' . date('Ymd_His') . '.xlsx';
    //     $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);

    //     header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    //     header("Content-Disposition: attachment; filename=\"$filename\"");
    //     header('Cache-Control: max-age=0');

    //     $writer->save('php://output');
    //     exit;
    // }
    public function exportExcel()
    {
        helper('filesystem');
        $datos = $this->form->showGeneralInformation(session('id_users'));

        $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Encabezados organizados por secciones
        $encabezados = [
            // Datos resumen
            'N#',
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

        // Escribir encabezados
        $col = 'A';
        foreach ($encabezados as $encabezado) {
            $sheet->setCellValue($col . '1', $encabezado);
            $col++;
        }

        $fila = 2;
        $contador = 1;
        foreach ($datos as $dato) {
            $parentescos = isset($dato->parentescos) ? $dato->parentescos : [$dato];

            foreach ($parentescos as $dp) {
                $col = 'A';

                // Datos resumen
                $sheet->setCellValue($col++ . $fila, $contador++);
                $sheet->setCellValue($col++ . $fila, ($dato->nombre_parentesco ?? '') . ' ' . ($dato->apellido_parentesco ?? ''));
                $sheet->setCellValue($col++ . $fila, $dato->datos_parentesco_documento ?? '');
                $sheet->setCellValue($col++ . $fila, $dato->datos_parentesco_celular_telf ?? '');
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
        }

        $filename = 'datos_generales_parentescos_' . date('Ymd_His') . '.xlsx';
        $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"$filename\"");
        header('Cache-Control: max-age=0');

        $writer->save('php://output');
        exit;
    }
}
