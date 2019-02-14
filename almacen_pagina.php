<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Almacén</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<script type="text/javascript">
		function funcionemergente(){
			var a = window.open("https://desarrolloweb.com",'Ventana',"width=300,height=400,top=150px,left=220px");
		}
		function location.href(pagina){
			var a = window.open(pagina,'Ventana',"width=900,height="+ window.innerHeight +",top=0px,left=220px");
		}
	</script>
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
			<li style="margin-bottom: 2px;"><a href="contacto/index.html">CONTACTO</a>
				<ul>
					<li><a href="contacto/index.html">DATOS</a></li>
				</ul>
			</li>
		</ul>
		</div>
		<button class="boton-enviar" id="masinfor" onclick="javascript:funcionemergente()"></button>
		<div id="logo">
			<img src="imagenes/logoicon.png" width="130%"><br/>
		</div>
</div>
<div class="contenedor" style="height: 750px;">
	<div class="encabezado"><h1>ALMACÉN</h1></div>
	<div class="cuerpo">
	<form onsubmit="return validartodo()" name="almacen" action="almacen.php" method="POST">
	<br>
	<label>Id almacen</label>
	<input type="text" class="texto text1" name="id_almacen" id="id_almacen" onchange="num('id_almacen')">
	<br><br>
	<label>Id sede</label>
	<select name="id_sede" class="selector texto" id="id_sede" onchange="sede('id_sede')">
		<option disabled value="" selected>
		Seleccione...
		</option>
		<?php
			include("conectar.php");
			$conexion = conectarse();
			$consulta = "select id_sede, nombre from sede";
			$resultado = pg_query($conexion,$consulta);
			$filas = pg_num_rows($resultado);
			if($filas > 0){
				while($fila = pg_fetch_array($resultado)){
					$nombre = $fila["nombre"];
					$id = $fila["id_sede"];
					echo "<option value='$id'>$nombre</option>";
				}
			}
		?>
	</select>
	<br><br>
	<label>Nombre</label>
	<input type="text" class="texto text1" name="nombre" id="nombre" onchange="nombres('nombre')">
	<br><br>
	<label>Cantidad</label>
	<input type="text" class="texto text1" name="cantidad" id="cantidad" onchange="num('cantidad')">
	<br><br>
	<label>Fecha de llegada</label>
	<input type="text" class="texto text1" name="fecha_llegada" id="fecha_llegada" onchange="validarFecha('fecha_llegada')" placeholder="yyyy-mm-dd">
	<br><br>
	<label>Fecha de salida</label>
	<input type="text" class="texto text1" name="fecha_salida" id="fecha_salida" onchange="validarFecha('fecha_salida')" placeholder="yyyy-mm-dd">
	<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
	</div>
</div>
</body>
</html>
