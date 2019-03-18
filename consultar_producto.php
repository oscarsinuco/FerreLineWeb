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
	<title>Consulta productos</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$valor1 = 0;
		$valor2 = 0;
		extract($_POST);
		if(($valor1 != "") || ($valor2 != "")){
			if(($valor1 > 0) || ($valor2 > 0)){

			}
			else{
				$valor1 = 0;
				$valor2 = 0;
			}
		}else{
			$valor1 = 0;
			$valor2 = 0;
		}
		$conexion = conectarse();
		$consulta = "SELECT * FROM unidad";
		$resultado = pg_query($conexion,$consulta);		
	?>
	<div id="contenedor">
		<h1>Consulta productos</h1>
		<form action="consultar_producto.php" method="POST">
			<label>Rango de precios: </label>
			<label>Entre: </label>
			<input type="number" id="valor1" value="<?php echo $valor1 ?>" style="color: black;" name="valor1"><label>y</label>
			<input type="number" id="valor2" value="<?php echo $valor2 ?>" style="color: black;" name="valor2"><br>
			<label>Unidad: </label>
			<select name="opcion">
			  <?php
			  		while ($row = pg_fetch_array($resultado)) {
			  			$id = $row["codigo_u"];
			  			$nombre = $row["nombre"];
			  			echo "<option value='$id' style='color:black'>$nombre</option>";
			  		}
			  ?>
			</select><br><br>
			<input type="submit" id="enviar" name="enviar" value="Consultar"><br>		
		</form>
	</div>
	<br>
	<?php 
		if($_POST != null){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";
			echo "<th>Codigo producto</th>";
			echo "<th>Nombre producto</th>";
			echo "<th>Precio</th>";
			echo "</tr>";
			$consulta_unidad = "select codigo_u from unidad where codigo_u = '$opcion'"; 
			$resultado = pg_query($consulta_unidad);
			$resultado_individual = pg_fetch_array($resultado);
			$codigo_u = $resultado_individual["codigo_u"];
			$consulta_producto = "select distinct unidad_producto.codigo_p, unidad_producto.precio from producto inner join unidad_producto on (unidad_producto.precio between '$valor1' and '$valor2') and (unidad_producto.codigo_u = '$codigo_u')" ;
			$resultado = pg_query($consulta_producto);
			while($row = pg_fetch_array($resultado)){
				$codigo_p = $row['codigo_p'];
				$consulta = "select nombre from producto where codigo_p = '$codigo_p'";
				$resultado_producto = pg_query($consulta);
				$resultado_producto = pg_fetch_array($resultado_producto);
				$nombre = $resultado_producto["nombre"];
				$precio = $row['precio'];
				echo "<tr><td>$codigo_p</td><td>$nombre</td><td>$precio</td></tr>";				
			}
			echo "</table>";
		}
	?>
</body>
</html>