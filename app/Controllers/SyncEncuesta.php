<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\UsersMod;

class SyncEncuesta extends ResourceController
{
    protected $format = 'json';

    public function sync()
    {
        log_message('error', '🔥 LOG DE PRUEBA: SyncEncuesta ejecutado');

        // 1️⃣ Leer JSON
        $data = $this->request->getJSON(true);
        log_message('error', 'JSON RECIBIDO: ' . print_r($data, true));
        log_message('error', 'CONTENT TYPE: ' . $this->request->getHeaderLine('Content-Type'));

        if (!$data) {
            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'No JSON received'
            ])->setStatusCode(400);
        }

        $cedula = isset($data['datos_cedula_voluntario'])
            ? trim((string) $data['datos_cedula_voluntario'])
            : null;

        log_message('error', 'CEDULA RECIBIDA NORMALIZADA: [' . $cedula . ']');

        if (!$cedula) {
            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'Cédula no enviada'
            ])->setStatusCode(400);
        }


        // 2️⃣ Conexión a DB
        $db = \Config\Database::connect();

        // 🔎 Buscar usuario por cédula
        $user = $db->table('tbl_users')
            ->where('TRIM(users_cedula)', $cedula)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'Cédula no existe en el sistema'
            ])->setStatusCode(400);
        }



        $provincia_id = $data['provincia'] ?? null;

        // ✅ Validación segura
        if ($provincia_id === null || $provincia_id === '') {
            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'Provincia requerida'
            ])->setStatusCode(400);
        }

        // 🔒 CAST EXPLÍCITO
        $provincia_id = (int) $provincia_id;

        // ✅ Validar contra catálogo PROVINCIAS (18)
        $provincia = $db->table('tbl_item_catalogo')
            ->where('id_item', $provincia_id)
            ->where('id_catalogo', 18)
            ->where('itc_estado', 1)
            ->get()
            ->getRow();

        if (!$provincia) {
            log_message(
                'error',
                'Provincia inválida | id_item=' . $provincia_id . ' | catálogo=18'
            );

            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'Provincia inválida'
            ])->setStatusCode(400);
        }


        // 🧱 Iniciar transacción
        $db->transStart();

        // 3️⃣ Insertar datos generales
        $generalData = [
            'id_users' => $user->id_users,
            'datos_provincia' => $data['provincia'] ?? null,
            'datos_canton' => $data['canton_nombre'] ?? null,
            'datos_parroquias' => $data['parroquia'] ?? null,
            'datos_tipo_parroquias' => $data['tipo_parroquia'] ?? null,
            'datos_comunidades' => $data['datos_comunidades'] ?? null,
            'datos_barrios' => $data['datos_barrios'] ?? null,
            'datos_tipo_viviendas' => $data['datos_tipo_viviendas'] ?? null,
            'datos_techos' => $data['datos_techos'] ?? null,
            'datos_paredes' => $data['datos_paredes'] ?? null,
            'datos_pisos' => $data['datos_pisos'] ?? null,
            'datos_cuarto' => $data['datos_cuarto'] ?? null,
            'datos_combustibles_cocina' => $data['datos_combustibles_cocina'] ?? null,
            'datos_servicios_higienicos' => $data['datos_servicios_higienicos'] ?? null,
            'datos_viviendas' => $data['datos_viviendas'] ?? null,
            'datos_pago_vivienda' => $data['datos_pago_vivienda'] ?? null,
            'datos_agua' => $data['datos_agua'] ?? null,
            'datos_pago_agua' => $data['datos_pago_agua'] ?? null,
            'datos_pago_luz' => $data['datos_pago_luz'] ?? null,
            'datos_cantidad_luz' => $data['datos_cantidad_luz'] ?? null,
            'datos_internet' => $data['datos_internet'] ?? null,
            'datos_pago_internet' => $data['datos_pago_internet'] ?? null,
            'datos_tv_cable' => $data['datos_tv_cable'] ?? null,
            'datos_tv_pago' => $data['datos_tv_pago'] ?? null,
            'datos_eliminacion_basura' => $data['datos_eliminacion_basura'] ?? null,
            'datos_lugares_mayor_frecuencia_viveres' => $data['datos_lugares_viveres'] ?? null,
            'datos_gastos_viveres_alimentacion' => $data['datos_gastos_viveres'] ?? null,
            'datos_medio_transporte' => $data['datos_medio_transporte'] ?? null,
            'datos_estado_transporte' => $data['datos_estado_transporte'] ?? null,
            'datos_terrenos' => $data['datos_terrenos'] ?? null,
            'datos_celular' => $data['datos_celular'] ?? null,
            'datos_cantidad_celulare' => $data['datos_cantidad_celulare'] ?? null,
            'datos_plan_celular' => $data['datos_plan_celular'] ?? null,
            'datos_observacion' => $data['datos_observacion'] ?? null,
            'datos_resultado' => $data['datos_resultado'] ?? null,
            'datos_resultado_sistema' => $data['datos_resultado_sistema'] ?? null,
            'datos_consentimiento' => $data['datos_consentimiento'] ?? null,
        ];

        $db->table('tbl_datos_generales')->insert($generalData);
        $idGeneral = $db->insertID();

        // 4️⃣ Insertar familiares
        $primerParentescoId = null;

        if (!empty($data['familiares'])) {
            foreach ($data['familiares'] as $i => $familiar) {

                $db->table('tbl_datos_parentesco')->insert([
                    'datos_parentesco_nombres' => $familiar['nombres'] ?? null,
                    'datos_parentesco_apellidos' => $familiar['apellidos'] ?? null,
                    'datos_parentesco_documento' => $familiar['documento'] ?? null,
                    'datos_parentesco_celular_telf' => $familiar['telefono'] ?? null,
                    'datos_parentesco_etnia' => $familiar['etnia'] ?? null,
                    'datos_parentesco_genero' => $familiar['genero'] ?? null,
                    'datos_parentesco_nivel_educacion' => $familiar['nivel_educacion'] ?? null,
                    'datos_parentesco_fecha_de_nacimiento' => $familiar['fecha_nacimiento'] ?? null,
                    'datos_parentesco_edad' => $familiar['edad'] ?? null,
                    'datos_parentesco_estado_civil' => $familiar['estado_civil'] ?? null,
                    'datos_parentesco_discapacidad' => $familiar['discapacidad'] ?? null,
                    'datos_parentesco_enfermedad_catastrofica' => $familiar['enfermedad'] ?? null,
                    'datos_parentesco_trabaja' => $familiar['trabaja'] ?? null,
                    'datos_parentesco_ocupacion' => $familiar['ocupacion'] ?? null,
                    'datos_parentesco_ingreso_mensual' => $familiar['ingreso'] ?? null,
                    'datos_parentesco_parentesco' => $familiar['parentesco'] ?? null,
                ]);

                $idParentesco = $db->insertID();

                // 🔗 Relación
                $db->table('tbl_datos_generales_parentesco')->insert([
                    'id_datos_generales' => $idGeneral,
                    'id_datos_parentescos' => $idParentesco
                ]);

                if ($i === 0) {
                    $primerParentescoId = $idParentesco;
                }
            }
        }

        // 5️⃣ Actualizar primer parentesco
        if ($primerParentescoId) {
            $db->table('tbl_datos_generales')
                ->where('id_datos_generales', $idGeneral)
                ->update(['datos_parentesco_id' => $primerParentescoId]);
        }

        $db->transComplete();

        if ($db->transStatus() === false) {
            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'Error al sincronizar'
            ])->setStatusCode(500);
        }

        // ✅ OK
        return $this->response->setJSON([
            'status' => 'ok',
            'uuid' => $data['uuid'] ?? null
        ]);
    }

    public function validarCedula()
    {
        $json = $this->request->getJSON(true);
        $cedula = trim($json['cedula'] ?? '');

        if ($cedula === '') {
            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'Cédula no enviada'
            ])->setStatusCode(400);
        }

        // ✅ CREAR EL MODELO AQUÍ
        $usersModel = new UsersMod();

        // ⚠️ OJO: el campo es users_cedula, NO cedula
        $user = $usersModel
            ->where('users_cedula', $cedula)
            ->first();

        if (!$user) {
            return $this->response->setJSON([
                'status' => 'error',
                'message' => 'Cédula no existe en el sistema'
            ])->setStatusCode(400);
        }

        return $this->response->setJSON([
            'status' => 'ok',
            'message' => 'Cédula válida'
        ]);
    }
}
