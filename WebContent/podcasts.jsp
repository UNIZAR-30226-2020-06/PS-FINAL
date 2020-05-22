<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html lang="zxx">

<% 
int pagina = Integer.valueOf((String) request.getParameter("pagina"));
%>

<!-- NOMBRE DE LA PESTAÃÂA -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/basic/logo.ico" type="image/x-icon">
    <title>Espotify - Mis Podcasts</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
</head>

<body background="assets/img/fondo3.png" style="background-size: cover;background-repeat: no-repeat; background-position: center center;background-attachment: fixed;" class="sidebar-mini sidebar-collapse sidebar-expanded-on-hover has-preloader" style="display: none;">
<!-- Pre loader
  To disable preloader remove 'has-preloader' from body
 -->

 <div id="loader" class="loader">
    <div class="loader-container">
        <div class="preloader-wrapper big active">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>
        </div>
    </div>
</div>

<!-- @Pre loader-->
<div id="app">

<!--MENU DE LA IZQUIERDA -->
<aside class="main-sidebar fixed offcanvas shadow" data-toggle='offcanvas'>
    <div class="sidebar">
        <ul class="sidebar-menu">
            <li><a class="ajaxifyPage active" href="Inicio?pagina=<%=pagina %>" >
                    <i class="icon icon-home-1 s-24"></i> <span>Inicio</span>
                </a>
            </li>
            
            <li class="menu-item-has-children">
                <a href="#">
                    <i class="icon icon-layers s-24"></i> <span>Categorías</span>
                    <i class=" icon-angle-left  pull-right"></i>
                </a>
                <ul class="sub-menu">
					<c:forEach var="genero" items="${generos}">                    
						<li><a href="obtener_info_gen?idGenero=${genero.getId()}&nombre=${genero.getNombre()}&pagina=10" >${genero.getNombre()}</a></li>
	                </c:forEach>

                </ul>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_lrs?tipo=ListaRep&pagina=<%=pagina %>" >
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis Listas de Reproducción</span>
                </a>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_podcasts?tipo=podcast&pagina=<%=pagina %>" >
                    <i class="icon icon-headphones s-24"></i> <span>Mis podcasts</span>
                </a>
            </li>
            <li><a class="ajaxifyPage" href="obtener_info_fav?pagina=<%=pagina %>" onclick="setTimeout(locaton.reload.bind(location), 1)">
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
%>

<!-- BARRA DE ARRIBA FIJA -->
<nav class="navbar-wrapper shadow">
    <div class="navbar navbar-expand player-header justify-content-between  bd-navbar">
        <div class="d-flex align-items-center">
            <a href="#" data-toggle="push-menu" class="paper-nav-toggle pp-nav-toggle ml-2 mr-2">
                <i></i>
            </a>
            <a class="navbar-brand d-none d-lg-block" href="Inicio?pagina=<%=pagina %>" >
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="Inicio?pagina=<%=pagina %>" ><img  src="assets/img/logo.png"></a>
                </div>
            </a>
        </div>
        
        <!--Top Menu Start -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li id="contenido" style="position: relative;right: 300px;top: 10px;"></li>
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
								<a class="ajaxifyPage" href="obtener_contenido_perfil?pagina=<%=pagina %>" >
									<i class="icon-user-4  s-24"></i>
									<div class="pt-1">Mi perfil</div>
								</a>
							</div>
							<div class="col text-center">
								<a class="ajaxifyPage" href="logout" >
									<a href="<%= request.getContextPath()+"/Cerrar_SesionServlet"%>"><i class="icon-exit-2  s-24"></i>
                                    <div class="pt-1">Cerrar sesión</div></a>
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

<main id="pageContent" class="page has-sidebar">

<div class="container-fluid relative animatedParent animateOnce">
        <div class="animated p-5 ml-lg-5 mr-lg-5">
            <section>
                <div class="relative mb-5" style="text-align: center; background-color:black;">
                    <h1 class="mb-2 text-primary">Podcast</h1>
                    <p>Todos tus Podcasts</p>
                </div>
                <div class="contenido-pestanas" style="text-align: center;">
						<button class="btn btn-abrir-popup-lista icon-plus" id="abrir-podcast"  onClick="document.getElementById('overlay-podcast').classList.add('active');">Crear Podcast</button>
				</div> 
                <div class="row has-items-overlay">
                    <c:forEach var="podcast" items="${podcasts}" >
							<div class="col-lg-3 col-md-4 col-sm-6 my-2">
								<figure>
									<div class="img-wrapper">
										<img src=${podcast.getImagen() } alt="/">
										<div class="img-overlay text-white text-center">
										<!--href="obtener_info_lr?nombre=${lista.getNombre()}"-->
										 	<%if(pagina == 10){ %>
											<a 	 href="obtener_info_podcast?nombre=${podcast.getNombre()}&pagina=5" onclick="setTimeout(location.reload.bind(location), 1)">
												<div class="figcaption mt-3">
													<i class="icon-link s-48"></i>
													<h5 class="mt-5">${podcast.getNombre()}</h5>
												</div>
											</a>
											 <%} else{%>
											 <a 	 href="obtener_info_podcast?nombre=${podcast.getNombre()}&pagina=<%=pagina %>">
												<div class="figcaption mt-3">
													<i class="icon-link s-48"></i>
													<h5 class="mt-5">${podcast.getNombre()}</h5>
												</div>
											</a>
											 <%}%>
										</div>
										<div class="figure-title text-center p-2">
											<h5>${podcast.getNombre()}</h5>
										</div>
									</div>
								</figure>
							<div class="contenido-pestanas" style="text-align: center;">
	                            <button class="btn btn-abrir-popup-lista icon-trash-o" 
	                            onclick="document.getElementById('idLista').value = '${podcast.getNombre()}';
	                            document.getElementById('overlay-borrar-listas-reproduccion').classList.add('active');"></button>
                       		 </div>
                    	</div>
					</c:forEach>      
                </div>
            </section>
        </div>
     </div> 
                    

<!-- CREAR PODCAST-->
<div class="overlay-pop-up" id="overlay-podcast">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-podcast" class="btn-cerrar-popup-perfil" onClick="document.getElementById('overlay-podcast').classList.remove('active');"><i class="icon-close1"></i></a>
		<form class="form-material" action="crear_lr">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR PODCAST</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>Añadir imagen</h4>
					<!--  <input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" /> -->
					<input type="text" name="nombre" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" name="descripcion" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
					<input type="hidden" name="tipo" id="tipo1" value="podcast">
				</div>

				<a id="submit1" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR PODCAST -->




<!-- BORRAR PODCAST -->	
	<div class="overlay-pop-up" id="overlay-borrar-listas-reproduccion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lr">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar esta Podcast para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idLista" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo2" value="podcast">	
					<a id="submit2" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR PODCAST -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>
<script  src="assets/js/mostrar-popup.js"></script>
<script>
    $(document).ready(function() {
    	$('#submit1').click(function(event) {
			var idListaVar = $('#nombre-listas-reproduccion').val();
			var descripcionVar = $('#descripcion-listas-reproduccion').val();
			var tipoVar = $('#tipo1').val();
			console.log(idListaVar);
			console.log(tipoVar);
			console.log(descripcionVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('crear_lr', {
				nombre : idListaVar,
				tipo : tipoVar,
				descripcion : descripcionVar
			}, function(){
				location.href="mostrar_podcasts?tipo=podcasts&pagina=10";
			});
		});
    	$('#submit2').click(function(event) {
			var idListaVar = $('#idLista').val();
			var tipoVar = $('#tipo2').val();
			console.log(idListaVar);
			console.log(tipoVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('borrar_lr', {
				nombre : idListaVar,
				tipo : tipoVar
			}, function(){
				location.href="mostrar_podcasts?tipo=podcasts&pagina=10";
			});
		});
    });
    </script>

</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>
<script  src="assets/js/mostrar-popup.js"></script>
<script>
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
	<!-- CREAR PODCAST-->
<div class="overlay-pop-up" id="overlay-podcast">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-podcast" class="btn-cerrar-popup-perfil" onClick="document.getElementById('overlay-podcast').classList.remove('active');"><i class="icon-close1"></i></a>
		<form class="form-material" action="crear_lr">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR PODCAST</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>Añadir imagen</h4>
					<!--  <input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" /> -->
					<input type="text" name="nombre" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" name="descripcion" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
					<input type="hidden" name="tipo" id="tipo1" value="podcast">
				</div>

				<a id="submit1" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR PODCAST -->




<!-- BORRAR PODCAST -->	
	<div class="overlay-pop-up" id="overlay-borrar-listas-reproduccion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lr">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar esta Podcast para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idLista" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo2" value="podcast">	
					<a id="submit2" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR PODCAST -->

<script>
    $(document).ready(function() {
    	$('#submit1').click(function(event) {
			var idListaVar = $('#nombre-listas-reproduccion').val();
			var descripcionVar = $('#descripcion-listas-reproduccion').val();
			var tipoVar = $('#tipo1').val();
			console.log(idListaVar);
			console.log(tipoVar);
			console.log(descripcionVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('crear_lr', {
				nombre : idListaVar,
				tipo : tipoVar,
				descripcion : descripcionVar
			}, function(){
				location.href="mostrar_podcasts?tipo=podcasts&pagina=10";
			});
		});
    	$('#submit2').click(function(event) {
			var idListaVar = $('#idLista').val();
			var tipoVar = $('#tipo2').val();
			console.log(idListaVar);
			console.log(tipoVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('borrar_lr', {
				nombre : idListaVar,
				tipo : tipoVar
			}, function(){
				location.href="mostrar_podcasts?tipo=podcasts&pagina=10";
			});
		});
    });
    </script>
</body>
</html>