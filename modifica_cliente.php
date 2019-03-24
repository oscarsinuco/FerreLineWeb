<?php
	session_start();
	if($_SESSION["roll"] != "cliente"){
		header("location:index.php");
	}

	include("cerrarSesion.php");
	if (isset($_SESSION['inicioSesion'])){
		cerrarSesion();
	}
	$_SESSION['inicioSesion'] = time();

?>
<!DOCTYPE html>
<html>
<head>
	<title>Modificar Cliente</title>
	<link rel="stylesheet" type="text/css" href="css/ferreline.css">
	<link rel="stylesheet" type="text/css" href="estilos-index/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<?php
	include("header.php");
?>
<?php
	if (isset($_SESSION['inicioSesion'])){
		cerrarSesion();
	}
	if ( isset($_SESSION['roll'])){
		if($_SESSION["roll"] == "cliente"){
			include("menu-cliente.php");
		}
		else{
			if($_SESSION["roll"] == "empleado"){
				include("menu-empleado.php");
			}
			else{
				if($_SESSION["roll"] == "jefe"){
					include("menu-jefe.php");
				}
				else{
					if($_SESSION["roll"] == "administrador"){
						include("menu.php");
					}
					else{
						include("menu-sin-sesion.php");
					}
				}
			}
		}
	}
	else{
		include("menu-sin-sesion.php");
	}
?>
		<?php
			include("conectar.php");
			if(isset($_SESSION['modificado']) && $_SESSION['modificado'] == 'true'){
				include("letrero.php");
				$_SESSION['modificado'] = 'false';
			}
			$conexion = conectarse();
			extract($_POST);
			if($conexion){
				if($_POST == null){
					$a = $_SESSION['datos'];
					$consulta_cliente = "select * from cliente where cedula_c = '".$a['cedula_c']."';"; 
					$resultado = pg_query($conexion,$consulta_cliente);
					if($resultado){
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
				}
				if($_POST != null){
					$consulta_cliente = "UPDATE cliente SET id_barrio='$id_barrio', nombre='$nombre',apellido1='$apellido1',apellido2='$apellido2',direccion='$direccion',sexo='$sexo',profesion='$profesion',telefono='$telefono',correo='$correo',fecha_nacimiento='$fecha_nacimiento',contrasena='$contrasena' where cedula_c='$cedula_c';"; 
					$resultado = pg_query($conexion,$consulta_cliente);
					$a = $_SESSION['datos'];
					$consulta_cliente = "select * from cliente where cedula_c = '".$a['cedula_c']."';"; 
					$resultado = pg_query($conexion,$consulta_cliente);
					if($resultado){
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
						$_SESSION['modificado'] = 'true';
						if(isset($_SESSION['modificado']) && $_SESSION['modificado'] == 'true'){
							include("letrero.php");
							$_SESSION['modificado'] = 'false';
						}
					}
				}
				pg_close($conexion);
			}else{
				header('location: /FerreLineWeb/');
			}
	?>
<div class="row column-comp-9 column-tablet-9 column-cel-10 centrado">
    <div class="column-comp-4 m-h-400 column-tablet-6 column-cel-10 bg-oscuro-transparente borde-radio-10">
        <form action="modifica_cliente.php" method="POST" class="column-comp-10 column-tablet-10 column-cel-10">
            <div class="column-comp-10 column-tablet-10 column-cel-10 borde-radio-10">
                <div class="column-comp-10 column-tablet-10 column-cel-10 h-20 borde-radio-top-10 inferior">
                    <h1 class="texto-centrado blanco">MODIFICA TUS DATOS</h1>
                </div>
                <div class="row column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
                    <div class="column-comp-8 column-tablet-8 column-cel-8">
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Cédula<input type="number" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" value="<?php echo $cedula_c; ?>" disabled><input type='hidden' name='cedula_c' value='<?php echo $cedula_c;?>'></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Barrio<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="id_barrio" value="<?php echo $id_barrio; ?>"></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Nombre<input type="text" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="nombre" value='<?php echo $nombre;?>'></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Apellido 1<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="apellido1" value='<?php echo $apellido1;?>'></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10">
                            	<label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Dirección<input type="text" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="direccion" value='<?php echo $direccion;?>'></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Apellido 2<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="apellido2" value='<?php echo $apellido2;?>'></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Sexo<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="sexo" value='<?php echo $sexo;?>'></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-10 column-tablet-10  column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Correo<input type="email" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="correo" value='<?php echo $correo;?>'></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Telefono<input type="number" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="telefono" value='<?php echo $telefono;?>'></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Profesión<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="profesion" value='<?php echo $profesion;?>'></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Fecha de nacimiento<input type="date" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="fecha_nacimiento" value='<?php echo $fecha_nacimiento;?>'></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Contraseña<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="contrasena" value='<?php echo $contrasena;?>'></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 cont-centrado m-b-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
                                <input type="submit" class="btn-amarillo column-comp-4 boton-comp boton-tablet boton-cel" value="Modificar">
                                <input type="submit" class="btn-azul column-comp-4 margen-10 boton-comp boton-tablet boton-cel" value="Cancelar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="oculto-cel column-comp-5 margen-comp-10 margen-tablet-10 column-tablet-3 column-cel-10 modifica h-600">
    </div>
</div><br>
<?php
	include("footer.php");
?>
<script src="js/scripts.js"></script>
</body>
</html>