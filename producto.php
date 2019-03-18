<!DOCTYPE html>
<html>
<head>
	<title>almacen</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$codigo_p = $_POST['codigo_p'];
		$id_almacen = $_POST['id_almacen'];
		$nombre = $_POST['nombre'];
		$medida = $_POST['medida'];
		$marca = $_POST['marca'];
		$descripcion = $_POST['descripcion'];
		$fecha_fabricacion = $_POST['fecha_fabricacion'];

		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into producto values ('$codigo_p','$nombre','$medida','$marca','$descripcion','$fecha_fabricacion','$id_almacen')"; 
		$result = pg_query($conexion, $sql3);
	?>

	<font face="Nirmala UI">
		<table align="center" width="50%" height="100px" border="0" cellpadding="10" cellspacing="0">
			<tr bgcolor="#FFBF00" height="100px">
				<th align="left">
					<font size="7">INFORMACIÓN <br> PEDIDO</font>
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
								<th>Código producto</th>
								<td>
								<?php 
									echo $_POST['codigo_p'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Código almacen</th>
								<td>
								<?php 
									echo $_POST['id_almacen'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Id almacén</th>
								<td>
								<?php 
									echo $_POST['id_almacen'];
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
								<th>Descripción</th>
								<td>
								<?php 
									echo $_POST['descripcion'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Fecha de fabricación</th>
								<td>
								<?php 
									echo $_POST['fecha_fabricacion'];
								?>
								</td>
							</tr>
						</table><br>
						<center><a href="producto_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>