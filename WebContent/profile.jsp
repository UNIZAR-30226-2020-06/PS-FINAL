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
<%request.setAttribute("generos", request.getAttribute("generos")); %>

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

<!-- END PESTAÃA -->

<body background="assets/img/fondo3.png" style="background-size: cover;background-repeat: no-repeat; background-position: center center;background-attachment: fixed;" class="sidebar-mini sidebar-collapse sidebar-expanded-on-hover has-preloader" style="display: none;">
<!-- Pre loader
  To disable preloader remove 'has-preloader' from body
 -->
<!-- CIRCULO DE CARGA -->
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
<!-- END CIRCULO DE CARGA -->							 

<!-- EMPIEZA APP -->
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
            
            <li><a class="ajaxifyPage" href="videos.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
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
<!-- END MENU DE LA IZQUIERDA-->

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
                    <a class="no-ajaxy media-url" href="http://34.69.44.48/almacen-mp3/13.mp3" >
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
<!-- END MENU DONDE ESTAN LAS CANCIONES EN LA COLA (DERECHA) -->


<!-- ALGO RANDOM DE LA PARTE DERECHA -->									
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
                                    <a href="video-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
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
                                    <a href="video-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
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
                                    <a href="video-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
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
<!-- END BUSCADOR (LUPA) -->


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
                                <a class="ajaxifyPage" href="#" id="abrir-popup-cuenta">
                                    <i class="icon-cog  s-24"></i>
                                    <div class="pt-1">Ajustes cuenta</div>
                                </a>
                            </div>
                            <div class="col text-center">
                                <a class="ajaxifyPage" href="#" onclick="setTimeout(location.reload.bind(location), 1)">
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
<!-- END BARRA DE ARRIBA FIJA -->


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
                        <button id="loopTrack" class="btn btn-link d-none d-sm-block" onclick="playlist.setLoop(true);">
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
<!-- END BARRA DE ABAJO -->

<!--  
########################################################################
############### ACABA BASE DE TODAS LAS PAGINAS    #####################
########################################################################
-->

<!-- Obtener datos usuario -->
<% 
String nombre = (String) session.getAttribute("nombre");
String descripcion = (String) session.getAttribute("descripcion");
//String imagen = (String) session.getAttribute("imagen");
%>
<!-- END Obtener datos usuario -->

<!--CONTENIDO DEL MEDIO-->
<main id="pageContent" class="page has-sidebar">


<div class="container-fluid relative animatedParent animateOnce p-lg-5">
	<!-- CABECERA CON LA INFORMACION DEL USUARIO -->											 
    <div class="card no-b shadow no-r">
        <div class="row no-gutters">
			<div class="col-md-4 b-r">
			<button style="position: absolute;left: 10px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3" id="abrir-popup-perfil"><i class="icon-edit  s-24"></i>Editar perfil</button>
                <div class="text-center p-5 mt-5">
					
                    <figure style="width: 130px;height: 130px;width-max: 50%;" class="avatar avatar-xl">
                    	<img src="assets/img/demo/u7.jpg" alt="">
                    </figure>
                    <div>
                        <h4 class="p-t-10"><%=nombre%></h4>
                    </div>
                    <a href="#" class="btn btn-abrir-popup btn-sm  mt-3" id="abrir-popup-foto">Cambiar foto</a>
                </div>
            </div>
            <div class="col-md-8">
				
                <div class="p-4">
                    <div class="pl-4 mt-4">
                        <h5>Descripción</h5>
						<span><%=descripcion %></span>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="p-4">
                                <a href="#w3-tab3" ><h5>Seguidores</h5></a><h6>(numero)</h6></a>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="p-4">
                                <a href="#w3-tab4" ><h5>Siguiendo</h5><h6>(numero)</h6></a>
                            </div>
                        </div>
                    </div>
                </div>
                
			</div>
        </div>

    </div>
	<!-- TABLA -->
	<div style="position: relative;top: 15px;" class="card no-b">
		<div class="card-header pb-0">
			<div class="d-flex justify-content-between">
				<div class="align-self-center">
					<ul class="nav nav-pills mb-3" role="tablist">
						<li class="nav-item">
							<a class="nav-link active show r-20" id="w3--tab1" data-toggle="tab"
							   href="#w3-tab1" role="tab" aria-controls="tab1" aria-expanded="true"
							   aria-selected="true">Canciones</a>
						</li>
						<li class="nav-item">
							<a class="nav-link show r-20" id="w3--tab2" data-toggle="tab"
							   href="#w3-tab2" role="tab" aria-controls="tab2" aria-expanded="true"
							   aria-selected="true">Listas de reproduccion</a>
						</li>
						<li class="nav-item">
							<a class="nav-link r-20" id="w3--tab3" data-toggle="tab" href="#w3-tab3"
							   role="tab" aria-controls="tab2" aria-selected="false">Mis podcasts</a>
						</li>
						<li class="nav-item">
							<a class="nav-link r-20" id="w3--tab4" data-toggle="tab" href="#w3-tab4"
							   role="tab" aria-controls="tab3" aria-selected="false">Seguidores</a>
						</li>
						<li class="nav-item">
							<a class="nav-link r-20" id="w3--tab5" data-toggle="tab" href="#w3-tab5"
							   role="tab" aria-controls="tab3" aria-selected="false">Siguiendo</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="card-body no-p">
			<div class="tab-content">
				
				<!--CANCIONES-->
				<div class="tab-pane fade show active text-center p-5" id="w3-tab1" role="tabpanel"
					 aria-labelledby="w3-tab1">
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus" id="abrir-popup"> Subir canción</button>
					</div>
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="row">
								<div class="col-md-12">
									<div class="playlist">
										<ul id="playlist" class="playlist list-group">
											<c:forEach var="cancion" items="${canciones}">                    
												<div style="margin-bottom: -1px;" class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<a class="no-ajaxy media-url" href="${cancion.getUrl()}">
																	<i class="icon-play s-28"></i>
																</a>					
															</div>
															<div class="col-6">
																<h6>${cancion.getTitulo()}</h6>${genero.getNombre()}
															</div>
															<span class=" ml-auto">${cancion.getGenero()}</span>
															<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
															<div class="ml-auto">
																<a href="#" class="btn-favorito icon-star active"></a>
																<a href="${pageContext.request.contextPath}/ir_modificar?id_cancion=${cancion.getId()}" class="btn-icono icon-pencil" onclick="setTimeout(location.reload.bind(location), 1)"></a>
																<a href="#" class="btn-icono icon-list-1" onclick="document.getElementById('overlay-anadir-listas-reproduccion').classList.add('active');"></a>
																<a href="${pageContext.request.contextPath}/eliminar_cancion?id_cancion=${cancion.getId()}" class="btn-icono icon-trash-o" onclick="setTimeout(location.reload.bind(location), 1)"></a>
															</div>
														</div>
													</li>
												</div>								                
											</c:forEach>									
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--LISTAS REPRODUCCIÓN-->
				<div class="tab-pane fade show text-center p-5" id="w3-tab2" role="tabpanel"
					 aria-labelledby="w3-tab2">
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus" id="abrir-listas-reproduccion">Crear Lista de Reproducción</button>
					</div>
						<div class="row has-items-overlay">
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a1.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>
							</figure>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a2.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>

							</figure>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a3.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>

							</figure>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a4.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>

							</figure>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a5.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>

							</figure>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a6.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>

							</figure>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a7.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>

							</figure>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
									<img src="assets/img/demo/a8.jpg" alt="/">
									<div class="img-overlay text-white text-center">
										<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
											<div class="figcaption mt-3">
												<i class="icon-link s-48"></i>
												<h5 class="mt-5">To Phir Ao</h5>
												<span>Atif Aslam</span>
											</div>
										</a>
									</div>
									<div class="figure-title text-center p-2">
										<h5>To Phir Ao</h5>
										<span>Atif Aslam</span>
									</div>
								</div>
							</figure>
						</div>
					</div>
				</div>
				
				<!--MIS PODCAST-->
				<div class="tab-pane fade text-center p-5" id="w3-tab3" role="tabpanel"
					 aria-labelledby="w3-tab2">
					<h4 class="card-title">Tab 2</h4>
					<p class="card-text">With supporting text below as a natural lead-in to additional
						content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
				
				<!---SEGUIDORES-->
				<div class="tab-pane fade text-center p-5" id="w3-tab4" role="tabpanel"
					 aria-labelledby="w3-tab3">
					<div class="table-responsive">
						<table class="table table-hover earning-box">
						
							<tbody>
							<tr class="no-b">
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u1.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u2.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u3.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u4.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u5.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u6.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<!--SIGUIENDO-->
				<div class="tab-pane fade text-center p-5" id="w3-tab5" role="tabpanel"
					 aria-labelledby="w3-tab4">
					<div class="table-responsive">
						<table class="table table-hover earning-box">

							<tbody>
							<tr class="no-b">
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u1.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u2.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u3.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u4.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u5.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							<tr>
								<td class="w-10"><span class="round">
							<img src="assets/img/demo/u6.png" alt="user"></span>
								</td>
								<td>
									<h6>Sara Kamzoon</h6>
									<small class="text-muted">Marketing Manager</small>
								</td>
								<td>25</td>
								<td>$250</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END TABLA -->
</div>
<!-- END CABECERA CON LA INFORMACION DEL USUARIO -->


</main>

<!-- Bloque de subir cancion datos-->
<div class="overlay-pop-up" id="overlay-subir-cancion">
    <div class="col-md-7 card p-5">
		<form class="form-material" action="subir_audio" method="post" enctype="multipart/form-data">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-subir-cancion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
					<h3>SUBIR CANCIÓN</h3>
					<h5>Paso 1: subir el fichero .mp3 de la cancion</h5>
			</header>
			<div class="contenedor-inputs">
				<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName"> 
			</div>
			<input type="submit" class="btn btn-outline-primary btn-sm  mt-3" value="Continuar">
		</form>
	</div>
</div>
<!-- END Bloque de subir cancion datos-->									 
<<<<<<< HEAD


<!-- EDICION PERFIL -->
<div class="overlay-pop-up" id="overlay-perfil">
    <div class="col-md-7 card p-5">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-perfil" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
				<h3>CAMBIAR INFORMACIÓN DE PERFIL</h3>
			</header>
			<form class="form-material" action="modinfo">
				<!-- Input -->
				<div class="body">
					
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" name="nombre" class="form-control">
							<label class="form-label">Nombre</label>
						</div>
					</div>
					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar nombre">
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" name="descripcion" class="form-control">
							<label class="form-label">Descripción</label>
						</div>
					</div>

					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar descripción">
				</div>
			</form>
			<!-- #END# Input -->
	</div>
</div>
<!-- END EDICION PERFIL -->


<!-- AJUSTES CUENTA -->
<div class="overlay-pop-up" id="overlay-cuenta">
    <div class="col-md-7 card p-5">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-cuenta" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
				<h3>CAMBIAR INFORMACIÓN DE LA CUENTA</h3>
			</header>
			<form class="form-material" action="modinfo"> <!--QUITAR-->
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
			<form class="form-material" action="modpass"> <!--QUITAR-->
				<!-- Input -->
				<div class="body">
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena1" class="form-control">
							<label class="form-label">Contraseña actual</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena2" class="form-control">
							<label class="form-label">Contraseña nueva</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena3" class="form-control">
							<label class="form-label">Confirmar contraseña</label>
						</div>
					</div>

					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar constraseña">
				</div>
			</form>
			<!-- #END# Input -->
	</div>
</div>
<!-- END AJUSTES CUENTA -->


<!-- CAMBIAR FOTO -->
<div class="overlay-pop-up" id="overlay-foto">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-foto" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="modinfo">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>SUBIR FOTO</h3>
				</header>
				<div class="contenedor-inputs">
					<input class="btn btn-outline-primary btn-sm  mt-3" type="file" name="imagen" value=""> 
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
					   value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CAMBIAR FOTO -->

<!-- CREAR LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="profile.jsp">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR LISTAS DE REPRODUCCIÓN</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>Añadir imagen</h4>
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" required=""/> 
					<input type="text" placeholder="Nombre" id="nombre-listas-reproduccion" required=""/>
					<input type="text" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
					   value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR LISTA DE REPRODUCCIÓN -->

<!-- AÃADIR CANCION A LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-anadir-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-anadir-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="profile.jsp">
			<!-- Input -->
			<div class="body">
				<div class="row has-items-overlay">
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a1.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a2.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a3.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a4.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a5.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a6.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a7.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a8.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>
						</figure>
					</div>
				</div>
=======


<!-- EDICION PERFIL -->
<div class="overlay-pop-up" id="overlay-perfil">
    <div class="col-md-7 card p-5">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-perfil" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
				<h3>CAMBIAR INFORMACIÓN DE PERFIL</h3>
			</header>
			<form class="form-material" action="modinfo">
				<!-- Input -->
				<div class="body">
					
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" name="nombre" class="form-control">
							<label class="form-label">Nombre</label>
						</div>
					</div>
					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar nombre">
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" name="descripcion" class="form-control">
							<label class="form-label">Descripción</label>
						</div>
					</div>

					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar descripción">
				</div>
			</form>
			<!-- #END# Input -->
	</div>
</div>
<!-- END EDICION PERFIL -->


<!-- AJUSTES CUENTA -->
<div class="overlay-pop-up" id="overlay-cuenta">
    <div class="col-md-7 card p-5">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-cuenta" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
				<h3>CAMBIAR INFORMACIÓN DE LA CUENTA</h3>
			</header>
			<form class="form-material" action="modinfo"> <!--QUITAR-->
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
			<form class="form-material" action="modpass"> <!--QUITAR-->
				<!-- Input -->
				<div class="body">
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena1" class="form-control">
							<label class="form-label">Contraseña actual</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena2" class="form-control">
							<label class="form-label">Contraseña nueva</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena3" class="form-control">
							<label class="form-label">Confirmar contraseña</label>
						</div>
					</div>

					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar constraseña">
				</div>
			</form>
			<!-- #END# Input -->
	</div>
</div>
<!-- END AJUSTES CUENTA -->


<!-- CAMBIAR FOTO -->
<div class="overlay-pop-up" id="overlay-foto">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-foto" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="modinfo" method="post" enctype="multipart/form-data">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>SUBIR FOTO</h3>
				</header>
				<div class="contenedor-inputs">
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="imagen" id="imagen" accept="image/jpeg"> 
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
					   value="Aceptar">
			</div>
>>>>>>> 622f124c006754d594ef86e265ef63a16da23876
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CAMBIAR FOTO -->

<!-- CREAR LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="profile.jsp">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR LISTAS DE REPRODUCCIÓN</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>Añadir imagen</h4>
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" required=""/> 
					<input type="text" placeholder="Nombre" id="nombre-listas-reproduccion" required=""/>
					<input type="text" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
					   value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR LISTA DE REPRODUCCIÓN -->

<!-- AÃADIR CANCION A LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-anadir-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-anadir-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="profile.jsp">
			<!-- Input -->
			<div class="body">
				<div class="row has-items-overlay">
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a1.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a2.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a3.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a4.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a5.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a6.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a7.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a8.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>
						</figure>
					</div>
				</div>
			<!-- #END# Input -->
<<<<<<< HEAD
	</div>
</div>
<!-- END EDICION PERFIL -->


<!-- AJUSTES CUENTA -->
<div class="overlay-pop-up" id="overlay-cuenta">
    <div class="col-md-7 card p-5">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-cuenta" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
				<h3>CAMBIAR INFORMACI�N DE LA CUENTA</h3>
			</header>
			<form class="form-material" action="modinfo"> <!--QUITAR-->
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
			<form class="form-material" action="modpass"> <!--QUITAR-->
				<!-- Input -->
				<div class="body">
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena1" class="form-control">
							<label class="form-label">Contrase�a actual</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena2" class="form-control">
							<label class="form-label">Contrase�a nueva</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena3" class="form-control">
							<label class="form-label">Confirmar contrase�a</label>
						</div>
					</div>

					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						   value="Cambiar constrase�a">
				</div>
			</form>
			<!-- #END# Input -->
	</div>
</div>
<!-- END AJUSTES CUENTA -->


<!-- CAMBIAR FOTO -->
<div class="overlay-pop-up" id="overlay-foto">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-foto" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="modinfo" method="post" enctype="multipart/form-data">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>SUBIR FOTO</h3>
				</header>
				<div class="contenedor-inputs">
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="imagen" id="imagen" accept="image/jpeg"> 
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
					   value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CAMBIAR FOTO -->

<!-- CREAR LISTA DE REPRODUCCI�N -->
<div class="overlay-pop-up" id="overlay-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="crear_lr" method="post">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR LISTAS DE REPRODUCCI�N</h3>
				</header>
				<div class="contenedor-inputs">
					<h4>A�adir imagen</h4>
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" required/> 
					<input type="text" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
					   value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR LISTA DE REPRODUCCIӓN -->

<!-- AÑADIR CANCION A LISTA DE REPRODUCCI�N -->
<div class="overlay-pop-up" id="overlay-anadir-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-anadir-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="profile.jsp">
			<!-- Input -->
			<div class="body">
				<div class="row has-items-overlay">
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a1.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a2.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="album-single.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a3.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a4.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a5.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a6.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a7.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>

						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 my-2">
						<figure>
							<div class="img-wrapper">
								<img src="assets/img/demo/a8.jpg" alt="/">
								<div class="img-overlay text-white text-center">
									<a href="#">
										<div class="figcaption mt-3">
											<i class="icon-link s-48"></i>
											<h5 class="mt-5">To Phir Ao</h5>
											<span>Atif Aslam</span>
										</div>
									</a>
								</div>
								<div class="figure-title text-center p-2">
									<h5>To Phir Ao</h5>
									<span>Atif Aslam</span>
								</div>
							</div>
						</figure>
					</div>
				</div>
			<!-- #END# Input -->
			</div>
		</form>
	</div>
</div>
<!-- END AÑADIR CANCION A LISTA DE REPRODUCCI�N -->
<!-- BORRAR LISTA DE REPRODUCCI�N -->	
	<div class="overlay-pop-up" id="overlay-borrar-listas-reproduccion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lr" method="post">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>�Estas seguro?</h3>	
	                    <h5>Vas a borrar esta lista de reproduccion para siempre, no hay vuelta atras</h5>	
					</header>	
		
		
					<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"	
	                       value="Aceptar">	
	                <button class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');">Cerrar</button>	
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR LISTA DE REPRODUCCI�N -->

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

<!-- Mirrored from xvelopers.com/demos/html/record-light/profile.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 05 Apr 2020 17:22:10 GMT -->
</html>