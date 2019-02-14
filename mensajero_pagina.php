<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Mensajero</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
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
<div class="contenedor" style="height: 1200px;">
	<div class="encabezado"><h1>MENSAJERO</h1></div>
	<div class="cuerpo">

				<form onsubmit="return validartodo5()" name="mensajero" action="mensajero.php" method="POST">
					<br>
					<label>Cedula</label>  
					<input id="cedula_m" class="texto text1" name="cedula_m" onchange="num('cedula_m')">
					<br><br>
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
					<br><br>
					<label>Id nomina</label>  
					<select name="id_nomina" class="selector texto" id="id_nomina" onchange="sede('id_nomina')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php
							$consulta = "select id_nomina, fecha_inicio from nomina";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$fecha_inicio = $fila["fecha_inicio"];
									$id = $fila["id_nomina"];
									echo "<option value='$id'>$fecha_inicio</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Nombre</label> 
					<input type="text" class="texto text1" id="nombre" name="nombre" onchange="nombres('nombre')">
					<br><br>
					<label>Apellido 1</label> 
					<input type="text" class="texto text1" id="apellido1" name="apellido1" onchange="nombres('apellido1')">
					<br><br>
					<label>Apellido 2</label> 
					<input type="text"class="texto text1" id="apellido2" name="apellido2" onchange="nombres('apellido2')">
					<br><br>
					<label>Direccion</label> 
					<textarea rows="4"  cols="30" name="direccion" id="direccion" onchange="novacio('direccion')"></textarea>
					<br><br>
					<label>Sexo</label>  
					<select id="sexo" class="selector texto" name="sexo" onchange="sede('sexo')">
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
					<br><br>
					<label>Cargo</label> 
					<input type="text" class="texto text1" id="cargo" name="cargo" onchange="nombres('cargo')">
					<br><br>
					<label>RUC</label>  
					<input type="text" class="texto text1" name="ruc"  id="ruc" onchange="num('ruc')">
					<br><br>
					<label>Telefono</label>
					<input type="text" class="texto text1" name="telefono" id="telefono" onchange="num('telefono')">
					<br><br>
					<label>Correo</label>
					<input type="email" class="texto text1" name="correo" id="correo" onchange="validarcorreo('correo')" placeholder="alguien@example.etc">
					<br><br>
					<label>Fecha de Nacimiento</label> 
					<input type="text" class="texto text1" name="fecha_nacimiento" id="fecha_nacimiento" onchange="validarFecha('fecha_nacimiento')" placeholder="yyyy-mm-dd">
					<br><br>
					<br>
					<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"></button> <button type="reset" class="boton-enviar" id="borrar" name="borrar" value="Limpiar"></button>
				</form>
			</div>

</div>
</body>
</html> 