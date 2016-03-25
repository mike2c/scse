<script type="text/javascript" src="<?=base_url('plugins/highcharts/highcharts.js')?>"></script>
<?php
	crear_grafico_pastel($data, $pregunta, "% de personas");
?>
<div id="background"></div>
<style type="text/css">
	#container{
	
		margin: 0 auto;
	
	}
	#background{
		padding: 10px 0px;
		background-color: white;
	}
</style>
<script type="text/javascript">
	$("#container").appendTo("#background");
</script>