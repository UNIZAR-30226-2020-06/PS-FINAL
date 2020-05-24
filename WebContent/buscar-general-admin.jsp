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
            <li><a class="ajaxifyPage active" href="perfil_admin?pagina=10" >
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
        </ul>
    </div>
</aside>
<!-- ACABA MENU DE LA IZQUIERDA-->

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
            <a class="navbar-brand d-none d-lg-block" href="perfil_admin?pagina=10" >
                <div class="d-flex align-items-center s-14 l-s-2">
                    <a style="position: absolute;width: 12%;" href="perfil_admin?pagina=10" ><img  src="assets/img/logo.png"></a>
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
								<a class="ajaxifyPage" href="perfil_admin.jsp?pagina=10" >
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
<div class="container-fluid relative animatedParent animateOnce no-p">
    <div class="animated">
        <!--Banner Slider-->
       
        <!--@Banner Slider-->
        <div class="p-md-5 p-3  ">
        	<h1 style="color:black;text-align:center;">Resultados de "${busqueda}"</h1>
        	<!-- USUARIOS -->
        	<section class="section">
                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black; top:20px;">
	                    <div class="mb-4">
	                        <h2 style="color:orange;">Usuarios</h2> 
	                    </div>
	                    <c:choose>
	                    	<c:when test="${usuarios.isEmpty()}">
	                    		<h2 style="color:orange;text-align:center;">No hay resultados</h2>
                    		</c:when>
                    		<c:otherwise>
			                    <a style="text-align:right;" 
		                    		href="VerMas?tipo=usuario&nombre=${busqueda}&pagina=10" >Ver más
		                    		<i class="icon-angle-right ml-3"></i>
			                    </a> 
		                    </c:otherwise>
	                    </c:choose>      
                </div>
                <%String id = (String)request.getSession().getAttribute("id");
                  String nombre = (String)request.getSession().getAttribute("nombre");
                 %>
                <div class="row no-gutters">
               	<c:forEach var="usuario" items="${usuarios}"> 
		            <div class="col-md-4 b-r">
		                <div class="text-center p-5 mt-5">
		                    <figure class="avatar avatar-xl">		                    	
				                    <a href="obtener_usuario?nombre=${usuario.getId()}&pagina=10">				                    
				                    	<c:choose>
				                    		<c:when test="${usuario.getImagen()!=null}">
				                    			<img src=${usuario.getImagen() }>
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
             <!-- LISTAS REPRODUCCION -->
            <!--New Releases-->
            <section class="section">
                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
	                    <div class="mb-4">
	                        <h2 style="color:orange;">Listas de Reproducción</h2> 
	                    </div>
	                    <c:choose>
	                    	<c:when test="${listas.isEmpty()}">
                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>	
                    		</c:when>
                    		<c:otherwise>
			                    <a style="text-align:right;" 
		                    		href="VerMas?tipo=ListaRep&nombre=${busqueda}&pagina=10" >Ver más
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
										<img src=${lista.getImagen() } alt="/">
										<div class="img-overlay text-white text-center">
							                 <a href="obtener_info_lr_usuario?id=${lista.getId()}&pagina=10">
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
              <!--  CANCIONES -->
               <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
                    <div class="mb-4">
                        <h2 style="color:orange;">Canciones</h2>
                    </div>
                    <c:choose>
                    	<c:when test="${canciones.isEmpty()}">
                   			<h2 style="color:orange;text-align:center;">No hay resultados</h2>	
                   		</c:when>
                   		<c:otherwise>
		                    <a style="text-align:right;" 
	                    		href="VerMas?tipo=cancion&nombre=${busqueda}&pagina=10" >Ver más
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
																<a href="#" data-toggle="control-sidebar" onclick="document.getElementById('audioIDcomment').value = '${cancion.getId()}';">
											                        <i style="position: relative;left: 10px;" class="icon-commenting-o s-24"></i>
											                    </a>
															<div class="ml-auto">
																<a href="${pageContext.request.contextPath}/ir_modificar?id_audio=${cancion.getId()}&cancion=true&pagina=10" class="btn-icono icon-pencil" ></a>
																<a href="${pageContext.request.contextPath}/eliminar_cancion?id_cancion=${cancion.getId()}&pagina=10" class="btn-icono icon-trash-o" ></a>
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
				<!--  TRANSMISIONES -->
				<section class="section">
	                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
		                    <div class="mb-4">
		                        <h2 style="color:orange;">Transmisiones</h2> 
		                    </div>
		                    <c:choose>
		                    	<c:when test="${transmisiones.isEmpty()}">
	                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
	                    		</c:when>
	                    		<c:otherwise>
				                    <a style="text-align:right;" 
			                    		href="VerMas?tipo=transmision&nombre=${busqueda}&pagina=10" >Ver más
			                    		<i class="icon-angle-right ml-3"></i>
				                    </a> 
			                    </c:otherwise>
		                    </c:choose>     
	                </div>
		                <div class="row has-items-overlay" >
		               		<c:forEach var="transmision" items="${transmisiones}" >
									<div class="col-lg-3 col-md-4 col-sm-6 my-2" style="top:20px;">
										<figure>
											<div class="img-wrapper">
												<img src="assets/img/demo/a1.jpg" alt="/">
												<div class="img-overlay text-white text-center">
													<a href="ver_transmision?idTransmision=${transmision.getId()}&pagina=10">
														<div class="figcaption mt-3">
															<i class="icon-link s-48"></i>
															<h5 class="mt-5">${transmision.getNombre()}</h5>
														</div>
													</a>
												</div>
												<div class="figure-title text-center p-2">
													<h5>${transmision.getNombre()}</h5>
												</div>
											</div>
										</figure>
		                    	</div>
							</c:forEach>                   
		                </div> 
                	</section>
                <!-- PODCASTS -->	
				<section class="section">	
					<div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
	                    <div class="mb-4">
	                        <h2 style="color:orange;">Podcasts</h2>
	                    </div>
	                    <c:choose>
	                    	<c:when test="${podcasts.isEmpty()}">
                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
                    		</c:when>
                    		<c:otherwise>
			                    <a style="text-align:right;" 
		                    		href="VerMas?tipo=podcast&nombre=${busqueda}&pagina=10" >Ver más
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
										<img src=${podcast.getImagen() } alt="/">
										<div class="img-overlay text-white text-center">
							                    <a href="obtener_info_podcast_usuario?id=${podcast.getId()}&pagina=10">
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
               <!--  CAPITULOS  -->
                </section>
                <section class="section">
	                <div class="d-flex relative align-items-center justify-content-between" style="background-color:black;">
		                    <div class="mb-4">
		                        <h2 style="color:orange;">Capitulos</h2> 
		                    </div>
		                    <c:choose>
		                    	<c:when test="${capitulos.isEmpty()}">
	                    			<h2 style="color:orange;text-align:center;">No hay resultados</h2>
	                    		</c:when>
	                    		<c:otherwise>
				                    <a style="text-align:right;" 
			                    		href="VerMas?tipo=capitulo&nombre=${busqueda}&pagina=10" >Ver más
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
																<h6>${capitulo.getTitulo()}</h6>${capitulo.getGenero()}
															</div>
																<a href="#" data-toggle="control-sidebar">
											                        <i style="position: relative;left: 10px;" class="icon-commenting-o s-24"></i>
											                    </a>															
															<div class="ml-auto">																
																<a href="${pageContext.request.contextPath}/ir_modificar?id_audio=${capitulo.getId()}&cancion=false&pagina=10" class="btn-icono icon-pencil" ></a>
																<a href="${pageContext.request.contextPath}/eliminar_capitulo?id_capitulo=${capitulo.getId()}&pagina=10" class="btn-icono icon-trash-o" ></a>
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
				</div>
	           </section>
        </div>
    </div>
</div>

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