<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span><b>Copyright &copy; Banco de Alimentos - 2025</b></span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->


</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<?php echo base_url(); ?>assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<?php echo base_url(); ?>assets/js/sb-admin-2.min.js"></script>

<!-- JS for General Information -->
<?php if ($function == 'formulario') { ?>
    <script src="<?php echo base_url(); ?>/assets/js/operations/generalInformation.js"></script>
    <script src="<?php echo base_url(); ?>/assets/js/operations/indexedDB.js"></script>
<?php } ?>

<!-- JS for General Information Records -->
<?php if ($function == 'datos registrados') { ?>
    <script src="<?php echo base_url(); ?>/assets/js/operations/generalInformationRecords.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<?php } ?>

<!-- JS for Profile-->
<?php if ($function == 'modificar perfil') { ?>
    <script src="<?php echo base_url(); ?>/assets/js/operations/profile.js"></script>
<?php } ?>

<!-- Alertify -->
<script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>/assets/js/alertify/alertify.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo base_url(); ?>/assets/js/alertify/alertify.min.js"></script>

<!--DATATABLE JQUERY-->
<script src="https://cdn.datatables.net/2.3.2/js/dataTables.min.js"></script>

<!-- Service Worker -->
<script>
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('<?php echo base_url(); ?>sw.js')
            .then(reg => console.log('Service Worker registrado 🚀', reg))
            .catch(err => console.error('Error registrando SW:', err));
    }
</script>

<!-- sync -->
<script src="<?php echo base_url(); ?>/assets/js/operations/sync.js"></script>


</body>

</html>