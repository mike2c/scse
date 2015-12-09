<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
          <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
          <li data-target="#carousel-example-generic" data-slide-to="3" class=""></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img src="http://placehold.it/1200x400/3c8dbc/ffffff?text=Universidad+Nacional+De+Ingeniería" alt="First slide">
            <div class="carousel-caption">
              Recinto Universitario Augusto César Sandino <br>
              Sistema de control y seguimiento de egresados
            </div>
          </div>
          <div class="item">
            <img src="http://placehold.it/1200x400/3c8dbc/ffffff?text=Curriculum+Vitae" alt="Second slide">
            <div class="carousel-caption">
              Crea y actualiza tu curriculum vitae con tu información personal, experiencia laboral y estudios realizados
            </div>
          </div>
          <div class="item">
            <img src="http://placehold.it/1200x400/3c8dbc/ffffff?text=Egresados" alt="Third slide">
            <div class="carousel-caption">
              Formen parte del programa de control y seguimiento de egresados de la universidad nacional de ingeniería, Recinto Universitario Augusto C. Sandino.
            </div>
          </div>
          <div class="item">
            <img src="http://placehold.it/1200x400/3c8dbc/ffffff?text=Empresas" alt="Third slide">
            <div class="carousel-caption">
              Agiliza el proceso de reclutamiento y selección de personal consultando en nuestra base de datos de egresados.
            </div>
          </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
          <span class="fa fa-angle-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
          <span class="fa fa-angle-right"></span>
        </a>
      </div>
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
        if (isset($lista)) {
         ?> 
          <ul class="product-list product-list-in-box">
            
          </ul>
        <?php
        }else{
        ?>
          <div class="alert alert-danger alert-dismissable text-justify">
            <h4 >
              <i class="icon glyphicon glyphicon-info-sign"></i>
              Alerta
            </h4>
            No hay Nuevas Publicaciones.
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
