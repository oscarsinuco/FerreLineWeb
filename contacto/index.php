<!DOCTYPE html>
<html>
<head>
	<title>Contacto</title>
	<link rel="stylesheet" type="text/css" href="../css/ferreline.css">
	<link rel="stylesheet" type="text/css" href="../estilos-index/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<?php
	include("../header.php");
?>
<?php
    session_start();
    include("../cerrarSesion.php");
    if (isset($_SESSION['inicioSesion']))
    {
        cerrarSesion();
    }
    if ( isset($_SESSION['roll']) )
    {
        if($_SESSION["roll"] == "cliente"){
            include("../menu-cliente.php");
        }
        else{
            if($_SESSION["roll"] == "empleado"){
                include("../menu-empleado.php");
            }
            else{
                if($_SESSION["roll"] == "jefe"){
                    include("../menu-jefe.php");
                }
                else{
                    if($_SESSION["roll"] == "administrador"){
                        include("../menu.php");
                    }
                    else{
                        include("../menu-sin-sesion.php");
                    }
                }
            }
        }
    }
    else
    {
        include("../menu-sin-sesion.php");
    }
?>
<div class="row m-h-400 column-comp-9 column-tablet-9 column-cel-9 centrado">
    <div class="column-comp-4 column-tablet-4 column-cel-10 h-400 bg-oscuro-transparente borde-radio-10 cont-centrado">
        <div class="row h-100 column-comp-10 column-tablet-10 column-cel-10">
            <div class="column-comp-10 column-tablet-10 column-cel-10 h-20 borde-radio-top-10 bg-azul">
                <h1 class="texto-centrado blanco">CONTÁCTENOS</h1>
            </div>
            <div class="column-comp-10 column-tablet-10 column-cel-8 h-80 centrar-vertical">
                <div class="column-comp-10 column-tablet-10 column-cel-10">
                    <h4 class="blanco column-comp-9 column-tablet-9 column-cel-8 margen-10 text-left w-100">Teléfono: 3154573647</h4>
                    <h4 class="blanco column-comp-9 column-tablet-9 column-cel-8 margen-10 text-left w-100">Correo electrónico: ferreline@support.com</h4>
                    <h4 class="blanco column-comp-9 column-tablet-9 column-cel-8 margen-10 text-left w-100">Ciudad: Bucaramanga</h4>
                    <h4 class="blanco column-comp-9 column-tablet-9 column-cel-8 margen-10 text-left w-100">Barrio: San Francisco</h4>
                    <h4 class="blanco column-comp-9 column-tablet-9 column-cel-8 margen-10 text-left w-100">Direccion: Calle 16 # 23-15</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="oculto-cel column-comp-5 margen-comp-10 margen-tablet-10 column-tablet-5 column-cel-10 contacto sombra h-400">
    </div>
</div><br>
<?php
	include("../footer.php");
?>
<script src="../js/scripts.js"></script>
</body>
</html>