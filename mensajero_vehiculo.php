<!DOCTYPE html>
<html>
<head>
	<title>Mensajero Vehiculo</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$cedula_m_fkey = $_POST['cedula_m_fkey'];
		$placa_fkey = $_POST['placa_fkey'];
		$fecha = $_POST['fecha'];
		$hora = $_POST['hora'];
		$descripcion = $_POST['descripcion'];

		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into mensajero_vehiculo values ('$cedula_m_fkey','$placa_fkey','$fecha','$hora','$descripcion')"; 
		$result = pg_query($conexion, $sql3);
	?>

	<font face="Nirmala UI">
		<table align="center" width="50%" height="100px" border="0" cellpadding="10" cellspacing="0">
			<tr bgcolor="#FFBF00" height="100px">
				<th align="left">
					<font size="7">INFORMACIÓN <br> MENSAJERO VEHICULO</font>
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
								<th>Cedula Mensajero</th>
								<td>
								<?php 
									echo $_POST['cedula_m_fkey'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Placa</th>
								<td>
								<?php 
									echo $_POST['placa_fkey'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Fecha</th>
								<td>
								<?php 
									echo $_POST['fecha'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Hora</th>
								<td>
								<?php 
									echo $_POST['hora'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Descripción</th>
								<td>
								<?php 
									echo $_POST['descripcion'];
								?>
								</td>
							</tr>
						</table><br>
						<center><a href="mensajero_vehiculo_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>