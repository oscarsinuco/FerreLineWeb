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
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
<div class="fondo">
</div>
<div class="contenedor">
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
