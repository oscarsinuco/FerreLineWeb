<!DOCTYPE html>
<html>
<head>
	<title>almacen</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$id_almacen = $_POST['id_almacen'];
		$id_sede = $_POST['id_sede'];
		$nombre = $_POST['nombre'];
		$cantidad = $_POST['cantidad'];
		$fecha_llegada = $_POST['fecha_llegada'];
		$fecha_salida = $_POST['fecha_salida'];
		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into almacen values ('$id_almacen','$id_sede', '$nombre','$cantidad','$fecha_llegada','$fecha_salida')"; 
		$result = pg_query($conexion, $sql3);

	?>
	<font face="Nirmala UI">
		<table align="center" width="50%" height="100px" border="0" cellpadding="10" cellspacing="0">
			<tr bgcolor="#FFBF00" height="100px">
				<th align="left">
					<font size="7">INFORMACIÓN <br> ALMACÉN</font>
				</th>
				<td>
					<a href="inicio/index.html"><img src="imagenes/logoicon.png" width="150" align="right"></a>
				</td>
			</tr>
		</table><br>
		<table align="center" width="50%" height="480px" border="0" cellpadding="10" cellspacing="0">
			<tr>
				<td valign="center" background="imagenes/fondot.png">
					<font color="white" size="5">
						<table align="center" width="80%" border="0" cellpadding="10" cellspacing="0">
							<tr align="center">
								<th>Id almacen</th>
								<td>
								<?php 
									echo $_POST['id_almacen'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Id sede</th>
								<td>
								<?php 
									echo $_POST['id_sede'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Nombre</th>
								<td>
								<?php 
									echo $_POST['nombre'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Cantidad</th>
								<td>
								<?php 
									echo $_POST['cantidad'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Fecha llegada</th>
								<td>
								<?php 
									echo $_POST['fecha_llegada'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Fecha salida</th>
								<td>
								<?php 
									echo $_POST['fecha_salida'];
								?>
								</td>
							</tr>
						</table><br>
						<center><a href="almacen_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>