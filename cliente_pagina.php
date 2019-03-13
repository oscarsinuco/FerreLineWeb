<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Cliente</title>
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
			<li style="margin-bottom: 2px;"><a href="">QUIENES SOMOS</a>
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
			<li style="margin-b<li style=margin-bottom: 2px;"><a href="contacto/index.html">CONTACTO</a>
				<ul>
					<li><a href="contacto/index.html">DATOS</a></li>
				</ul>
			</li>
		</ul>
		</div>
		<div id="logo">
			<img src="imagenes/logoicon.png" width="130%"><br/>
		</div>
</div>
	<div class="contenedor" style="height: 1120px;">
		<div class="encabezado"><h1>CLIENTE</h1></div>
		<div class="cuerpo">
			<form name="cliente" action="cliente.php" method="POST" onsubmit="return validartodo1()">
				<label>Cedula</label>
				<input name="cedula_c" class="texto text1" id="cedula_c" onchange="num('cedula_c')">
				<label>Id barrio</label>
				<select name="id_barrio" class="selector texto" id="id_barrio" onchange="sede('id_barrio')">
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
				<label>Nombre</label>
				<input type="text" name="nombre" class="texto text1" id="nombre" onchange="nombres('nombre')">
				<label>Apellido 1</label>
				<input type="text" name="apellido1" class="texto text1" id="apellido1" onchange="nombres('apellido1')">
				<label>Apellido 2</label>
				<input type="text" name="apellido2" class="texto text1" id="apellido2" onchange="nombres('apellido2')">
				<label>Direccion</label>
				<textarea rows="4" cols="30" name="direccion" id="direccion" onchange="novacio('direccion')"></textarea>
				<label>Sexo</label>
				<select name="sexo" class="selector texto" id="sexo" onchange="sede('sexo')">
					<option disabled value="" selected>
						Seleccione...
					</option>
					<option value="F">
						F
					</option>
					<option value="M">
						M
					</option>
				</select>
				<label>Profesion</label>
				<input type="text" name="profesion" class="texto text1" id="profesion" onchange="nombres('profesion')">
				<label>RUC</label>
				<input type="text" name="ruc" class="texto text1" id="ruc" onchange="num('ruc')">
				<label>Telefono</label>
				<input type="text" name="telefono" class="texto text1" id="telefono" onchange="num('telefono')">
				<label>Correo</label>
				<input type="email" name="correo" class="texto text1" id="correo" onchange="validarcorreo('correo')" placeholder="alguien@example.etc">
				<label>Fecha de Nacimiento</label>
				<input type="text" name="fecha_nacimiento" class="texto text1" id="fecha_nacimiento" onchange="validarFecha('fecha_nacimiento')" placeholder="yyyy-mm-dd">
				<label>Contraseña</label>
				<input type="password" name="contrasena" class="texto text1" id="contrasena" onchange="novacio('contrasena')">
			  <button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
			</form>
	  </div>
	</div>
</body>
</html>
