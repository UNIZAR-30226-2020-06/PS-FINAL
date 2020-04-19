
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html lang="zxx">

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

<body background="assets/img/fondo.png" style="background-size: cover;background-repeat: no-repeat; background-position: center center;background-attachment: fixed;" class="sidebar-mini sidebar-collapse sidebar-expanded-on-hover has-preloader" style="display: none;">
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
            <li><a class="ajaxifyPage active" href="index.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
                    <i class="icon icon-home-1 s-24"></i> <span>Inicio</span>
                </a>
            </li>
            
            <li class="menu-item-has-children">
                <a href="#">
                    <i class="icon icon-layers s-24"></i> <span>CategorÃÂ­as</span>
                    <i class=" icon-angle-left  pull-right"></i>
                </a>
                <ul class="sub-menu">
					<c:forEach var="genero" items="${generos}">                    
						<li><a href="page-blank.jsp" onclick="setTimeout(location.reload.bind(location), 1)">${genero.getNombre()}</a></li>
	                </c:forEach>

                </ul>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_lrs" onclick="setTimeout(location.reload.bind(location), 1)">
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis listas de reproduccion</span>
                </a>
            </li>
            
            <li><a class="ajaxifyPage" href="blog.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
                    <i class="icon icon-headphones s-24"></i> <span>Mis podcasts</span>
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
        <form class="searchOverlay__form" action="https://xvelopers.com/demos/html/record-light/index.jsp">
            <input
                    class="searchOverlay__input"
                    name="searchOverlay"
                    type="text"
                    placeholder="Search"
                    autocomplete="off"
                    spellcheck="false"
            />
            <span class="searchOverlay__info">Hit enter to searchOverlay or ESC to close</span>
        </form>
    </div>
    <div class="searchOverlay__inner searchOverlay__inner--down">
        <div class="searchOverlay__related">
            <div class="searchOverlay__suggestion">
                <div class="card mb-3">
                    <div class="card-header transparent b-b">
                        <strong>New Artists</strong>
                    </div>
                    <ul class="playlist list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="d-flex align-items-center">
                                <div class="col-10">
                                    <figure class="avatar avatar-md float-left  mr-3 mt-1">
                                        <img src="assets/img/demo/u1.jpg" alt="">
                                    </figure>
                                    <h6>Zoe Foe</h6>
                                    <small>5 Albums - 50 Songs</small>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-more"></i></a>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex align-items-center">
                                <div class="col-10">
                                    <figure class="avatar avatar-md float-left  mr-3 mt-1">
                                        <img src="assets/img/demo/u2.jpg" alt="">
                                    </figure>
                                    <h6>Zoe Foe</h6>
                                    <small>5 Albums - 50 Songs</small>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-more"></i></a>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex align-items-center">
                                <div class="col-10">
                                    <figure class="avatar avatar-md float-left  mr-3 mt-1">
                                        <img src="assets/img/demo/u3.jpg" alt="">
                                    </figure>
                                    <h6>Zoe Foe</h6>
                                    <small>5 Albums - 50 Songs</small>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-more"></i></a>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex align-items-center">
                                <div class="col-10">
                                    <figure class="avatar avatar-md float-left  mr-3 mt-1">
                                        <img src="assets/img/demo/u6.jpg" alt="">
                                    </figure>
                                    <h6>Zoe Foe</h6>
                                    <small>5 Albums - 50 Songs</small>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-more"></i></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="searchOverlay__suggestion">
                <div class="card mb-3">
                    <div class="card-header transparent b-b">
                        <strong>Events</strong>
                    </div>
                    <ul class="playlist list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="d-flex align-items-center ">
                                <div class="col-8 ">
                                    <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
                                        <h6>Battal of Bands</h6>
                                    </a>
                                    <small class="mt-1"><i class="icon-placeholder-3 mr-1 "></i> London Music Hall
                                    </small>
                                </div>
                                <div class="ml-auto">
                                    <div class="text-lg-center  bg-primary r-10 p-2 text-white primary-bg">
                                        <div class="s-18">24</div>
                                        <small>July, 2019</small>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex align-items-center ">
                                <div class="col-8 ">
                                    <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
                                        <h6>Battal of Bands</h6>
                                    </a>
                                    <small class="mt-1"><i class="icon-placeholder-3 mr-1 "></i> London Music Hall
                                    </small>
                                </div>
                                <div class="ml-auto">
                                    <div class="text-lg-center  bg-primary r-10 p-2 text-white primary-bg">
                                        <div class="s-18">08</div>
                                        <small>July, 2019</small>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex align-items-center ">
                                <div class="col-8 ">
                                    <a href="album-single.jsp">
                                        <h6>Battal of Bands</h6>
                                    </a>
                                    <small class="mt-1"><i class="icon-placeholder-3 mr-1 "></i> London Music Hall
                                    </small>
                                </div>
                                <div class="ml-auto">
                                    <div class="text-lg-center  bg-primary r-10 p-2 text-white primary-bg">
                                        <div class="s-18">12</div>
                                        <small>July, 2019</small>
                                    </div>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- BARRA DE ARRIBA FIJA -->
<nav class="navbar-wrapper shadow">
    <div class="navbar navbar-expand player-header justify-content-between  bd-navbar">
        <div class="d-flex align-items-center">
            <a href="#" data-toggle="push-menu" class="paper-nav-toggle pp-nav-toggle ml-2 mr-2">
                <i></i>
            </a>
            <a class="navbar-brand d-none d-lg-block" href="index.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="index.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><img  src="assets/img/logo.png"></a>
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
                    <img src="assets/img/demo/u7.png" alt="">
                </figure>
                <i class="icon-more_vert "></i>
            </a>
            <div class="dropdown-menu p-4 dropdown-menu-right">
                <div class="row box justify-content-between my-4">
                    <div class="col text-center">
                        <a class="ajaxifyPage" href="obtener_contenido_perfil" onclick="setTimeout(location.reload.bind(location), 1)">
                            <i class="icon-user-4  s-24"></i>
                            <div class="pt-1">Mi perfil</div>
                        </a>
                    </div>
                    <div class="col text-center">
                        <a class="ajaxifyPage" href="logout">
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
            <div style="height: 50px;width: 150%;" class="row align-items-center grid">
			<!-- BOTONES ANTERIOR, PAUSE, SIGUIENTE -->
                <div class="col">
                    <div class="d-flex align-items-center">

						<button id="shuffleTrack" class="btn btn-link d-none d-sm-block">
                            <i class="icon-shuffle s-18"></i>
                        </button>
                        <button id="previousTrack" class="btn btn-link d-none d-sm-block">

                        <button id="previousTrack" class="btn btn-link d-none d-sm-block" onclick="playlist.prevTrack();">

                            <i class="icon-back s-18"></i>
                        </button>

						<audio src="" class="reproductor" controls id="audioPlayer" >
							Sorry, your browser doesn't support html5!
						</audio>
						
						<button class="btn btn-link" id="playPause">
							<span id="play"><i class="icon-play s-36"></i></span>
							<span id="pause" style="display: none"><i class="icon-pause s-36 text-primary"></i></span>
						</button>
                        <button id="nextTrack" class="btn btn-link d-none d-sm-block" onclick="playlist.nextTrack();">
                            <i class="icon-next s-18"></i>
                        </button>
						<button id="loopTrack" class="btn btn-link d-none d-sm-block">
                            <i class="icon-repeat s-18"></i>
                        </button>
                    </div>
                </div>
				
				<!-- ONDA -->
				<div class="col-8 d-none d-lg-block">
					<div id="waveform">
						<wave style="display: block; position: relative; user-select: none; height: 50px; overflow: auto hidden;">
							<wave style="position: absolute; z-index: 3; left: 0px; top: 0px; bottom: 0px; overflow: hidden; width: 135px; display: block; box-sizing: border-box; border-right: 1px solid rgb(51, 51, 51); pointer-events: none;">
								<canvas style="position: absolute; left: 0px; top: 0px; bottom: 0px; height: 100%; width: 804px;" width="804" height="50"></canvas>
							</wave>
							<canvas style="position: absolute; z-index: 2; left: 0px; top: 0px; bottom: 0px; height: 100%; pointer-events: none; width: 804px;" width="804" height="50"></canvas>
						</wave>
						<audio preload="auto" src="estopa.mp3" style="width: 100%;"></audio>
					</div>
				</div>
                
				
				<!-- COLA -->
                <div class="col d-none d-lg-block">
                    <small class="track-time mr-2 text-primary align-middle"></small>
                    <a data-toggle="control-sidebar">
                        <i class="icon icon-menu-3 s-24 align-middle"></i>Cola
                    </a>
                </div>
				
            </div>

        </div>
        <!--END Player-->
    </div>

</nav>
<!-- ACABA BARRA DE ABAJO -->

<main id="pageContent" class="page has-sidebar">

<div class="container-fluid relative animatedParent animateOnce">
        <div class="animated fadeInUpShort p-5 ml-lg-5 mr-lg-5">
            <section>
                <div class="relative mb-5" style="text-align: center;">
                    <h1 class="mb-2 text-primary">Lista de Reproduccion</h1>
                    <p>Todas tus maravillosas listas de reproduccion</p>
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
                                    <a href="obtener_info_fav" onclick="setTimeout(location.reload.bind(location), 1)">
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
										<img src="assets/img/demo/a1.jpg" alt="/">
										<div class="img-overlay text-white text-center">
											<a href="obtener_info_lr?nombre=${lista.getNombre()}" onclick="setTimeout(location.reload.bind(location), 1)">
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
                    

<!-- CREAR LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="crear_lr" method="post">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR LISTAS DE REPRODUCCIÓN</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>Añadir imagen</h4>
					<!--  <input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" /> -->
					<input type="text" name="nombre" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" name="descipcion" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
					<input type="hidden" name="tipo" value="ListaRep">
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
					   value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR LISTA DE REPRODUCCIÓN -->


<!-- AJUSTES CUENTA -->
<div class="overlay-pop-up" id="overlay-cuenta">
    <div class="col-md-7 card p-5">
		<form class="form-material" action="#">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-cuenta" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
				<h3>CAMBIAR INFORMACIÃÂN DE LA CUENTA</h3>
			</header>
			<form class="form-material" action="#"> <!--QUITAR-->
				<!-- Input -->
				<div class="body">
					
					<div class="form-group form-float">
						<div class="form-line">
							<input type="email" name="email" class="form-control">
							<label class="form-label">Email</label>
						</div>
					</div>
					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar email">
				</div>
			</form>
			<form class="form-material" action="#"> <!--QUITAR-->
				<!-- Input -->
				<div class="body">
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena" class="form-control">
							<label class="form-label">ContraseÃÂ±a actual</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena" class="form-control">
							<label class="form-label">ContraseÃÂ±a nueva</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="password" class="form-control">
							<label class="form-label">Confirmar contraseÃÂ±a</label>
						</div>
					</div>

					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar constraseÃÂ±a">
				</div>
			</form>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END AJUSTES CUENTA -->

<!-- BORRAR LISTA DE REPRODUCCIÓN -->	
	<div class="overlay-pop-up" id="overlay-borrar-listas-reproduccion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lr" method="post">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar esta lista de reproduccion para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idLista" name="nombre" value="">
					<input type="hidden" name="tipo" value="ListaRep">	
					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"	
	                       value="Aceptar">	
	                <button class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');">Cerrar</button>	
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR LISTA DE REPRODUCCIÓN -->


</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>
<script  src="assets/js/mostrar-popup.js"></script>
<script  src="assets/js/cambiarPestanaPerfil.js"></script>
<script  src="assets/js/audioPlayer.js"></script>
 <script src="https://code.jquery.com/jquery-2.2.0.js"></script>
    <script>
        
        /*
    Default constructor configuration:
        autoplay: false,
        shuffle: false,
        loop: false,
        playerId: "audioPlayer",
        playlistId: "playlist",
        currentClass: "current-song"
        
        
*/
        
        // loads the audio player
        var config = {
          autoplay: true, 
            loop: true,
            shuffle: true
        };
        var playlist = new AudioPlaylist();
        
    </script>
</body>
</html>