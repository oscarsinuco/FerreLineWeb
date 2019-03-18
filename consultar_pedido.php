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
	<title>Consultar pedidos</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
</head>
<body>	
	<?php
		include("conectar.php");
		$cedula_c= 0;
		extract($_POST);
		if(($cedula_c != "")){
			if(($cedula_c > 0)){

			}
			else{
				$cedula_c = 0;
			}
		}else{
			$cedula_c = 0;
		}
		$conexion = conectarse();
	?>
	<div id="contenedor">
		<h1>Consulta pedidos</h1>
		<form action="consultar_pedido.php" method="POST">
			<label>Cedula cliente</label>
			<input type="number" id="valor1" style="color: black; height: 40px" name="cedula_c" style="color: black;">
			<input type="submit" id="enviar" name="enviar" value="Consultar"><br>		
		</form>
	</div>
	<br>
	<?php 
		if($_POST != null){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Resultados de la búsqueda</caption>";
			echo "<tr>";
			echo "<th>Id pedido</th>";
			echo "<th>Cédula cliente</th>";
			echo "</tr>";
			$consulta_producto = "select id_pedido, cedula_c from pedido where cedula_c = '$cedula_c'" ;
			$resultado = pg_query($consulta_producto);
			while($row = pg_fetch_array($resultado)){
				$cedula_c = $row['cedula_c'];
				$id_pedido = $row['id_pedido'];
				echo "<tr align='center'><td>$id_pedido</td><td>$cedula_c</td></tr>";				
			}
			echo "</table>";
		}
	?>
</body>
</html>