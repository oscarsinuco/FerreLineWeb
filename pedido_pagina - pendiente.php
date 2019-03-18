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

?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Pedido</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<script type="text/javascript">
		function validaProducto(id)
		{
			var producto = document.getElementById(id).value;
			if(producto == ""){
				document.getElementById(id).disabled = false;
				return false;
			}
			else{
				document.getElementById(id).disabled = true;
				return true;
			}
		}
	</script>
</head>
<body>
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
					<li><a href="contacto/index.html">DATOS</a></li>
				</ul>
			</li>
		</ul>
		</div>
		<div id="logo">
			<img src="imagenes/logoicon.png" width="130%"><br/>
		</div>
</div>
<div class="contenedor" style="height: 1070px;">
	<div class="encabezado"><h1>PEDIDO</h1></div>
	<div class="cuerpo">
				<form onsubmit="return validartodo7()" name="pedido" action="pedido.php" method="POST">
					<br>
					<label>Id pedido</label>  
					<input type="text" class="texto text1" name="id_pedido" id="id_pedido" onchange="num('id_pedido')"> 
					<label>Cliente</label>  
					<select name="cedula_c" class="selector texto" id="cedula_c" onchange="sede('cedula_c')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php
							include("conectar.php");
							$conexion = conectarse();
							$consulta = "select cedula_c, nombre, apellido1, apellido2 from cliente";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$nombre = $fila["nombre"];
									$cedula_c = $fila["cedula_c"];
									$apellido1 = $fila["apellido1"];
									$apellido2  =$fila["apellido2"];
									echo "<option value='$cedula_c'>$nombre $apellido1 $apellido2</option>";
								}
							}
						?>
					</select>
					<label>Código producto</label>  
					<select name="codigo_p" class="selector texto" id="codigo_p" onchange="sede('codigo_p');validaProducto('codigo_u')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php						
							$consulta = "select distinct codigo_p from unidad_producto order by codigo_p asc"; 
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$codigo_p = $fila["codigo_p"];
									echo "<option value='$codigo_p'>$codigo_p</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Unidad</label>  
					<select name="codigo_u" class="selector texto" id="codigo_u" onchange="sede('codigo_u')" disabled>
						<option disabled value="" selected>
							Seleccione...
						</option>	

						<?php
//------------------------------------------------------------------------------>
							$opcion = $_POST['codigo_p'];
							$consulta = "select distinct codigo_u from unidad_producto where codigo_p = $opcion"; 
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$codigo_u = $fila["codigo_u"];
									echo "<option value='$codigo_u'>$codigo_u</option>";
								}
							}
						?>
					</select> 
					<br><br>
					<label>Id factura</label>  
					<select name="id_factura" class="selector texto" id="id_factura" onchange="sede('id_factura')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php							
							$consulta = "select id_factura from factura"; 
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$id_factura = $fila["id_factura"];
									echo "<option value='$id_factura'>$id_factura</option>";
								}
							}
						?>
					</select> 
						<label>Mensajero</label>  
					<select name="cedula_m" class="selector texto" id="cedula_m" onchange="sede('cedula_m')">
						<option disabled value="" selected>
							Seleccione...
						</option>

						<?php							
							$consulta = "select cedula_m, nombre, apellido1, apellido2 from mensajero"; 
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$apellido1 = $fila["apellido1"];
									$apellido2  =$fila["apellido2"];
									$nombre = $fila["nombre"];
									$cedula_m = $fila["cedula_m"];
									echo "<option value='$cedula_m'>$nombre $apellido1 $apellido2</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Descuento (%)</label> 
					<input type="text" class="texto text1" name="descuento" id="descuento" onchange="num('descuento')"> 
					<label>Cantidad</label> 
					<input type="text" class="texto text1" name="cantidad" id="cantidad" onchange="num('cantidad')">
					<br><br>
					<label>Fecha</label> 
					<input type="text" class="texto text1" name="fecha" id="fecha" onchange="validarFecha('fecha')" placeholder="yyyy-mm-dd"> 
					<label>Precio Unitario</label> 
					<input type="text" class="texto text1" name="precio_unitario" id="precio_unitario" onchange="num('precio_unitario')"><br><br>
					<label>IVA (%)</label> 
					<input type="text" class="texto text1" name="iva" id="iva" onchange="num('iva')">
					<br><br><br>
					<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
				</form>
			</div>
</div>
</body>
</html> 