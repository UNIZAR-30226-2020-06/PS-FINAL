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

<body background="assets/img/fondo3.png" style="background-size: cover;background-repeat: no-repeat; background-position: center center;background-attachment: fixed;" class="sidebar-mini sidebar-collapse sidebar-expanded-on-hover" style="display: none;">
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
                    <i class="icon icon-compact-disc-1 s-24"></i> <span>Mis listas de reproduccion</span>
                </a>
            </li>
            
            <li><a class="ajaxifyPage" href="mostrar_podcasts?tipo=podcast&pagina=<%=pagina %>" >
                    <i class="icon icon-headphones s-24"></i> <span>Mis podcasts</span>
                </a>
            </li>
            <li><a class="ajaxifyPage" href="obtener_info_fav?pagina=<%=pagina %>">
            		<i class="icon icon-star s-24"></i> <span>Mis favoritos</span>
            	</a>
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
        	
            <form action="anyadir_coment_cancion">
			<div class="row">
                 <div class="col-lg-12">
                     <div class="form-group">
                         <div class="form-line">
                               <textarea id="textarea" style="color: white;" rows="5" class="form-control r-0"
                                         placeholder="Escribir comentario..."></textarea>
                         </div>
                     </div>

                 </div>
             </div>
             <input type="hidden" id="audioIDcomment" name="nombre" value="">
             <div class="row text-center">
                 <div class="col-lg-12">
                 	<a id="publicar" href="#"  class="btn btn-primary" style="border-radius: 7px;position: relative;left: 95px;">Publicar</a>
                 </div>
             </div>
             </form>
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

<!-- Obtener datos usuario -->
<% 
String hayfoto = (String) session.getAttribute("hayfoto");

String nombre = (String) session.getAttribute("nombre");
String descripcion = (String) session.getAttribute("descripcion");
String email = (String) session.getAttribute("email");
String imagen = (String) session.getAttribute("imagen");
%>
<!-- END Obtener datos usuario -->

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
								<a class="ajaxifyPage" href="${pageContext.request.contextPath}/obtener_contenido_perfil?pagina=<%=pagina %>" >
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



<!--CONTENIDO NO AJAX-->
<main id="pageContent" class="page has-sidebar">
<div class="container-fluid relative animatedParent animateOnce p-lg-5">
	<!-- CABECERA CON LA INFORMACION DEL USUARIO -->											 
    <div class="card no-b shadow no-r">
        <div class="row no-gutters">
			<div class="col-md-4 b-r">
				<button style="position: absolute;left: 10px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3" id="abrir-popup-perfil"><i class="icon-edit  s-24"></i>Editar perfil</button>
				<button style="position: absolute;left: 130px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3" id="abrir-popup-cuenta"><i class="icon-cog  s-24"></i>Cambiar contraseña</button>
                <button id="abrir-popup-eliminar" style="position: absolute;left: 280px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3"
                		onClick="document.getElementById('overlay-eliminar-cuenta').classList.add('active');"><i class="icon-trash  s-24"></i>Borrar Cuenta</button> 
                <div class="text-center p-5 mt-5">
					
                    <figure style="width: 130px;height: 130px;width-max: 50%;" class="avatar avatar-xl">
                    	<%if (hayfoto!=null){ %>
                    	<img src=<%=imagen %>>
                    	<%} else {%>
                    	<img src="assets/img/fondo1.jpg">
                    	<%} %>
                    </figure>
                    <div>
                        <h4 class="p-t-10" id="nombreUsuario"><%=nombre%></h4>
                    </div>
                    <a href="#" class="btn btn-abrir-popup btn-sm  mt-3" id="abrir-popup-foto">Cambiar foto</a>
                </div>
            </div>
            <div class="col-md-8">
				
                <div class="p-4">
                    <div class="pl-4 mt-4">
                        <h5>Descripción</h5>
						<span id="descripcionUsuario"><%=descripcion %></span>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="p-4">
                                <a href="#w3-tab3" ><h5>Seguidores</h5></a><h6>${numSeguidores}</h6></a>
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
															<div>
																<h6 >LIKES</h6>
																<label id='${cancion.getId() }'>${cancion.getNumLikes() }</label>
															</div>
															<form action="like_audio">
																	<input type="hidden" id="numLikes" value="">
																	<input type="hidden" id="idAudioLike" name="idAudioLike" value="">
																	<input type="hidden" id="audioLike" name="audioLike" value="">
																	<c:choose>
																		<c:when test="${cancion.getLikeUsuario() == null}">
																				<a title="Like" href="#" id="accion_cancion_like" class="snackbar ml-3" 
																					onclick="document.getElementById('idAudioLike').value ='${cancion.getId()}';"																				
																					data-text="Te gusta esta canción"
																				   data-pos="top-right"
																				   data-showAction="true"
																				   data-actionText="ok"
																				   data-actionTextColor="#fff"
																				   data-backgroundColor="#0c101b">
																				   <i onclick="if(this.className == 'icon-thumbs-up s-24'){this.className='icon-thumbs-o-up s-24';} else{this.className='icon-thumbs-up s-24';document.getElementById('audioLike').value ='false';}"
																					   class="icon-thumbs-o-up s-24"></i>
																				</a>
																		</c:when>
																		<c:otherwise>
																				<a title="Like" href="#" id="accion_cancion_like" class="snackbar ml-3" 
																						onclick="document.getElementById('idAudioLike').value ='${cancion.getId()}';"	
																						data-text="Ya no te gusta esta canción"
																					   data-pos="top-right"
																					   data-showAction="true"
																					   data-actionText="ok"
																					   data-actionTextColor="#fff"
																					   data-backgroundColor="#0c101b">
																					   <i onclick="if(this.className == 'icon-thumbs-up s-24'){this.className='icon-thumbs-o-up s-24';document.getElementById('audioLike').value ='true';} else{this.className='icon-thumbs-up s-24';document.getElementById('audioLike').value ='false';}"
																					   class="icon-thumbs-up s-24"></i>
																				</a>
																		</c:otherwise>																	
																	</c:choose>
																</form>
															<a title="Comentarios" href="#" data-toggle="control-sidebar" onclick="document.getElementById('audioIDcomment').value = '${cancion.getId()}';">
										                        <i style="position: relative;left: 10px;" class="icon-commenting-o s-24"></i>
										                    </a>
															<div class="ml-auto">
																<a title="Favoritos" href="anyadir_cancion_fav?idAudio=${cancion.getId()}&pagina=<%=pagina %>" class="btn-favorito icon-star" ></a>
																<a title="Editar información" href="${pageContext.request.contextPath}/ir_modificar?id_audio=${cancion.getId()}&cancion=true&pagina=<%=pagina %>" class="btn-icono icon-pencil" ></a>
																<a title="Añadir a lista de reproducción" href="#" class="btn-icono icon-indent" onclick="rellenarCampos('${listaslr.size()}','${cancion.getId()}');
																document.getElementById('overlay-anadir-listas-reproduccion').classList.add('active');"
																	></a>
																<a href="#" 
																onclick="document.getElementById('cancionIDborrar').value = '${cancion.getId()}';
																document.getElementById('overlay-borrar-cancion').classList.add('active');" class="btn-icono icon-trash-o" ></a>
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
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus" id="abrir-listas-reproduccion"> Crear Lista de Reproducción</button>
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
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus" id="abrir-popup-capitulo"> Subir capítulo</button>
					</div>
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
															
															<div>
																<h6 >LIKES</h6>
																<label id='${capitulo.getId() }'>${capitulo.getNumLikes() }</label>
															</div>
															
															<form action="like_audio">
																	<input type="hidden" id="numLikes" value="">
																	<input type="hidden" id="idAudioLike" name="idAudioLike" value="">
																	<input type="hidden" id="audioLike" name="audioLike" value="">
																	<c:choose>
																		<c:when test="${capitulo.getLikeUsuario() == null}">
																				<a title="Like" href="#" id="accion_cancion_like" class="snackbar ml-3" 
																					onclick="document.getElementById('idAudioLike').value ='${capitulo.getId()}';"																				
																					data-text="Te gusta este capitulo"
																				   data-pos="top-right"
																				   data-showAction="true"
																				   data-actionText="ok"
																				   data-actionTextColor="#fff"
																				   data-backgroundColor="#0c101b">
																				   <i onclick="if(this.className == 'icon-thumbs-up s-24'){this.className='icon-thumbs-o-up s-24';} else{this.className='icon-thumbs-up s-24';document.getElementById('audioLike').value ='false';}"
																					   class="icon-thumbs-o-up s-24"></i>
																				</a>
																		</c:when>
																		<c:otherwise>
																				<a title="Like" href="#" id="accion_cancion_like" class="snackbar ml-3" 
																						onclick="document.getElementById('idAudioLike').value ='${capitulo.getId()}';"	
																						data-text="Ya no te gusta este capitulo"
																					   data-pos="top-right"
																					   data-showAction="true"
																					   data-actionText="ok"
																					   data-actionTextColor="#fff"
																					   data-backgroundColor="#0c101b">
																					   <i onclick="if(this.className == 'icon-thumbs-up s-24'){this.className='icon-thumbs-o-up s-24';document.getElementById('audioLike').value ='true';} else{this.className='icon-thumbs-up s-24';document.getElementById('audioLike').value ='false';}"
																					   class="icon-thumbs-up s-24"></i>
																				</a>
																		</c:otherwise>																	
																	</c:choose>
																</form>
															<a href="#" data-toggle="control-sidebar" onclick="document.getElementById('audioIDcomment').value = '${capitulo.getId()}';">
										                        <i style="position: relative;left: 10px;" class="icon-commenting-o s-24"></i>
										                    </a>
															<div class="ml-auto">
																<a href="${pageContext.request.contextPath}/ir_modificar?id_audio=${capitulo.getId()}&cancion=false&pagina=<%=pagina %>" class="btn-icono icon-pencil" ></a>
																<a href="#" class="btn-icono icon-indent" onclick="rellenarCamposP('${podcasts.size()}','${capitulo.getId()}');
																document.getElementById('overlay-anadir-podcast').classList.add('active');"></a>
																<a href="#" 
																onclick="document.getElementById('capituloIDborrar').value = '${capitulo.getId()}';
																document.getElementById('overlay-borrar-capitulo').classList.add('active');" class="btn-icono icon-trash-o" ></a>
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
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus" id="abrir-podcast" onClick="document.getElementById('overlay-podcast').classList.add('active');"> Crear Podcast </button>
					</div>
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
				<!-- TRANSMISONES -->
				<div class="tab-pane fade show text-center p-5" id="w3-tab5" role="tabpanel"
					 aria-labelledby="w3-tab5">
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus" id="abrir-iniciar-transmision" onClick="document.getElementById('overlay-iniciar-transmision').classList.add('active');"> Iniciar Transmision </button>
					</div>
				</div>
				<!-- END TRANSMISIONES -->
			</div>
		</div>
	</div>
	<!-- END TABLA -->
</div>
<!-- END CABECERA CON LA INFORMACION DEL USUARIO -->


<!-- Bloque de subir cancion-->
<div class="overlay-pop-up" id="overlay-subir-cancion">
    <div class="col-md-7 card p-5">
		<form class="form-material" action="subir_audio_cancion" method="post" enctype="multipart/form-data">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-subir-cancion" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
					<h3>SUBIR CANCIÓN</h3>
					<h5>Paso 1: subir el fichero .mp3 de la cancion</h5>
			</header>
			<div class="contenedor-inputs">
				<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName"> 
				<input type="text" name="titulo" id="titulo1" class="formulario-subir-cancion" placeholder="Título de la canción" required/>
				<select id="genero1" name="genero">
				   <c:forEach var="genero" items="${generos}">
				   		<option value="${genero.getId()}">${genero.getNombre()}</option>
				   </c:forEach>
				</select>
			</div>
			<input type="submit" class="btn btn-outline-primary btn-sm  mt-3" value="Subir Canción">
		</form>
	</div>
</div>
<!-- END Bloque de subir cancion-->

<!-- BORRAR CANCION -->
	<div class="overlay-pop-up" id="overlay-borrar-cancion">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-cancion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-cancion').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="eliminar_cancion">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estás seguro?</h3>	
	                    <h5>Vas a borrar esta canción de tu perfil.</h5>	
					</header>	
		
					<input type="hidden" id="cancionIDborrar" value="">
					<a id="borrarCancion" href="obtener_contenido_perfil?pagina=<%=pagina %>" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR CANCION -->

<!-- ELIMINAR CUENTA -->
	<div class="overlay-pop-up" id="overlay-eliminar-cuenta">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-eliminar-cuenta" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-eliminar-cuenta').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="eliminar_cuenta">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estás seguro?</h3>	
	                    <h5>Vas a borrar tu perfil.</h5>	
					</header>	
		
					<input type="hidden" id="cancionIDborrar" value="">
					<a id="eliminarCuenta" href="eliminar_cuenta?pagina=<%=pagina %>" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END ELIMINAR CUENTA -->


<!-- Bloque de subir capitulo-->
<div class="overlay-pop-up" id="overlay-subir-capitulo">
    <div class="col-md-7 card p-5">
		<form class="form-material" action="subir_audio_capitulo" method="post" enctype="multipart/form-data">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-subir-capitulo" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
					<h3>SUBIR CAPITULO DE  PODCAST</h3>
					<h5>Paso 1: subir el fichero .mp3 del capitulo podcast</h5>
			</header>
			<div class="contenedor-inputs">
				<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName">
				<input type="text" name="titulo" id="titulo1" class="formulario-subir-cancion" placeholder="Título de la canción" required/>
				<select id="genero1" name="genero">
				   <c:forEach var="genero" items="${categorias}">
				   		<option value="${genero.getId()}">${genero.getNombre()}</option>
				   </c:forEach>
				</select>
			</div>
			<input type="submit" class="btn btn-outline-primary btn-sm  mt-3" value="Continuar">
		</form>
	</div>
</div>
<!-- END Bloque de subir capitulo-->									 

<!-- BORRAR CAPITULO PODCAST -->
	<div class="overlay-pop-up" id="overlay-borrar-capitulo">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-capitulo" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-capitulo').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="eliminar_capitulo">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estás seguro?</h3>	
	                    <h5>Vas a borrar este capítulo de tu perfil.</h5>	
					</header>	
		
					<input type="hidden" id="capituloIDborrar" value="">
					<a id="borrarCapitulo" href="obtener_contenido_perfil?pagina=<%=pagina %>" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR CAPITULO PODCAST -->

<!-- CAMBIAR FOTO -->
<div class="overlay-pop-up" id="overlay-foto">
    <div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-foto" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
		<form class="form-material" action="modImagenUsuario" method=POST enctype=multipart/form-data>
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>SUBIR FOTO</h3>
				</header>
				<div class="contenedor-inputs">
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="imagen" accept="image/jpeg"> 
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
  <form class="form-material" action="crear_lr" method="post" enctype="multipart/form-data" name="fileinfo">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"
		onClick="document.getElementById('overlay-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR LISTAS DE REPRODUCCIÓN</h3>
				</header>
				<div class="contenedor-inputs" id="output">
					<label>Imagen</label>
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" id="file">
					<input type="text" name="nombre" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" name="descripcion" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
					<input type="hidden" name="tipo" id="tipo" value="ListaRep">
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR LISTA DE REPRODUCCIÓN -->

<!-- CREAR PODCAST -->
<div class="overlay-pop-up" id="overlay-podcast">					
    <div class="col-md-7 card p-5">
  <form class="form-material" action="crear_lr" method="post" enctype="multipart/form-data" name="fileinfo">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-listas-reproduccion" class="btn-cerrar-popup-perfil"
		onClick="document.getElementById('overlay-podcast').classList.remove('active');"><i class="icon-close1"></i></a>
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3>CREAR PODCAST</h3>
				</header>
				<div class="contenedor-inputs" id="output">
					<label>Imagen</label>
					<input type="file" class="btn btn-outline-primary btn-sm  mt-3" name="fileName" id="file">
					<input type="text" name="nombre" placeholder="Nombre" id="nombre-listas-reproduccion" required/>
					<input type="text" name="descripcion" placeholder="Descripcion" id="descripcion-listas-reproduccion"/>
					<input type="hidden" name="tipo" id="tipo" value="podcast">
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!-- END CREAR PODCAST -->

<!-- AÑADIR CANCION A LISTA DE REPRODUCCIÓN -->
<div class="overlay-pop-up" id="overlay-anadir-listas-reproduccion">
    <div class="col-md-7 card p-5" style="height: 485px;">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-anadir-listas-reproduccion" class="btn-cerrar-popup-perfil"
		class="btn btn-outline-primary btn-sm pl-4 pr-4" onclick="document.getElementById('overlay-anadir-listas-reproduccion').classList.remove('active');"><i class="icon-close1"></i></a>			
			<!-- Input -->
			
			<div class="body" style="height: 410px;">
				<div id="scrollLista" class="slimScroll">
					<div class="row has-items-overlay">
					<c:choose ><c:when test="${listaslr.isEmpty()}"><h2>Parece que no tienes ninguna lista...</h2></c:when>
						<c:otherwise>
						<c:forEach var="listalr" items="${listaslr}">
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
			
									<img src=${listalr.getImagen() } alt="/">
									
									<div class="figure-title text-center p-2">
										<h5>${listalr.getNombre()}</h5>
									</div>
								</div>
							</figure>
							<form class="form-material" action="anyadir_cancion_lr">
								<input type="hidden" name="idLista" id="idLista" value="${listalr.getId()}">
								<input type="hidden" name="idAudio" id="idAudio" value="">
								<input type="hidden" name="nombreLista" id="nombreLista" value="${listalr.getNombre()}">
								<input type="hidden" name="tipo" id="tipo2" value="ListaRep">
								<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Añadir">
							</form>	
						</div>
					</c:forEach>
					</c:otherwise></c:choose>
				<!-- #END# Input -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END AÑADIR CANCION A LISTA DE REPRODUCCIÓN -->

<!-- AÑADIR CAPITULO A PODCAST -->
<div class="overlay-pop-up" id="overlay-anadir-podcast">
    <div class="col-md-7 card p-5" style="height: 485px;">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-anadir-podcast" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>			
			<!-- Input -->
			<div class="body" style="height: 410px;">
				<div id="scrollLista" class="slimScroll">
					<div class="row has-items-overlay">
					<c:choose ><c:when test="${podcasts.isEmpty()}"><h2>Parece que no tienes ningun podcast...</h2></c:when>
						<c:otherwise>
						<c:forEach var="podcast" items="${podcasts}">
						<div class="col-lg-3 col-md-4 col-sm-6 my-2">
							<figure>
								<div class="img-wrapper">
			
									<img src=${podcast.getImagen() } alt="/">
									
									<div class="figure-title text-center p-2">
										<h5>${podcast.getNombre()}</h5>
									</div>
								</div>

							</figure>
							<form class="form-material" action="anyadir_cancion_lr">
								<input type="hidden" name="idLista" id="idLista2" value="${podcast.getId()}">
								<input type="hidden" name="idAudioP" id="idAudio2" value="">
								<input type="hidden" name="nombreLista" id="nombreLista2" value="${podcast.getNombre()}">
								<input type="hidden" name="tipo" id="tipo3" value="podcast">
								<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Añadir">

							</form>	
						</div>
					</c:forEach>
					</c:otherwise></c:choose>
				<!-- #END# Input -->
				</div>
			</div>	
		</div>	
	</div>
</div>
<!-- END AÑADIR CAPITULO A PODCAST -->

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
		
					<input type="hidden" id="idLista6" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo6" value="ListaRep">	
					<a id="submit6" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR LISTA DE REPRODUCCIÓN -->

<!-- BORRAR PODCAST -->	
	<div class="overlay-pop-up" id="overlay-borrar-podcast">	
	    <div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-borrar-podcast').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="borrar_lr" method="post">	
				<!-- Input -->	
				<div class="body">	
					<header class="relative nav-sticky card">	
	                    <h3>¿Estas seguro?</h3>	
	                    <h5>Vas a borrar este podcast para siempre, no hay vuelta atras</h5>	
					</header>	
		
					<input type="hidden" id="idPodcast8" name="nombre" value="">
					<input type="hidden" name="tipo" id="tipo8" value="podcast">	
					<a id="submit8" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">Aceptar</a>	
	             </div>   
				<!-- #END# Input -->	
	        </form>	
		</div>	
	</div>	
<!-- END BORRAR PODCAST -->

<!-- INICIAR TRANSMISION -->
<div class="overlay-pop-up" id="overlay-iniciar-transmision">	
		<div class="col-md-7 card p-5">	
	        <a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-borrar-listas-reproduccion" class="btn-cerrar-popup-perfil"	
	        class="btn btn-outline-primary btn-sm pl-4 pr-4"  onclick="document.getElementById('overlay-iniciar-transmision').classList.remove('active');"><i class="icon-close1"></i></a>	
			<form class="form-material" action="iniciar_transmision" method="post">
					<div class="p5 b-b">
						<input type="text" name="nombre" class="formulario-subir-cancion" placeholder="Nombre de la transmisión" required/>
						<input type="text" name="descripcion" class="formulario-subir-cancion" placeholder="Descripcion"/>
						<select id="estacion" name="estacion">
						   <c:forEach var="estacion" items="${estaciones}">
						   		<option value="${estacion.getUrl()}">${estacion.getUrl()}</option>
						   </c:forEach>
						</select>
					</div>
					<div class="p-4">
						<input type="submit" class="btn btn-outline-primary btn-sm  mt-3" value="INICIAR">
					</div>
			</form>
		</div>
</div>				
<!-- END INICIAR TRANSMISION -->

<!-- EDICION PERFIL -->
<div class="overlay-pop-up" id="overlay-perfil">
    <div class="col-md-7 card p-5">
			<a style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-perfil" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
			<header class="relative nav-sticky card">
				<h3>CAMBIAR INFORMACIÓN DE PERFIL</h3>
			</header>
			<form  action="modinfo">
				<!-- Input -->
				<div class="body">
					
					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" name="nombre" id="nombre" class="form-control" value="<%=nombre%>">
							<label class="form-label">Nombre de usuario</label>
						</div>
					</div>

					<div class="form-group form-float">
						<div class="form-line">
							<input type="text" name="descripcion" id="descripcion" class="form-control" value="<%=descripcion%>">
							<label class="form-label">Descripción</label>
						</div>
					</div>
					
					<div class="form-group form-float">
						<div class="form-line">
							<input type="email" name="email" id="email" class="form-control" value="<%=email%>">
							<label class="form-label">Email</label>
						</div>
					</div>
					<a id="submit1" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4">
						Cambiar información
					</a>
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
			<form  action="modpass"> <!--QUITAR-->
				<!-- Input -->
				<div class="body">
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena1" id="contrasena1" class="form-control">
							<label class="form-label">Contraseña actual</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena2" id="contrasena2" class="form-control">
							<label class="form-label">Contraseña nueva</label>
						</div>
					</div>
					<div class="form-group form-float">
						<div class="form-line">
							<input type="password" name="contrasena3" id="contrasena3" class="form-control">
							<label class="form-label">Confirmar contraseña</label>
						</div>
					</div>

					<a id="submit2" href="#" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						  >Cambiar constraseña</a>
				</div>
			</form>
			<!-- #END# Input -->
	</div>
</div>
<!-- END AJUSTES CUENTA -->

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


<!--/#app -->
<script src="https://maps.googleapis.com/maps/api/js?&amp;key=AIzaSyC3YkZNNySdyR87o83QEHWglHfHD_PZqiw&amp;libraries=places"></script>
<script src="assets/js/app.js"></script>
<script  src="assets/js/mostrar-popup.js"></script>
<script>
    $(document).ready(function() {
    	$('#borrarCapitulo').click(function(event) { // cargar los comentarios de cancion
			var capituloId = $('#capituloIDborrar').val();
			console.log(capituloId);
			$.get('eliminar_capitulo', {
				id_capitulo: capituloId
			}, function(data){
				$('#contenido').html(data);
			});
		});
    });
    </script>
 <script>
		function darbaja(){
			if (confirm("¿Estás seguro que quieres eliminar tu cuenta?\nEsta operación es irreversible. Todos tus datos y canciones se perderán.")){
					// eliminar usuario
				document.location.href="nombre_servlet";
			}
		}
	</script>
	<script>
    $(document).ready(function() {
    	$('#borrarCancion').click(function(event) { // cargar los comentarios de cancion
			var cancionId = $('#cancionIDborrar').val();
			console.log(cancionId);
			$.get('eliminar_cancion', {
				id_cancion: cancionId
			}, function(data){
				$('#contenido').html(data);
			});
		});
    });
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
    	  	console.log(song);
    	}
    }
    </script>
<script>
<%if(pagina!=4){%>
    $(document).ready(function() {
    	$('#submit1').click(function(event) { // cambiar info usuario
			var nombreVar = $('#nombre').val();
			var descripcionVar = $('#descripcion').val();
			var emailVar = $('#email').val();
			console.log(nombreVar);console.log(descripcionVar);console.log(emailVar);
			if(nombreVar != "" && emailVar != ""){
				$.get('modinfo', {
					nombre : nombreVar,
					descripcion : descripcionVar,
					email : emailVar
				}, function(responseText){
					$('#contenido').html(responseText);
					$('#nombreUsuario').text(nombreVar);
					$('#descripcionUsuario').text(descripcionVar);
				});
			}
			else{
				console.log("else");
				var contenido = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">";
				contenido = contenido + "<strong>Es necesario poner un nombre de usuario o email. </strong> Campo vacío.";
				contenido = contenido + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
				contenido = contenido + "<span aria-hidden='true'>&times;</span>";
				contenido = contenido + "</button>";
				contenido = contenido + "</div>";
				$('#contenido').html(contenido);
				document.getElementById('overlay-perfil').classList.remove('active');
			}
		});
    	$('#submit2').click(function(event) { // cambiar contraseña
			var contrasena1Var = $('#contrasena1').val();
			var contrasena2Var = $('#contrasena2').val();
			var contrasena3Var = $('#contrasena3').val();
			$.get('modpass', {
				contrasena1 : contrasena1Var,
				contrasena2 : contrasena2Var,
				contrasena3 : contrasena3Var
			}, function(responseText){
				$('#contenido').html(responseText);
				document.getElementById('overlay-cuenta').classList.remove('active');
			});
		});
    	
    	$('#submit4').click(function(event) { // añadir cancion a lista
			var idListaVar = $('#idLista').val();
			var idAudioVar = $('#idAudio').val();
			var nombreListaVar = $('#nombreLista').val();
			var tipoVar = $('#tipo2').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('anyadir_cancion_lr', {
				idLista : idListaVar,
				idAudio : idAudioVar,
				nombreLista : nombreListaVar,
				tipo : tipoVar
			},function(){
				location.href ="obtener_info_lr?nombre="+nombreListaVar+"&pagina=10";
			});
		});
    	$('#submit5').click(function(event) { // añadir capitulo a podcast
			var idListaVar = $('#idLista2').val();
			var idAudioVar = $('#idAudio2').val();
			var nombreListaVar = $('#nombreLista2').val();
			var tipoVar = $('#tipo3').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('anyadir_cancion_lr', {
				idListaP : idListaVar,
				idAudioP : idAudioVar,
				nombreLista : nombreListaVar,
				tipo : tipoVar
			});
		});
    	$('#submit6').click(function(event) { // borrar lista de reproduccion
			var idListaVar = $('#idLista6').val();
			var tipoVar = $('#tipo6').val();
			console.log(idListaVar);
			console.log(tipoVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('borrar_lr', {
				nombre : idListaVar,
				tipo : tipoVar
			}, function(){
				location.href ="mostrar_lrs?tipo=ListaRep&pagina=10";
			});
		});
    	
    	$('#submit8').click(function(event) { // borrar podcast
			var idListaVar = $('#idPodcast8').val();
			var tipoVar = $('#tipo8').val();
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
    <%}%>
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
		$("#scrollLista").slimscroll({
			height: "400px"
		});
    	$('#iconoPlay').replaceWith("<i id='iconoPlay' class='icon-play s-28'></i>");
    	$('#playlist a').click(function(event) { // cargar los comentarios de cancion
			var audioId = $('#audioIDcomment').val();
			console.log(audioId);
			$.get('getall_coment_cancion', {
				idAudio: audioId
			}, function(data){
				$('#listaComentariosCancion').html(data);
			});
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

<script>
	$(document).ready(function() {
	    $('#playlist a').click(function(event) {//dar like a un audio
		 	var audioId = $('#idAudioLike').val();
	        var like = $('#audioLike').val();
	        console.log(audioId);
	        console.log(like);
	        console.log(numLikes);
			$.get('like_audio', {
	           idAudio: audioId,
	            like : like
			}, function(){
				$.get('obtener_num_likes',{
					tipo : "Audio",
					idLike : audioId
				}, function(data){
					var id = '#' + audioId;
					$(id).text(data);
				});
			//	document.getElementById(audioId).innerHTML= ;
			});
	   });
	});
</script>

</main><!--@Page Content-->
</div><!--@#app-->

<script>
	$(document).ready(function() {
	    $('#playlist a').click(function(event) {//dar like a un audio
		 	var audioId = $('#idAudioLike').val();
	        var like = $('#audioLike').val();
	        console.log(audioId);
	        console.log(like);
	        console.log(numLikes);
			$.get('like_audio', {
	           idAudio: audioId,
	            like : like
			}, function(){
				$.get('obtener_num_likes',{
					tipo : "Audio",
					idLike : audioId
				}, function(data){
					var id = '#' + audioId;
					$(id).text(data);
				});
			});
	   });
	});
</script>

<script>
    $(document).ready(function() {
    	$("#scrollLista").slimscroll({
			height: "400px"
		});
    	$('#iconoPlay').replaceWith("<i id='iconoPlay' class='icon-play s-28'></i>");
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
			if(textarea.length <=0){
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
			else{
				console.log("else");
				var contenido = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">";
				contenido = contenido + "<strong>Ha ocurrido un error. </strong> Vuelva a intentarlo.";
				contenido = contenido + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
				contenido = contenido + "<span aria-hidden='true'>&times;</span>";
				contenido = contenido + "</button>";
				contenido = contenido + "</div>";
				$('#contenido').html(contenido);
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
<script>
<%if(pagina==4){%>
    $(document).ready(function() {
    	$('#submit1').click(function(event) { // cambiar info usuario
			var nombreVar = $('#nombre').val();
			var descripcionVar = $('#descripcion').val();
			var emailVar = $('#email').val();
			console.log(nombreVar);console.log(descripcionVar);console.log(emailVar);
			if(nombreVar != "" && emailVar != ""){
				$.get('modinfo', {
					nombre : nombreVar,
					descripcion : descripcionVar,
					email : emailVar
				}, function(responseText){
					$('#contenido').html(responseText);
					$('#nombreUsuario').text(nombreVar);
					$('#descripcionUsuario').text(descripcionVar);
				});
			}
			else{
				console.log("else");
				var contenido = "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">";
				contenido = contenido + "<strong>Es necesario poner un nombre de usuario o email. </strong> Campo vacío.";
				contenido = contenido + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
				contenido = contenido + "<span aria-hidden='true'>&times;</span>";
				contenido = contenido + "</button>";
				contenido = contenido + "</div>";
				$('#contenido').html(contenido);
			}
		});
    	$('#submit2').click(function(event) { // cambiar contraseña
			var contrasena1Var = $('#contrasena1').val();
			var contrasena2Var = $('#contrasena2').val();
			var contrasena3Var = $('#contrasena3').val();
			$.get('modpass', {
				contrasena1 : contrasena1Var,
				contrasena2 : contrasena2Var,
				contrasena3 : contrasena3Var
			}, function(responseText){
				$('#contenido').html(responseText);
			});
		});
    	
    	$('#submit4').click(function(event) { // añadir cancion a lista
			var idListaVar = $('#idLista').val();
			var idAudioVar = $('#idAudio').val();
			var nombreListaVar = $('#nombreLista').val();
			var tipoVar = $('#tipo2').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('anyadir_cancion_lr', {
				idLista : idListaVar,
				idAudio : idAudioVar,
				nombreLista : nombreListaVar,
				tipo : tipoVar
			},function(){
				location.href ="obtener_info_lr?nombre="+nombreListaVar+"&pagina=10";
			});
		});
    	$('#submit5').click(function(event) { // añadir capitulo a podcast
			var idListaVar = $('#idLista2').val();
			var idAudioVar = $('#idAudio2').val();
			var nombreListaVar = $('#nombreLista2').val();
			var tipoVar = $('#tipo3').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('anyadir_cancion_lr', {
				idLista : idListaVar,
				idAudioP : idAudioVar,
				nombreLista : nombreListaVar,
				tipo : tipoVar
			});
		});
    	$('#submit6').click(function(event) { // borrar lista de reproduccion
			var idListaVar = $('#idLista6').val();
			var tipoVar = $('#tipo6').val();
			console.log(idListaVar);
			console.log(tipoVar);
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('borrar_lr', {
				nombre : idListaVar,
				tipo : tipoVar
			}, function(){
				location.href ="mostrar_lrs?tipo=ListaRep&pagina=10";
			});
		});
    	
    	$('#submit8').click(function(event) { // borrar podcast
			var idListaVar = $('#idPodcast8').val();
			var tipoVar = $('#tipo8').val();
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
    <%}%>
    </script>
</body>
</html>