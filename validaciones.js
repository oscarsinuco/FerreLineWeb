function num(id) {
	var ide = document.getElementById(id).value;
	var val = isNaN(ide);
	if(val || ide == ""){
		alert("El valor ingresado debe ser un número");
		return false;
	}
	else{
		return true;
	}
}
function sede(id){
	var sedes = document.getElementById(id).value;
	if(sedes == ""){
		alert("Debe escoger una opción");
		return false;
	}
	else{
		return true;
	}
}
function nombres(id){
	campo = document.getElementById(id);
	var solotext = campo.value;
	var longi = solotext.length;
	var valor = longi < 3;
	var a = solotext.match(/^[A-Za-z\_\-\.\s\xF1\xD1]+$/);
	if ((!a) || (valor == true)){
		alert("El campo solo puede tener letras y debe tener mas de 3 caracteres");
		return false;
	}
	else{
		if(id == "nombre" || id=="apellido1" || id=="apellido2"){
			document.getElementById(id).value = document.getElementById(id).value.toUpperCase();
		}
		return true;
	}
}
function validartodo(){
	var v1 = document.getElementById("id_almacen").value;
	var v2 = document.getElementById("id_sede").value;
	var v3 = document.getElementById("nombre").value;
	var v4 = document.getElementById("cantidad").value;
	var v5 = document.getElementById("fecha_llegada").value;
	var v6 = document.getElementById("fecha_salida").value;
	var valores = [v1,v2,v3,v4,v5,v6];
	var contador = 0;
	for (var i = 1; i <= 6; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num("id_almacen");
	var ver2 = sede("id_sede");
	var ver3 = nombres("nombre");
	var ver4 = num("cantidad");
	var ver5 = validarFecha("fecha_llegada");
	var ver6 = validarFecha("fecha_salida");
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5 && ver6); 
	if(contador != 6 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}
function validarFecha(id) {
	var dateString = document.getElementById(id).value;
	var regEx = /^\d{4}-\d{2}-\d{2}$/;
	var contador = 0;
	if(!dateString.match(regEx)){
		alert("Error, la fecha debe tener el formato yyyy-mm-dd");
		contador = contador + 1;
	} 
	var d = new Date(dateString);
	if(Number.isNaN(d.getTime())){
		if(contador > 1){
			alert("Error, la fecha debe tener el formato yyyy-mm-dd");
		}
		contador = contador + 1;
	} 
	if(contador > 0){
		return false;
	}
	else{
		return true;
	}
}

function validarHora(id) {
	var hourString = document.getElementById(id).value;
	var regEx = /^\d{2}:\d{2}$/;
	var contador = 0;
	if(!hourString.match(regEx)){
		alert("Error, la hora debe tener el formato HH:MM");
		contador = contador + 1;
	} 
	if(contador > 0){
		return false;
	}
	else{
		return true;
	}
}

function validarcorreo(id){
	var valor = document.getElementById(id).value;
	var expreg = /[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}/;
	if(!valor.match(expreg)){
		alert("Digite una dirección de correo electrónico válida");
		return false;
	}
	else{
		return true;
	}
}
function novacio(id){
	var valor = document.getElementById(id).value;
	if (valor == ""){
		alert("El campo no puede estar vacío");
		return false;
	}
	else{
		return true;
	}
}
function validartodo1(){
	var v1 = document.getElementById("cedula_c").value;
	var v2 = document.getElementById("id_barrio").value;
	var v3 = document.getElementById("nombre").value;
	var v4 = document.getElementById("apellido1").value;
	var v5 = document.getElementById("apellido2").value;
	var v6 = document.getElementById("direccion").value;
	var v7 = document.getElementById("sexo").value;
	var v8 = document.getElementById("profesion").value;
	var v9 = document.getElementById("ruc").value;
	var v10 = document.getElementById("telefono").value;
	var v11 = document.getElementById("correo").value;
	var v12 = document.getElementById("fecha_nacimiento").value;
	var v13 = document.getElementById("contrasena").value;
	var valores = [v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13];
	var contador = 0;
	for (var i = 1; i <= 13; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num("cedula_c");
	var ver2 = sede("id_barrio");
	var ver3 = nombres("nombre");
	var ver4 = num("telefono");
	var ver5 = validarFecha("fecha_nacimiento");
	var ver6 = validarcorreo("correo");
	var ver7 = nombres("apellido1");
	var ver8 = nombres("apellido2");
	var ver9 = novacio("direccion");
	var ver10 = sede("sexo");
	var ver11 = nombres("profesion");
	var ver12 = num("ruc");
	var ver13 = novacio("contrasena");
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5 && ver6 && ver7 && ver8 && ver9 && ver10 && ver11 && ver12 && ver13); 
	if(contador != 13 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}
function validartodo2(){
	var v1 = document.getElementById("cedula").value;
	var v2 = document.getElementById("barrio").value;
	var v3 = document.getElementById("nombre").value;
	var v4 = document.getElementById("apellido1").value;
	var v5 = document.getElementById("apellido2").value;
	var v6 = document.getElementById("direccion").value;
	var v7 = document.getElementById("sexo").value;
	var v8 = document.getElementById("telefono").value;
	var v9 = document.getElementById("correo").value;
	var valores = [v1,v2,v3,v4,v5,v6,v7,v8,v9];
	var contador = 0;
	for (var i = 1; i <= 9; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num("cedula");
	var ver2 = sede("barrio");
	var ver3 = nombres("nombre");
	var ver4 = num("telefono");
	var ver6 = validarcorreo("correo");
	var ver7 = nombres("apellido1");
	var ver8 = nombres("apellido2");
	var ver9 = novacio("direccion");
	var ver10 = sede("sexo");
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver6 && ver7 && ver8 && ver9 && ver10); 
	if(contador != 9 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}
function validartodo3(){
	var v1 = document.getElementById("id_empleado").value;
	var v2 = document.getElementById("id_barrio").value;
	var v3 = document.getElementById("nombre").value;
	var v4 = document.getElementById("apellido1").value;
	var v5 = document.getElementById("apellido2").value;
	var v6 = document.getElementById("direccion").value;
	var v7 = document.getElementById("sexo").value;
	var v8 = document.getElementById("cargo").value;
	var v9 = document.getElementById("ruc").value;
	var v10 = document.getElementById("telefono").value;
	var v11 = document.getElementById("correo").value;
	var v12 = document.getElementById("fecha_nacimiento").value;
	var v13 = document.getElementById("id_nomina").value;
	var v14 = document.getElementById("cedula").value;
	var v15 = document.getElementById("contrasena").value;
	var valores = [v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15];
	var contador = 0;
	for (var i = 1; i <= 15; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num("id_empleado");
	var ver2 = sede("id_barrio");
	var ver3 = nombres("nombre");
	var ver4 = num("telefono");
	var ver5 = validarFecha("fecha_nacimiento");
	var ver6 = validarcorreo("correo");
	var ver7 = nombres("apellido1");
	var ver8 = nombres("apellido2");
	var ver9 = novacio("direccion");
	var ver10 = sede("sexo");
	var ver11 = nombres("cargo");
	var ver12 = num("ruc");
	var ver12 = num("id_nomina");
	var ver13 = num("cedula");
	var ver14 = validarcorreo("correo");
	var ver15 = novacio("contrasena");
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5 && ver6 && ver7 && ver8 && ver9 && ver10 && ver11 && ver12 && ver13 && ver14 && ver15); 
	if(contador != 15 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}
function validartodo4(){
	var v1 = document.getElementById("id_barrio").value;//
	var v2 = document.getElementById("nombre").value;//
	var v3 = document.getElementById("apellido1").value;//
	var v4 = document.getElementById("apellido2").value;//
	var v5 = document.getElementById("direccion").value;//
	var v6 = document.getElementById("sexo").value;//
	var v7 = document.getElementById("telefono").value;//
	var v8 = document.getElementById("correo").value;//
	var v9 = document.getElementById("fecha_nacimiento").value;//
	var v10 = document.getElementById("cedula_j").value;//
	var v11 = document.getElementById("contrasena").value;//
	var valores = [v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11];
	var contador = 0;
	for (var i = 1; i <= 11; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = sede("id_barrio");//
	var ver2 = nombres("nombre");//
	var ver3 = num("telefono");//
	var ver4 = validarFecha("fecha_nacimiento");//
	var ver5 = validarcorreo("correo");//
	var ver6 = nombres("apellido1");//
	var ver7 = nombres("apellido2");//
	var ver8 = novacio("direccion");//
	var ver9 = sede("sexo");//
	var ver10 = num("cedula_j");//
	var ver11 = novacio("contrasena");
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5 && ver6 && ver7 && ver8 && ver9 && ver10 && ver11); 
	if(contador != 11 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}

function validartodo5(){
	var v1 = document.getElementById("cedula_m").value;
	var v2 = document.getElementById("id_barrio").value;
	var v3 = document.getElementById("nombre").value;
	var v4 = document.getElementById("apellido1").value;
	var v5 = document.getElementById("apellido2").value;
	var v6 = document.getElementById("direccion").value;
	var v7 = document.getElementById("sexo").value;
	var v8 = document.getElementById("cargo").value;
	var v9 = document.getElementById("ruc").value;
	var v10 = document.getElementById("telefono").value;
	var v11 = document.getElementById("correo").value;
	var v12 = document.getElementById("fecha_nacimiento").value;
	var v13 = document.getElementById("id_nomina").value;
	var valores = [v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13];
	var contador = 0;
	for (var i = 1; i <= 13; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num("cedula_m");
	var ver2 = sede("id_barrio");
	var ver3 = nombres("nombre");
	var ver4 = num("telefono");
	var ver5 = validarFecha("fecha_nacimiento");
	var ver6 = validarcorreo("correo");
	var ver7 = nombres("apellido1");
	var ver8 = nombres("apellido2");
	var ver9 = novacio("direccion");
	var ver10 = sede("sexo");
	var ver11 = nombres("cargo");
	var ver12 = num("ruc");
	var ver13 = sede('id_nomina');
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5 && ver6 && ver7 && ver8 && ver9 && ver10 && ver11 && ver12 && ver13); 
	if(contador != 13 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}

function validartodo6(){
	var v1 = document.getElementById("cedula_m_fkey").value;
	var v2 = document.getElementById("placa_fkey").value;
	var v3 = document.getElementById("fecha").value;
	var v4 = document.getElementById("hora").value;
	var v5 = document.getElementById("descripcion").value;
	var valores = [v1,v2,v3,v4,v5];
	var contador = 0;
	for (var i = 1; i <= 5; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = sede("cedula_m_fkey");
	var ver2 = sede("placa_fkey");
	var ver3 = validarFecha("fecha");
	var ver4 = validarHora("hora");
	var ver5 = novacio("descripcion");
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5); 
	alert(ver1);
	alert(ver2);
	alert(ver3);
	alert(ver4);
	alert(ver5);
	
	if(contador != 5 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}

function validartodo7(){
	var v1 = document.getElementById("id_pedido").value;
	var v2 = document.getElementById("cedula_c").value;
	var v4 = document.getElementById("codigo_p").value;
	var v5 = document.getElementById("id_factura").value;
	var v6 = document.getElementById("cedula_m").value;
	var v7 = document.getElementById("descuento").value;
	var v8 = document.getElementById("cantidad").value;
	var v9 = document.getElementById("fecha").value;
	var v10 = document.getElementById("precio_unitario").value;
	var v11 = document.getElementById("iva").value;
	var valores = [v1,v2,v4,v5,v6,v7,v8,v9,v10,v11];
	var contador = 0;
	for (var i = 1; i <= 10; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num('id_pedido');
	var ver2 = sede("cedula_c");
	var ver4 = sede("codigo_p");
	var ver5 = sede("id_factura");
	var ver6 = sede("cedula_m");
	var ver7 = num("descuento");
	var ver8 = num("cantidad");
	var ver9 = validarFecha("fecha");
	var ver10 = num("precio_unitario");
	var ver11 = num("iva");
	var verificacion = !(ver1 && ver2 && ver4 && ver5 && ver6 && ver7 && ver8 && ver9 && ver10 && ver11); 
	if(contador != 10 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}

function validartodo8(){
	var v1 = document.getElementById("id_sede").value;
	var v2 = document.getElementById("barrio").value;
	var v3 = document.getElementById("director").value;
	var v4 = document.getElementById("nombre").value;
	var v5 = document.getElementById("direccion").value;
	var v6 = document.getElementById("telefono").value;
	var valores = [v1,v2,v3,v4,v5,v6];
	var contador = 0;
	for (var i = 1; i <= 6; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num('id_sede');
	var ver2 = sede("barrio");
	var ver3 = sede("director");
	var ver4 = nombres("nombre");
	var ver5 = novacio("direccion");
	var ver6 = num("telefono");
	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5 && ver6); 
	if(contador != 6 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}
function validartodo9(){
	var v1 = document.getElementById("codigo_p").value;
	var v2 = document.getElementById("id_almacen").value;
	var v3 = document.getElementById("nombre").value;
	var v4 = document.getElementById("medida").value;
	var v5 = document.getElementById("marca").value;
	var v6 = document.getElementById("descripcion").value;
	var v7 = document.getElementById("fecha_fabricacion").value;
	var valores = [v1,v2,v3,v4,v5,v6,v7];
	var contador = 0;
	for (var i = 1; i <= 7; i++) {
		if(valores[i] == null){
			valores[i] = "";
		}
		if(valores[i] != ""){
			contador++;
		}
	}
	var ver1 = num('codigo_p');
	var ver2 = sede("id_almacen");
	var ver3 = nombres("nombre");
	var ver4 = novacio("medida");
	var ver5 = novacio("marca");
	var ver6 = novacio("descripcion");
	var ver7 = validarFecha("fecha_fabricacion");

	var verificacion = !(ver1 && ver2 && ver3 && ver4 && ver5 && ver6 && ver7); 
	if(contador != 7 && verificacion){
		alert("Faltan campos por llenar o hay algunos con valores no aceptados");
		return false;
	}
	else{
		return true;
	}
}

