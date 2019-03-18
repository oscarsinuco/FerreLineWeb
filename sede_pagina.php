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
	<title>Sede</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="fondo">
</div>

<div class="contenedor">
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