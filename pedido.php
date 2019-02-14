<!DOCTYPE html>
<html>
<head>
	<title>Pedido</title>
</head>
<body background="imagenes/fondo1.jpg">
	<?php
		$id_pedido = $_POST['id_pedido'];
		$cedula_c = $_POST['cedula_c'];
		$codigo_producto = $_POST['codigo_p'];
		$id_factura = $_POST['id_factura'];
		$cedula_m = $_POST['cedula_m'];
		$fecha = $_POST['fecha'];
		$cantidad = $_POST['cantidad'];
		$descuento = $_POST['descuento'];
		$precio_unitario = $_POST['precio_unitario'];
		$iva = $_POST['iva'];
		
		$codigo_p = strtok($codigo_producto, " ");
		$codigo_u = strtok(" ");

		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456"); 
		$sql3="insert into pedido values ('$id_pedido','$cedula_c','$codigo_u','$codigo_p','$id_factura','$cedula_m','$fecha','$cantidad','$descuento','$precio_unitario','$iva')"; 
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
								<th>Id pedido</th>
								<td>
								<?php 
									echo $_POST['id_pedido'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Cedula cliente</th>
								<td>
								<?php 
									echo $_POST['cedula_c'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Código unidad</th>
								<td>
								<?php 
									$codigo_producto = $_POST['codigo_p'];
									$codigo_p = strtok($codigo_producto, " ");
									$codigo_u = strtok(" ");
									echo $codigo_u;
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Código producto</th>
								<td>
								<?php 
									$codigo_producto = $_POST['codigo_p'];
									$codigo_p = strtok($codigo_producto, " ");
									$codigo_u = strtok(" ");
									echo $codigo_p;
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Id factura</th>
								<td>
								<?php 
									echo $_POST['id_factura'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Cedula mensajero</th>
								<td>
								<?php 
									echo $_POST['cedula_m'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Descuento (%)</th>
								<td>
								<?php 
									echo $_POST['descuento'];
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
								<th>Fecha</th>
								<td>
								<?php 
									echo $_POST['fecha'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>Precio unitario</th>
								<td>
								<?php 
									echo $_POST['precio_unitario'];
								?>
								</td>
							</tr>
							<tr align="center">
								<th>IVA (%)</th>
								<td>
								<?php 
									echo $_POST['iva'];
								?>
								</td>
							</tr>
						</table><br>
						<center><a href="pedido_pagina.php"><button type="button"><img src="imagenes/volver.png" width="30"></button></a></center>
					</font>
				</td>
			</tr>
		</table>
	</font>
</body>
</html>