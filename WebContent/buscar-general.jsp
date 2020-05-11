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

<!-- NOMBRE DE LA PESTAÑA -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/basic/logo.ico" type="image/x-icon">
    <title>Espotify-Búsqueda</title>
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
						<li><a href="page-blank.jsp" >${genero.getNombre()}</a></li>
	                </c:forEach>

                </ul>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_lrs?tipo=ListaRep" >
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis listas de reproducción</span>
                </a>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_podcasts?tipo=podcasts" >
                    <i class="icon icon-headphones s-24"></i> <span>Mis podcasts</span>
                </a>
            </li>
            <li><a class="ajaxifyPage" href="obtener_info_fav" >
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
                                    <a href="album-single.jsp" >
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
                                    <a href="album-single.jsp" >
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
                                    <a href="album-single.jsp" >
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
                    <div id="waveform"></div>
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
<div class="container-fluid relative animatedParent animateOnce no-p">
    <div class="animated">
        <!--Banner Slider-->
       
        <!--@Banner Slider-->
        <div class="p-md-5 p-3  ">
        	<h1 style="color:black;text-align:center;">Resultados de "${busqueda}"</h1>
        	<section class="section">
                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black; top:20px;">
	                    <div class="mb-4">
	                        <h2 style="color:orange;">Usuarios</h2> 
	                    </div>
	                    <c:choose>
	                    	<c:when test="${usuarios.isEmpty()}">
	                    		<div style="width:33%">
	                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
	                    			
	                    		</div>
                    		</c:when>
                    		<c:otherwise>
			                    <a style="text-align:right;" 
		                    		href="VerMas?tipo=usuario&nombre=${busqueda}" >Ver más
		                    		<i class="icon-angle-right ml-3"></i>
			                    </a> 
		                    </c:otherwise>
	                    </c:choose>      
                </div>
                <%String id = (String)request.getSession().getAttribute("id");
                 %>
                <div class="row no-gutters">
               	<c:forEach var="usuario" items="${usuarios}"> 
		            <div class="col-md-4 b-r">
		                <div class="text-center p-5 mt-5">
		                    <figure class="avatar avatar-xl">
		                    	<c:choose>
		                    		<c:when test="${usuario.getId()==id }">
				                    	<a href="obtener_contenido_perfil">
				                    </c:when>
				                    <c:otherwise>
				                    	<a href="obtener_usuario?nombre=${usuario.getCorreo()}">
				                    </c:otherwise>
				                </c:choose>
				                    	<c:choose>
				                    		<c:when test="${usuario.getImagen()!=null}">
				                    			<img src="${pageContext.request.contextPath}/cargar_imagen">
				                    		</c:when>
				                    		<c:otherwise>
				                    			<img src="assets/img/demo/u7.jpg" alt="">
				                    		</c:otherwise>
				                    	</c:choose>	
				                    	</a>     
		                    </figure>
		                  	<div>
		                        <h4 class="p-t-10">${usuario.getNombre()}</h4>
		                    </div>
		                </div>
		            </div>
		         </c:forEach>   
		         </div>
             </section>
              
            <!--New Releases-->
            <section class="section">
                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
	                    <div class="mb-4">
	                        <h2 style="color:orange;">Listas de Reproducción</h2> 
	                    </div>
	                    <c:choose>
	                    	<c:when test="${listas.isEmpty()}">
                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
                    			<p style="color:black">..........................</p>	
                    		</c:when>
                    		<c:otherwise>
			                    <a style="text-align:right;" 
		                    		href="VerMas?tipo=ListaRep&nombre=${busqueda}" >Ver más
		                    		<i class="icon-angle-right ml-3"></i>
			                    </a> 
		                    </c:otherwise>
	                    </c:choose>     
                </div>
               <div class="row has-items-overlay" >
               		<c:forEach var="lista" items="${listas}" >
							<div class="col-lg-3 col-md-4 col-sm-6 my-2" style="top:20px;">
								<figure>
									<div class="img-wrapper">
										<img src="assets/img/demo/a1.jpg" alt="/">
										<div class="img-overlay text-white text-center">
											<a href="obtener_info_lr?nombre=${lista.getNombre()}" >
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
							
                    	</div>
					</c:forEach>                   
               </div> 
               </section>
              
               <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
                    <div class="mb-4">
                        <h2 style="color:orange;">Canciones</h2>
                    </div>
                    <c:choose>
                    	<c:when test="${canciones.isEmpty()}">
                   			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
                   			<p style="color:black">..........................</p>	
                   		</c:when>
                   		<c:otherwise>
		                    <a style="text-align:right;" 
	                    		href="VerMas?tipo=cancion&nombre=${busqueda}" >Ver más
	                    		<i class="icon-angle-right ml-3"></i>
		                    </a> 
	                    </c:otherwise>
                    </c:choose> 
                </div>
               <div class="p-3 p-lg-5">
					<!--New Releases-->
					<section>
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
																	<h6>${cancion.getTitulo()}</h6>${cancion.getGenero()}
																</div>
																<span class="ml-auto">${cancion.getGenero()}</span>
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																<a href="anyadir_cancion_fav?idAudio=${cancion.getId()}" class="btn-favorito icon-star active" ></a>
																<a href="#" class="btn-icono icon-list-1" onclick="('${listaslr.size()}','${cancion.getId()}');
																document.getElementById('overlay-anadir-listas-reproduccion').classList.add('active')"
																	></a>
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
					</section>
					<!--@New Releases-->
				</div>
				<section class="section">
	                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
		                    <div class="mb-4">
		                        <h2 style="color:orange;">Transmisiones</h2> 
		                    </div>
		                    <c:choose>
		                    	<c:when test="${transmisiones.isEmpty()}">
	                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
	                    			<p style="color:black">........................</p>	
	                    		</c:when>
	                    		<c:otherwise>
				                    <a style="text-align:right;" 
			                    		href="VerMas?tipo=transmision&nombre=${busqueda}" >Ver más
			                    		<i class="icon-angle-right ml-3"></i>
				                    </a> 
			                    </c:otherwise>
		                    </c:choose>     
	                </div>
	                <div class="p-3 p-lg-5">
					<section>
						<div class="row">
							<div class="col-lg-10 offset-lg-1">
								<div class="row">
									<div class="col-md-12">
										<div class="playlist">
											<ul id="playlist" class="playlist list-group">
												<c:forEach var="cancion" items="${transmisiones}">                    
													<div style="margin-bottom: -1px;" class="cancion">
														<li class="list-group-item my-1">																
															<div class="d-flex align-items-center">
																<div class="col-1">
																	<a class="no-ajaxy media-url" href="${cancion.getUrl()}">
																		<i class="icon-play s-28"></i>
																	</a>					
																</div>
																<div class="col-6">
																	<h6>${cancion.getNombre()}</h6><c:if test="${cancion.getActiva()}">En directo!</c:if>
																</div>
																
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																
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
					</section>
				</div>
	           </section>
				 
				<section class="section">	
					<div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
	                    <div class="mb-4">
	                        <h2 style="color:orange;">Podcasts</h2>
	                    </div>
	                    <c:choose>
	                    	<c:when test="${podcasts.isEmpty()}">
                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
                    			<p style="color:black">....................</p>	
                    		</c:when>
                    		<c:otherwise>
			                    <a style="text-align:right;" 
		                    		href="VerMas?tipo=podcast&nombre=${busqueda}" >Ver más
		                    		<i class="icon-angle-right ml-3"></i>
			                    </a> 
		                    </c:otherwise>
	                    </c:choose> 
                	</div>
                	<div class="row has-items-overlay" >
               		<c:forEach var="podcast" items="${podcasts}" >
							<div class="col-lg-3 col-md-4 col-sm-6 my-2" style="top:20px;">
								<figure>
									<div class="img-wrapper">
										<img src="assets/img/demo/a1.jpg" alt="/">
										<div class="img-overlay text-white text-center">
											<a href="obtener_info_lr?nombre=${lista.getNombre()}" >
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
							
                    	</div>
					</c:forEach>                   
               </div> 
                </section>
                <section class="section">
	                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
		                    <div class="mb-4">
		                        <h2 style="color:orange;">Capitulos</h2> 
		                    </div>
		                    <c:choose>
		                    	<c:when test="${capitulos.isEmpty()}">
	                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
	                    			<p style="color:black">....................</p>	
	                    		</c:when>
	                    		<c:otherwise>
				                    <a style="text-align:right;" 
			                    		href="VerMas?tipo=capitulo&nombre=${busqueda}" >Ver más
			                    		<i class="icon-angle-right ml-3"></i>
				                    </a> 
			                    </c:otherwise>
		                    </c:choose>    
	                </div>
	                <div class="p-3 p-lg-5">
					<section>
						<div class="row">
							<div class="col-lg-10 offset-lg-1">
								<div class="row">
									<div class="col-md-12">
										<div class="playlist">
											<ul id="playlist" class="playlist list-group">
												<c:forEach var="cancion" items="${capitulos}">                    
													<div style="margin-bottom: -1px;" class="cancion">
														<li class="list-group-item my-1">																
															<div class="d-flex align-items-center">
																<div class="col-1">
																	<a class="no-ajaxy media-url" href="${cancion.getUrl()}">
																		<i class="icon-play s-28"></i>
																	</a>					
																</div>
																<div class="col-6">
																	<h6>${cancion.getTitulo()}</h6>${cancion.getGenero()}
																</div>
																<span class="ml-auto">${cancion.getGenero()}</span>
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																<a href="anyadir_cancion_fav?idAudio=${cancion.getId()}" class="btn-favorito icon-star active" ></a>
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
					</section>
				</div>
	           </section>
        </div>
    </div>
</div>



</main><!--@Page Content-->
</div><!--@#app-->

<!-- AÑADIR CANCION A LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-anadir-listas-reproduccion">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-anadir-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>			
			<!-- Input -->
				<div class="body">
					<div class="row has-items-overlay">
						<c:forEach var="listalr" items="${listaslr}">
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
								<input type="hidden" name="tipo" value="ListRep">
							</form>	
						</div>
					</c:forEach>
				<!-- #END# Input -->
				</div>
			</div>		
	</div>
</div>
<!-- END AÑADIR CANCION A LISTA DE REPRODUCCIÓN -->
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
	<script>
    function rellenarCampos(size,song) {
    	var i;
    	for (i=0; i <size; i++){
    	  	document.getElementsByName("idAudio")[i].value = song;
    	}

    }
    </script>


</body>

</html>