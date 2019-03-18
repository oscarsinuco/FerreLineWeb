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
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
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
</body>
</html>