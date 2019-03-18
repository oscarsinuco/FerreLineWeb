<?php
	function conectarse(){
		$conexion = pg_connect("host=localhost user=postgres port=5432 dbname=FerreLine password=123456");
		return $conexion;
	}
?>