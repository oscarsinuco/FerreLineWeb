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
	<title>Director</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
	<div class="fondo">
</div>
	<div class="contenedor">
		<div class="encabezado"><h1>DIRECTOR</h1></div>
		<div class="cuerpo">
			<form onsubmit="return validartodo2()" name="almacen" action="director.php" method="POST">
				<label>Cédula</label>
				<input type="text" name="cedula" class="texto text1" id="cedula" onchange="num('cedula')">
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
				<label>Nombre</label>
				<input type="text" class="texto text1" id="nombre" name="nombre" onchange="nombres('nombre')" >
				<label>Apellido 1</label>
				<input type="text" class="texto text1" id="apellido1" name="apellido1" onchange="nombres('apellido1')">
				<label>Apellido 2</label>
				<input type="text" class="texto text1" id="apellido2" name="apellido2" onchange="nombres('apellido2')">
				<label>Dirección</label>
				<textarea rows="4" cols="30" name="direccion" id="direccion" onchange="novacio('direccion')"></textarea>
				<label>Telefono</label>
				<input type="text" class="texto text1" id="telefono" name="telefono" onchange="num('telefono')">
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
				<label>Correo</label>
				<input type="email" class="texto text1" id="correo" name="correo" onchange="validarcorreo('correo')" placeholder="alguien@example.etc">
				<button type="submit" class="boton-enviar" name="enviar" id="enviar" value="Enviar datos"> </button><button class="boton-enviar" type="reset" id="borrar" name="borrar" value="Limpiar"></button>
			</form>
	  </div>
	</div>
</body>
</html>
