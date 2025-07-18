<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<?php echo base_url('/formGeneralInformation'); ?>">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-seedling"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Banco de Alimentos</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Registros generales
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item <?php echo $function == 'formulario' ? 'active' : ''; ?>">
                <a class="nav-link" href="<?php echo base_url('/formGeneralInformation'); ?>">
                    <i class="fas fa-clipboard"></i>
                    <span>Formulario</span></a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item <?php echo $function == 'datos registrados' ? 'active' : ''; ?>">
                <a class="nav-link" href="<?php echo base_url('/informationRecords'); ?>">
                    <i class="fas fa-scroll"></i>
                    <span>Datos registrados</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">
                        <?php echo $function == 'formulario' ? '<h1><b>Formulario general</b></h1>' : ''; ?>
                        <?php echo $function == 'datos registrados' ? '<h1><b>Datos registrados</b></h1>' : ''; ?>
                        <?php echo $function == 'modificar perfil' ? '<h1><b>Modificar cuenta</b></h1>' : ''; ?>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 lg"><b><?php echo session('users_nombre') . ' ' . session('users_apellido'); ?></b></span>
                                <img class="img-profile rounded-circle"
                                    src="<?php echo base_url(); ?>assets/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">

                                <a class="dropdown-item disabled text-gray-500 text-center w-100" href="#" tabindex="-1" aria-disabled="true">
                                    <b><?php echo session('rol_nombre'); ?></b>
                                </a>


                                <div class="dropdown-divider"></div>

                                <a class="dropdown-item" href="<?php echo base_url('/profile'); ?>">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Modificar cuenta
                                </a>

                                <div class="dropdown-divider"></div>

                                <a class="dropdown-item" href="<?php echo base_url('/logout'); ?>">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Cerrar sesión
                                </a>
                            </div>

                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->