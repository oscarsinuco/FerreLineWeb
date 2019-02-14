<!DOCTYPE html>
<html>
<head>
	<title>Director</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$cedula = $_POST['cedula'];
		$barrio = $_POST['barrio'];
		$nombre = $_POST['nombre'];
		$apellido1 = $_POST['apellido1'];
		$apellido2 = $_POST['apellido2'];
		$direccion = $_POST['direccion'];
		$telefono = $_POST['telefono'];
		$sexo = $_POST['sexo'];
		$correo = $_POST['correo'];
		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into director values ('$cedula','$barrio', '$nombre','$apellido1','$apellido2','$direccion','$telefono','$sexo','$correo')"; 
		$result = pg_query($conexion, $sql3);
	?>
	<font face="Nirmala UI">
		<table align="center" width="50%" height="100px" border="0" cellpadding="10" cellspacing="0">
			<tr bgcolor="#FFBF00" height="100px">
				<th align="left">
					<font size="7">INFORMACIÓN <br> DIRECTOR</font>
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
									echo $_POST['cedula'];
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
							<tr align="center">
								<th>Sexo</th>
								<td>
								<?php 
									echo $_POST['sexo'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Correo electrónico</th>
								<td>
								<?php 
									echo $_POST['correo'];
								?>
								</td>
							</tr>
						</table><br>
						<center><a href="director_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>