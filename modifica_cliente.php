<?php
	session_start();
	if($_SESSION["roll"] != "cliente"){
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
<html>
<head>
	<title>Modificar Cliente</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
	<script type="text/javascript" src="validaciones.js"></script>
</head>
<body>
		<?php 
			
			include("conectar.php");

			if( isset($_SESSION['modificado']) && $_SESSION['modificado'] == 'true')
			{
				include("letrero.php");
			}


			$conexion = conectarse();
			extract($_POST);

			if($_POST == null){

				$a = $_SESSION['datos'];
				
				$consulta_cliente = "select * from cliente where cedula_c = '".$a['cedula_c']."';"; 
				//$consulta_cliente = "select * from cliente where cedula_c = '1102331110'";
				$resultado = pg_query($conexion,$consulta_cliente);
				$row = pg_fetch_array($resultado);

					$cedula_c = $row['0'];
					$id_barrio = $row['1'];
					$nombre = $row['2'];
					$apellido1 = $row['3'];
					$apellido2 = $row['4'];
					$direccion = $row['5'];
					$sexo = $row['6'];
					$profesion = $row['7'];
					$telefono = $row['8'];
					$correo = $row['9'];
					$fecha_nacimiento = $row['10'];
					$contrasena = $row['11'];
			}

			if($_POST != null && $enviar == 'enviar'){

				$consulta_cliente = "UPDATE cliente SET id_barrio='$id_barrio', nombre='$nombre',apellido1='$apellido1',apellido2='$apellido2',direccion='$direccion',sexo='$sexo',profesion='$profesion',telefono='$telefono',correo='$correo',fecha_nacimiento='$fecha_nacimiento',contrasena='$contrasena' where cedula_c='$cedula_c';"; 
				$resultado = pg_query($conexion,$consulta_cliente);
				$a = $_SESSION['datos'];
				//$consulta_cliente = "select * from cliente where cedula_c = '".$_SESSION['cedula_c']."';";
				$consulta_cliente = "select * from cliente where cedula_c = '".$a['cedula_c']."';"; 
				$resultado = pg_query($conexion,$consulta_cliente);

				$row = pg_fetch_array($resultado);

					$cedula_c = $row['0'];
					$id_barrio = $row['1'];
					$nombre = $row['2'];
					$apellido1 = $row['3'];
					$apellido2 = $row['4'];
					$direccion = $row['5'];
					$sexo = $row['6'];
					$profesion = $row['7'];
					$telefono = $row['8'];
					$correo = $row['9'];
					$fecha_nacimiento = $row['10'];
					$contrasena = $row['11'];

					$_SESSION['datos'] = $row;
					//$_SESSION['modificado'] = 'true';

			}
	?>
<div class="modificacion">
	<div style="width: 100%">
		<div class="encabezado">
			<h1>Modifica tus datos</h1>
		</div>
		<div class="contenido">
			<div class="formulario">
				<form action="modifica_cliente.php" method="POST">
					<div class="grupo_formulario">
						<label>Cedula</label>
						<input type="number" value="<?php echo $cedula_c; ?>" disabled>
						<input type='hidden' name='cedula_c' value='<?php echo $cedula_c;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Barrio</label>
						<input type="text" name="id_barrio" value="<?php echo $id_barrio; ?>">
					</div>
					<div class="grupo_formulario">
						<label>Nombre</label>
						<input type="text" name="nombre" value='<?php echo $nombre;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Apellido 1</label>
						<input type="text" name="apellido1" value='<?php echo $apellido1;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Apellido 2</label>
						<input type="text" name="apellido2" value='<?php echo $apellido2;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Direccion</label>
						<input type="text" name="direccion" value='<?php echo $direccion;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Sexo</label>
						<input type="text" name="sexo" value='<?php echo $sexo;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Profesion</label>
						<input type="text" name="profesion" value='<?php echo $profesion;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Telefono</label>
						<input type="number" name="telefono" value='<?php echo $telefono;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Correo</label>
						<input type="email" name="correo" value='<?php echo $correo;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Fecha de nacimiento</label>
						<input type="date" name="fecha_nacimiento" value='<?php echo $fecha_nacimiento;?>'>
					</div>
					<div class="grupo_formulario">
						<label>Contraseña</label>
						<input type="password" name="contrasena" value='<?php echo $contrasena;?>'>
					</div>
					<div class="grupo_formulario enviar_div">
						<input type="submit" name="enviar" value="enviar">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>