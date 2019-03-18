<!DOCTYPE html>
<html>
<head>
	<title>almacen</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$id_sede = $_POST['id_sede'];
		$nombre = $_POST['nombre'];
		$direccion = $_POST['direccion'];
		$telefono = $_POST['telefono'];
		$barrio = $_POST['barrio'];
		$cedula = $_POST['director'];
		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into sede values ('$id_sede','$nombre', '$direccion','$telefono','$barrio','$cedula')"; 
		$result = pg_query($conexion, $sql3);
	?>
	<font face="Nirmala UI">
		<table align="center" width="50%" height="100px" border="0" cellpadding="10" cellspacing="0">
			<tr bgcolor="#FFBF00" height="100px">
				<th align="left">
					<font size="7">INFORMACIÓN <br> SEDE</font>
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
								<th>Id sede</th>
								<td>
								<?php 
									echo $_POST['id_sede'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Id barrio</th>
								<td>
								<?php 
									echo $_POST['barrio'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Cedula director</th>
								<td>
								<?php 
									echo $_POST['director'];
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
								<th>Dirección</th>
								<td>
								<?php 
									echo $_POST['direccion'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Telefono</th>
								<td>
								<?php 
									echo $_POST['telefono'];
								?>
								</td>
							</tr>
						</table><br>
						<center><a href="sede_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>