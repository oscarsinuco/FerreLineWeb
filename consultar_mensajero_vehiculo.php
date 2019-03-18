<?php
	session_start();
	if($_SESSION["roll"] != "administrador"){
		header("location:index.php");
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
	<title>Consultar mensajeros y vehiculos</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$placa= 0;
		extract($_POST);
		if(($placa != "")){
			
		}else{
			$placa = 0;
		}
		$conexion = conectarse();
	?>
	<div id="contenedor">
		<h1>Consulta mensajeros y vehiculos</h1>
		<form action="consultar_mensajero_vehiculo.php" method="POST">
			<label>Placa automovil</label>
			<input type="text" id="valor1" style="color: black; height: 40px" name="placa" style="color: black;">
			<input type="submit" id="enviar" name="enviar" value="Consultar"><br>		
		</form>
	</div>
	<br>
	<?php 
		if($_POST != null){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";
			echo "<th>Cedula mensajero</th>";
			echo "<th>Nombre mensajero</th>";
			echo "<th>Placa</th>";
			echo "<th>Fecha</th>";
			echo "<th>Hora</th>";
			echo "<th>Descripcion</th>";
			echo "</tr>";
			$placa = strtoupper($placa);			
			$consulta_producto = "select cedula_m, placa, fecha, hora, descripcion from mensajero_vehiculo where placa = '$placa'" ;
			$resultado = pg_query($consulta_producto);
			while($row = pg_fetch_array($resultado)){				
				$cedula_m = $row['cedula_m'];
				$consulta_mensajero = "select nombre, apellido1, apellido2 from mensajero where cedula_m = '$cedula_m'";
				$resultado2 = pg_query($consulta_mensajero);
				$resultado_nombre = pg_fetch_array($resultado2);
				$nombre = $resultado_nombre["nombre"]; 
				$apellido1 = $resultado_nombre["apellido1"];
				$apellido2 = $resultado_nombre["apellido2"];
				$placa = $row['placa'];
				$fecha = $row['fecha'];
				$hora = $row['hora'];
				$descripcion = $row['descripcion'];
				echo "<tr align='center'><td>$cedula_m</td><td>$nombre $apellido1 $apellido2</td><td>$placa</td><td>$fecha</td><td>$hora</td><td>$descripcion</td></tr>";				
			}
			echo "</table>";
		}
	?>
</body>
</html>