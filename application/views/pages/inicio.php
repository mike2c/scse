<div class="container">
  <div class="row">
   <div class="col-md-12 col-lg-12">
      <ul class="pgwSlider">
        <li><img src="<?=base_url()?>dist/img/Uni_banner.jpg" alt='SCSE' data-description='Recinto Universitario Augusto César Sandino - Sistema de control y seguimiento de egresados'></li>
        <li><img src="<?=base_url()?>dist/img/Curriculum_banner.jpg" alt='Curriculum Vitae' data-description='Crea y actualiza tu curriculum vitae con tu información personal, experiencia laboral y estudios realizados.'></li>
        <li><img src="<?=base_url()?>dist/img/Egresados_banner.jpg" alt='Egresados' data-description='Formen parte del programa de control y seguimiento de egresados de la universidad nacional de ingeniería, Recinto Universitario Augusto C. Sandino.'></li>
        <li><img src="<?=base_url()?>dist/img/Empresas_banner.jpg" alt='Empresas' data-description='Agiliza el proceso de reclutamiento y selección de personal consultando en nuestra base de datos de egresados.'></li>
      </ul>
    </div>
    <div class="col-md-8">
      <br>
      <div class="box box-primary">
        <div class="row">
          <div class="col-sm-4">
            <div class="box-header with-border text-center">
              <h3 class="box-title">Objetivo</h3>
            </div>
            <div class="box-body text-justify text-muted">
              Impulsar vínculos permanentes de apoyo y beneficio mutuo entre el Recinto Universitario Augusto C. Sandino, sede regional del norte con sus egresados y graduados, así como crear y mantener relaciones entre la universidad y los empleadores de la Región Norte del país facilitando la inserción laboral de los egresados y graduados del Recinto.
            </div>
          </div>
          <div class="col-sm-4">
            <div class="box-header with-border text-center">
              <h3 class="box-title">Misión</h3>
            </div>
            <div class="box-body text-justify text-muted">
              El programa de seguimiento a graduados del Recinto Universitario Augusto C. Sandino, sede regional del norte es la instancia institucional responsable de la vinculación dinámica y permanente entre los egresados, graduados, la universidad y empleadores, para facilitar la mejor y actualización del currículo de las carreras, el vínculo con el campo laboral y la formación permanente.
            </div>
          </div>
          <div class="col-sm-4">
            <div class="box-header with-border text-center">
              <h3 class="box-title">Visión</h3>
            </div>
            <div class="box-body text-justify text-muted">
              Ser un programa competente para fortalecer la pertinencia de la formación profesional, a través de la interacción institucional del Recinto Universitario Augusto C. Sandino, sede regional del norte con los graduados y los empleadores que posibilitan su inserción laboral en cada una de las actividades dirigidas  a la trasformación de la sociedad y su entorno.
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <br>
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Ultimas Publicaciones</h3>
        </div>
        <div class="box-body">
        <?php 
        if (isset($publicaciones)) {
         ?> 
          <ul class="products-list product-list-in-box">
            <?php
            if($publicaciones['curso']->num_rows() > 0){
            ?>
              <li class="item">
                <div class="product-img">
                <?php
                  if ($imagenCurso) {
                ?>
                    <img src="<?= base_url('Imagen/Cargar/'.$publicaciones['curso']->row()->imagen_publicacion_id) ?>" alt="">
                <?php
                  }else{
                ?>
                    <img src="<?= base_url()?>dist/img/imagen_publicaciones.jpg" alt="">
                <?php
                  }
                ?>
                </div>
                <div class="product-info">
                  <a href="<?=base_url('publicaciones/cursos')?>" class="product-title"><?= $publicaciones['curso']->row()->nombre_curso ?> <span class="label label-warning pull-right">$<?=$publicaciones['curso']->row()->costo?></span></a>
                  <span class="product-description">
                    <?= $publicaciones['curso']->row()->descripcion ?>
                  </span>
                </div>
              </li>
            <?php
            }if($publicaciones['beca']->num_rows() > 0){
            ?>
              <li class="item">
                <div class="product-img">
                <?php
                  if ($imagenBeca) {
                ?>
                    <img src="<?= base_url('Imagen/Cargar/'.$publicaciones['beca']->row()->imagen_publicacion_id) ?>" alt="">
                <?php
                  }else{
                ?>
                    <img src="<?= base_url()?>dist/img/imagen_publicaciones.jpg" alt="">
                <?php
                  }
                ?>
                  
                </div>
                <div class="product-info">
                  <a href="<?=$publicaciones['beca']->row()->url?>" class="product-title"><?= $publicaciones['beca']->row()->programa_academico ?></a>
                  <span class="product-description">
                    <?= $publicaciones['beca']->row()->descripcion ?>
                  </span>
                </div>
              </li>
            <?php
            }if($publicaciones['ficha']->num_rows() > 0){
            ?>
              <li class="item">
                <div class="product-img">
                <?php
                  if ($imagenFicha) {
                ?>
                   <img src="<?= base_url('Imagen/Cargar/'.$publicaciones['ficha']->row()->imagen_publicacion_id) ?>" alt=""> 
                <?php
                  }else{
                ?>
                    <img src="<?= base_url()?>dist/img/imagen_publicaciones.jpg" alt="">
                <?php
                  }
                ?>
                </div>
                <div class="product-info">
                  <a href="<?=base_url('publicaciones/bolsa_de_trabajo')?>" class="product-title"><?= $publicaciones['ficha']->row()->cargo ?></a>
                  <span class="product-description">
                    <?= $publicaciones['ficha']->row()->descripcion ?>
                  </span>
                </div>
              </li>
            <?php
            }
            ?>
          </ul>
        <?php
        }else{
        ?>
          <div class="callout callout-info text-justify">
            <h4 >
              No hay Nuevas Publicaciones.
            </h4>
          </div>
        <?php
        }
        ?>
        </div>
      </div>
    </div>
    <div class="col-md-12">
      <div class="box box-primary">
        <div class="box-header with-border">
          <i class="fa fa-info-circle"></i>
          <h3 class="box-title">Contactanos</h3>
        </div>
        <div class="box-footer no-border">
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box border-right">
              <span class="info-box-icon bg-green">
                <i class="fa fa-map-marker"></i>
              </span>
              <div class="info-box-content text-justify">
                <strong class="text-muted">Dirección:</strong>
                <p class="text-muted">Entrada a La Tunoza, Antigua Hacienda el Higo, Estelí, Nicaragua</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-red">
                <i class="fa fa-phone"></i>
              </span>
              <div class="info-box-content text-justify">
                <strong class="text-muted">Telefonos:</strong>
                <p class="text-muted">
                  Administración: 2719-7841 <br>
                  Registro académico: 2719-7818 <br>
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-aqua">
                <i class="fa fa-bookmark"></i>
              </span>
              <div class="info-box-content text-justify">
                <strong class="text-muted">Sitios de interés:</strong>
                <p class="text-muted">
                  <a href="http://norte.uni.edu.ni/" target="_new">Universidad Nacional de Ingeniería, RUACS</a>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="<?=base_url()?>dist/js/app.min.js"></script>
<script type="text/javascript" src="<?=base_url()?>dist/js/pgwslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?=base_url()?>dist/css/pgwslider.min.css">
<script type="text/javascript">
  $(document).ready(function() {
      $('.pgwSlider').pgwSlider({
        transitionEffect: "sliding",
        intervalDuration: 5000,
        transitionDuration: 700,
        displayList: false,
        displayControls: true,
        adaptiveHeight: true,
        verticalCentering: true,
        touchControls: true,
      });
  });
</script>