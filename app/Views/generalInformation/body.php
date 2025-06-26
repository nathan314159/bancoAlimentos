


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Formulario de Datos</title>
    <style>
        form {
            max-width: 800px;
            margin: auto;
            padding: 1em;
            background: #f9f9f9;
            border-radius: 10px;
        }

        label {
            display: block;
            margin-top: 1em;
            font-weight: bold;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 0.5em;
            margin-top: 0.3em;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            margin-top: 2em;
            padding: 0.7em 1.5em;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
        }
    </style>
</head>

<body>

    <form action="<?php echo base_url('/insertDatosGenerales'); ?>" method="POST">
        <h2>Formulario de Datos</h2>

        <label for="datos_provincia">Provincia</label>
        <select id="datos_provincia" name="datos_provincia">
            <option value="">-- Selecciona una provincia --</option>
        </select>

        <label for="datos_canton">Cantón</label>
        <select id="datos_canton" name="datos_canton">
            <option value="">-- Selecciona una cantón --</option>
        </select>

        <label for="datos_parroquias">Parroquia</label>
        <select id="datos_parroquias" name="datos_parroquias">
            <option value="">-- Selecciona una parroquias --</option>
        </select>

        <label for="datos_comunidades">Comunidades</label>
        <input type="text" id="datos_comunidades" name="datos_comunidades">

        <label for="datos_barrios">Barrios</label>
        <input type="text" id="datos_barrios" name="datos_barrios">

        <label for="datos_tipo_viviendas">Tipo de Vivienda</label>
        <select id="datos_tipo_viviendas" name="datos_tipo_viviendas">
            <option value="">-- Selecciona Tipo de Vivienda --</option>
        </select>

        <label for="datos_techos">Tipo de Techo</label>
        <select id="datos_techos" name="datos_techos">
            <option value="">-- Selecciona Tipo de Techo --</option>
        </select>

        <label for="datos_paredes">Tipo de Pared</label>
        <select id="datos_paredes" name="datos_paredes">
            <option value="">-- Selecciona Tipo de Pared --</option>
        </select>

        <label for="datos_pisos">Tipo de Piso</label>
        <select id="datos_pisos" name="datos_pisos">
            <option value="">-- Selecciona Tipo de Pisos --</option>
        </select>

        <label for="datos_cuarto">¿Cuantos Cuartos?</label>
        <input type="text" id="datos_cuarto" name="datos_cuarto">

        <label for="datos_combustibles_cocina">Combustible para Cocina</label>
        <select id="datos_combustibles_cocina" name="datos_combustibles_cocina">
            <option value="">-- Selecciona Tipo de combustibles cocina --</option>
        </select>

        <label for="datos_servicios_higienicos">Servicios Higiénicos</label>
        <select id="datos_servicios_higienicos" name="datos_servicios_higienicos">
            <option value="">-- Selecciona Tipo de Servicios Higiénicos --</option>
        </select>

        <label for="datos_viviendas">Tipo de Viviendas</label>
        <select id="datos_viviendas" name="datos_viviendas">
            <option value="">-- Selecciona Tipo Vivienda --</option>
        </select>

        <label for="datos_pago_vivienda">Pago por Vivienda</label>
        <input type="text" id="datos_pago_vivienda" name="datos_pago_vivienda">

        <label for="datos_agua">Servicio de Agua</label>
        <select id="datos_agua" name="datos_agua">
            <option value="">-- Selecciona Tipo Servicio de Agua --</option>
        </select>

        <label for="datos_pago_agua">Pago de Agua</label>
        <input type="text" id="datos_pago_agua" name="datos_pago_agua">

        <label for="datos_pago_luz">Pago de Luz</label>
        <input type="text" id="datos_pago_luz" name="datos_pago_luz">

        <label for="datos_cantidad_luz">Cantidad de Luz Consumida</label>
        <input type="number" id="datos_cantidad_luz" name="datos_cantidad_luz">

        <label for="datos_internet">Servicio de Internet</label>
        <input type="text" id="datos_internet" name="datos_internet">

        <label for="datos_pago_internet">Pago de Internet</label>
        <input type="text" id="datos_pago_internet" name="datos_pago_internet">

        <label for="datos_tv_cable">TV por Cable</label>
        <input type="text" id="datos_tv_cable" name="datos_tv_cable">

        <label for="datos_tv_pago">TV de Pago</label>
        <input type="text" id="datos_tv_pago" name="datos_tv_pago">

        <label for="datos_eliminacion_basura">Eliminación de Basura</label>
        <select id="datos_eliminacion_basura" name="datos_eliminacion_basura">
            <option value="">-- Selecciona Tipo Eliminación de Basura --</option>
        </select>

        <label for="datos_lugares_mayor_frecuencia_viveres">Lugares Frecuentes de Compra de Víveres</label>
        <select id="datos_lugares_mayor_frecuencia_viveres" name="datos_lugares_mayor_frecuencia_viveres">
            <option value="">-- Selecciona Donde Compra los Víveres --</option>
        </select>

        <label for="datos_gastos_viveres_alimentacion">Gastos en Alimentación</label>
        <input type="text" id="datos_gastos_viveres_alimentacion" name="datos_gastos_viveres_alimentacion">

        <label for="datos_medio_transporte">Medio de Transporte</label>
        <select id="datos_medio_transporte" name="datos_medio_transporte">
            <option value="">-- Selecciona Tipo Medio de Transposte --</option>
        </select>

        <label for="datos_estado_transporte">Estado del Transporte</label>
        <select id="datos_estado_transporte" name="datos_estado_transporte">
            <option value="">-- Selecciona el Estado del Transporte --</option>
        </select>

        <label for="datos_terrenos">¿Posee Terrenos?</label>
        <input type="text" id="datos_terrenos" name="datos_terrenos">

        <label for="datos_celular">¿Posee Celular?</label>
        <input type="text" id="datos_celular" name="datos_celular">

        <label for="datos_cantidad_celulare">Cantidad de Celulares</label>
        <input type="number" id="datos_cantidad_celulare" name="datos_cantidad_celulare">

        <label for="datos_plan_celular">Plan de Celular</label>
        <input type="text" id="datos_plan_celular" name="datos_plan_celular">

        <button type="submit">Enviar</button>
    </form>

</body>

</html>