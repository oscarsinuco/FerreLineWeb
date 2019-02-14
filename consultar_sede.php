<!DOCTYPE html>
<html>
<head>
	<title>Consultar sedes</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$id_barrio= 0;
		extract($_POST);
		if(($id_barrio != "")){
			if(($id_barrio > 0)){

			}
			else{
				$id_barrio = 0;
			}
		}else{
			$id_barrio = 0;
		}
		$conexion = conectarse();
	?>
	<div id="contenedor">
		<h1>Consulta sedes</h1>
		<form action="consultar_sede.php" method="POST">
			<label>Barrio</label>
			<select class="selector texto" name="id_barrio" style="width:23%">
				<option value='' style='color:black'>[Seleccione un barrio]</option>
				<?php
					$consulta = "select * from barrio";
					$resultado = pg_query($conexion,$consulta);
					$filas = pg_numrows($resultado);
					if($filas > 0){
						while($fila = pg_fetch_array($resultado)){
							$nombre = $fila["nombre"];
							$id = $fila["id_barrio"];
							echo "<option style='color: black' value='$id'>$nombre</option>";
						}
					}
				?>
			</select><br/><br/>
			<input type="submit" id="enviar" name="enviar" value="Consultar"><br>		
		</form>
	</div>
	<br>
	<?php 
		if($_POST != null && $id_barrio!= ''){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";
			echo "<th>Id sede</th>";
			echo "<th>Nombre</th>";
			echo "</tr>";
			$consulta_producto = "select id_sede, nombre from sede where id_barrio = '$id_barrio'" ;
			$resultado = pg_query($consulta_producto);
			while($row = pg_fetch_array($resultado)){
				$nombre = $row['nombre'];
				$id_sede = $row['id_sede'];
				echo "<tr align='center'><td>$id_sede</td><td>$nombre</td></tr>";				
			}
			echo "</table>";
		}
	?>
</body>
</html>