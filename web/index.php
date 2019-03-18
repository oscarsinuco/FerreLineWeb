<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Inicio</title>
	<link rel="stylesheet" type="text/css" href="estilos-index/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="login-celular" id="login-celular">
	<div class="contenido-login">
		<img src="imagenes-index/cerrar.png" id="cerrar">
		<div class="ingreso">
			<div class="cont-img">
				<img src="https://www.anujgargcoaching.com/images/joe-dawson.jpg" alt="">
			</div>
		</div>
		<div class="formulario">
			<div id="subformulario">
				<form action="valida_usuario.php" method="POST">
					<input type="text" name="cedula" placeholder="Usuario">
					<input type="password" name="contrasena" placeholder="Contraseña">
					<input type="submit" value="Ingresar">
					<input type="button" value="Registrarse">
				</form>	
			</div>	
		</div>
	</div>
</div>
<div id="encabezado">
	<div class="fila" id="buscador">
		<form action="">
			<center><input type="text" placeholder="Ingresa tu búsqueda"><input type="submit" value="Buscar"><input type="button" id="ingresar-boton" value="Ingresar"></center>
		</form>
	</div>
</div>
<?php
	session_start();
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
?>
<div class="fila">
	<div class="categorias">
		<form action="mostrar_consultas.php" style="background-color: rgba(0,0,30,0.4); width: 90%; border-radius: 5px;">
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 1</label></center>
			</div>
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 2</label></center>
			</div>
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 3</label></center>
			</div>
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 4</label></center>
			</div>
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 5</label></center>
			</div>
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 6</label></center>
			</div>
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 7</label></center>
			</div>
			<div class="categoria_individual">
				<center><input type="checkbox"><label>Categoria 8</label></center>
			</div>
			<div class="categoria_individual" id="filtro">
				<center><input type="submit" value="Filtrar"></center>
			</div>
		</form>
	</div>
	<div class="productos">
		<div class="producto">
			<div class="imagen">
				<img src="https://bricovel.com/2458-big_default/taladro-de-percusion-bosch-gsb-20-2-re-.jpg" alt="">
			</div>
			<div class="descripcion">
				<div class="opciones">
					<span>Precio</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Unidades</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Marca</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones" id="descripcion">
					<span>Descripcion</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones" id="vermas">
						<center><input type="submit" value="Ver mas"></center>
				</div>
			</div>
		</div>
		<div class="producto">
			<div class="imagen">
				<img src="https://ftmapp-production.s3.amazonaws.com/uploads/product/picture/1762/large_retina_GWS6115.png" alt="">
			</div>
			<div class="descripcion">
				<div class="opciones">
					<span>Precio</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Unidades</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Marca</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones" id="descripcion">
					<span>Descripcion</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones" id="vermas">
						<center><input type="submit" value="Ver mas"></center>
				</div>
			</div>
		</div>
		<div class="producto">
			<div class="imagen">
				<img src="https://ftmapp-production.s3.amazonaws.com/uploads/product/picture/1762/large_retina_GWS6115.png" alt="">
			</div>
			<div class="descripcion">
				<div class="opciones">
					<span>Precio</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Unidades</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Marca</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones" id="descripcion">
					<span>Descripcion</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones" id="vermas">
						<center><input type="submit" value="Ver mas"></center>
				</div>
			</div>
		</div>
		<div class="producto">
			<div class="imagen">
				<img src="http://www.discovertools.com.co/fotostec/RUTEADORA-CT2801-2.png" alt="">
			</div>
			<div class="descripcion">
				<div class="opciones">
					<span>Precio</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Unidades</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones">
					<span>Marca</span>
					<p>Hoa jajajaj</p>
				</div>
				<div class="opciones" id="descripcion">
					<span>Descripcion</span>
					<p>Hoa jajajaj</p>
					</div>
				<div class="opciones" id="vermas">
					<center><input type="submit" value="Ver mas"></center>
				</div>
			</div>	
		</div>
		<div class="producto">
				<div class="imagen">
					<img src="http://www.discovertools.com.co/fotostec/RUTEADORA-CT2801-2.png" alt="">
				</div>
				<div class="descripcion">
					<div class="opciones">
						<span>Precio</span>
						<p>Hoa jajajaj</p>
					</div>
					<div class="opciones">
						<span>Unidades</span>
						<p>Hoa jajajaj</p>
					</div>
					<div class="opciones">
						<span>Marca</span>
						<p>Hoa jajajaj</p>
					</div>
					<div class="opciones" id="descripcion">
						<span>Descripcion</span>
						<p>Hoa jajajaj</p>
						</div>
					<div class="opciones" id="vermas">
						<center><input type="submit" value="Ver mas"></center>
					</div>
				</div>	
			</div>
	</div>
	<div class="login">
		<div class="ingreso" style="background-color: rgba(0,0,30,0.4); border-top-left-radius: 5px; border-top-right-radius: 5px; width: 90%; margin-left: 5%">
			<div class="cont-img">
				<img src="https://www.anujgargcoaching.com/images/joe-dawson.jpg" alt="">
			</div>
		</div>
		<div class="formulario" style="background-color: rgba(0,0,30,0.4); padding-bottom: 20px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; width: 90%; margin-left: 5%">
			<form action="">
				<input type="text" placeholder="Usuario">
				<input type="password" placeholder="Contraseña">
				<input type="submit" value="Ingresar">
				<input type="button" value="Registrarse">
			</form>		
		</div>
		<div class="publicidad">
			
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	a = document.getElementById("cerrar");
	b = document.getElementById("ingresar-boton");
	a.onclick = function(){
		document.getElementById("login-celular").style.display="none";
	};
	b.onclick = function(){
		document.getElementById("login-celular").style.display="flex";
	}
</script>
</html>