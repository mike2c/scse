<!DOCTYPE html>
<html lang="es">
	<title>Universidad Nacional de Ingenieria - Sistema de control y seguimiento de egresados y gradudados</title>
	<head>
		<!--Cargando JQuery-->
		<script type="text/javascript" src="<?=base_url('plugins/jquery/jquery.js')?>"></script>

		<!--Cargando bootstrap-->
		<link rel="stylesheet" type="text/css" href="<?=base_url('bootstrap/css/bootstrap.css')?>"></link>
		<script type="text/javascript" src="<?=base_url('bootstrap/js/bootstrap.js')?>"></script>
		
		<!--Cargando archivos generados-->
		<link rel="stylesheet" type="text/css" href="<?=base_url('dist/css/AdminLTE.css')?>"></link>
		<link rel="stylesheet" type="text/css" href="<?=base_url('dist/css/scse.css')?>"></link>
		<link rel="stylesheet" type="text/css" href="<?=base_url('dist/css/skins/_all-skins.css')?>"></link>

		<link rel="stylesheet" href="<?=base_url('dist/css/skins/_all-skins.css')?>">
		<script type="text/javascript" src="<?=base_url('dist/js/app.min.js')?>"></script>
		<script type="text/javascript" src="<?=base_url('dist/js/demo.js')?>"></script>
		
		<!--Cargando plugins-->
		<link rel="stylesheet" href="<?=base_url()?>plugins/iCheck/all.css">
		<link rel="stylesheet" href="<?=base_url('plugins/jquery-ui/jquery-ui.min.css')?>">
		<script type="text/javascript" src="<?=base_url('plugins/jquery-ui/jquery-ui.min.js')?>"></script>
		
		<!--Font awsome 4.4.0-->
		<link rel="stylesheet" href="<?=base_url('font-awesome/css/font-awesome.min.css')?>">
		<script type="text/javascript">
			$(function($){
			    $.datepicker.regional['es'] = {
			        closeText: 'Cerrar',
			        prevText: '<Ant',
			        nextText: 'Sig>',
			        currentText: 'Hoy',
			        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
			        monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
			        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
			        dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
			        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
			        weekHeader: 'Sm',
			        dateFormat: 'dd/mm/yy',
			        firstDay: 1,
			        isRTL: false,
			        showMonthAfterYear: false,
			        yearSuffix: ''

			    };
			    $.datepicker.setDefaults($.datepicker.regional['es']);
			});

			function baseURL(ext){

				if(ext != undefined){
					return "<?=base_url()?>" + ext
				}

				return "<?=base_url()?>";
			}
		</script>
	</head>

<body>
		

