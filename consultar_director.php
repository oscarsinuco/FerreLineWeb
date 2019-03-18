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
	<title>Consulta directores</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$valor1 = 0;
		$valor2 = 0;
		extract($_POST);
		$conexion = conectarse();
		$consulta = "SELECT * FROM sede";
		$resultado = pg_query($conexion,$consulta);
	?>

	<div id="contenedor">
		<h1>Consulta directores</h1>
		<form action="consultar_director.php" method="POST">
			<label>Sede: </label>
			<select name="opcion" style="width:25%">
				<option value='' style='color:black'>[Seleccione una sede]</option>
			  <?php
			  		while ($row = pg_fetch_array($resultado)) {
			  			$id = $row["cedula"];
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
		if($_POST != null && $opcion!= ''){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";

			echo "<th>Cedula</th>";
			echo "<th>id_barrio</th>";
			echo "<th>Nombre</th>";
			echo "<th>Apellido 1</th>";
			echo "<th>Apellido 2</th>";
			echo "<th>Direccion</th>";
			echo "<th>Telefono</th>";
			echo "<th>Sexo</th>";
			echo "<th>Correo</th>";

			echo "</tr>";
			$consulta_directores = "select distinct d.* from director d, sede s where s.cedula = '$opcion' and s.cedula = d.cedula;"; 
			$resultado = pg_query($conexion,$consulta_directores);

			while($row = pg_fetch_array($resultado)){

				$cedula_c = $row['0'];
				$id_barrio = $row['1'];
				$nombre = $row['2'];
				$apellido1 = $row['3'];
				$apellido2 = $row['4'];
				$direccion = $row['5'];
				$telefono = $row['6'];
				$sexo = $row['7'];
				$correo = $row['8'];

				echo "<tr>";

				echo "<td>$cedula_c</td>";
				echo "<td>$id_barrio</td>";
				echo "<td>$nombre</td>";
				echo "<td>$apellido1</td>";
				echo "<td>$apellido2</td>";
				echo "<td>$direccion</td>";
				echo "<td>$telefono</td>";
				echo "<td>$sexo</td>";
				echo "<td>$correo</td>";

				echo"</tr>";						
			}
			echo "</table>";
		}
	?>
</body>
</html>