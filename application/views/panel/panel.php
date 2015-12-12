<body class="skin-blue sidebar-mini">
<div class="wrapper">

<header class="main-header">

  <!-- Logo -->
  <a href="#" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b></b>Admin</span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b>Administracion</b></span>
  </a>

  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top" role="navigation">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>
    <!-- Navbar Right Menu -->
    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <!-- Messages: style can be found in dropdown.less-->
        <li class="dropdown messages-menu">
          <a href="<?=base_url('correo')?>">
            <i class="fa fa-envelope-o"></i>
          </a>
        </li>
         <!-- User Account: style can be found in dropdown.less -->
        <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <?php
              if(file_exists("uploads/". getImagenPerfil())){
                ?>
                  <img src="<?=base_url('uploads/'. getImagenPerfil())?>" class="user-image" alt="User Image">
                <?
              }else{
                ?>
                  <img src="<?=base_url('dist/img/no_image.gif')?>" class="user-image" alt="User Image">
                <?
              }
            ?>                  
            <span class="hidden-xs"><?=getNombre()?></span>
          </a>
          <ul class="dropdown-menu">
            <!-- User image -->
            <li class="user-header">
              <?php
                if(file_exists("uploads/". getImagenPerfil())){
                  ?>
                    <img src="<?=base_url('uploads/'. getImagenPerfil())?>" class="img-circle" alt="User Image">
                  <?
                }else{
                  ?>
                    <img src="<?=base_url('dist/img/no_image.gif')?>" class="img-circle" alt="User Image">
                  <?
                }
              ?>
              
              <p>
                <?=getNombreCompleto()?>
                <small>Administrador</small>
              </p>
            </li>
   
            <!-- Menu Footer-->
            <li class="user-footer">
              <div class="pull-left">
                <a href="<?=base_url('perfil')?>" class="btn btn-default btn-flat">Mi Perfil</a>
              </div>
              <div class="pull-right">
                <a href="<?=base_url('sesion/cerrar_sesion')?>" class="btn btn-default btn-flat">Cerrar sesión</a>
              </div>
            </li>
          </ul>
        </li>
       </ul>
    </div>

  </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar" style="height: auto;">

    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
      <li class="header">Navegación</li>
      <li class="active treeview">
        <a href="#">
          <i class="fa fa-graduation-cap"></i> <span>Egresados</span> <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li><a href="javascript:registrarEgresado()"><i class="fa fa-circle-o"></i> Agregar</a></li>
          <li><a href="javascript:listarEgresados()"><i class="fa fa-circle-o"></i> Listado</a></li>
          <li><a href="javascript:importarEgresado()"><i class="fa fa-circle-o"></i> Importar</a></li>
        </ul>
      </li>
      <li class="treeview">
        <a href="#">
          <i class="fa fa-industry"></i>
         <span>Empresas</span> <i class="fa fa-angle-left pull-right"></i>      
        </a>
        <ul class="treeview-menu">
          <li><a href="javascript:listarEmpresas()"><i class="fa fa-circle-o"></i> Listado</a></li>
        </ul>
      </li>
      <li class="treeview">
        <a href="#">
          <i class="fa fa-pie-chart"></i>
          <span>Publicadores</span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li><a href="javascript:registrarPublicador()"><i class="fa fa-circle-o"></i> Agregar</a></li>
          <li><a href="javascript:listarPublicador()"><i class="fa fa-circle-o"></i> Listado</a></li>
     
        </ul>
      </li>
      <li class="treeview">
        <a href="#">
          <i class="fa fa-laptop"></i>
          <span>Administradores</span>
          <i class="fa fa-angle-left pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li><a href="javascript:registrarAdministrador()"><i class="fa fa-circle-o"></i> Agregar</a></li>
          <li><a href="javascript:listarAdministradores()"><i class="fa fa-circle-o"></i> Listado</a></li>
        </ul>
      </li>
      <li><a href="javascript:menuReportes()"><i class="fa fa-pie-chart"></i> <span>Reportes</span></a></li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="min-height: 916px;" id="contenido">

</div><!-- ./wrapper -->

<!--Importando archivos js-->
<script type="text/javascript" src="<?=base_url('dist/js/admin.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/listas.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/jquery.cedula_plugin.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/jquery.mask/jquery.mask.js')?>"></script>
<script type="text/javascript" src="<?=base_url('plugins/highcharts/highcharts.js')?>"></script>
<script type="text/javascript" src="<?=base_url('dist/js/validar.js')?>"></script>