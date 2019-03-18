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
	<title>Mensajero Vehículo</title>
	<script type="text/javascript" src="validaciones.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
<div class="fondo">
</div>
<div class="contenedor">
	<div class="encabezado"><h2>MENSAJERO VEHÍCULO</h2></div>
	<div class="cuerpo">
				<form onsubmit="return validartodo6()" name="menajero_vehiculo" action="mensajero_vehiculo.php" method="POST">
					<br>
					<label>Mensajero</label>
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
					<label>Placa del vehiculo</label>
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