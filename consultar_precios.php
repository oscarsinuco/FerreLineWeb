<?php
	session_start();
	if($_SESSION["roll"] != "administrador"){
		if( $_SESSION["roll"] == "cliente" ){

		}
		else{
			header("location:index.php");
		}
		
	}

	include("cerrarSesion.php");
	if (isset($_SESSION['inicioSesion']))
	{
		cerrarSesion();
	}
	$_SESSION['inicioSesion'] = time();

?>
<!DOCTYPE html>
<html>
<head>
	<title>Consulta precio productos por unidad</title>
	<link rel="stylesheet" type="text/css" href="css/ferreline.css">
	<link rel="stylesheet" type="text/css" href="estilos-index/estilos.css">
</head>
<body>
<?php
	include("header.php");
?>
<?php
	if (isset($_SESSION['inicioSesion'])){
		cerrarSesion();
	}
	if (isset($_SESSION['roll']) ){
		if($_SESSION["roll"] == "cliente"){
			include("menu-cliente.php");
		}
		else{
			if($_SESSION["roll"] == "empleado"){
				include("menu-empleado.php");
			}
			else{
				if($_SESSION["roll"] == "jefe"){
					include("menu-jefe.php");
				}
				else{
					if($_SESSION["roll"] == "administrador"){
						include("menu.php");
					}
					else{
						include("menu-sin-sesion.php");
					}
				}
			}
		}
	}
	else{
		include("menu-sin-sesion.php");
	}
?>
	<?php
		include("conectar.php");
		$valor1 = 0;
		extract($_POST);
		if(($valor1 != "")){
			if(($valor1 > 0)){

			}
			else{
				$valor1 = 0;
			}
		}else{
			$valor1 = 0;
		}
		$conexion = conectarse();
	?>
	<div class="row m-h-400 column-comp-9 column-tablet-9 column-cel-9 centrado cont-centrado-vertical">
	    <div class="column-comp-4 column-tablet-4 column-cel-10 bg-oscuro-transparente borde-radio-10 cont-centrado">
	    	<form action="/FerreLineWeb/consultar_precios.php" method="POST" class="h-100 column-comp-10">
	    		<div class="column-comp-10 column-tablet-10 column-cel-10 h-20 borde-radio-top-10 bg-azul">
		                <h1 class="texto-centrado blanco">CONSULTA UN PRODUCTO</h1>
		        </div>
		        <div class="row column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
		        	<div class="column-comp-8 column-tablet-8 column-cel-8 m-t-20 m-b-20 centrado">
		                <label for="" class="blanco">Código producto<input type="number" name="id_producto" class="text-comp text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10"></label>
		            </div>
		        </div>
		        <div class="row column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
		            <div class="column-comp-8 column-tablet-8 column-cel-8 cont-centrado">
		                <input type="submit" class="btn-amarillo column-comp-4 boton-comp boton-tablet boton-cel" value="Buscar producto">
		                <input type="submit" class="btn-azul column-comp-4 margen-10 boton-comp boton-tablet boton-cel" value="Cancelar">
		            </div>
		        </div>
		    </form>
	    </div>
	    <div class="column-comp-5 margen-comp-10 margen-tablet-10 column-tablet-5 column-cel-10 cont-centrado">
	    	<?php
	    		if($_POST != null){
	    			echo "<div class='tarjeta column-comp-7 column-tablet-10 column-cel-10 bg-blanco'>";
	    				echo "<div class='column-comp-10 column-tablet-10 column-cel-10 imagen'>";
	    					echo "<div class='fecha bg-rojo cont-centrado blanco'>";
	    						echo "<center>3<br>UND</center>";
	    					echo "</div>";
	    					echo "<div class='abajo'>";
	    						echo "<span class='tipo bg-rojo' style='z-index: 0'>2'000.000 CO</span>";
	    					echo "</div>";
	    				echo "</div>";
	    				echo "<div class='cont-centrado f-12'>";
	    					echo "<div class='descripcion-tarjeta column-comp-8 column-cel-8 column-tablet-8'>";
	    						echo "<div class='column-comp-10 column-tablet-10 column-cel-10 cont-centrado'>";
	    							echo "<div>";
	    								echo "<div class='f-10'>";
	    									echo "<h1>Motor de combustión interna</h1>";
	    								echo "</div>";
	    								echo "<div class='f-10' style='width: 100%'>";
	    									echo "<div class='row'>";
	    										echo "<div class='column-comp-7 column-tablet-7 column-cel-7 cont-centrado-vertical'>";
	    											echo "<h3>BBC</h3>";
	    										echo "</div>";
	    										echo "<div class='column-comp-3 column-tablet-3 column-cel-3 cont-centrado'>";
	    											echo "<h3><img src='imagenes/flechas.png' onclick='desplegar(this)' height='10' alt=''></h3>";
	    										echo "</div>";
	    									echo "</div>";
	    								echo "</div>";
	    								echo "<div id='descripcion-tarjeta'>";
	    									echo "<p>Descripcion</p>";
	    								echo "</div>";
	    								echo "<div style='width: 100%'>";
	    									echo "<span class='gris tiempo'>* Publicado hace 9 minutos</span>";
	    								echo "</div><br>";
	    								echo "<div class='cont-centrado' style='width: 100%'>";
	    									echo "<input type='submit' class='boton-comp boton-tablet boton-cel btn-rojo column-comp-8 column-tablet-6 column-cel-6' value='Comprar'>";
	    								echo "</div>";
	    								echo "<br>";
	    							echo "</div>";
	    						echo "</div>";
	    					echo "</div>";
	    				echo "</div>";
	    			echo "</div>";
	    		}
	    	?>
	    </div>
	</div><br>
	<div id="contenedor">
		<h1>Consulta precios</h1>
		<form action="consultar_precios.php" method="POST">
			<label>Id_producto</label>
			<input type="number" id="valor1" value="<?php echo $valor1 ?>" style="color: black; height: 40px;" name="valor1">
			<input type="submit" id="enviar" name="enviar" value="Consultar"><br>		
		</form>
	</div>
	<br>
	<?php 
		if($_POST != null){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";
			echo "<th>Nombre producto</th>";
			echo "<th>Precio</th>";
			echo "<th>Descripción</th>";
			echo "</tr>";
			$consulta_producto = "select distinct producto.nombre, producto.descripcion, unidad_producto.precio from producto inner join unidad_producto on (producto.codigo_p = '$valor1') and (unidad_producto.codigo_u = '1') and (unidad_producto.codigo_p = '$valor1')" ;
			$resultado = pg_query($consulta_producto);
			while($row = pg_fetch_array($resultado)){
				$nombre = $row['nombre'];
				$precio = $row['precio'];
				$descripcion = $row['descripcion'];
				echo "<tr align='center'><td>$nombre</td><td>$precio</td><td>$descripcion</td></tr>";				
			}
			echo "</table>";
		}
	?>
<?php
	include("footer.php");
?>
<script src="js/scripts.js"></script>
</body>
</html>