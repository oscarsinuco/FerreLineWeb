<!DOCTYPE html>
<html>
<head>
	<title>Consulta empleado</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$valor1 = 0;
		$valor2 = 0;
		extract($_POST);
		$conexion = conectarse();
		$consulta = "SELECT * FROM nomina";
		$resultado = pg_query($conexion,$consulta);
	?>

	<div id="contenedor">
		<h1>Consulta empleados</h1>
		<form action="consultar_empleado.php" method="POST">
			<label>Nomina: </label>
			<select name="opcion" style="width:30%">
				<option value='' style='color:black'>[Seleccione un rango de fecha]</option>
			  <?php
			  		while ($row = pg_fetch_array($resultado)) {
			  			$id = $row["id_nomina"];
			  			$inicio = $row["fecha_inicio"];
			  			$fin = $row["fecha_fin"];
			  			echo "<option value='$id' style='color:black'>Desde: $inicio Hasta: $fin</option>";
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

			echo "<th>id_empleado</th>";
			echo "<th>id_barrio</th>";
			echo "<th>id_nomina</th>";
			echo "<th>Nombre</th>";
			echo "<th>Apellido 1</th>";
			echo "<th>Apellido 2</th>";
			echo "<th>Direccion</th>";
			echo "<th>Cedula</th>";
			echo "<th>Sexo</th>";
			echo "<th>Cargo</th>";
			echo "<th>Ruc</th>";	
			echo "<th>Telefono</th>";
			echo "<th>Correo</th>";
			echo "<th>Fecha nacimiento</th>";

			echo "</tr>";
			$consulta_almacenes = "select * from empleado where id_nomina = '$opcion';"; 
			$resultado = pg_query($conexion,$consulta_almacenes);

			while($row = pg_fetch_array($resultado)){

				$id_empleado= $row['0'];	
				$id_barrio= $row['1'];
				$id_nomina= $row['2'];
				$nombre= $row['3'];
				$apellido1= $row['4'];
				$apellido2= $row['5'];
				$direccion= $row['6'];
				$cedula= $row['7'];
				$sexo= $row['8'];
				$cargo= $row['9'];
				$ruc= $row['10'];
				$telefono= $row['11'];
				$correo= $row['12'];
				$fecha_nacimiento= $row['13'];

				echo "<tr>";

				echo "<td>$id_empleado</td>";
				echo "<td>$id_barrio</td>";
				echo "<td>$id_nomina</td>";
				echo "<td>$nombre</td>";
				echo "<td>$apellido1</td>";
				echo "<td>$apellido2</td>";
				echo "<td>$direccion</td>";
				echo "<td>$cedula</td>";
				echo "<td>$sexo</td>";
				echo "<td>$cargo</td>";
				echo "<td>$ruc</td>";
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