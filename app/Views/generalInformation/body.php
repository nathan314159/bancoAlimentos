<!DOCTYPE html>
<html lang="es">


<head>

    <meta charset="UTF-8">
    <title>Formulario de Datos</title>

    <!-- AlertifyJS CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
    <!-- AlertifyJS JS -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

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

    <form id="datosForm" action="<?php echo base_url('/insertDatosGenerales'); ?>" method="POST">
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
<script>
    const datos_provincia = document.getElementById("datos_provincia");
    const datos_canton = document.getElementById("datos_canton");
    const datos_parroquias = document.getElementById("datos_parroquias");
    const datos_comunidades = document.getElementById("datos_comunidades");
    const datos_barrios = document.getElementById("datos_barrios");
    const datos_tipo_viviendas = document.getElementById("datos_tipo_viviendas");
    const datos_techos = document.getElementById("datos_techos");
    const datos_paredes = document.getElementById("datos_paredes");
    const datos_pisos = document.getElementById("datos_pisos");
    const datos_cuarto = document.getElementById("datos_cuarto");
    const datos_combustibles_cocina = document.getElementById("datos_combustibles_cocina");
    const datos_servicios_higienicos = document.getElementById("datos_servicios_higienicos");
    const datos_viviendas = document.getElementById("datos_viviendas");
    const datos_pago_vivienda = document.getElementById("datos_pago_vivienda");
    const datos_agua = document.getElementById("datos_agua");
    const datos_pago_agua = document.getElementById("datos_pago_agua");
    const datos_pago_luz = document.getElementById("datos_pago_luz");
    const datos_cantidad_luz = document.getElementById("datos_cantidad_luz");
    const datos_internet = document.getElementById("datos_internet");
    const datos_pago_internet = document.getElementById("datos_pago_internet");
    const datos_tv_cable = document.getElementById("datos_tv_cable");
    const datos_tv_pago = document.getElementById("datos_tv_pago");
    const datos_eliminacion_basura = document.getElementById("datos_eliminacion_basura");
    const datos_lugares_mayor_frecuencia_viveres = document.getElementById("datos_lugares_mayor_frecuencia_viveres");
    const datos_gastos_viveres_alimentacion = document.getElementById("datos_gastos_viveres_alimentacion");
    const datos_medio_transporte = document.getElementById("datos_medio_transporte");
    const datos_estado_transporte = document.getElementById("datos_estado_transporte");
    const datos_terrenos = document.getElementById("datos_terrenos");
    const datos_celular = document.getElementById("datos_celular");
    const datos_cantidad_celulare = document.getElementById("datos_cantidad_celulare");
    const datos_plan_celular = document.getElementById("datos_plan_celular");

    document.getElementById("datosForm").addEventListener("submit", function(e) {
        e.preventDefault(); // Stop the form from submitting

        if (datos_provincia.value === "") {
            alertify.error("Por favor selecciona una provincia");
            datos_provincia.focus();
            return;
        }

        if (datos_canton.value === "") {
            alertify.error("Por favor selecciona un cantón");
            datos_canton.focus();
            return;
        }

        if (datos_parroquias.value == "") {
            alertify.error("Por favor selecciona una parroquia");
            datos_parroquias.focus();
            return;
        }

        if (datos_comunidades.value.trim() === "") {
            alertify.error("Por favor escribe una comunidad");
            datos_comunidades.focus();
            return;
        }

        if (datos_barrios.value.trim() === "") {
            alertify.error("Por favor escribe un barrio");
            datos_barrios.focus();
            return;
        }



        if (datos_tipo_viviendas.value.trim() === "") {
            alertify.error("Por favor escribe el tipo vivienda");
            datos_tipo_viviendas.focus();
            return;
        }

        if (datos_techos.value.trim() === "") {
            alertify.error("Por favor escribe tipo de techo");
            datos_techos.focus();
            return;
        }

        if (datos_paredes.value.trim() === "") {
            alertify.error("Por favor escribe tipo de pared");
            datos_paredes.focus();
            return;
        }

        if (datos_pisos.value.trim() === "") {
            alertify.error("Por favor escribe un tipo de piso");
            datos_pisos.focus();
            return;
        }

        if (isNaN(datos_cuarto.value) || parseInt(datos_cuarto.value) <= 0) {
            alertify.error("Por favor ingresa un número válido de cuartos");
            datos_cuarto.focus();
            return;
        }

        if (datos_combustibles_cocina.value.trim() === "") {
            alertify.error("Por favor escribe un tipo de combustible");
            datos_combustibles_cocina.focus();
            return;
        }

        if (datos_servicios_higienicos.value.trim() === "") {
            alertify.error("Por favor escribe un servicio higienico");
            datos_servicios_higienicos.focus();
            return;
        }

        if (datos_viviendas.value.trim() === "") {
            alertify.error("Por favor escribe los datos de la vivienda");
            datos_viviendas.focus();
            return;
        }

        if (datos_pago_vivienda.value.trim() === "") {
            alertify.error("Por favor escribe el pago de la vivienda");
            datos_pago_vivienda.focus();
            return;
        }

        if (datos_agua.value.trim() === "") {
            alertify.error("Por favor escribe los datos de agua");
            datos_agua.focus();
            return;
        }

        if (datos_pago_agua.value.trim() === "") {
            alertify.error("El campo 'Pago de Agua' es obligatorio");
            datos_pago_agua.focus();
            return;
        }

        if (datos_pago_luz.value.trim() === "") {
            alertify.error("Por favor escribe los datos de la luz");
            datos_pago_luz.focus();
            return;
        }

        if (isNaN(datos_cantidad_luz.value) || parseInt(datos_cantidad_luz.value) <= 0) {
            alertify.error("Por favor ingresa una cantidad válida de luz consumida");
            datos_cantidad_luz.focus();
            return;
        }


        // nuevos 
        // ingresos 
        // de datos

        if (datos_internet.value.trim() === "") {
            alertify.error("Por favor escribe datos del internet");
            datos_internet.focus();
            return;
        }

        if (datos_pago_internet.value.trim() === "") {
            alertify.error("Por favor escribe la cantidad del pago de internet");
            datos_pago_internet.focus();
            return;
        }

        if (datos_tv_cable.value.trim() === "") {
            alertify.error("Por favor escribe los datos de tv cable");
            datos_tv_cable.focus();
            return;
        }

        if (datos_tv_pago.value.trim() === "") {
            alertify.error("Por favor escribe la cantidad de pagos tv");
            datos_tv_pago.focus();
            return;
        }

        if (datos_eliminacion_basura.value.trim() === "") {
            alertify.error("Por favor escribe donde se elimina la basura");
            datos_eliminacion_basura.focus();
            return;
        }

        if (datos_lugares_mayor_frecuencia_viveres.value.trim() === "") {
            alertify.error("Por favor escribe dónde frecuenta para hacer las compras del hogar");
            datos_lugares_mayor_frecuencia_viveres.focus();
            return;
        }

        if (datos_gastos_viveres_alimentacion.value.trim() === "") {
            alertify.error("Por favor escribe cuanto sale en compras");
            datos_gastos_viveres_alimentacion.focus();
            return;
        }

        if (datos_medio_transporte.value.trim() === "") {
            alertify.error("Por favor escribe el medio de transporte que usa");
            datos_medio_transporte.focus();
            return;
        }

        if (datos_estado_transporte.value.trim() === "") {
            alertify.error("Por favor escribe el estado de su transporte");
            datos_estado_transporte.focus();
            return;
        }

        if (datos_terrenos.value.trim() === "") {
            alertify.error("Por favor escribe si tiene terrenos");
            datos_terrenos.focus();
            return;
        }

        if (datos_celular.value.trim() === "") {
            alertify.error("Por favor escribe si tienes celular");
            datos_celular.focus();
            return;
        }

        if (isNaN(datos_cantidad_celulare.value) || parseInt(datos_cantidad_celulare.value) <= 0) {
            alertify.error("Por favor ingresa una cantidad válida de celulares");
            datos_cantidad_celulare.focus();
            return;
        }


        if (datos_plan_celular.value.trim() === "") {
            alertify.error("Por favor escribe que plan de celular tiene");
            datos_plan_celular.focus();
            return;
        }

        // If all validations pass:
        alertify.success("Formulario válido, enviando...");
        this.submit(); // Now send the form


    });
</script>

</html>