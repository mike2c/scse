<?php

	function crear_grafico_pastel($arr,$text = "",$tooltipText = ""){
		if($text== null || $text == ""){
			$text = "Titulo por default";
		}
		if($tooltipText== null || $tooltipText == ""){
			$tooltipText = "Titulo por default";
		}
		?>
		<style type="text/css">
			${demo.css}
			</style>
			<div id="container" style="min-width: 310px; height: 500px; max-width: 600px;margin-bottom:10px;"></div>
			<script type="text/javascript">
				
				var data = <?=json_encode($arr)?>;
				var jsonData = Array();
				for(var i = 0; i < data.length; i++){
					jsonData.push({name:data[i].name,y: parseFloat(data[i].y)});
				}
				$('#container').highcharts({
			            chart: {
			                plotBackgroundColor: null,
			                plotBorderWidth: null,
			                plotShadow: false,
			                type: 'pie'
			            },
			            title: {
			                text: "<?=$text?>"
			            },
			            tooltip: {
			                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			            },
			            plotOptions: {
			                pie: {
			                    allowPointSelect: true,
			                    cursor: 'pointer',
			                    dataLabels: {
			                        enabled: false
			                    },
			                    showInLegend: true
			                }
			            },
			            series:[{
			                name: "<?=$tooltipText?>",
			                colorByPoint: true,
			                data: jsonData}]
			             });
			</script>
		<?

	}
?>
