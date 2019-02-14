<!DOCTYPE html>
<html>
<head>
	<title>Jefe</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$cedula_j = $_POST['cedula_j'];
		$id_barrio = $_POST['id_barrio'];
		$nombre = $_POST['nombre'];
		$apellido1 = $_POST['apellido1'];
		$apellido2 = $_POST['apellido2'];
		$direccion = $_POST['direccion'];
		$telefono = $_POST['telefono'];
		$sexo = $_POST['sexo'];
		$correo = $_POST['correo'];
		$fecha_nacimiento = $_POST['fecha_nacimiento'];

		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into jefe values ('$cedula_j','$nombre','$apellido1','$apellido2','$direccion','$telefono','$sexo','$correo','$id_barrio','$fecha_nacimiento')"; 
		$result = pg_query($conexion, $sql3);

	?>
	<font face="Nirmala UI">
		<table align="center" width="50%" height="100px" border="0" cellpadding="10" cellspacing="0">
			<tr bgcolor="#FFBF00" height="100px">
				<th align="left">
					<font size="7">INFORMACIÓN <br> JEFE</font>
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
								<th>Cedula</th>
								<td>
								<?php 
									echo $_POST['cedula_j'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Barrio</th>
								<td>
								<?php 
									echo $_POST['id_barrio'];
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
								<th>Apellido 1</th>
								<td>
								<?php 
									echo $_POST['apellido1'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Apellido 2</th>
								<td>
								<?php 
									echo $_POST['apellido2'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Direccion</th>
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
							<tr align="center">
								<th>Sexo</th>
								<td>
								<?php 
									echo $_POST['sexo'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Correo</th>
								<td>
								<?php 
									echo $_POST['correo'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Fecha de Nacimiento</th>
								<td>
								<?php 
									echo $_POST['fecha_nacimiento'];
								?>
								</td>
							</tr>
						</table><br>
						<center><a href="jefe_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>