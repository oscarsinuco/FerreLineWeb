<!DOCTYPE html>
<html>
<head>
	<title>Quienes somos</title>
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
    else{
        include("../menu-sin-sesion.php");
    }
?>
<div class="row column-comp-9 column-tablet-9 column-cel-10 cont-centrado centrado">
    <div class="column-comp-10 column-tablet-8 column-cel-10 m-h-400 bg-oscuro-transparente borde-radio-10 cont-centrado">
        <div class="row h-100 column-comp-10 column-tablet-10 column-cel-10">
            <div class="column-comp-10 column-tablet-10 column-cel-10 h-20 borde-radio-top-10 bg-azul m-bottom-50">
                <h1 class="texto-centrado blanco">QUIENES SOMOS</h1>
            </div>
            <div class="column-comp-10 column-tablet-10 column-cel-10 h-80 centrar-vertical">
                <div class="column-comp-10 column-tablet-10 column-cel-10 cont-centrado">
                    <div class="column-comp-8 column-tablet-8 column-cel-8">
                        <div class="row h-100 column-comp-10 column-tablet-10 column-cel-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5 bg-amarillo">
                                <h3 class="texto-centrado blanco" id="og">Objetivos generales</h3>
                            </div>
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5">
                                <p class="justificado blanco parrafo-comp parrafo-tablet parrafo-cel">
                                    Ofrecer productos de ferreteria via online.
                                    <br><br>
                                    Ofrecer una mayor comodidad a la hora de realizar compras o pedidos por parte de los clientes.
                                </p>
                            </div>
                        </div>
                        <div class="row h-100 column-comp-10 column-tablet-10 column-cel-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5 bg-amarillo">
                                <h3 class="texto-centrado blanco" id="oe">Objetivos específicos</h3>
                            </div>
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5">
                                <p class="justificado blanco parrafo-comp parrafo-tablet parrafo-cel">
                                    Permitir el acceso a la compra y visualización de diferentes productos a lo largo y ancho de Bucaramanga.
                                    <br><br>
                                    Comercializar diferentes productos de las marcas más reconocidas y de mejor calidad a los mejores precios.
                                    <br><br>
                                    Generar nuevas estrategias de ventas en cuanto a la facilidad de acceso a diferentes productos de ferretería.
                                    <br><br>
                                    Permitir el fácil y rápido acceso a diferentes productos derivados o relacionados con ferretería..
                                </p>
                            </div>
                        </div>
                        <div class="row h-100 column-comp-10 column-tablet-10 column-cel-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5 bg-amarillo">
                                <h3 class="texto-centrado blanco" id="mi">Nuestra misión</h3>
                            </div>
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5">
                                <p class="justificado blanco parrafo-comp parrafo-tablet parrafo-cel">
                                    Distribuir los mejores materiales de reparacion y construccion tanto a nivel de hogar como industrial al mejor precio y calidad con la finalidad de hacerlos más accesibles tanto al consumidor como al especialista, haciendo uso de una plataforma online capaz de resolver las necesidades del cliente situado en Bucaramanga y sus afueras.
                                </p>
                            </div>
                        </div>
                        <div class="row h-100 column-comp-10 column-tablet-10 column-cel-10">
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5 bg-amarillo">
                                <h3 class="texto-centrado blanco" id="vi">Nuestra visión</h3>
                            </div>
                            <div class="column-comp-10 column-tablet-10 column-cel-10 h-5">
                                <p class="justificado blanco parrafo-comp parrafo-tablet parrafo-cel">
                                    A largo plazo se espera una completa digitalización por parte de la Ferretería en la cual aquellos clientes que viven principalmente en las afueras de la ciudad de Bucaramanga o en otros departamentos puedan acceder fácilmente a ellos, debido a la continua dificultad que viven dichas personas al momento de adquirir un producto. Se espera adicionalmente que la empresa crezca con esta idea debido a que muchas más personas podrán acceder a ella, haciendo uso de la publicidad necesaria y por tal motivo se generarán más ingresos para la empresa que permitirán cubrir los costos de la inversión en el sitio web y más adelante permitirá la adquisición de muchas más sucursales para la empresa.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><br>
<?php
	include("../footer.php");
?>
<script src="../js/scripts.js"></script>
</body>
</html>