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
	<title>Consulta almacenes</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$valor1 = 0;
		$valor2 = 0;
		extract($_POST);
		$conexion = conectarse();
		$consulta = "SELECT * FROM ciudad";
		$resultado = pg_query($conexion,$consulta);
	?>

	<div id="contenedor">
		<h1>Consulta almacenes</h1>
		<form action="consultar_almacen.php" method="POST">
			<label>Ciudad: </label>
			<select name="opcion" style="width:25%">
				<option value='' style='color:black'>[Seleccione una ciudad]</option>
			  <?php
			  		while ($row = pg_fetch_array($resultado)) {
			  			$id = $row["id_ciudad"];
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
		if($_POST != null  && $opcion!= ''){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";
			echo "<th>Codigo almacen</th>";
			echo "<th>Codigo sede</th>";
			echo "<th>Nombre</th>";
			echo "</tr>";
			$consulta_almacenes = "select a.* from barrio b, sede s, almacen a where b.id_ciudad = '$opcion' and b.id_barrio = s.id_barrio and a.id_sede = s.id_sede;"; 
			$resultado = pg_query($conexion,$consulta_almacenes);

			while($row = pg_fetch_array($resultado)){

				$id_almacen = $row['0'];
				$id_sede = $row['1'];
				$nombre = $row['2'];
				echo "<tr>";
				echo"<td>$id_almacen</td>";
				echo"<td>$id_sede</td>";
				echo"<td>$nombre</td>";
				echo"</tr>";				
			}
			echo "</table>";
		}
	?>
</body>
</html>