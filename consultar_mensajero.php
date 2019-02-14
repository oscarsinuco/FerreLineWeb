<!DOCTYPE html>
<html>
<head>
	<title>Consultar mensajeros</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$conexion = conectarse();
	?>
	<div id="contenedor">
		<h1>Consulta mensajeros</h1>
		<form action="consultar_mensajero.php" method="POST">
			<label>Nomina</label>
			<select class="selector texto" name="id_nomina">
				<option style="color: black" disabled value="" selected>
					Seleccione...
				</option>
				<?php
					$consulta = "select id_nomina, fecha_inicio from nomina";
					$resultado = pg_query($conexion,$consulta);
					$filas = pg_numrows($resultado);
					if($filas > 0){
						while($fila = pg_fetch_array($resultado)){
							$id_nomina = $fila["id_nomina"];
							$fecha_inicio = $fila["fecha_inicio"];
							echo "<option style='color: black' value='$id_nomina'>$fecha_inicio</option>";
						}
					}
				?>
			</select><br/><br/>
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
			echo "<th>Nombre</th>";
			echo "</tr>";		
			extract($_POST);
			$consulta_producto = "select nombre, apellido1, apellido2, cedula_m from mensajero where id_nomina = '$id_nomina'" ;
			$resultado = pg_query($conexion,$consulta_producto);
			$filas = pg_numrows($resultado);
			if($filas > 0){
				while($row = pg_fetch_array($resultado)){
					$nombre = $row['nombre'];
					$apellido1 = $row['apellido1'];
					$apellido2 = $row['apellido2'];
					$cedula_m = $row['cedula_m'];
					echo "<tr align='center'><td>$cedula_m</td><td>$nombre $apellido1 $apellido2</td></tr>";				
				}
				echo "</table>";
			}
		}
	?>
</body>
</html>