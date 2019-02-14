<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Mensajero Vehículo</title>
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
			<li style="margin-b<li style="margin-bottom: 2px;"><a href="contacto/index.html">CONTACTO</a>
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

<div class="contenedor" style="height: 690px;">
	<div class="encabezado"><h2>MENSAJERO VEHÍCULO</h2></div>
	<div class="cuerpo">
				<form onsubmit="return validartodo6()" name="menajero_vehiculo" action="mensajero_vehiculo.php" method="POST">
					<br>
					<label>Mensajero</label> | 
					<select name="cedula_m_fkey" class="selector texto" id="cedula_m_fkey" onchange="sede('cedula_m_fkey')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php
							include("conectar.php");
							$conexion = conectarse();
							$consulta = "select cedula_m, nombre, apellido1, apellido2 from mensajero";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_numrows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$nombre = $fila["nombre"];
									$cedula_m = $fila["cedula_m"];
									$apellido1 = $fila["apellido1"];
									$apellido2  =$fila["apellido2"];
									echo "<option value='$cedula_m'>$nombre $apellido1 $apellido2</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Placa del vehiculo</label> | 
					<select name="placa_fkey" class="selector texto" id="placa_fkey" onchange="sede('placa_fkey')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php
							$consulta = "select placa from vehiculo";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$placa = $fila["placa"];
									echo "<option value='$placa'>$placa</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Fecha</label>
					<input type="text" class="texto text1" name="fecha" id="fecha" onchange="validarFecha('fecha')" placeholder="yyyy-mm-dd">
					<br><br>
					<label>Hora</label>
					<input type="text" class="texto text1" name="hora" id="hora" onchange="validarHora('hora')" placeholder="HH:MM">
					<br><br>
					<label>Descripción</label>
					<textarea rows="4" cols="30" name="descripcion" id="descripcion" onchange="novacio('descripcion')"></textarea>
					<br>
					<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
				</form>
			</div>
</div>
</body>
</html> 