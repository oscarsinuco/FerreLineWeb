<?php	
	function cerrarSesion()
	{
		$horaActual = time();

		if( $horaActual - $_SESSION['inicioSesion'] > 20 )
		{	
			session_unset();
			session_destroy();
			header("Location: index.php");
		}
	}
?>