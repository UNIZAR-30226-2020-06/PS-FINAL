<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from xvelopers.com/demos/html/record-light/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 05 Apr 2020 17:21:29 GMT -->

<!--  
########################################################################
############### BASE DE TODAS LAS PAGINAS    ###########################
########################################################################
-->

<!-- NOMBRE DE LA PESTAÃÂA -->
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
                    <i class="icon icon-layers s-24"></i> <span>Categorías</span>
                    <i class=" icon-angle-left  pull-right"></i>
                </a>
                <ul class="sub-menu">
					<c:forEach var="genero" items="${generos}">                    
						<li><a href="page-blank.jsp" onclick="setTimeout(location.reload.bind(location), 1)">${genero.getNombre()}</a></li>
	                </c:forEach>

                </ul>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_lrs" onclick="setTimeout(location.reload.bind(location), 1)">
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis listas de reproducción</span>
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
                    <a class="no-ajaxy media-url" href="https://espotify.ddns.net/almacen-mp3/23.mp3"  data-wave="assets/media/track1.json">
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
                                    <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
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
<!-- ACABA BUSCADOR (LUPA) -->


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
								<a class="ajaxifyPage" href="logout" onclick="setTimeout(location.reload.bind(location), 1)">
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
            <div style="height: 50px;width: 150%;" class="row align-items-center grid">
			<!-- BOTONES ANTERIOR, PAUSE, SIGUIENTE -->
                <div class="col">
                    <div class="d-flex align-items-center">
						<button id="shuffleTrack" class="btn btn-link d-none d-sm-block">
                            <i class="icon-shuffle s-18"></i>
                        </button>
                        <button id="previousTrack" class="btn btn-link d-none d-sm-block" onclick="playlist.prevTrack();">
							<i class="icon-back s-18"></i>
                        </button>
                        <audio src="" class="reproductor" controls id="audioPlayer" >
							Sorry, your browser doesn't support html5!
						</audio>
                        <button id="nextTrack" class="btn btn-link d-none d-sm-block" onclick="playlist.nextTrack();">
                            <i class="icon-next s-18"></i>
                        </button>
						<button id="loopTrack" class="btn btn-link d-none d-sm-block">
                            <i class="icon-repeat s-18"></i>
                        </button>
                    </div>
                </div>
				
                <!-- COLA -->
                <div class="col d-none d-lg-block">
                    <small class="track-time mr-2 text-primary align-middle"></small>
                    <a style="position: absolute;top: -5px;right: 50px;" data-toggle="control-sidebar">
                        <i class="icon icon-menu-3 s-24 align-middle"></i>Cola
                    </a>
                </div>	
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




<!--CONTENIDO DE EN MEDIO-->
<main id="pageContent" class="page has-sidebar">
<div class="container-fluid relative animatedParent animateOnce no-p">
    <div class="animated fadeInUpShort">
        <!--Banner Slider-->
       
        <!--@Banner Slider-->
        <div class="p-md-5 p-3  ">
            <!--New Releases-->
            <section class="section">
                <div class="d-flex relative align-items-center justify-content-between">
                    <div class="mb-4">
                        <h4>Tus Listas de reproduccion</h4>
                    </div>
                    <a href="mostrar_lrs?tipo=ListaRep" onclick="setTimeout(location.reload.bind(location), 1)">View Albums<i class="icon-angle-right ml-3"></i></a>
                </div>
                <div class="lightSlider has-items-overlay playlist"
                     data-item="6"
                     data-item-lg="3"
                     data-item-md="3"
                     data-item-sm="2"
                     data-auto="false"
                     data-pager="false"
                     data-controls="true"
                     data-loop="false">
                    <div>
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a8.jpg" alt="/">
                                <div class="img-overlay text-white">
                                    <div class="figcaption">
                                        <ul class="list-inline d-flex align-items-center justify-content-between">
                                            <li class="list-inline-item">
                                                <a href="#" class="snackbar" data-text="Added to favourites"
                                                   data-pos="top-right"
                                                   data-showAction="true"
                                                   data-actionText="ok"
                                                   data-actionTextColor="#fff"
                                                   data-backgroundColor="#0c101b">
                                                    <i class="icon-heart-o s-18"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item ">
                                                <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                    <i class="icon-play s-48"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><i
                                                        class="icon-more s-18 pt-3"></i></a></li>
                                        </ul>
                                        <div class="text-center mt-5">
                                            <h5>To Phir Ao</h5>
                                            <span>Joe Doe</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>To Phir Ao</h5>
                                    <span>Joe Doe</span>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div>
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a1.jpg" alt="/">
                                <div class="img-overlay text-white">
                                    <div class="figcaption">
                                        <ul class="list-inline d-flex align-items-center justify-content-between">
                                            <li class="list-inline-item">
                                                <a href="#" class="snackbar" data-text="Added to favourites"
                                                   data-pos="top-right"
                                                   data-showAction="true"
                                                   data-actionText="ok"
                                                   data-actionTextColor="#fff"
                                                   data-backgroundColor="#0c101b">
                                                    <i class="icon-heart-o s-18"></i>
                                                </a></li>
                                            <li class="list-inline-item ">
                                                <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                    <i class="icon-play s-48"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><i
                                                        class="icon-more s-18 pt-3"></i></a></li>
                                        </ul>
                                        <div class="text-center mt-5">
                                            <h5>To Phir Ao</h5>
                                            <span>Joe Doe</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>To Phir Ao</h5>
                                    <span>Joe Doe</span>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div>
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a2.jpg" alt="/">
                                <div class="img-overlay text-white">
                                    <div class="figcaption">
                                        <ul class="list-inline d-flex align-items-center justify-content-between">
                                            <li class="list-inline-item">
                                                <a href="#" class="snackbar" data-text="Added to favourites"
                                                   data-pos="top-right"
                                                   data-showAction="true"
                                                   data-actionText="ok"
                                                   data-actionTextColor="#fff"
                                                   data-backgroundColor="#0c101b">
                                                    <i class="icon-heart-o s-18"></i>
                                                </a></li>
                                            <li class="list-inline-item ">
                                                <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                    <i class="icon-play s-48"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><i
                                                        class="icon-more s-18 pt-3"></i></a></li>
                                        </ul>
                                        <div class="text-center mt-5">
                                            <h5>To Phir Ao</h5>
                                            <span>Joe Doe</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>To Phir Ao</h5>
                                    <span>Joe Doe</span>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div>
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a4.jpg" alt="/">
                                <div class="img-overlay text-white">
                                    <div class="figcaption">
                                        <ul class="list-inline d-flex align-items-center justify-content-between">
                                            <li class="list-inline-item">
                                                <a href="#" class="snackbar" data-text="Added to favourites"
                                                   data-pos="top-right"
                                                   data-showAction="true"
                                                   data-actionText="ok"
                                                   data-actionTextColor="#fff"
                                                   data-backgroundColor="#0c101b">
                                                    <i class="icon-heart-o s-18"></i>
                                                </a></li>
                                            <li class="list-inline-item ">
                                                <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                    <i class="icon-play s-48"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><i
                                                        class="icon-more s-18 pt-3"></i></a></li>
                                        </ul>
                                        <div class="text-center mt-5">
                                            <h5>To Phir Ao</h5>
                                            <span>Joe Doe</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>To Phir Ao</h5>
                                    <span>Joe Doe</span>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div>
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a5.jpg" alt="/">
                                <div class="img-overlay text-white">
                                    <div class="figcaption">
                                        <ul class="list-inline d-flex align-items-center justify-content-between">
                                            <li class="list-inline-item">
                                                <a href="#" class="snackbar" data-text="Added to favourites"
                                                   data-pos="top-right"
                                                   data-showAction="true"
                                                   data-actionText="ok"
                                                   data-actionTextColor="#fff"
                                                   data-backgroundColor="#0c101b">
                                                    <i class="icon-heart-o s-18"></i>
                                                </a></li>
                                            <li class="list-inline-item ">
                                                <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                    <i class="icon-play s-48"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><i
                                                        class="icon-more s-18 pt-3"></i></a></li>
                                        </ul>
                                        <div class="text-center mt-5">
                                            <h5>To Phir Ao</h5>
                                            <span>Joe Doe</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>To Phir Ao</h5>
                                    <span>Joe Doe</span>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div>
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a6.jpg" alt="/">
                                <div class="img-overlay text-white">
                                    <div class="figcaption">
                                        <ul class="list-inline d-flex align-items-center justify-content-between">
                                            <li class="list-inline-item">
                                                <a href="#" class="snackbar" data-text="Added to favourites"
                                                   data-pos="top-right"
                                                   data-showAction="true"
                                                   data-actionText="ok"
                                                   data-actionTextColor="#fff"
                                                   data-backgroundColor="#0c101b">
                                                    <i class="icon-heart-o s-18"></i>
                                                </a></li>
                                            <li class="list-inline-item ">
                                                <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                    <i class="icon-play s-48"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><i
                                                        class="icon-more s-18 pt-3"></i></a></li>
                                        </ul>
                                        <div class="text-center mt-5">
                                            <h5>To Phir Ao</h5>
                                            <span>Joe Doe</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>To Phir Ao</h5>
                                    <span>Joe Doe</span>
                                </div>
                            </div>
                        </figure>
                    </div>
                    <div>
                        <figure>
                            <div class="img-wrapper">
                                <img src="assets/img/demo/a7.jpg" alt="/">
                                <div class="img-overlay text-white">
                                    <div class="figcaption">
                                        <ul class="list-inline d-flex align-items-center justify-content-between">
                                            <li class="list-inline-item">
                                                <a href="#" class="snackbar" data-text="Added to favourites"
                                                   data-pos="top-right"
                                                   data-showAction="true"
                                                   data-actionText="ok"
                                                   data-actionTextColor="#fff"
                                                   data-backgroundColor="#0c101b">
                                                    <i class="icon-heart-o s-18"></i>
                                                </a></li>
                                            <li class="list-inline-item ">
                                                <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                    <i class="icon-play s-48"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)"><i
                                                        class="icon-more s-18 pt-3"></i></a></li>
                                        </ul>
                                        <div class="text-center mt-5">
                                            <h5>To Phir Ao</h5>
                                            <span>Joe Doe</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="figure-title text-center p-2">
                                    <h5>To Phir Ao</h5>
                                    <span>Joe Doe</span>
                                </div>
                            </div>
                        </figure>
                    </div>

                </div>
            </section>
            <!--@New Releases-->


            <!--@New Releases-->

            <!--PlayList & Events-->
            <section class="section mt-4">
                <div class="row row-eq-height">
                    <div class="col-lg-8">
                        <div class="card no-b mb-md-3 p-2">
                            <div class="card-header no-bg transparent">
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-center">
                                        <div class="d-flex">
                                            <!--<i class="icon-music s-36 mr-3  mt-2"></i>-->
                                            <div>
                                                <h4>Most Popular This Week</h4>
                                                <p>Checkout What's new at our blog</p>
                                                <div class="mt-3">
                                                    <ul class="nav nav-tabs card-header-tabs nav-material responsive-tab mb-1"
                                                        role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active show" id="w2--tab1"
                                                               data-toggle="tab" href="#w2-tab1"
                                                               role="tab"
                                                               aria-selected="true">Rock</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="w3--tab1" data-toggle="tab"
                                                               href="#w2-tab1"
                                                               role="tab"
                                                               aria-selected="false">Jazz</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="w4--tab3" data-toggle="tab"
                                                               href="#w2-tab3" role="tab"

                                                               aria-selected="false">Classic</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="w5--tab1" data-toggle="tab"
                                                               href="#w2-tab1" role="tab"

                                                               aria-selected="false">Jazz</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="w6--tab3" data-toggle="tab"
                                                               href="#w2-tab3" role="tab"

                                                               aria-selected="false">Classic</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="card-body no-p">
                                <div class="tab-content" id="v-pills-tabContent1">
                                    <div class="tab-pane fade show active" id="w2-tab1" role="tabpanel"
                                         aria-labelledby="w2-tab1">
                                       <div class="playlist pl-lg-3 pr-lg-3">
                                           <div class="m-1 my-4">
                                               <div class="d-flex align-items-center">
                                                   <div class="col-1">
                                                       <a class="no-ajaxy media-url" href="assets/media/track1.mp3" data-wave="assets/media/track1.json">
                                                           <i class="icon-play s-28"></i>
                                                       </a>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <figure class="avatar-md float-left  mr-3 mt-1">
                                                           <img class="r-3" src="assets/img/demo/a1.jpg" alt="">
                                                       </figure>
                                                       <h6>Dance with me tonight</h6>Joe Doe
                                                   </div>
                                                   <div class="col-md-5 d-none d-lg-block">
                                                       <div class="d-flex">
                                                           <span class="ml-auto"> 5:03</span>
                                                           <a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
                                                           <div class="ml-auto">
                                                               <a href="#" class="btn btn-outline-primary btn-sm">Buy at iTunes</a>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-1 ml-auto d-lg-none">
                                                       <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                           <i class="icon-more-1"></i></a>
                                                       <div class="dropdown-menu dropdown-menu-right">
                                                               <a  class="dropdown-item" href="#"><i class="icon-share-1 mr-3"></i> Share</a>
                                                               <a  class="dropdown-item" href="#"><i class="icon-shopping-bag mr-3"></i>Buy at iTunes</a>
                                                           </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="m-1 my-4">
                                               <div class="d-flex align-items-center">
                                                   <div class="col-1">
                                                       <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                           <i class="icon-play s-28"></i>
                                                       </a>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <figure class="avatar-md float-left  mr-3 mt-1">
                                                           <img class="r-3" src="assets/img/demo/a2.jpg" alt="">
                                                       </figure>
                                                       <h6>Dance with me tonight</h6>Joe Doe
                                                   </div>
                                                   <div class="col-md-5 d-none d-lg-block">
                                                       <div class="d-flex">
                                                           <span class="ml-auto"> 5:03</span>
                                                           <a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
                                                           <div class="ml-auto">
                                                               <a href="#" class="btn btn-outline-primary btn-sm">Buy at iTunes</a>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-1 ml-auto d-lg-none">
                                                       <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                           <i class="icon-more-1"></i></a>
                                                       <div class="dropdown-menu dropdown-menu-right">
                                                           <a  class="dropdown-item" href="#"><i class="icon-share-1 mr-3"></i> Share</a>
                                                           <a  class="dropdown-item" href="#"><i class="icon-shopping-bag mr-3"></i>Buy at iTunes</a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="m-1 my-4">
                                               <div class="d-flex align-items-center">
                                                   <div class="col-1">
                                                       <a class="no-ajaxy media-url" href="assets/media/track3.mp3" data-wave="assets/media/track3.json">
                                                           <i class="icon-play s-28"></i>
                                                       </a>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <figure class="avatar-md float-left  mr-3 mt-1">
                                                           <img class="r-3" src="assets/img/demo/a3.jpg" alt="">
                                                       </figure>
                                                       <h6>Dance with me tonight</h6>Joe Doe
                                                   </div>
                                                   <div class="col-md-5 d-none d-lg-block">
                                                       <div class="d-flex">
                                                           <span class="ml-auto"> 5:03</span>
                                                           <a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
                                                           <div class="ml-auto">
                                                               <a href="#" class="btn btn-outline-primary btn-sm">Buy at iTunes</a>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-1 ml-auto d-lg-none">
                                                       <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                           <i class="icon-more-1"></i></a>
                                                       <div class="dropdown-menu dropdown-menu-right">
                                                           <a  class="dropdown-item" href="#"><i class="icon-share-1 mr-3"></i> Share</a>
                                                           <a  class="dropdown-item" href="#"><i class="icon-shopping-bag mr-3"></i>Buy at iTunes</a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="m-1 my-4">
                                               <div class="d-flex align-items-center">
                                                   <div class="col-1">
                                                       <a class="no-ajaxy media-url" href="assets/media/track1.mp3" data-wave="assets/media/track1.json">
                                                           <i class="icon-play s-28"></i>
                                                       </a>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <figure class="avatar-md float-left  mr-3 mt-1">
                                                           <img class="r-3" src="assets/img/demo/a4.jpg" alt="">
                                                       </figure>
                                                       <h6>Dance with me tonight</h6>Joe Doe
                                                   </div>
                                                   <div class="col-md-5 d-none d-lg-block">
                                                       <div class="d-flex">
                                                           <span class="ml-auto"> 5:03</span>
                                                           <a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
                                                           <div class="ml-auto">
                                                               <a href="#" class="btn btn-outline-primary btn-sm">Buy at iTunes</a>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-1 ml-auto d-lg-none">
                                                       <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                           <i class="icon-more-1"></i></a>
                                                       <div class="dropdown-menu dropdown-menu-right">
                                                           <a  class="dropdown-item" href="#"><i class="icon-share-1 mr-3"></i> Share</a>
                                                           <a  class="dropdown-item" href="#"><i class="icon-shopping-bag mr-3"></i>Buy at iTunes</a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="m-1 my-4">
                                               <div class="d-flex align-items-center">
                                                   <div class="col-1">
                                                       <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                           <i class="icon-play s-28"></i>
                                                       </a>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <figure class="avatar-md float-left  mr-3 mt-1">
                                                           <img class="r-3" src="assets/img/demo/a5.jpg" alt="">
                                                       </figure>
                                                       <h6>Dance with me tonight</h6>Joe Doe
                                                   </div>
                                                   <div class="col-md-5 d-none d-lg-block">
                                                       <div class="d-flex">
                                                           <span class="ml-auto"> 5:03</span>
                                                           <a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
                                                           <div class="ml-auto">
                                                               <a href="#" class="btn btn-outline-primary btn-sm">Buy at iTunes</a>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-1 ml-auto d-lg-none">
                                                       <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                           <i class="icon-more-1"></i></a>
                                                       <div class="dropdown-menu dropdown-menu-right">
                                                           <a  class="dropdown-item" href="#"><i class="icon-share-1 mr-3"></i> Share</a>
                                                           <a  class="dropdown-item" href="#"><i class="icon-shopping-bag mr-3"></i>Buy at iTunes</a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="m-1 my-4">
                                               <div class="d-flex align-items-center">
                                                   <div class="col-1">
                                                       <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                           <i class="icon-play s-28"></i>
                                                       </a>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <figure class="avatar-md float-left  mr-3 mt-1">
                                                           <img class="r-3" src="assets/img/demo/a8.jpg" alt="">
                                                       </figure>
                                                       <h6>Dance with me tonight</h6>Joe Doe
                                                   </div>
                                                   <div class="col-md-5 d-none d-lg-block">
                                                       <div class="d-flex">
                                                           <span class="ml-auto"> 5:03</span>
                                                           <a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
                                                           <div class="ml-auto">
                                                               <a href="#" class="btn btn-outline-primary btn-sm">Buy at iTunes</a>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-1 ml-auto d-lg-none">
                                                       <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                           <i class="icon-more-1"></i></a>
                                                       <div class="dropdown-menu dropdown-menu-right">
                                                           <a  class="dropdown-item" href="#"><i class="icon-share-1 mr-3"></i> Share</a>
                                                           <a  class="dropdown-item" href="#"><i class="icon-shopping-bag mr-3"></i>Buy at iTunes</a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="tab-pane fade" id="w2-tab3" role="tabpanel"
                                         aria-labelledby="w2-tab3">
                                        <div class="card-body has-items-overlay playlist p-5">
                                            <div class="row">
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a7.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a6.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a5.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a4.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a3.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a2.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a1.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 mb-3">
                                                    <figure class="mb-2">
                                                        <div class="img-wrapper r-10">
                                                            <img class=" r-10" src="assets/img/demo/a8.jpg"
                                                                 alt="/">
                                                            <div class="img-overlay text-white p-5">
                                                                <div class="center-center">
                                                                    <a class="no-ajaxy media-url"
                                                                       href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                                        <i class="icon-play s-48"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                    <div class="figure-title">
                                                        <h6>To Phir Ao</h6>
                                                        <small>Atif Aslam</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--@PlayLIst & Events-->

        </div>
    </div>
</div>
</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>
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

<!-- Mirrored from xvelopers.com/demos/html/record-light/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 05 Apr 2020 17:21:40 GMT -->
>>>>>>> branch 'master' of https://github.com/UNIZAR-30226-2020-06/PS-FINAL.git
</html>