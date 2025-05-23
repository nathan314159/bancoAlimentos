<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Local Bootstrap CSS -->
    <link href="<?= base_url('bootstrap/bootstrap-5.3.6-dist/css/bootstrap.min.css') ?>" rel="stylesheet">

    <!-- Your Custom Styles -->
    <link href="<?= base_url('css/style.css') ?>" rel="stylesheet">
</head>

<body>

    <div class="container">
        <?= $this->renderSection("content"); ?>
    </div>

    <!-- Local Bootstrap JS -->
    <script src="<?= base_url('bootstrap/bootstrap-5.3.6-dist/js/bootstrap.bundle.min.js') ?>"></script>
</body>

</html>