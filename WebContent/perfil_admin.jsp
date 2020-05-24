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
				<li id="contenido"></li>
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
								<a class="ajaxifyPage" href="perfil_admin?pagina=10" >
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

<!-- Obtener datos usuario -->
<% 
String nombre = (String) session.getAttribute("nombre");
String descripcion = (String) session.getAttribute("descripcion");
String email = (String) session.getAttribute("email");
%>
<!-- END Obtener datos usuario -->

<!--CONTENIDO NO AJAX-->
<main id="pageContent" class="page has-sidebar">
<div class="container-fluid relative animatedParent animateOnce p-lg-5">
	<!-- CABECERA CON LA INFORMACION DEL USUARIO -->											 
    <div class="card no-b shadow no-r">
        <div class="row no-gutters">
			<div class="col-md-4 b-r">
			<button style="position: absolute;left: 10px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3" id="abrir-popup-perfil"><i class="icon-edit  s-24"></i>Editar perfil</button>
			<button onClick="document.getElementById('overlay-cuenta').classList.add('active')"
			style="position: absolute;left: 130px;border-color: transparent;color: #fd7e14;background-color: #fd7e1400;" class="btn btn-abrir-popup-perfil btn-sm  mt-3" id="abrir-popup-cuenta"><i class="icon-cog  s-24"></i>Cambiar contraseña</button>
                <div class="text-center p-5 mt-5">
					
                    <figure style="width: 130px;height: 130px;width-max: 50%;" class="avatar avatar-xl">
                    	<%if (hayfoto!=null){ %>
                    	<img src="${pageContext.request.contextPath}/cargar_imagen">
                    	<%} else {%>
                    	<img src="assets/img/fondo1.jpg">
                    	<%} %>
                    </figure>
                    <div>
                        <h4 class="p-t-10"><%=nombre%></h4>
                    </div>
                    <a onClick="document.getElementById('overlay-foto').classList.add('active')" href="#" class="btn btn-abrir-popup btn-sm  mt-3" id="abrir-popup-foto">Cambiar foto</a>
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
							   aria-selected="true">Generos</a>
						</li>
						<li class="nav-item">
							<a class="nav-link show r-20" id="w3--tab2" data-toggle="tab"
							   href="#w3-tab2" role="tab" aria-controls="tab2" aria-expanded="true"
							   aria-selected="true">Categorias</a>
						</li>
						
					</ul>
				</div>
			</div>
		</div>
		<div class="card-body no-p">
			<div class="tab-content">
				
				<!--GENEROS-->
				<div class="tab-pane fade show active text-center p-5" id="w3-tab1" role="tabpanel"
					 aria-labelledby="w3-tab1">
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus" onClick="document.getElementById('crear_distinto').innerHTML='CREAR NUEVO GENERO';document.getElementById('tipo1').value='cancion';document.getElementById('overlay-generos').classList.add('active');"> Nuevo Genero</button>
					</div>
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="row">
								<div class="col-md-12">
									<div class="playlist">
										<ul id="playlist" class="playlist list-group">
											<c:forEach var="cancion" items="${generos}">                    
												<div style="margin-bottom: -1px;" class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-6">
																<h6>${cancion.getNombre()}</h6>
															</div>
															<div class="ml-auto">
																<a href="#" onclick="document.getElementById('mod').innerHTML='MODIFICAR GENERO';document.getElementById('id_genero2').value='${cancion.getId()}';document.getElementById('overlay-mod-generos').classList.add('active');document.getElementById('oldname').placeholder='${cancion.getNombre()}';" 
																	class="btn-icono icon-pencil" ></a>
																<a href="#" onclick="document.getElementById('distinto').innerHTML='ELIMINAR GENERO';document.getElementById('id_genero').value='${cancion.getId()}';document.getElementById('overlay-eliminar-generos').classList.add('active');document.getElementById('oldname').value='${cancion.getNombre()};"
																   class="btn-icono icon-trash-o">
																</a>
																
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
				<!-- END GENEROS -->
				<!-- CATEGORIAS -->
				<div class="tab-pane fade show text-center p-5" id="w3-tab2" role="tabpanel"
					 aria-labelledby="w3-tab2">
					<div class="contenido-pestanas">
						<button class="btn btn-abrir-popup icon-plus"  onClick="document.getElementById('crear_distinto').innerHTML='CREAR NUEVA CATEGORIA';document.getElementById('tipo1').value='capituloPodcast';document.getElementById('overlay-generos').classList.add('active');"> Nueva Categoria</button>
					</div>
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="row">
								<div class="col-md-12">
									<div class="playlist">
										<ul id="playlist" class="playlist list-group">
											<c:forEach var="cancion" items="${categorias}">                    
												<div style="margin-bottom: -1px;" class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-6">
																<h6>${cancion.getNombre()}</h6>
															</div>
															<div class="ml-auto">
																<a href="#" onclick="document.getElementById('mod').innerHTML='MODIFICAR CATEGORIA';document.getElementById('id_genero2').value='${cancion.getId()}';document.getElementById('overlay-mod-generos').classList.add('active');document.getElementById('oldname').placeholder='${cancion.getNombre()}';" 
																	class="btn-icono icon-pencil" ></a>
																<a href="#" onclick="document.getElementById('distinto').innerHTML='ELIMINAR CATEGORIA';document.getElementById('id_genero').value='${cancion.getId()}';document.getElementById('overlay-eliminar-generos').classList.add('active');"
																   class="btn-icono icon-trash-o">
																</a>
																
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
				<!-- END CATEGORIAS -->
			</div>
		</div>
	</div>
	<!-- END TABLA -->
</div>
<!-- END CABECERA CON LA INFORMACION DEL USUARIO -->

<!--  NUEVO GENERO -->
<div class="overlay-pop-up" id="overlay-generos">
	<div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" class="btn-cerrar-popup-perfil"
		onClick="document.getElementById('overlay-generos').classList.remove('active');"><i class="icon-close1"></i></a>
		<form class="form-material" action="anyadir_genero" method="post">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3 id="crear_distinto"></h3>
				</header>
				<div class="contenedor-inputs">
					
					<input type="text" name="nombre" placeholder="Nombre" id="nombre1" required/>
					<input type="hidden" name="tipo" id="tipo1" value="">
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!--  FIN NUEVO GENERO -->

<!--  ELIMINAR GENERO -->
<div class="overlay-pop-up" id="overlay-eliminar-generos">
	<div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" class="btn-cerrar-popup-perfil"
		onClick="document.getElementById('overlay-eliminar-generos').classList.remove('active');"><i class="icon-close1"></i></a>
		<form class="form-material" action="eliminar_genero" method="post">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3 id=distinto></h3>
					<p>¿Estás seguro?</p>
				</header>
				<div class="contenedor-inputs">
					
					
					<input type="hidden" name="idGenero" id="id_genero" >
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!--  FIN ELIMINAR GENERO -->

<!--  MODIFICAR GENERO  -->
<div class="overlay-pop-up" id="overlay-mod-generos">
	<div class="col-md-7 card p-5">
		<a style="position: absolute;top: 20px;right: 30px;" href="#" class="btn-cerrar-popup-perfil"
		onClick="document.getElementById('overlay-mod-generos').classList.remove('active');"><i class="icon-close1"></i></a>
		<form class="form-material" action="modifNombre_genero" method="post">
			<!-- Input -->
			<div class="body">
				<header class="relative nav-sticky card">
					<h3 id="mod"></h3>
					<p>¿Estás seguro?</p>
				</header>
				<div class="contenedor-inputs">
					
					<input id=oldname type="text" name="newName" required>
					<input type="hidden" name="idGenero" id="id_genero2" >
				</div>

				<input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4" value="Aceptar">
			</div>
			<!-- #END# Input -->
		</form>
	</div>
</div>
<!--  FIN MODIFICAR GENERO -->

<!-- CAMBIAR FOTO -->
<div class="overlay-pop-up" id="overlay-foto">
    <div class="col-md-7 card p-5">
		<a onClick="document.getElementById('overlay-foto').classList.remove('active')"
		style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-foto" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
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
							<label class="form-label">Nombre</label>
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
					<a id="submit1" href="perfil_admin?pagina=<%=pagina %>" class="btn btn-outline-primary btn-sm pl-4 pr-4">
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
			<a onClick="document.getElementById('overlay-cuenta').classList.remove('active')" style="position: absolute;top: 20px;right: 30px;" href="#" id="btn-cerrar-cuenta" class="btn-cerrar-popup-perfil"><i class="icon-close1"></i></a>
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

					<a id="submit2" href="perfil_admin?pagina=<%=pagina %>" class="btn btn-outline-primary btn-sm pl-4 pr-4"
						  >Cambiar constraseña</a>
				</div>
			</form>
			<a href="" style="color: red;" onclick="darbaja()">Eliminar cuenta</a>
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
    	  	document.getElementsByName("idGenero")[i].value = song;
    	}
    }
    </script>
    <script>
    $(document).ready(function() {
    	$('#submit1').click(function(event) { // cambiar info imagen
			var nombreVar = $('#nombre').val();
			var descripcionVar = $('#descripcion').val();
			var emailVar = $('#email').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('modinfo', {
				nombre : nombreVar,
				descripcion : descripcionVar,
				email : emailVar
			}, function(responseText){
				$('#contenido').html(responseText);
			});
		});
    	$('#submit2').click(function(event) { // cambiar contraseña
			var contrasena1Var = $('#contrasena1').val();
			var contrasena2Var = $('#contrasena2').val();
			var contrasena3Var = $('#contrasena3').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.get('modpass', {
				contrasena1 : contrasena1Var,
				contrasena2 : contrasena2Var,
				contrasena3 : contrasena3Var
			}, function(responseText){
				$('#contenido').html(responseText);
			});
		});   	
    	$('#iconoPlay').replaceWith("<i id='iconoPlay' class='icon-play s-28'></i>")
    	$('.playlist a').click(function(event) { // cargar los comentarios de cancion
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

    function rellenarCamposP(size,song) {
    	var i;
    	for (i=0; i <size; i++){
    	  	document.getElementsByName("idAudioP")[i].value = song;
    	}
    }

    </script>
    
    </main><!--@Page Content-->
</div><!--@#app-->
</body>
</html>