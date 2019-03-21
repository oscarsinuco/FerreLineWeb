var menu = document.getElementById("boton-menu");
	var elems = document.getElementsByClassName('column-cel-9-8');
	menu.onclick = function(){
		if(elems[1].style.display == "none"){
			for (var i=0;i<elems.length;i+=1){
				elems[i].style.display = 'block';
			}
		}else{
			for (var i=0;i<elems.length;i+=1){
				elems[i].style.display = 'none';
			}
		}
	}
	setInterval(function(){
		if(screen.width > 700){
			menu.style.display = "none";
		}
	},100);
	function desplegar(mostrar){
		var padre = mostrar.parentNode.parentNode.parentNode.parentNode.parentNode;
		var descripcion = padre.children;
		if(descripcion[2].style.display == "block"){
			descripcion[2].style.display = "none";
		}else{
			descripcion[2].style.display = "block";
		}
		mostrar.onclick = function(){
			if(descripcion[2].style.display == "block"){
				descripcion[2].style.display = "none";
			}else{
				descripcion[2].style.display = "block";
			}
		};
	};
	var imagenes= ["imagenes/c1.jpg","imagenes/c2.jpg","imagenes/c3.jpg","imagenes/c4.jpg","imagenes/c5.jpg","imagenes/c6.jpg","imagenes/c7.jpg"];
	var contador = 1;
	function pasar(id){
		contador = id;
		for(i=0;i<=6;i++){
			if(i != contador){
				var temp = document.getElementById(i);
				temp.style.backgroundColor = "white";
			}
		}
		var carousel = document.getElementById("carousel");
		var circulo = document.getElementById(contador);		
		carousel.style.transition = "background-image .3s";
		carousel.style.backgroundImage = "url('" + imagenes[contador] +  "')";
		circulo.style.backgroundColor = "#0275d8";
	}
	function adelante(){
		if(contador > 6){
			contador = 0;
			for(i=0;i<=6;i++){
				if(i != contador){
					var temp = document.getElementById(i);
					temp.style.backgroundColor = "white";
				}
			}
			var carousel = document.getElementById("carousel");
			var circulo = document.getElementById(contador);			
			carousel.style.transition = "background-image .3s";
			carousel.style.backgroundImage = "url('" + imagenes[contador] +  "')";
			circulo.style.backgroundColor = "#0275d8";
		}else{
			for(i=0;i<=6;i++){
				if(i != contador){
					var temp = document.getElementById(i);
					temp.style.backgroundColor = "white";
				}
			}
			var carousel = document.getElementById("carousel");
			var circulo = document.getElementById(contador);			
			carousel.style.transition = "background-image .3s";
			carousel.style.backgroundImage = "url('" + imagenes[contador] +  "')";
			circulo.style.backgroundColor = "#0275d8";
			contador++;
		}
	};
	function atras(){
		contador--;
		if(contador < 0){
			contador = 6;
			for(i=0;i<=6;i++){
				if(i != contador){
					var temp = document.getElementById(i);
					temp.style.backgroundColor = "white";
				}
			}
			var carousel = document.getElementById("carousel");
			var circulo = document.getElementById(contador);			
			carousel.style.transition = "background-image .3s";
			carousel.style.backgroundImage = "url('" + imagenes[contador] +  "')";
			circulo.style.backgroundColor = "#0275d8";
		}else{
			for(i=0;i<=6;i++){
				if(i != contador){
					var temp = document.getElementById(i);
					temp.style.backgroundColor = "white";
				}
			}
			var carousel = document.getElementById("carousel");
			var circulo = document.getElementById(contador);			
			carousel.style.transition = "background-image .3s";
			carousel.style.backgroundImage = "url('" + imagenes[contador] +  "')";
			circulo.style.backgroundColor = "#0275d8";
		}
	}
	setInterval(adelante, 10000);