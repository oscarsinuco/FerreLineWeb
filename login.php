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
	include("header.php");
?>
<?php
	include("menu-sin-sesion.php");
?>
<div class="row m-h-400 column-comp-9 column-tablet-9 column-cel-10 centrado">
    <div class="column-comp-4 column-tablet-4 column-cel-10 h-400 bg-oscuro-transparente borde-radio-10 cont-centrado">
        <form action="" class="column-comp-10 cont-centrado">
            <div class="row column-comp-8 column-tablet-8 column-cel-8">
                <div class="column-comp-10 column-tablet-10 column-cel-10 m-b-10 icon-login">

                </div>
                <div class="column-comp-10 column-tablet-10 column-cel-10 m-b-40">
                    <label for="" class="blanco">Cédula<input type="number" class="text-comp text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10"></label>
                </div>
                <div class="column-comp-10 column-tablet-10 column-cel-10 m-b-10">
                    <label for="" class="blanco">Contraseña<input type="password" class="text-left text-comp text-tablet text-cel column-comp-10 column-tablet-10 column-cel-10"></label>
                </div>
                <div class="column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
                    <input type="submit" class="btn-amarillo column-comp-4 boton-comp boton-tablet boton-cel" value="Iniciar sesión">
                    <input type="submit" class="btn-azul column-comp-4 margen-10 boton-comp boton-tablet boton-cel" value="Cancelar">
                </div>
            </div>
        </form>
    </div>
    <div class="oculto-cel column-comp-5 margen-comp-10 margen-tablet-10 column-tablet-5 column-cel-10 decoracion h-400 sombra">
    </div>
</div><br>
<?php
	include("footer.php");
?>
<script src="js/scripts.js"></script>
</body>
</html>