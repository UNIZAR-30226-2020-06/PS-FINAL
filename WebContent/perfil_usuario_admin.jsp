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
String nombre = (String) request.getParameter("nombre");
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
            <li><a class="ajaxifyPage active" href="perfil_admin" >
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
            
        </ul>
    </div>
</aside>
<!-- END MENU DE LA IZQUIERDA-->

<!-- MENU DONDE ESTAN LAS CANCIONES EN LA COLA (DERECHA) -->
<aside class="control-sidebar fixed ">
    <div class="slimScroll">
        <div class="sidebar-header" style="margin-bottom: 1rem !important;">
            <h4>Comentarios</h4>
            <a href="#" data-toggle="control-sidebar" class="paper-nav-toggle  active"><i></i></a>
        </div>
        <div class="p-3">
            <div class="media my-5 " style="margin-top: -1rem !important;margin-bottom: 2rem !important;">
                <div class="media-body">
                    <h6 class="mt-0">Ami Fro</h6>
                    Cras sit amet nibh libero, in gravida nulla.
                </div>
            </div>
            <div class="media my-5 " style="margin-top: -1rem !important;margin-bottom: 2rem !important;">
                <div class="media-body">
                    <h6 class="mt-0">Mohamed secame</h6>
                    Basura es esta?
                </div>
            </div>
            
			<div class="row">
                 <div class="col-lg-12">
                     <div class="form-group">
                         <div class="form-line">
                               <textarea style="color: white;" rows="5" class="form-control r-0"
                                         placeholder="Escribir comentario..."></textarea>
                         </div>
                     </div>

                 </div>
             </div>
             <div class="row text-center">
                 <div class="col-lg-12"><input type="submit" class="btn btn-primary"
                                               value="Publicar" style="border-radius: 7px;position: relative;left: 95px;"></div>
             </div>
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
            <a class="navbar-brand d-none d-lg-block" href="perfil_admin" >
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="perfil_admin" ><img  src="assets/img/logo.png"></a>
                </div>
            </a>
        </div>
        <h2 style="color:black">ADMINISTRADOR</h2>
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
								<a class="ajaxifyPage" href="perfil_admin" >
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
				<button style="position: absolute;left: 10px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3" id="abrir-popup-perfil"><i class="icon-edit  s-24"></i>Editar perfil</button>
				<button style="position: absolute;left: 130px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3" id="abrir-popup-cuenta"><i class="icon-cog  s-24"></i>Cambiar contraseña</button>
                <button style="position: absolute;left: 280px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3"
                		onClick="document.getElementById('overlay-borrar-usuario').classList.add('active')"><i class="icon-trash  s-24"></i>Borrar Cuenta</button>
                <div class="text-center p-5 mt-5">
					
                    <figure style="width: 130px;height: 130px;width-max: 50%;" class="avatar avatar-xl">
                    	<c:choose>
                    		<c:when test="${usuario.getImagen()!=null}">
                    			<img src="${usuario.getImagen()}">
                    		</c:when>
                    		<c:otherwise>
                    			<img src="assets/img/fondo1.jpg">
                    		</c:otherwise>
                    	</c:choose>
                    </figure>
                    <div>
                        <h4 class="p-t-10">${usuario.getNombre()}</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
				
                <div class="p-4">
                    <div class="pl-4 mt-4">
                        <h5>Descripción</h5>
						<span>${usuario.getDescripcion()}</span>
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
																if(pagina == 4) {%>
																<a class="no-ajaxy media-url" href="${cancion.getUrl()}">
																	<i id="iconoPlay" class="icon-play s-28"></i>
																</a>
																<%} else {%>
																<a href="obtener_contenido_perfil?pagina=4" onclick="setTimeout(location.reload.bind(location), 1)">
																	<i id="iconoPlay" class="icon-play s-28"></i>
																</a>
																<%} %>				
															</div>
															<div class="col-6">
																<h6>${cancion.getTitulo()}</h6>${cancion.getGenero()}
															</div>
															<a href="#" data-toggle="control-sidebar" onclick="document.getElementById('audioIDcomment').value = '${cancion.getId()}';">
										                        <i style="position: relative;left: 10px;" class="icon-commenting-o s-24"></i>
										                    </a>
															<div class="ml-auto">																
																<a href="${pageContext.request.contextPath}/ir_modificar?id_audio=${cancion.getId()}&cancion=true&pagina=<%=pagina %>" class="btn-icono icon-pencil" ></a>
																<a href="${pageContext.request.contextPath}/eliminar_cancion?id_cancion=${cancion.getId()}&pagina=<%=pagina %>" class="btn-icono icon-trash-o" ></a>
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
										<img src=${listalr.getImagen() } alt="/">
										<div class="img-overlay text-white text-center">
											<a href="obtener_info_lr?nombre=${listalr.getNombre()}&pagina=<%=pagina %>" >
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
								<div class="contenido-pestanas" style="text-align: center;">
		                            <button class="btn btn-abrir-popup-lista icon-trash-o" 
		                            onclick="document.getElementById('idLista6').value = '${listalr.getNombre()}';
		                            document.getElementById('overlay-borrar-listas-reproduccion').classList.add('active');"></button>
                       			</div>
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
										<ul id="playlist" class="playlist list-group">
											<c:forEach var="capitulo" items="${capitulos}">                    
												<div style="margin-bottom: -1px;" class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<%
																if(pagina == 7) {%>
																<a class="no-ajaxy media-url" href="${capitulo.getUrl()}">
																	<i id="iconoPlay" class="icon-play s-28"></i>
																</a>
																<%} else {%>
																<a href="obtener_contenido_perfil?pagina=7" onclick="setTimeout(location.reload.bind(location), 1)">
																	<i id="iconoPlay" class="icon-play s-28"></i>
																</a>
																<%} %>					
															</div>
															<div class="col-6">
																<h6>${capitulo.getTitulo()}</h6>${capitulo.getGenero()}
															</div>
															<a href="#" data-toggle="control-sidebar" onclick="document.getElementById('audioIDcomment').value = '${capitulo.getId()}';">
										                        <i style="position: relative;left: 10px;" class="icon-commenting-o s-24"></i>
										                    </a>
															<div class="ml-auto">
																<a href="${pageContext.request.contextPath}/ir_modificar?id_audio=${capitulo.getId()}&cancion=false&pagina=<%=pagina %>" class="btn-icono icon-pencil" ></a>
																<a href="${pageContext.request.contextPath}/eliminar_capitulo?id_capitulo=${capitulo.getId()}&pagina=<%=pagina %>" class="btn-icono icon-trash-o" ></a>
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
										<img src=${podcast.getImagen() } alt="/">
										<div class="img-overlay text-white text-center">
											<a href="obtener_info_podcast?nombre=${podcast.getNombre()}&pagina=<%=pagina %>" >
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
								<div class="contenido-pestanas" style="text-align: center;">
		                            <button class="btn btn-abrir-popup-lista icon-trash-o" 
		                            onclick="document.getElementById('idPodcast8').value = '${podcast.getNombre()}';
		                            document.getElementById('overlay-borrar-podcast').classList.add('active');"></button>
                       			</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- END  PODCAST -->
			</div>
		</div>
	</div>
	<!-- END TABLA -->
</div>
<!-- END CABECERA CON LA INFORMACION DEL USUARIO -->

<!--  BORRAR USUARIO -->
	<div class="overlay-pop-up" id="overlay-borrar-usuario">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-usuario').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="eliminar_user" method="post">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar este usuario, y todas sus aportaciones</h5>	
					</header>	
		
					<input type="hidden" name="idUser" value="${usuario.getId()}">
					<input type="submit" value="Aceptar">	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!--  END BORRAR USUARIO -->
<!-- BORRAR PODCAST -->	
	<div class="overlay-pop-up" id="overlay-borrar-podcast">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-podcast').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lista_admin" method="post">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar este podcast para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idPodcast8" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo8" value="podcast">	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR PODCAST -->
<!-- BORRAR LISTA DE REPRODUCCIÓN -->	
	<div class="overlay-pop-up" id="overlay-borrar-listas-reproduccion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lista_admin">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar esta lista de reproduccion para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idLista6" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo6" value="ListaRep">	
					<a id="submit6" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR LISTA DE REPRODUCCIÓN -->
<!-- BORRAR COMENTARIO DE CANCION -->	
	<div class="overlay-pop-up" id="overlay-borrar-coment-cancion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-coment-cancion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-coment-cancion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_coment_cancion">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>Vas a borrar este comentario.</h3>
	                    <h5>¿Estás seguro?</h5>	
					</header>	
		
					<input type="hidden" id="comentarioID" name=idComentario value="">	
					<a id="borrarComentario" href="#" onclick="document.getElementById('overlay-borrar-coment-cancion').classList.remove('active');" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>
				</div>	
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR COMENTARIO DE CANCION -->





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
    <script>
    function rellenarCamposP(size,song) {
    	var i;
    	for (i=0; i <size; i++){
    	  	document.getElementsByName("idAudioP")[i].value = song;
    	}
    }
    </script>
    <script>
    $(document).ready(function() {
    	$('#iconoPlay').replaceWith("<i id='iconoPlay' class='icon-play s-28'></i>")
    	$('#playlist a').click(function(event) { // cargar los comentarios de cancion
			var audioId = $('#audioIDcomment').val();
			console.log(audioId);
			$.get('getall_coment_cancion', {
				idAudio: audioId
			}, function(data){
				$('#listaComentariosCancion').html(data);
			});
		});

    });
    </script>
    
    </main><!--@Page Content-->
</div><!--@#app-->

<script>
    $(document).ready(function() {
    	$('#iconoPlay').replaceWith("<i id='iconoPlay' class='icon-play s-28'></i>")
    	$('#playlist a').click(function(event) { // cargar los comentarios de cancion
			var audioId = $('#audioIDcomment').val();
			console.log(audioId);
			$.get('getall_coment_cancion', {
				idAudio: audioId
			}, function(data){
				$('#listaComentariosCancion').html(data);
			});
		});
    	$('#publicar').click(function(event) { // publicar comentario en cancion
			var textarea = $('#textarea').val();
			var audioId = $('#audioIDcomment').val();
			var idUsuarioVar = <%=session.getAttribute("id")%>;
			console.log(textarea);
			console.log(audioId);
			console.log(idUsuarioVar);
			if(textarea != ""){
				$.get('anyadir_coment_cancion', {
					descripcion : textarea,
					idUsuario : idUsuarioVar,
					idAudio: audioId
				}, function(){
					document.getElementById('textarea').value="";
					$('.playlist a').ready(function(event) { // cargar los comentarios de cancion
						var audioId = $('#audioIDcomment').val();
						console.log(audioId);
						$.get('getall_coment_cancion', {
							idAudio: audioId
						}, function(data){
							$('#listaComentariosCancion').html(data);
						});
					});
				});
			}
		});
    	$('#borrarComentario').click(function(event) { // borrar comentario en cancion
			var idComentario = $('#comentarioID').val();
			console.log(idComentario);
			$.get('borrar_coment_cancion', {
				idComentario: idComentario
			}, function(responseText){
				$('#contenido').html(responseText);
			});
		});
    });
    </script>

</body>
</html>