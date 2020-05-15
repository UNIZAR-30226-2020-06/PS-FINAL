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
<%
request.setAttribute("generos", request.getAttribute("generos"));
int pagina = Integer.valueOf((String) request.getParameter("pagina"));
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

<!-- END PESTAÑA -->

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
            <li><a class="ajaxifyPage active" href="Inicio" >
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
						<li class="list-group-item my-1"><a href="page-blank.jsp" >${genero.getNombre()}</a></li>
	                </c:forEach>

                </ul>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_lrs?tipo=ListaRep" >
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis listas de reproduccion</span>
                </a>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_podcasts?tipo=podcast" >
                    <i class="icon icon-headphones s-24"></i> <span>Mis podcasts</span>
                </a>
            </li>
            <li><a class="ajaxifyPage" href="obtener_info_fav" onclick="setTimeout(locaton.reload.bind(location), 1)">
            		<i class="icon icon-star s-24"></i> <span>Mis favoritos</span>
            	</a>
            </li>
        </ul>
    </div>
</aside>
<!-- END MENU DE LA IZQUIERDA-->


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
%>

<!-- BARRA DE ARRIBA FIJA -->
<nav class="navbar-wrapper shadow">
    <div class="navbar navbar-expand player-header justify-content-between  bd-navbar">
        <div class="d-flex align-items-center">
            <a href="#" data-toggle="push-menu" class="paper-nav-toggle pp-nav-toggle ml-2 mr-2">
                <i></i>
            </a>
            <a class="navbar-brand d-none d-lg-block" href="Inicio" >
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="Inicio" ><img  src="assets/img/logo.png"></a>
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
	                    	<img src="${pageContext.request.contextPath}/cargar_imagen">
	                    	<%} else {%>
	                    	<img src="assets/img/fondo1.jpg">
	                    	<%} %>
                        </figure>
                        <i class="icon-more_vert "></i>
                    </a>
                    <div class="dropdown-menu p-4 dropdown-menu-right">
                        <div class="row box justify-content-between my-4">
                        	<div class="col text-center">
								<a class="ajaxifyPage" href="obtener_contenido_perfil" >
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
<!-- END BARRA DE ARRIBA FIJA -->


<!-- BARRA DE ABAJO FIJA-->
<nav class="navbar-wrapper navbar-bottom-fixed shadow">
    <div class="navbar navbar-expand player-header justify-content-between  bd-navbar">
        <!--Player-->
        <div id="mediaPlayer" class="player-bar col-lg-8 col-md-5" data-auto="true">
            <div style="height: 50px;width: 157%;" class="row align-items-center grid">
            <!-- BOTONES ANTERIOR, PAUSE, SIGUIENTE -->
                <div class="col">
                    <div class="d-flex align-items-center">
                        <button id="shuffleTrack" class="btn btn-link d-none d-sm-block" onClick="document.getElementById('shuffleTrack').classList.add('active');">
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
                        <button class=" btn btn-control" id="btn-loop" onclick="loopAudio();document.getElementById('btn-loop').classList.add('active');"">
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


<!--CONTENIDO NO AJAX-->
<main id="pageContent" class="page has-sidebar">
<div class="container-fluid relative animatedParent animateOnce p-lg-5">
	<!-- CABECERA CON LA INFORMACION DEL USUARIO -->											 
    <div class="card no-b shadow no-r">
        <div class="row no-gutters">
			<div class="col-md-4 b-r">
                <div class="text-center p-5 mt-5">
					
                    <figure style="width: 130px;height: 130px;width-max: 50%;" class="avatar avatar-xl">
                    	<c:choose>
                    		<c:when test="${imagen!=null}">
                    			<img src="${pageContext.request.contextPath}/cargar_imagen">
                    		</c:when>
                    		<c:otherwise>
                    			<img src="assets/img/fondo1.jpg">
                    		</c:otherwise>
                    	</c:choose>
                    </figure>
                    <div>
                        <h4 class="p-t-10">${nombre}</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
				
                <div class="p-4">
                    <div class="pl-4 mt-4">
                        <h5>Descripción</h5>
						<span>${descripcion}</span>
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
							   role="tab" aria-controls="tab2" aria-selected="false">Capitulos Podcast</a>
						</li>
						<li class="nav-item">
							<a class="nav-link r-20" id="w3--tab4" data-toggle="tab" href="#w3-tab4"
							   role="tab" aria-controls="tab2" aria-selected="false">Podcasts</a>
						</li>
						<li class="nav-item">
							<a class="nav-link r-20" id="w3--tab5" data-toggle="tab" href="#w3-tab5"
							   role="tab" aria-controls="tab2" aria-selected="false">Transmisiones</a>
						</li>
						<li class="nav-item">
							<a class="nav-link r-20" id="w3--tab6" data-toggle="tab" href="#w3-tab6"
							   role="tab" aria-controls="tab3" aria-selected="false">Seguidores</a>
						</li>
						<li class="nav-item">
							<a class="nav-link r-20" id="w3--tab7" data-toggle="tab" href="#w3-tab7"
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
																<%
																	if(pagina == 2) {%>
																	<a class="no-ajaxy media-url" href="${cancion.getUrl()}">
																		<i class="icon-play s-28"></i>
																	</a>
																	<%} else {%>
																	<a href="NOMBRE DEL SERVLET A CARGAR PERFIL USUARIO?pagina=2" onclick="setTimeout(location.reload.bind(location), 1)">
																		<i class="icon-play s-28"></i>
																	</a>
																	<%} %>					
															</div>
															<div class="col-6">
																<h6>${cancion.getTitulo()}</h6>${genero.getNombre()}
															</div>
															<span class="ml-auto">${cancion.getGenero()}</span>
															<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
															<div class="ml-auto">
																<a href="anyadir_cancion_fav?idAudio=${cancion.getId()}" class="btn-favorito icon-star active" ></a>
																<a href="#" class="btn-icono icon-list-1" onclick="rellenarCampos('${mislistas.size()}','${cancion.getId()}');
																document.getElementById('overlay-anadir-listas-reproduccion').classList.add('active')"></a>
																
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
				<!-- END CANCIONES -->
				
				<!--LISTAS REPRODUCCIÓN-->
				<div class="tab-pane fade show text-center p-5" id="w3-tab2" role="tabpanel"
					 aria-labelledby="w3-tab2">
					<div class="row has-items-overlay">
						<c:forEach var="listalr" items="${listaslr}">
							<div class="col-lg-3 col-md-4 col-sm-6 my-2">
								<figure>
									<div class="img-wrapper">
										<img src="assets/img/demo/a1.jpg" alt="/">
										<div class="img-overlay text-white text-center">
											<a href="obtener_info_lr?nombre=${listalr.getNombre()}" >
												<div class="figcaption mt-3">
													<i class="icon-link s-48"></i>
													<h5 class="mt-5">${listalr.getNombre()}</h5>
												</div>
											</a>
										</div>
										<div class="figure-title text-center p-2">
											<h5>${listalr.getNombre()}</h5>
										</div>
									</div>
								</figure>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- END LISTAS REPRODUCCION -->
				
				<!-- CAPITULOS PODCAST -->
				<div class="tab-pane fade show text-center p-5" id="w3-tab3" role="tabpanel"
					 aria-labelledby="w3-tab3">
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="row">
								<div class="col-md-12">
									<div class="playlist">
										<ul id="playlistPodcast" class="playlist list-group">
											<c:forEach var="capitulo" items="${capitulos}">                    
												<div style="margin-bottom: -1px;" class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<a class="no-ajaxy media-url" href="${capitulo.getUrl()}">
																	<i class="icon-play s-28"></i>
																</a>					
															</div>
															<div class="col-6">
																<h6>${capitulo.getTitulo()}</h6>${genero.getNombre()}
															</div>
															<span class="ml-auto">${capitulo.getGenero()}</span>
															<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
															<div class="ml-auto">
																<a href="#" class="btn-icono icon-list-1" onclick="rellenarCampos('${podcasts.size()}','${capitulo.getId()}');
																document.getElementById('overlay-anadir-podcast').classList.add('active')"></a>

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
				<!-- END CAÎTULOS PODCAST -->
				
				<!-- PODCAST-->
				<div class="tab-pane fade show text-center p-5" id="w3-tab4" role="tabpanel"
					 aria-labelledby="w3-tab4">
					<div class="row has-items-overlay">
						<c:forEach var="podcast" items="${podcasts}">
							<div class="col-lg-3 col-md-4 col-sm-6 my-2">
								<figure>
									<div class="img-wrapper">
										<img src="assets/img/demo/a1.jpg" alt="/">
										<div class="img-overlay text-white text-center">
											<a href="obtener_info_podcast?nombre=${podcast.getNombre()}" >
												<div class="figcaption mt-3">
													<i class="icon-link s-48"></i>
													<h5 class="mt-5">${podcast.getNombre()}</h5>
												</div>
											</a>
										</div>
										<div class="figure-title text-center p-2">
											<h5>${podcast.getNombre()}</h5>
										</div>
									</div>
								</figure>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- END  PODCAST -->
				<!-- TRANSMISONES -->
				<div class="tab-pane fade show text-center p-5" id="w3-tab5" role="tabpanel"
					 aria-labelledby="w3-tab5">
				</div>
				<!-- END TRANSMISIONES -->
				<!---SEGUIDORES-->
				<div class="tab-pane fade text-center p-5" id="w3-tab6" role="tabpanel"
					 aria-labelledby="w3-tab6">
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
				<!-- END SEGUIDORES -->
				
				<!--SIGUIENDO-->
				<div class="tab-pane fade text-center p-5" id="w3-tab7" role="tabpanel"
					 aria-labelledby="w3-tab7">
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
				<!-- END SIGUIENDO -->
			</div>
		</div>
	</div>
	<!-- END TABLA -->
</div>
<!-- END CABECERA CON LA INFORMACION DEL USUARIO -->


<!-- AÑADIR CANCION A LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-anadir-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" onclick="document.getElementById('overlay-anadir-listas-reproduccion').classList.remove('active');"id="btn-cerrar-anadir-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>			
			<!-- Input -->
				<div class="body">
					<div class="row has-items-overlay">
						<c:forEach var="listalr" items="${mislistas}">
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
			
									<img src="assets/img/demo/a1.jpg" alt="/">
									
									<div class="figure-title text-center p-2">
										<h5>${listalr.getNombre()}</h5>
									</div>
								</div>
							</figure>
							<form class="form-material" action="anyadir_cancion_lr" method="post">
								<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Añadir">
								<input type="hidden" name="idLista" value="${listalr.getId()}">
								<input type="hidden" name="idAudio" value="">
								<input type="hidden" name="nombreLista" value="${listalr.getNombre()}">
								<input type="hidden" name="tipo" value="ListaRep">
							</form>	
						</div>
					</c:forEach>
				<!-- #END# Input -->
				</div>
			</div>		
	</div>
</div>
<!-- END AÑADIR CANCION A LISTA DE REPRODUCCIÓN -->

<!-- AÑADIR CAPITULO A PODCAST -->
<div class="overlay-pop-up" id="overlay-anadir-podcast">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-anadir-podcast" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>			
			<!-- Input -->
				<div class="body">
					<div class="row has-items-overlay">
						<c:forEach var="podcast" items="${podcasts}">
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
			
									<img src="assets/img/demo/a1.jpg" alt="/">
									
									<div class="figure-title text-center p-2">
										<h5>${podcast.getNombre()}</h5>
									</div>
								</div>
							</figure>
							<form class="form-material" action="anyadir_cancion_lr" method="post">
								<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Añadir">
								<input type="hidden" name="idLista" value="${podcast.getId()}">
								<input type="hidden" name="idAudio" value="">
								<input type="hidden" name="nombreLista" value="${podcast.getNombre()}">
								<input type="hidden" name="tipo" value="podcast">
							</form>	
						</div>
					</c:forEach>
				<!-- #END# Input -->
				</div>
			</div>		
	</div>
</div>
<!-- END AÑADIR CAPITULO A PODCAST -->





<!--/#app -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>
<script  src="assets/js/mostrar-popup.js"></script>
 <script>
		function darbaja(){
			if (confirm("¿Estás seguro que quieres eliminar tu cuenta?\nEsta operación es irreversible. Todos tus datos y canciones se perderán.")){
					// eliminar usuario
				document.location.href="nombre_servlet";
			}
		}
	</script>
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
	<script>
    function rellenarCampos(size,song) {
    	var i;
    	for (i=0; i <size; i++){
    	  	document.getElementsByName("idAudio")[i].value = song;
    	}
    }
    </script>
    
    </main><!--@Page Content-->
</div><!--@#app-->
</body>
</html>