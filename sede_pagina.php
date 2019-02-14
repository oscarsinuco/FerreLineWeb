<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Sede</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<link rel="stylesheet" type="text/css" href="css/estilos_emergentes.css">
</head>
<body>
<div class="fondo">
</div>
<div id="menu">
	<div id="fblur">
		
	</div>
	<div id="header">
				<ul class="nav">
			<li style="margin-bottom: 2px;"><a href="index.html">INICIO</a></li>
			<li style="margin-bottom: 2px;"><a href="quienes-somos/index.html">QUIENES SOMOS</a>
				<ul>
					<li><a href="quienes-somos/index.html#og">OBJETIVOS GENERALES</a></li>
					<li><a href="quienes-somos/index.html#oe">OBJETIVOS ESPECIFICOS</a></li>
					<li><a href="quienes-somos/index.html#mi">MISÍON</a></li>
					<li><a href="quienes-somos/index.html#vi">VISIÓN</a></li>
				</ul>
			</li>
			<li style="margin-bottom: 2px;"><a href="">INSERTAR DATOS</a>
				<ul>
					<li><a href="almacen_pagina.php">ALMACEN</a></li>
					<li><a href="cliente_pagina.php">CLIENTE</a></li>
					<li><a href="director_pagina.php">DIRECTOR</a></li>
					<li><a href="empleado_pagina.php">EMPLEADO</a></li>
					<li><a href="jefe_pagina.php">JEFE</a></li>
					<li><a href="mensajero_pagina.php">MENSAJERO</a></li>
					<li><a href="mensajero_vehiculo_pagina.php">MENSAJERO-VEHICULO</a></li>
					<li><a href="pedido_pagina.php">PEDIDO</a></li>
					<li><a href="producto_pagina.php">PRODUCTO</a></li>
					<li><a href="sede_pagina.php">SEDE</a></li>
				</ul>
			</li>
			<li style="margin-bottom: 2px;"><a href="">CONSULTAR DATOS</a>
				<ul>
					<li><a target="_blank" href="consultar_almacen.php">CONSULTAR ALMACEN</a></li>
					<li><a target="_blank" href="consultar_cliente.php">CONSULTAR CLIENTE</a></li>
					<li><a target="_blank" href="consultar_director.php">CONSULTAR DIRECTOR</a></li>
					<li><a target="_blank" href="consultar_empleado.php">CONSULTAR EMPLEADO</a></li>
					<li><a target="_blank" href="consultar_jefe.php">CONSULTAR JEFE</a></li>
					<li><a target="_blank" href="consultar_mensajero.php">CONSULTAR MENSAJERO</a></li>
					<li><a target="_blank" href="consultar_mensajero_vehiculo.php">CONSULTAR M-V</a></li>
					<li><a target="_blank" href="consultar_pedido.php">CONSULTAR PEDIDO</a></li>
					<li><a target="_blank" href="consultar_producto.php">CONSULTAR PRODUCTO</a>
						<ul>
							<li><a target="_blank" href="consultar_precios.php">CONSULTAR PRECIO</a></li>
							<li><a target="_blank" href="consultar_producto.php">CONSULTAR RANGO</a></li>
						</ul>
					</li>
					<li><a target="_blank" href="consultar_sede.php">CONSULTAR SEDE</a></li>
				</ul>
			</li>
			<li style="margin-bottom: 2px;"><a href="contacto/index.html">CONTACTO</a>
				<ul>
					<li style="margin-bottom: 2px;"><a href="contacto/index.html">CONTACTO</a>
				</ul>
			</li>
		</ul>
		</div>
		<div id="logo">
			<img src="imagenes/logoicon.png" width="130%"><br/>
		</div>
</div>
<div class="contenedor" style="height: 750px;">
	<div class="encabezado"><h1>SEDE</h1></div>
	<div class="cuerpo">
				<form onsubmit="return validartodo8()" name="sede1" action="sede.php" method="POST">
					<br>
					<label>Id sede</label>  
					<input type="text" class="texto text1" name="id_sede" id="id_sede" onchange="num('id_sede')"><br><br>
					<label>Id barrio</label>  
					<select name="barrio" class="selector texto" id="barrio" onchange="sede('barrio')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php
							include("conectar.php");
							$conexion = conectarse();
							$consulta = "select id_barrio, nombre from barrio";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$nombre = $fila["nombre"];
									$id = $fila["id_barrio"];
									echo "<option value='$id'>$nombre</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Cedula director</label>  
					<select name="director" class="selector texto" id="director" onchange="sede('director')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php
							$consulta = "select cedula, nombre, apellido1, apellido2 from director";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$nombre = $fila["nombre"];
									$apellido1 = $fila["apellido1"];
									$apellido2 = $fila["apellido2"];
									$cedula = $fila["cedula"];
									echo "<option value='$cedula'>$nombre $apellido1 $apellido2</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Nombre</label> 
					<input type="text" class="texto text1" name="nombre" id="nombre" onchange="nombres('nombre')"><br><br>
					<label>Dirección</label> 
					<textarea rows="4" cols="30" name="direccion" id="direccion" onchange="novacio('direccion')"></textarea>
					<br><br>
					<label>Telefono</label> 
					<input type="text" class="texto text1" name="telefono" id="telefono" onchange="num('telefono')">
					<br><br><br>
					<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
				</form>
			</div>
</div>
</body>
</html> 