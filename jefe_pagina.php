<?php
	session_start();

	if($_SESSION["roll"] != "administrador"){
		header("location:index.php");
	}

	include("cerrarSesion.php");
	if (isset($_SESSION['inicioSesion']))
	{
		cerrarSesion();
	}
	$_SESSION['inicioSesion'] = time();

?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Jefe</title>
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
	<div class="contenedor" style="height: 1000px;">
		<div class="encabezado"><h1>JEFE</h1></div>
		<div class="cuerpo">
			<form onsubmit="return validartodo4()" name="jefe" action="jefe.php" method="POST">
			<label>Cedula</label>
			<input onchange="num('cedula_j')" type="text" name="cedula_j" class="texto text1" id="cedula_j">
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
			<input onchange="nombres('nombre')" type="text" name="nombre" class="texto text1" id="nombre">
			<label>Apellido 1</label>
			<input onchange="nombres('apellido1')" type="text" name="apellido1" class="texto text1" id="apellido1">
			<label>Apellido 2</label>
			<input type="text" name="apellido2" class="texto text1" id="apellido2" onchange="nombres('apellido2')">
			<label>Direccion</label>
			<textarea onchange="novacio('direccion')" rows="4" cols="30" name="direccion" id="direccion"></textarea>
			<label>Telefono</label>
			<input onchange="num('telefono')" type="text" name="telefono" class="texto text1" id="telefono">
			<label>Sexo</label>
			<select name="sexo" id="sexo" class="selector texto" onchange="sede('sexo')">
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
			<label>Correo</label>
			<input onchange="validarcorreo('correo')" type="text" name="correo" class="texto text1" id="correo" placeholder="alguien@example.etc">
			<label>Fecha de Nacimiento</label>
			<input onchange="validarFecha('fecha_nacimiento')" type="text" name="fecha_nacimiento" class="texto text1" id="fecha_nacimiento" placeholder="yyyy-mm-dd">
			<label>contraseña</label>
				<input type="password" name="contrasena" class="texto text1" id="contrasena" onchange="novacio('contrasena')">
			<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
			</form>
		</div>
	</div>
</body>
</html>
