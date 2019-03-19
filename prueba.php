 <!DOCTYPE html>
<html>
<head>
	<title>Inicio</title>
	<link rel="stylesheet" type="text/css" href="css/ferreline.css">
	<link rel="stylesheet" type="text/css" href="estilos-index/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<?php
	include("header.php");
?>
<?php
	include("menu-sin-sesion.php");
?>
<div style="width: 90%; margin: auto; min-height: 500px" class="cont-centrado">
	<div class="row cont-centrado">
		<div class="column-comp-3 column-tablet-5 column-cel-10 cont-centrado">
			<div class="row bg-blanco borde-radio-10 sombra">
				<div class="column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
					<img src="https://pbs.twimg.com/profile_images/446356636710363136/OYIaJ1KK.png" width="200" alt="">
				</div>
				<div class="column-comp-10 column-tablet-10 column-cel-10">
					<div class="row">
 						<div class="h-0-4 column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
					<div class="row">
 						<div class="column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
					<div class="row">
 						<div class="column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="column-comp-3 column-tablet-5 column-cel-10 cont-centrado">
			<div class="row bg-blanco borde-radio-10 sombra">
				<div class="column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
					<img src="https://pbs.twimg.com/profile_images/446356636710363136/OYIaJ1KK.png" width="200" alt="">
				</div>
				<div class="column-comp-10 column-tablet-10 column-cel-10">
					<div class="row">
 						<div class="h-0-4 column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
					<div class="row">
 						<div class="column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
					<div class="row">
 						<div class="column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="column-comp-3 column-tablet-5 column-cel-10 cont-centrado">
			<div class="row bg-blanco borde-radio-10 sombra">
				<div class="column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
					<img src="https://pbs.twimg.com/profile_images/446356636710363136/OYIaJ1KK.png" width="200" alt="">
				</div>
				<div class="column-comp-10 column-tablet-10 column-cel-10">
					<div class="row">
 						<div class="h-0-4 column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
					<div class="row">
 						<div class="column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
					<div class="row">
 						<div class="column-comp-4 bg-celeste column-tablet-4 column-cel-4 cont-centrado">
 							Hola
						</div>
						<div class="column-comp-6 bg-azul column-tablet-6 column-cel-6 cont-centrado">
 							Descripcion
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php
	include("footer.php");
?>
<script>
	var menu = document.getElementById("boton-menu");
	var elems = document.getElementsByClassName('column-cel-9-8');
	menu.onclick = function(){
		if(elems[1].style.display == "none"){
			for (var i=0;i<elems.length;i+=1){
				elems[i].style.display = 'block';
			}
		}else{
			for (var i=0;i<elems.length;i+=1){
				elems[i].style.display = 'none';
			}
		}
	}
	setInterval(function(){
		if(screen.width > 700){
			menu.style.display = "none";
		}
	},100);
</script>
</body>
</html>