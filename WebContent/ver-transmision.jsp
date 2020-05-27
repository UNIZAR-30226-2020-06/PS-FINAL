<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<!--  
########################################################################
############### BASE DE TODAS LAS PAGINAS    ###########################
########################################################################
-->

<!-- RECOGIDA DATOS -->
<%
String nombre = (String) session.getAttribute("nombre");
%>


<!-- NOMBRE DE LA PESTAÃA -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/basic/logo.ico" type="image/x-icon">
    <title>Espotify</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
</head>

<body background="assets/img/fondo3.png" style="background-size: cover;background-repeat: no-repeat; background-position: center center;background-attachment: fixed;" class="sidebar-mini sidebar-collapse sidebar-expanded-on-hover has-preloader" style="display: none;">
<!-- Pre loader
  To disable preloader remove 'has-preloader' from body
 -->



<!-- @Pre loader-->
<div id="app">

<!--MENU DE LA IZQUIERDA -->
<aside class="main-sidebar fixed offcanvas shadow" data-toggle='offcanvas'>
    <div class="sidebar">
        <ul class="sidebar-menu">
            <li><a class="ajaxifyPage active" href="Inicio?pagina=0" onclick="setTimeout(location.reload.bind(location), 1)">
                    <i class="icon icon-home-1 s-24"></i> <span>Inicio</span>
                </a>
            </li>
            
            <li class="menu-item-has-children">
                <a href="#">
                    <i class="icon icon-layers s-24"></i> <span>Categorías</span>
                    <i class=" icon-angle-left  pull-right"></i>
                </a>
                <ul class="sub-menu">
					<c:forEach var="genero1" items="${generos}">                    
						<li><a href="obtener_info_gen?idGenero=${genero.getId()}&nombre=${genero.getNombre()}&pagina=10" >${genero.getNombre()}</a></li>
	                </c:forEach>

                </ul>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_lrs?tipo=ListaRep&pagina=10" onclick="setTimeout(location.reload.bind(location), 1)">
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis listas de reproduccion</span>
                </a>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_podcasts?tipo=podcasts&pagina=10" onclick="setTimeout(location.reload.bind(location), 1)">
                    <i class="icon icon-headphones s-24"></i> <span>Mis podcasts</span>
                </a>
            </li>
            <li><a class="ajaxifyPage" href="obtener_info_fav?pagina=1" onclick="setTimeout(location.reload.bind(location), 1)">
            		<i class="icon icon-star s-24"></i> <span>Mis favoritos</span>
            	</a>
            </li>
        </ul>
    </div>
</aside>
<!-- ACABA MENU DE LA IZQUIERDA-->




<svg class="d-none">
    <defs>
        <symbol id="icon-cross" viewBox="0 0 24 24">
            <title>cross</title>
            <path
                    d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
            />
        </symbol>
    </defs>
</svg>

<!-- BUSCADOR (LUPA) -->
<div class="searchOverlay page">
    <button
            id="btn-searchOverlay-close"
            class="btn btn--searchOverlay-close"
            aria-label="Close searchOverlay form"
    >
        <svg class="icon icon--cross">
            <use xlink:href="#icon-cross"></use>
        </svg>
    </button>
    <div class="searchOverlay__inner  searchOverlay__inner--up">
        <form class="searchOverlay__form" action="Buscar" method="post">
            <input
                    class="searchOverlay__input"
                    name="nombre"
                    type="text"
                    placeholder="Search"
                    autocomplete="off"
                    spellcheck="false"
                    required
            />
            <span class="searchOverlay__info">Enter para buscar, esc  para cancelar</span>
        </form>
    </div>
    
</div>
<!-- ACABA BUSCADOR (LUPA) -->


<%
String hayfoto = (String) session.getAttribute("hayfoto");
String imagen = (String) session.getAttribute("imagen");
String like = (String) request.getAttribute("like");
%>

<!-- BARRA DE ARRIBA FIJA -->
<nav class="navbar-wrapper shadow">
    <div class="navbar navbar-expand player-header justify-content-between  bd-navbar">
        <div class="d-flex align-items-center">
            <a href="#" data-toggle="push-menu" class="paper-nav-toggle pp-nav-toggle ml-2 mr-2">
                <i></i>
            </a>
            <a class="navbar-brand d-none d-lg-block" href="Inicio?pagina=10" >
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="Inicio?pagina=0" onclick="setTimeout(location.reload.bind(location), 1)"><img  src="assets/img/logo.png"></a>
                </div>
            </a>
        </div>
        
        <!--Top Menu Start -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">

				<!-- Right Sidebar Toggle Button -->
				<li class="searchOverlay-wrap">
					<a href="#" id="btn-searchOverlay" class="nav-link mr-3 btn--searchOverlay no-ajaxy">
						<i class="icon icon-search s-24"></i>
					</a>

				</li>
				<!-- User Account-->
				<li class="dropdown custom-dropdown user user-menu ">
					<a href="#" class="nav-link" data-toggle="dropdown">
						<figure class="avatar">
							<%if (hayfoto!=null){ %>
								<img src=<%=imagen %>>	                    	
							<%} else {%>
	                    		<img src="assets/img/fondo1.jpg">
	                    	<%} %>
						</figure>
						<i class="icon-more_vert "></i>
					</a>
					<div class="dropdown-menu p-4 dropdown-menu-right">
						<div class="row box justify-content-between my-4">
							<div class="col text-center">
								<a class="ajaxifyPage" href="obtener_contenido_perfil?pagina=4" onclick="setTimeout(location.reload.bind(location), 1)">
									<i class="icon-user-4  s-24"></i>
									<div class="pt-1">Mi perfil</div>
								</a>
							</div>
							<div class="col text-center">
								<a class="ajaxifyPage" onclick="document.getElementById('overlay-cerrar-sesion').classList.add('active');" href="#" >
									<i class="icon-exit-2  s-24"></i>
                                    <div class="pt-1">Cerrar sesión</div>
								</a>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- ACABA BARRA DE ARRIBA FIJA -->


<!-- BARRA DE ABAJO FIJA-->
<nav class="navbar-wrapper navbar-bottom-fixed shadow">
    <div class="navbar navbar-expand player-header justify-content-between  bd-navbar">
        <!--Player-->
        <div id="mediaPlayer" class="player-bar col-lg-8 col-md-5" data-auto="true">
            <div style="height: 50px;width: 157%;" class="row align-items-center grid">
            <!-- BOTONES ANTERIOR, PAUSE, SIGUIENTE -->
                <div class="col">
                    <div class="d-flex align-items-center">
                        <button id="shuffleTrack" class="btn btn-link d-none d-sm-block">
                            <i class="icon-shuffle s-18"></i>
                        </button>
                        <button id="previousTrack" class="btn btn-link d-none d-sm-block">
                            <i class="icon-back s-18"></i>
                        </button>
                        <button class=" btn btn-link" id="playPause">
                            <span id="play" style=""><i class="icon-play s-36"></i></span>
                            <span id="pause" style="display: none;"><i class="icon-pause s-36 text-primary"></i></span>
                        </button>
                        <button id="nextTrack" class="btn btn-link d-none d-sm-block">
                            <i class="icon-next s-18"></i>
                        </button>
                        <button class="btn btn-link" onclick="loopAudio();">
                            <i class="icon-repeat s-18"></i>
                        </button>
                    </div>
                </div>
                
                <div class="col-8 d-none d-lg-block">
                    <div id="waveform" style="background-color: hsla(30.6, 92.7%, 78.4%, 0.38);border-radius: 10px;"></div>
                </div>
                
                <!-- TIEMPO -->
                <div class="col d-none d-lg-block">
                    <small class="track-time mr-2 text-primary align-middle"></small>
                </div> 
                
                <button class="btn btn-link d-none d-sm-block" style="position: fixed;right: 78px;" onclick="muteVol();">
                    <i class="icon-mute s-18"></i>
                </button>
                <button class="btn btn-link d-none d-sm-block" style="position: fixed;right: 49px;" onclick="bajarVol();">
                    <i class="icon-volume-down s-18"></i>
                </button>
                <button class="btn btn-link d-none d-sm-block" style="position: fixed;right: 14px;" onclick="subirVol();">
                    <i class="icon-volume-up s-18"></i>
                </button>
            </div>
        </div>
        <!--END Player-->
    </div>
</nav>
<!-- ACABA BARRA DE ABAJO -->

<!--  
########################################################################
############### ACABA BASE DE TODAS LAS PAGINAS    #####################
########################################################################
-->
<!--Page Content-->
<main id="pageContent" class="page has-sidebar">
<div class="container-fluid relative animatedParent animateOnce p-lg-5">
    <div class="card no-b shadow no-r">
        <div class="row no-gutters">
            <div class="col-md-4 b-r">
                <div class="text-center p-5 mt-5">
                    <figure class="avatar avatar-xl">
                        <img src=${usuario.getImagen() } alt=""></figure>
                    <div>
                        <h4 class="p-t-10">${usuario.getNombre()}</h4>
                    </div>
                    <h3>${transmision.getNombre()}</h3>
					<h6>${transmision.getDescripcion()}</h6>
					<div>
						<h6 >LIKES</h6>
						<label id='transmisionNumLikes'>${transmision.getNumLikes() }</label>
					</div>
                   <ul id="transmision" class="playlist list-group">
                   	<li class="list-group-item my-1">
              			<div class="d-flex align-items-center">
							<div class="col-1">
								<a class="no-ajaxy media-url" href="${transmision.getUrl()}">
									<i class="icon-play s-28"></i>
								</a>					
							</div>
							<div class="col-6">
								<form action="like_transmision">
	                                  <input type="hidden" id="idTransmisionLike" name="idTransmisionLike" value="${transmision.getId()}">
	                                  <input type="hidden" id="likeTransmision" name="likeTransmision" value="">
	                                 <%if(like == null){%>
		                                  <a href="#" id="accion_like_transmision" class="btn-favorito"  
		                                  	data-text="Te gusta esta canción"
										   data-pos="top-right"
										   data-showAction="true"
										   data-actionText="ok"
										   data-actionTextColor="#fff"
										   data-backgroundColor="#0c101b">
										   <i onclick="if(this.className == 'icon-thumbs-up s-24'){this.className='icon-thumbs-o-up s-24';document.getElementById('likeTransmision').value ='true';} else{this.className='icon-thumbs-up s-24';document.getElementById('likeTransmision').value ='false';}"
											   class="icon-thumbs-o-up s-24"></i>
										</a>
	                                 <%}else{ %>
		                                  <a href="#" id="accion_like_transmision" class="btn-favorito"
		                                     data-text="Ya no te gusta este directo"
										   data-pos="top-right"
										   data-showAction="true"
										   data-actionText="ok"
										   data-actionTextColor="#fff"
										   data-backgroundColor="#0c101b">
										   <i onclick="if(this.className == 'icon-thumbs-up s-24'){this.className='icon-thumbs-o-up s-24';document.getElementById('likeTransmision').value ='true';} else{this.className='icon-thumbs-up s-24';document.getElementById('likeTransmision').value ='false';}"
										   class="icon-thumbs-up s-24"></i>
									</a>
									<%} %>
								</form>
							</div>
							<span class="ml-auto">${transmision.getActiva()}</span>
						</div>
                   	</li>
                   </ul>
                </div>
            </div>
			
            <!-- COMENTARIOS -->
			<div class="col-md-8">
				<div class="p5 b-b">
					<div class="p-4" style="height: 472px;">
						<div class="sidebar-header" style="margin-bottom: 1rem !important;">
				            <h4><b>Comentarios</b></h4>
				        </div>
				        
						<div class="slimScroll" style="overflow: hidden; width: auto; height: 285px;">
					        <div class="p-3">
					        	<div id="listaComentariosTransmision"></div> <!-- DONDE SE MUESTRAN LOS COMENTARIOS -->
					        </div>
					    </div>
					    <form action="anyadir_coment_transmision" style="position: absolute;top: 378px;">
							<div class="row">
				                 <div class="col-lg-12">
				                     <div class="form-group">
				                         <div class="form-line" style="display: inline-block;width: auto;margin: auto;text-align: left;padding: 20px, 20px;">
				                               <textarea id="textarea" style="color: black;height: 43px;display: inline-block;width: auto;margin: auto;text-align: left;width: 546px;" rows="5" class="form-control r-0" placeholder="Escribir comentario..."></textarea>
				                               <a id="publicar" href="#" class="btn btn-primary" style="border-radius: 7px;position: relative;
				                               			display: inline-block;width: auto;margin: auto;text-align: left;top: -13px;left: 24px;">Publicar</a>
				                         </div>
				                     </div>
				
				                 </div>
				             </div>
				             <input type="hidden" id="transmIDcomment" name="nombre" value="${transmision.getId()}">
			             </form>
					</div>
				</div>
			</div>
			<!-- COMENTARIOS -->
        </div>
    </div>

</div>

<!-- CERRAR SESIÓN -->	
	<div class="overlay-pop-up" id="overlay-cerrar-sesion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-sesion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-cerrar-sesion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_coment_cancion">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>Vas a cerrar tu sesión.</h3>
	                    <h5>¿Estás seguro?</h5>	
					</header>	
		
					<a href="<%= request.getContextPath()+"/Cerrar_SesionServlet"%>" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END CERRAR SESIÓN -->



</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>

<script>
$(document).ready(function() {
        $('#accion_like_transmision').click(function(event) { // dar like a transmision
            var transmsionId = $('#idTransmisionLike').val();
            var like = $('#likeTransmision').val();
            console.log(like);
            console.log(transmsionId);
            $.get('like_transmision', {
                    idTransmision : transmsionId,
                    like : like
            }, function(){
            	$.get('obtener_num_likes',{
					tipo : "Transmision",
					idLike : transmsionId
				}, function(data){
					$('#transmisionNumLikes').text(data);
				});
			});
        });
});
</script>

<script>
    $(document).ready(function() {
    	setTimeout(recargar,10000);
    	$(".slimScroll").slimscroll({
			height: "285px"
		});
		var audioId = $('#transmIDcomment').val();
		console.log(audioId);
		$.get('getall_coment_transmision', {
			idTransmision: audioId
		}, function(data){
			$('#listaComentariosTransmision').html(data);
		});
		
    	$('#publicar').click(function(event) { // publicar comentario
			var textarea = $('#textarea').val();
			var audioId = $('#transmIDcomment').val();
			var idUsuarioVar = <%=session.getAttribute("id")%>;
			console.log(textarea);
			console.log(audioId);
			console.log(idUsuarioVar);
			if(textarea != ""){
				$.get('anyadir_coment_transm', {
					descripcion : textarea,
					idUsuario : idUsuarioVar,
					idTransmision: audioId
				}, function(){
					document.getElementById('textarea').value="";
					$('.playlist a').ready(function(event) { // cargar los comentarios
						var audioId = $('#transmIDcomment').val();
						console.log(audioId);
						$.get('getall_coment_transmision', {
							idTransmision: audioId
						}, function(data){
							$('#listaComentariosTransmision').html(data);
						});
					});
				});
			}
		});
    });
    </script>
<script>
function recargar(){
	var audioId = $('#transmIDcomment').val();
		console.log(audioId);
		$.get('getall_coment_transmision', {
			idTransmision: audioId
		}, function(data){
			$('#listaComentariosTransmision').html(data);
		});
		setTimeout(recargar,10000);
}
	function loopAudio(){
		var audio = document.getElementsByTagName("audio")[0];
		if(audio.loop){
			audio.loop = false;
		}else{
			audio.loop = true;
		}
		//audio.load();
	}
	
	function subirVol(){
		var audio = document.getElementsByTagName("audio")[0];
		audio.volume+=0.1;
	}
	
	function bajarVol(){
		var audio = document.getElementsByTagName("audio")[0];
		audio.volume-=0.1;
	}
	
	function muteVol(){
		var audio = document.getElementsByTagName("audio")[0];
		if(audio.muted){
			audio.muted = false;
		}else{
			audio.muted = true;
		}
	}
	</script>

</body>
</html>