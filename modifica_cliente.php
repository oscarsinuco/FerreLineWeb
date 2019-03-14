<?php
	session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Modificar Cliente</title>
	<link rel="stylesheet" type="text/css" href="css/estilos_consulta.css">
	<script type="text/javascript" src="validaciones.js"></script>
</head>
<body>
<div class="modificacion">
	<div style="width: 100%">
		<div class="encabezado">
			<h1>Modifica tus datos</h1>
		</div>
		<div class="contenido">
			<div class="formulario">
				<form action="" method="POST">
					<div class="grupo_formulario">
						<label>Cedula</label>
						<input type="number" name="" disabled="">
					</div>
					<div class="grupo_formulario">
						<label>Barrio</label>
						<input type="text" name="">
					</div>
					<div class="grupo_formulario">
						<label>Nombre</label>
						<input type="text" name="">
					</div>
					<div class="grupo_formulario">
						<label>Apellido 1</label>
						<input type="text" name="">
					</div>
					<div class="grupo_formulario">
						<label>Apellido 2</label>
						<input type="text" name="">
					</div>
					<div class="grupo_formulario">
						<label>Direccion</label>
						<input type="text" name="">
					</div>
					<div class="grupo_formulario">
						<label>Sexo</label>
						<input type="text" name="">
					</div>
					<div class="grupo_formulario">
						<label>Profesion</label>
						<input type="text" name="">
					</div>
					<div class="grupo_formulario">
						<label>Telefono</label>
						<input type="number" name="">
					</div>
					<div class="grupo_formulario">
						<label>Correo</label>
						<input type="email" name="">
					</div>
					<div class="grupo_formulario">
						<label>Fecha de nacimiento</label>
						<input type="date" name="">
					</div>
					<div class="grupo_formulario">
						<label>Contraseña</label>
						<input type="password" name="">
					</div>
					<div class="grupo_formulario enviar_div">
						<input type="submit" name="">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
		<?php
		include("conectar.php");
		$valor1 = 0;
		$valor2 = 0;
		$conexion = conectarse();
		extract($_POST);

		if($_POST == null){
			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Datos de usuario</caption>";
			echo "<tr>";

			echo "<th>Cedula</th>";
			echo "<th>id_barrio</th>";
			echo "<th>Nombre</th>";
			echo "<th>Apellido 1</th>";
			echo "<th>Apellido 2</th>";
			echo "<th>Direccion</th>";
			echo "<th>Sexo</th>";
			echo "<th>Profesion</th>";
			echo "<th>Telefono</th>";
			echo "<th>Correo</th>";
			echo "<th>Fecha Nacimiento</th>";
			echo "<th>Contraseña</th>";

			echo "</tr>";
			//$consulta_cliente = "select * from cliente where cedula_c = '".$_SESSION['cedula_c']."';"; 
			$consulta_cliente = "select * from cliente where cedula_c = '1102331110'";
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

			echo "<form name='formulario10' method='POST' action='modifica_cliente.php' onsubmit='return validartodo1()'>";

				echo "<tr>";

				echo "<td><input type='text' name='Cedula_c' value='$cedula_c' disabled></td>";
				echo "<input type='hidden' name='cedula_c' value='$cedula_c'>";
				echo "<td><select name='id_barrio' class='selector texto' id='id_barrio'>";
							$consulta = "select id_barrio, nombre from barrio";
							$resultado = pg_query($conexion,$consulta);
							$filas = pg_num_rows($resultado);
							if($filas > 0){
								while($fila = pg_fetch_array($resultado)){
									$nombre = $fila["nombre"];
									$id = $fila["id_barrio"];
									if ( $id == $id_barrio)
									{
										echo "<option value='$id' selected>$nombre</option>";
									}
									else 
									{
										echo "<option value='$id'>$nombre</option>";
									}
								}
							}
				echo"</select></td>";
				echo "<td><input type='text' name='nombre' value='$nombre'></td>";
				echo "<td><input type='text' name='apellido1' value='$apellido1'></td>";
				echo "<td><input type='text' name='apellido2' value='$apellido2'></td>";
				echo "<td><input type='text' name='direccion' value='$direccion'></td>";
				echo "<td><select name='sexo' class='selector texto' id='sexo'>";
				echo "	<option value='$sexo' selected> $sexo </option>";
				if ($sexo == 'M')
				{
					echo "	<option value='F'>F</option>";
				}
				else{
					echo "	<option value='M'>M</option>";
				}
				echo "</select></td>";
				echo "<td><input type='text' name='profesion' value='$profesion'></td>";
				echo "<td><input type='text' name='telefono' value='$telefono'></td>";
				echo "<td><input type='text' name='correo' value='$correo'></td>";
				echo "<td><input type='text' name='fecha_nacimiento' value='$fecha_nacimiento'></td>";
				echo "<td><input type='text' name='contrasena' value='$contrasena'></td>";

				echo "<input type='submit' id='enviar' name='Confirmar' value='enviar'";

				echo"</tr>";

			echo "</form>";
				

				
			echo "</table>";
		}
		if($_POST != null && $Confirmar == 'enviar'){

			$consulta_cliente = "UPDATE cliente SET id_barrio='$id_barrio', nombre='$nombre',apellido1='$apellido1',apellido2='$apellido2',direccion='$direccion',sexo='$sexo',profesion='$profesion',telefono='$telefono',correo='$correo',fecha_nacimiento='$fecha_nacimiento',contrasena='$contrasena' where cedula_c='$cedula_c';"; 
			$resultado = pg_query($conexion,$consulta_cliente);

			echo "<table align='center' border='1' cellspacing='0' cellspacing='0'>";
			echo "<caption>Datos actualizados</caption>";
			echo "<tr>";

			echo "<th>Cedula</th>";
			echo "<th>id_barrio</th>";
			echo "<th>Nombre</th>";
			echo "<th>Apellido 1</th>";
			echo "<th>Apellido 2</th>";
			echo "<th>Direccion</th>";
			echo "<th>Sexo</th>";
			echo "<th>Profesion</th>";
			echo "<th>Telefono</th>";
			echo "<th>Correo</th>";
			echo "<th>Fecha Nacimiento</th>";
			echo "<th>Contraseña</th>";

			echo "</tr>";

			//$consulta_cliente = "select * from cliente where cedula_c = '".$_SESSION['cedula_c']."';";
			$consulta_cliente = "select * from cliente where cedula_c = '1102331110'"; 
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

				echo "<tr>";

				echo "<td>$cedula_c</td>";
				echo "<td>$id_barrio</td>";
				echo "<td>$nombre</td>";
				echo "<td>$apellido1</td>";
				echo "<td>$apellido2</td>";
				echo "<td>$direccion</td>";
				echo "<td>$sexo</td>";
				echo "<td>$profesion</td>";
				echo "<td>$telefono</td>";
				echo "<td>$correo</td>";
				echo "<td>$fecha_nacimiento</td>";
				echo "<td>$contrasena</td>";

				echo"</tr>";				
			echo "</table>";


		}
	?>
</body>
</html>