<!DOCTYPE html>
<html>
<head>
	<title>Cliente</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$cedula_c = $_POST['cedula_c'];
		$id_barrio = $_POST['id_barrio'];
		$nombre = $_POST['nombre'];
		$apellido1 = $_POST['apellido1'];
		$apellido2 = $_POST['apellido2'];
		$direccion = $_POST['direccion'];
		$sexo = $_POST['sexo'];
		$profesion = $_POST['profesion'];
		$telefono = $_POST['telefono'];
		$correo = $_POST['correo'];
		$fecha_nacimiento = $_POST['fecha_nacimiento'];
		$contrasena = $_POST['contrasena'];
		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into cliente values ('$cedula_c','$id_barrio', '$nombre','$apellido1','$apellido2','$direccion','$sexo','$profesion','$telefono','$correo','$fecha_nacimiento','$contrasena')"; 
		$result = pg_query($conexion, $sql3);
	?>
	<font face="Nirmala UI">
		<table align="center" width="50%" height="100px" border="0" cellpadding="10" cellspacing="0">
			<tr bgcolor="#FFBF00" height="100px">
				<th align="left">
					<font size="7">INFORMACIÓN <br> CLIENTE</font>
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
									echo $_POST['cedula_c'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Id barrio</th>
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
								<th>Sexo</th>
								<td>
								<?php 
									echo $_POST['sexo'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Profesion</th>
								<td>
								<?php 
									echo $_POST['profesion'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>RUC</th>
								<td>
								<?php 
									echo $_POST['ruc'];
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
						<center><a href="cliente_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>