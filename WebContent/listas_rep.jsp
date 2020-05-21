
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
    <title>Espotify - Mis Listas</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
</head>

<body id="todo" background="assets/img/fondo3.png" style="background-size: cover;background-repeat: no-repeat; background-position: center center;background-attachment: fixed;" class="sidebar-mini sidebar-collapse sidebar-expanded-on-hover has-preloader" style="display: none;">
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
						<li><a href="page-blank.jsp" >${genero.getNombre()}</a></li>
	                </c:forEach>

                </ul>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_lrs?tipo=ListaRep&pagina=<%=pagina %>" >
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis listas de reproduccion</span>
                </a>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_podcasts?tipo=podcasts&pagina=<%=pagina %>" >
                    <i class="icon icon-headphones s-24"></i> <span>Mis podcasts</span>
                </a>
            </li>
            <li><a class="ajaxifyPage" href="obtener_info_fav?pagina=<%=pagina %>" >
            		<i class="icon icon-star s-24"></i> <span>Mis favoritos</span>
            	</a>
            </li>
        </ul>
    </div>
</aside>
<!-- ACABA MENU DE LA IZQUIERDA-->

<!-- MENU DONDE ESTAN LAS CANCIONES EN LA COLA (DERECHA) -->
<aside class="control-sidebar fixed ">
    <div class="slimScroll">
        <div class="sidebar-header">
            <h4>PlayList</h4>
            <p>Awesome Collection for you</p>
            <a href="#" data-toggle="control-sidebar" class="paper-nav-toggle  active"><i></i></a>
        </div>
        <div class="p-3">
            <ul id="playlist" class="playlist list-group">
                <li class="list-group-item my-1">
                    <a class="no-ajaxy media-url" href="http://34.69.44.48/almacen-mp3/13.mp3" data-wave="http://34.69.44.48/almacen-mp3/13.mp3">
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="icon-play s-28"></i>
                            <figure class="avatar-md float-left mr-3 mt-1">
                                <img class="r-5" src="assets/img/demo/a1.jpg" alt="">
                            </figure>
                            <div>
                                <h6>alexander Pierce</h6>Atif Aslam
                            </div>
                            <span class="badge badge-primary badge-pill"> 5:03</span>
                        </div>
                    </a>
                </li>
                <li class="list-group-item my-1">
                    <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="icon-play s-28"></i>
                            <figure class="avatar-md float-left mr-3 mt-1">
                                <img class="r-5" src="assets/img/demo/a2.jpg" alt="">
                            </figure>
                            <div>
                                <h6>alexander Pierce</h6>Atif Aslam
                            </div>
                            <span class="badge badge-primary badge-pill"> 5:03</span>
                        </div>
                    </a>
                </li>
                <li class="list-group-item my-1">
                    <a class="no-ajaxy media-url" href="assets/media/track3.mp3" data-wave="assets/media/track3.json">
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="icon-play s-28"></i>
                            <figure class="avatar-md float-left mr-3 mt-1">
                                <img class="r-5" src="assets/img/demo/a4.jpg" alt="">
                            </figure>
                            <div>
                                <h6>alexander Pierce</h6>Atif Aslam
                            </div>
                            <span class="badge badge-primary badge-pill"> 5:03</span>
                        </div>
                    </a>
                </li>

                <li class="list-group-item my-1">
                    <a class="no-ajaxy media-url" href="assets/media/track1.mp3"  data-wave="assets/media/track1.json">
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="icon-play s-28"></i>
                            <figure class="avatar-md float-left mr-3 mt-1">
                                <img class="r-5" src="assets/img/demo/a5.jpg" alt="">
                            </figure>
                            <div>
                                <h6>alexander Pierce</h6>Atif Aslam
                            </div>
                            <span class="badge badge-primary badge-pill"> 5:03</span>
                        </div>
                    </a>
                </li>

                <li class="list-group-item my-1">
                    <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                        <div class="d-flex justify-content-between align-items-center">
                            <i class="icon-play s-28"></i>
                            <figure class="avatar-md float-left mr-3 mt-1">
                                <img class="r-5" src="assets/img/demo/a6.jpg" alt="">
                            </figure>
                            <div>
                                <h6>alexander Pierce</h6>Atif Aslam
                            </div>
                            <span class="badge badge-primary badge-pill"> 5:03</span>
                        </div>
                    </a>
                </li>


            </ul>

        </div>
    </div>
</aside>

<!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
<div class="control-sidebar-bg shadow  fixed"></div>
<!-- ACABA MENU DERECHA -->

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

<div class="container-fluid relative animatedParent animateOnce no-p">
    <div class="animated">
    	 <div class="p-md-5 p-3  ">
            <section class="section">
                <div class="relative mb-5" style="text-align: center;">
                    <div style="background-color:black;">	
                    	<h1 class="mb-2 text-primary" >Listas de Reproduccion</h1>
                    	<p>Todas tus maravillosas listas de reproduccion</p>
                    </div>	
                </div>
                <div class="contenido-pestanas" style="text-align: center;">
						<button class="btn btn-abrir-popup-lista icon-plus" id="abrir-listas-reproduccion"  onClick="document.getElementById('overlay-listas-reproduccion').classList.add('active');">Crear Lista de Reproducción</button>
				</div> 
                <div class="row has-items-overlay">
                	<div class="col-lg-3 col-md-4 col-sm-6 my-2">
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a2.jpg" alt="/">
                                <div class="img-overlay text-white text-center">
                                	<a href="obtener_info_fav?pagina=<%=pagina %>" >
                                        <div class="figcaption mt-3">
                                            <i class="icon-link s-48"></i>
                                            <h5 class="mt-5">Mis Favoritos</h5>
                                            
                                        </div>
                                    </a>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>Mis favoritos</h5>
                                    
                                </div>
                            </div>
                     	</figure>
                    </div>
                    <c:forEach var="lista" items="${listas}" >
							<div class="col-lg-3 col-md-4 col-sm-6 my-2">
								<figure>
									<div class="img-wrapper">
										<img src=${lista.getImagen() } alt="/">
										<div class="img-overlay text-white text-center">
											<a class="ajaxifyPage" href="${pageContext.request.contextPath}/obtener_info_lr?nombre=${lista.getNombre()}&pagina=<%=pagina %>" >
												<div class="figcaption mt-3">
													<i class="icon-link s-48"></i>
													<h5 class="mt-5">${lista.getNombre()}</h5>
												</div>
											</a>
										</div>
										<div class="figure-title text-center p-2">
											<h5>${lista.getNombre()}</h5>
										</div>
									</div>
								</figure>
							<div class="contenido-pestanas" style="text-align: center;">
	                            <button class="btn btn-abrir-popup-lista icon-trash-o" 
	                            onclick="document.getElementById('idLista').value = '${lista.getNombre()}';
	                            document.getElementById('overlay-borrar-listas-reproduccion').classList.add('active');"></button>
                       		 </div>
                    	</div>
					</c:forEach>      
                </div>
            </section>
        </div>
     </div> 
 </div>                   

<!-- CREAR LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"
		onClick="document.getElementById('overlay-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>
		<form class="form-material" action="crear_lr">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR LISTAS DE REPRODUCCIÓN</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>Añadir imagen</h4>
					<!--  <input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" /> -->
					<input type="text" name="nombre" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" name="descripcion" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
					<input type="hidden" name="tipo" id="tipo1" value="ListaRep">
				</div>

				<a id="submit1" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR LISTA DE REPRODUCCIÓN -->




<!-- BORRAR LISTA DE REPRODUCCIÓN -->	
	<div class="overlay-pop-up" id="overlay-borrar-listas-reproduccion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lr">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar esta lista de reproduccion para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idLista" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo2" value="ListaRep">	
					<a id="submit2" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR LISTA DE REPRODUCCIÓN -->

<script>
    $(document).ready(function() {
    	$('#submit1').click(function(event) {
			var idListaVar = $('#nombre-listas-reproduccion').val();
			var descripcionVar = $('#descripcion-listas-reproduccion').val();
			var tipoVar = $('#tipo1').val();
			console.log(idListaVar);
			console.log(tipoVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('crear_lr', {
				nombre : idListaVar,
				tipo : tipoVar,
				descripcion : descripcionVar
			}, function(){
				location.href="mostrar_lrs?tipo=ListaRep&pagina=10";
				//$("#pageContent").load("#pageContent");
				//$("#todo").load("#todo");
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
				location.href="mostrar_lrs?tipo=ListaRep&pagina=10";
				//$("#pageContent").load("#pageContent");
				//$("#todo").load("#todo");
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
	<!-- CREAR LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"
		onClick="document.getElementById('overlay-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>
		<form class="form-material" action="crear_lr">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR LISTAS DE REPRODUCCIÓN</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>Añadir imagen</h4>
					<!--  <input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" /> -->
					<input type="text" name="nombre" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" name="descripcion" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
					<input type="hidden" name="tipo" id="tipo1" value="ListaRep">
				</div>

				<a id="submit1" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR LISTA DE REPRODUCCIÓN -->




<!-- BORRAR LISTA DE REPRODUCCIÓN -->	
	<div class="overlay-pop-up" id="overlay-borrar-listas-reproduccion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lr">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar esta lista de reproduccion para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idLista" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo2" value="ListaRep">	
					<a id="submit2" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR LISTA DE REPRODUCCIÓN -->
<script>
    $(document).ready(function() {
    	$('#submit1').click(function(event) {
			var idListaVar = $('#nombre-listas-reproduccion').val();
			var descripcionVar = $('#descripcion-listas-reproduccion').val();
			var tipoVar = $('#tipo1').val();
			console.log(idListaVar);
			console.log(tipoVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('crear_lr', {
				nombre : idListaVar,
				tipo : tipoVar,
				descripcion : descripcionVar
			}, function(){
				location.href="mostrar_lrs?tipo=ListaRep&pagina=10";
				//$("#pageContent").load("#pageContent");
				//$("#todo").load("#todo");
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
				location.href="mostrar_lrs?tipo=ListaRep&pagina=10";
				//$("#pageContent").load("#pageContent");
				//$("#todo").load("#todo");
			});
		});
    });
    </script>
</body>
</html>