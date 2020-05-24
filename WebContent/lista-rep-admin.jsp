<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from xvelopers.com/demos/html/record-light/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 05 Apr 2020 17:21:29 GMT -->

<!--  
########################################################################
############### BASE DE TODAS LAS PAGINAS    ###########################
########################################################################
-->
<% 
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
        	<%if(pagina == 5){ %>
            <li><a class="ajaxifyPage active" href="perfil_admin?pagina=10" >
                    <i class="icon icon-home-1 s-24"></i> <span>Inicio</span>
                </a>
            </li>
            <%} else{%>
            <li><a class="ajaxifyPage active" href="perfil_admin?pagina=10" >
                    <i class="icon icon-home-1 s-24"></i> <span>Inicio</span>
                </a>
            </li>
            <%}%>
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
        </ul>
    </div>
</aside>
<!-- END MENU DE LA IZQUIERDA-->

<!-- MENU DONDE ESTAN LOS COMENTARIOS (DERECHA) -->
<aside class="control-sidebar fixed ">
    <div class="slimScroll">
        <div class="sidebar-header" style="margin-bottom: 1rem !important;">
            <h4>Comentarios</h4>
            <a href="#" data-toggle="control-sidebar" class="paper-nav-toggle  active"><i></i></a>
        </div>
        <div class="p-3">
        	<div id="listaComentariosCancion"></div>
        	

        </div>
    </div>
</aside>

<!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
<div class="control-sidebar-bg shadow  fixed"></div>
<!-- END MENU DONDE ESTAN LOS COMENTARIOS (DERECHA) -->


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
            <%if(pagina == 5){ %>
            <a class="navbar-brand d-none d-lg-block"href="perfil_admin?pagina=10">
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="perfil_admin?pagina=10" ><img  src="assets/img/logo.png"></a>
                </div>
            </a>
            <%} else{%>
            <a class="navbar-brand d-none d-lg-block" href="perfil_admin?pagina=10" >
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="perfil_admin?pagina=10" ><img  src="assets/img/logo.png"></a>
                </div>
            </a>
            <%}%>
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
								<%if(pagina == 5){ %>
					            <a class="ajaxifyPage" href="perfil_admin?pagina=10" >
									<i class="icon-user-4  s-24"></i>
									<div class="pt-1">Mi perfil</div>
								</a>
					            <%} else{%>
					            <a class="ajaxifyPage" href="perfil_admin?pagina=10" >
									<i class="icon-user-4  s-24"></i>
									<div class="pt-1">Mi perfil</div>
								</a>
					            <%}%>
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
<!-- END BARRA DE ABAJO -->

<!--  
########################################################################
############### ACABA BASE DE TODAS LAS PAGINAS    #####################
########################################################################
-->



<!-- LISTA DE REPRODUCCION-->
<!--Page Content-->
<main id="pageContent" class="page has-sidebar">
<div class="container-fluid relative p-lg-5">								
	<div class="container-fluid relative p-0">
		<div class="card no-b shadow no-r">				
				<div class="has-bottom-gradient">
						<div class="row pt-5 ml-lg-5 mr-lg-5">
							<div class="col-md-10 offset-1">
								<div class="row my-5 pt-5">

									<div class="col-md-3">
										<img src=${infoLista.getImagen() } alt="/">
									</div>
									<div class="col-md-9">
										<div class="d-md-flex align-items-center justify-content-between">
											<h1 class="my-3 text-orange">${infoLista.getNombre()}</h1>
											<div class="ml-auto mb-2">
												<a href="#" onClick="document.getElementById('overlay-foto').classList.add('active');" 
													class="btn btn-abrir-popup btn-sm  mt-3" id="abrir-popup-foto" style="position: relative;left: -4px;bottom: 13px;">Cambiar foto</a>
											    <a style="color: #fd7e14;position: relative;left: 10px;bottom: 13px;" 
													class="btn btn-abrir-popupl btn-sm  mt-3" 
													id="abrir-popup-lista"
													href="#"
													onclick="document.getElementById('overlay-mod-listas-reproduccion').classList.add('active');">
													<i class="icon-edit  s-24"></i>Editar
												</a>
												<a href="#" onClick="document.getElementById('overlay-borrar').classList.add('active');"
												   class="btn btn-abrir-popupl btn-sm  mt-3"
												   style="color: #fd7e14;position: relative;left: 10px;bottom: 13px;">
												   <i class="icon-trash s-24"></i>Borrar
												</a>
												
											</div>
											<!-- BORRAR LISTA DE REPRODUCCION -->
											<div class="overlay-pop-up" id="overlay-borrar">	
											    <div class="col-md-7 card p-5">	
											        <a style="position: absolute;top: 20px;right: 30px;" href="#" class="btn-cerrar-popup-perfil"	
											        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar').classList.remove('active');"><i class="icon-close1"></i></a>	
													<form class="form-material" action="borrar_lista_admin" method="post">	
														<!-- Input -->	
														<div class="body">	
															<header class="relative nav-sticky card">	
											                    <h3>Vas a borrar esta lista.</h3>
											                    <h5>¿Estás seguro?</h5>	
															</header>	
												
															<input type="hidden" id="id_lista" name=idLista value="${infoLista.getId()}">	
															<input type="submit" value="Aceptar">
														</div>	
														<!-- #END# Input -->	
											        </form>	
												</div>	
											</div>	
											<!-- END BORRAR LISTA DE REPRODUCCION -->
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
											<!-- AÑADIR CANCION A LISTA DE REPRODUCCI�N -->
											<div class="overlay-pop-up" id="overlay-anadir-listas-reproduccion">
											    <div class="col-md-7 card p-5">
													<a style="position: absolute;top: 20px;right: 30px;" href="#" onclick="document.getElementById('overlay-anadir-listas-reproduccion').classList.remove('active');" id="btn-cerrar-anadir-listas-reproduccion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>			
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
																			<input type="hidden" name="tipo" value="ListaRep">
																		</form>	
																	</div>
																</c:forEach>
															<!-- #END# Input -->
															</div>
														</div>		
												</div>
											</div>
											<!-- END AÑADIR CANCION A LISTA DE REPRODUCCI�N -->
											<!-- EDICION LISTA DE REPRODUCCION -->
											<div class="overlay-pop-up" id="overlay-mod-listas-reproduccion">
											    <div class="col-md-7 card p-5">
														<a style="position: absolute;top: 20px;right: 30px;" href="#" 
														class="btn-cerrar-popup-perfil"
														onclick="document.getElementById('overlay-mod-listas-reproduccion').classList.remove('active');">
															<i class="icon-close1"></i>
														</a>
														<header class="relative nav-sticky card">
															<h3>CAMBIAR INFORMACIÓN DE LISTA</h3>
														</header>
														<form  action="modlr" method="post">
															<!-- Input -->
															<div class="body">
																<input type="hidden" name="tipo" id="tipo" value="ListaRep">
																<div class="form-group form-float">
																	<div class="form-line">
																		<input type="text" name="nombreNew" id="nombreNew" class="form-control" value="${infoLista.getNombre()}">
																		<label class="form-label">Nombre</label>
																	</div>
																</div>
											
																<div class="form-group form-float">
																	<div class="form-line">
																		<input type="text" name="descripcion" id="descripcion" class="form-control" value="${infoLista.getDescripcion()}">
																		<label class="form-label">Descripción</label>
																	</div>
																</div>
																<input type="hidden" name="nombreOld" id="nombreOld" value="${infoLista.getNombre()}">
																<input type="hidden" name="idLista" value="${infoLista.getId()}">
																<input type="submit"class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Cambiar informacion">
															</div>
														</form>
														<!-- #END# Input -->
												</div>
											</div>
											<!-- END EDICION LISTA DE REPRODUCCION -->
											<!-- CAMBIAR FOTO -->
											<!-- CAMBIAR FOTO -->
											<div class="overlay-pop-up" id="overlay-foto">
											    <div class="col-md-7 card p-5">
													<a href="#" style="position: absolute;top: 20px;right: 30px;"
													 onClick="document.getElementById('overlay-foto').classList.remove('active');"  id="btn-cerrar-foto" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
													<form class="form-material" action="modImagenLista" method=POST enctype=multipart/form-data>
														<!-- Input -->
														<div class="body">
															<header class="relative nav-sticky card">
																<h3>SUBIR FOTO</h3>
															</header>
															<div class="contenedor-inputs">
																<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="imagen" accept="image/jpeg"> 
																<input type="hidden" name="idLista" id="idLista" value=${infoLista.getId() }>
															</div>
											
															<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
																   value="Aceptar">
														</div>
														<!-- #END# Input -->
													</form>
												</div>
											</div>
											
											<!-- END CAMBIAR FOTO -->											
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
										</div>
									
										<div class="text-orange my-2">
											<p>${infoLista.getDescripcion()}</p>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				<!--@Banner-->

				<div class="p-3 p-lg-5">
					<!--New Releases-->
					<section>
						<div class="row">
							<div class="col-lg-10 offset-lg-1">
								<div class="row">
									<div class="col-md-12">
										<div class="playlist">
											<ul id="playlist" class="playlist list-group">
												<c:forEach var="cancion" items="${audios}">                    
													<div style="margin-bottom: -1px;" class="cancion">
														<li class="list-group-item my-1">
															<div class="d-flex align-items-center">
																<div class="col-1">
																	<%if(pagina == 5) {%>
																	<a class="no-ajaxy media-url" href="${cancion.getUrl()}">
																		<i id="iconoPlay" class="icon-play s-28"></i>
																	</a>
																	<% } else {%>
																	<a href="obtener_info_lr_usuario?id=${idUsuario}&pagina=5" onclick="setTimeout(location.reload.bind(location), 1)">
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
																	<a href="${pageContext.request.contextPath}/ir_modificar?id_audio=${cancion.getId()}&cancion=true&pagina=10" class="btn-icono icon-pencil" ></a>
																	<a href="${pageContext.request.contextPath}/borrar_cancion_lr?idAudio=${cancion.getId()}&idLista=${infoLista.getId()}&nombreLista=${infoLista.getNombre()}&tipo=ListaRep&pagina=<%=pagina %>" class="btn-icono icon-trash-o" ></a>
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
					</section>
					<!--@New Releases-->
				</div>
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
<script>
    $(document).ready(function() {
    	$('#submit').click(function(event) {
			var tipoVar = $('#tipo').val();
			var nombreNewVar = $('#nombreNew').val();
			var descripcionVar = $('#descripcion').val();
			var nombreOldVar = $('#nombreOld').val();
			console.log(tipoVar);
			console.log(nombreNewVar);
			console.log(descripcionVar);
			console.log(nombreOldVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('modlr', {
				tipo : tipoVar,
				nombreNew : nombreNewVar,
				descripcion : descripcionVar,
				nombreOld : nombreOldVar
			});
		});
    	$('#submit2').click(function(event) {
			var idListaVar = $('#idLista').val();
			var idAudioVar = $('#idAudio').val();
			var nombreListaVar = $('#nombreLista').val();
			var tipoVar = $('#tipo').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('anyadir_cancion_lr', {
				idLista : idListaVar,
				idAudio : idAudioVar,
				nombreLista : nombreListaVar,
				tipo : tipoVar
			});
		});
    });
    </script>
</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>
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