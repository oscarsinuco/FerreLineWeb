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
	<title>Producto</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body >
<div class="fondo">
</div>
<div class="contenedor">
	<div class="encabezado"><h1>PRODUCTO</h1></div>
	<div class="cuerpo">
				<form onsubmit="return validartodo9()" name="producto" action="producto.php" method="POST">
					<br>
					<label>Código producto</label>  
					<input type="text" class="texto text1" name="codigo_p" id="codigo_p" onchange="num('codigo_p')"><br><br>
					<label>Id almacén</label>  
					<select name="id_almacen" class="selector texto" id="id_almacen" onchange="sede('id_almacen')">
						<option disabled value="" selected>
							Seleccione...
						</option>
						<?php
							include("conectar.php");
							$conexion = conectarse();
							$consulta = "select id_almacen, nombre from almacen";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$nombre = $fila["nombre"];
									$id_almacen = $fila["id_almacen"];
									echo "<option value='$id_almacen'>$nombre</option>";
								}
							}
						?>
					</select>
					<br><br>
					<label>Nombre</label> 
					<input type="text" class="texto text1" name="nombre" id="nombre" onchange="nombres('nombre')"><br><br>
					<label>Medida</label> 
					<input type="text" class="texto text1" name="medida" id="medida" onchange="novacio('medida')"><br><br>
					<label>Marca</label> 
					<input type="text" class="texto text1" name="marca" id="marca" onchange="novacio('marca')"><br><br>
					<label>Descripción</label> 
					<textarea rows="7" cols="30" name="descripcion" id="descripcion" onchange="novacio('descripcion')"></textarea>
					<br><br>
					<label>Fecha de fabricación</label> 
					<input type="text" class="texto text1" name="fecha_fabricacion" id="fecha_fabricacion" onchange="validarFecha('fecha_fabricacion')" placeholder="yyyy-mm-dd">
					
					<br><br><br>
					<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
				</form>
			</div>
</div>
</body>
</html> 