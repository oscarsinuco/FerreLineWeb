function cambiartamano(){
			a = 100;
			this.resizeTo(window.innerWidth + a,window.innerHeight + a);
			a = a + 100;
		}
        var toSecond = 0;
        function countDown(){
            toSecond=toSecond-1;
            if(toSecond<0){
                toSecond=10;
            }
            document.getElementById("toSecond").innerHTML = "Esta pagina se cerrara en: "+toSecond;
            if(toSecond == 0 ){      
                window.close();
            }else{                
               myTimeGame = setTimeout("countDown()",1000);
            }
        }     