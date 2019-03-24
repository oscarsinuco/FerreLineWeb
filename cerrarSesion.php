<?php	
	function cerrarSesion()
	{
		$horaActual = time();

		if( $horaActual - $_SESSION['inicioSesion'] < 0 )
		{	
			session_unset();
			session_destroy();
			header("Location: index.php");
		}
	}
?>