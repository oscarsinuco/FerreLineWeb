<?php

	extract($_POST);
	include("conectar.php");
	$conexion = conectarse();

	$usuario = ["cliente","empleado","jefe","administrador"];
	$campo = ["cedula_c","cedula","cedula_j","id"];
	$redirige = ["cliente_consulta.php","empleado_inserta.php","jefe_elimina.php","administrador.php"];

	for ($i=0;$i<4;$i++)
	{
		$sql = "select * from ".$usuario[$i]." where ".$campo[$i]." = '$cedula' and contrasena ='$contrasena'";
		$resultado = pg_query($conexion,$sql);
		$numeroFilas = pg_num_rows($resultado);
		pg_num_fields($resultado);
		if( $numeroFilas != 0 )
		{
			session_start();
			$columna = pg_fetch_array($resultado);

			$_SESSION['datos'] = $columna;
			$_SESSION['roll'] = $usuario[$i];

			print_r($_SESSION);

			$string = "Location:".$redirige[$i];
			header($string);
		}
	}

	echo "Error encontrando usuario";

?>