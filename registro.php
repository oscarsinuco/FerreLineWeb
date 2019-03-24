<!DOCTYPE html>
<html>
<head>
	<title>Inicio</title>
	<link rel="stylesheet" type="text/css" href="css/ferreline.css">
	<link rel="stylesheet" type="text/css" href="estilos-index/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<?php
    error_reporting(0);
	include("header.php");
?>
<?php
	include("menu-sin-sesion.php");
?>
<?php
    include("conectar.php");
    $conexion = conectarse();
    extract($_POST);
    if($_POST != null){
        $sql3="insert into cliente values ('$cedula_c','$id_barrio', '$nombre','$apellido1','$apellido2','$direccion','$sexo','$profesion','$telefono','$correo','$fecha_nacimiento','$contrasena')"; 
        $result = pg_query($conexion, $sql3);
        if($result){
            include("mensaje-registro-exito.php");
        }else{
            include("mensaje-registro-fallo.php");
        }
    }
    pg_close($conexion);
?>
<div class="row column-comp-9 column-tablet-9 column-cel-10 centrado">
    <div class="column-comp-4 m-h-400 column-tablet-6 column-cel-10 bg-oscuro-transparente borde-radio-10">
        <form action="registro.php" method="POST" class="column-comp-10 column-tablet-10 column-cel-10">
            <div class="column-comp-10 column-tablet-10 column-cel-10 borde-radio-10">
                <div class="column-comp-10 column-tablet-10 column-cel-10 h-20 borde-radio-top-10 inferior m-b-10">
                    <h1 class="texto-centrado blanco">REGÍSTRATE</h1>
                </div>
                <div class="row column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
                    <div class="column-comp-8 column-tablet-8 column-cel-8">
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Cédula<input type="number" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="cedula_c"></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Barrio
                                    <select class="text-cel text-tablet text-comp-md selector column-tablet-10 column-comp-10 column-cel-10" name="id_barrio">
                                        <?php
                                            $conexion = conectarse();
                                            if($conexion){
                                                $consulta = "select id_barrio, nombre from barrio";
                                                $resultado = pg_query($conexion,$consulta);
                                                if($resultado){
                                                    $filas = pg_num_rows($resultado);
                                                    if($filas > 0){
                                                        while($fila = pg_fetch_array($resultado)){
                                                            $nombre = $fila["nombre"];
                                                            $id = $fila["id_barrio"];
                                                            echo "<option value='$id'>$nombre</option>";
                                                        }
                                                    }else{
                                                        echo "<option>No hay entradas</option>";
                                                    }
                                                }else{
                                                    echo "<option>No hay entradas</option>";
                                                }
                                            }else{
                                                echo "<option>No hay entradas</option>";
                                            }
                                            pg_close($conexion);
                                        ?>
                                    </select>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Nombre<input type="text" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="nombre"></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Primer apellido<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="apellido1"></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Direccion<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="direccion"></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Segundo apellido<input type="text" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="apellido2"></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Sexo<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="sexo"></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-10 column-tablet-10  column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Correo<input type="email" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="correo"></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Telefono<input type="number" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="telefono"></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Profesión<input type="text" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="profesion"></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                            <div class="column-comp-4 column-tablet-10 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Fecha nacimiento<input type="date" class="text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="fecha_nacimiento"></label>
                            </div>
                            <div class="column-comp-4 column-tablet-10 margen-comp-20 column-cel-10">
                                <label for="" class="blanco parrafo-comp parrafo-tablet parrafo-cel">Contraseña<input type="password" class="text-left text-comp-md text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10" name="contrasena"></label>
                            </div>
                        </div>
                        <div class="row column-comp-10 column-tablet-10 column-cel-10 cont-centrado m-b-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
                                <input type="submit" class="btn-verde column-comp-4 boton-comp boton-tablet boton-cel" value="Registrarse">
                                <input type="submit" class="btn-azul column-comp-4 margen-10 boton-comp boton-tablet boton-cel" value="Cancelar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="oculto-cel column-comp-5 margen-comp-10 margen-tablet-10 column-tablet-3 column-cel-10 registro h-600">
    </div>
</div><br>
<?php
	include("footer.php");
?>
<script src="js/scripts.js"></script>
</body>
</html>