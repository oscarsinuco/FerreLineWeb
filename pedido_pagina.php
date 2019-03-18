<?php
	session_start();
	if($_SESSION["roll"] != "administrador"){

		if($_SESSION["roll"] == "empleado"){
			
		}else{
			header("location:index.php");
		}
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
	<title>Pedido</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<div class="contenedor">
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
					<label>Producto</label>  
					<select name="codigo_p" class="selector texto" id="codigo_p" onchange="sede('codigo_p')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php						
							$consulta = "select distinct p.medida as productomedida, p.codigo_p as codigoproducto, p.nombre as nombreproducto, u.nombre as nombreunidad, u.codigo_u as codigounidad, u.descripcion as descripcionunidad from unidad_producto up, producto p, unidad u where p.codigo_p = up.codigo_p and u.codigo_u = up.codigo_u order by p.nombre"; 
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$nombre_u = $fila['nombreunidad'];
									$nombre_p = $fila['nombreproducto'];
									$codigo_p = $fila["codigoproducto"];
									$codigo_u = $fila["codigounidad"];
									$medida = $fila["productomedida"];
									$descripcion = $fila['descripcionunidad'];
									echo "<option value='$codigo_p $codigo_u'>$nombre_p $medida | $nombre_u | $descripcion </option>";
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