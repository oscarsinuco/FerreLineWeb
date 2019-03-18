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
	<title>Consulta cliente</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$valor1 = 0;
		$valor2 = 0;
		extract($_POST);
		$conexion = conectarse();
		$consulta = "SELECT * FROM cliente";
		$resultado = pg_query($conexion,$consulta);
	?>

	<div id="contenedor">
		<h1>Consulta clientes</h1>
		<form action="consultar_cliente.php" method="POST">
			<label>Sexo: </label>

			<input type="radio" name="opcion" value="M" checked>Masculino
			<input type="radio" name="opcion" value="F">Femenino <br/>
			<br/>
			<br/>

			<input type="submit" id="enviar" name="enviar" value="Consultar"><br>		
		</form>
	</div>
	<br>
	<?php 
		if($_POST != null){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";

			echo "<th>Cedula</th>";
			echo "<th>id_barrio</th>";
			echo "<th>Nombre</th>";
			echo "<th>Apellido 1</th>";
			echo "<th>Apellido 2</th>";
			echo "<th>Direccion</th>";
			echo "<th>Sexo</th>";
			echo "<th>Profesion</th>";
			echo "<th>Telefono</th>";
			echo "<th>Correo</th>";
			echo "<th>Fecha Nacimiento</th>";

			echo "</tr>";
			$consulta_almacenes = "select * from cliente where sexo = '$opcion';"; 
			$resultado = pg_query($conexion,$consulta_almacenes);

			while($row = pg_fetch_array($resultado)){

				$cedula_c = $row['0'];
				$id_barrio = $row['1'];
				$nombre = $row['2'];
				$apellido1 = $row['3'];
				$apellido2 = $row['4'];
				$direccion = $row['5'];
				$sexo = $row['6'];
				$profesion = $row['7'];
				$telefono = $row['8'];
				$correo = $row['9'];
				$fecha_nacimiento = $row['10'];

				echo "<tr>";

				echo "<td>$cedula_c</td>";
				echo "<td>$id_barrio</td>";
				echo "<td>$nombre</td>";
				echo "<td>$apellido1</td>";
				echo "<td>$apellido2</td>";
				echo "<td>$direccion</td>";
				echo "<td>$sexo</td>";
				echo "<td>$profesion</td>";
				echo "<td>$telefono</td>";
				echo "<td>$correo</td>";
				echo "<td>$fecha_nacimiento</td>";

				echo"</tr>";				
			}
			echo "</table>";
		}
	?>
</body>
</html>