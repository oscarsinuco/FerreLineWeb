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
	<title>Consulta jefe</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$valor1 = 0;
		$valor2 = 0;
		extract($_POST);
		$conexion = conectarse();
		$consulta = "SELECT * FROM jefe";
		$resultado = pg_query($conexion,$consulta);
	?>

	<div id="contenedor">
		<h1>Consulta jefe</h1>
		<form action="consultar_jefe.php" method="POST">
			<label>Cedula: </label>
			<select name="opcion" style=" width: 25%">
				<option value='' style='color:black;'>[Seleccione una cedula]</option>
			  <?php
			  		while ($row = pg_fetch_array($resultado)) {
			  			$id = $row["cedula_j"];
			  			$nombre = $row["nombre"];
			  			echo "<option value='$id' style='color:black'>$id</option>";
			  		}
			  ?>
			</select><br><br>
			<input type="submit" id="enviar" name="enviar" value="Consultar"><br>		
		</form>
	</div>
	<br>
	<?php 
		if($_POST != null && $opcion!= ''){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";

			echo "<th>Cedula</th>";
			echo "<th>Nombre</th>";
			echo "<th>Apellido 1</th>";
			echo "<th>Apellido 2</th>";
			echo "<th>Direccion</th>";
			echo "<th>Telefono</th>";
			echo "<th>Sexo</th>";
			echo "<th>Correo</th>";
			echo "<th>id_barrio</th>";
			echo "<th>fecha_nacimiento</th>";

			echo "</tr>";
			$consulta_jefe = "select * from jefe where cedula_j = '$opcion';"; 
			$resultado = pg_query($conexion,$consulta_jefe);

			while($row = pg_fetch_array($resultado)){

				$cedula_j = $row['0'];
				$nombre = $row['1'];
				$apellido1 = $row['2'];
				$apellido2 = $row['3'];
				$direccion = $row['4'];
				$telefono = $row['5'];
				$sexo = $row['6'];
				$correo = $row['7'];
				$id_barrio = $row['8'];
				$fecha_nacimiento = $row['9'];

				echo "<tr>";

				echo "<td>$cedula_j</td>";
				echo "<td>$nombre</td>";
				echo "<td>$apellido1</td>";
				echo "<td>$apellido2</td>";
				echo "<td>$direccion</td>";
				echo "<td>$telefono</td>";
				echo "<td>$sexo</td>";
				echo "<td>$correo</td>";
				echo "<td>$id_barrio</td>";
				echo "<td>$fecha_nacimiento</td>";

				echo"</tr>";						
			}
			echo "</table>";
		}
	?>
</body>
</html>