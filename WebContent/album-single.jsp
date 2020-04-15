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

                    <li><a href="page-blank.jsp" onclick="setTimeout(location.reload.bind(location), 1)">Genero1</a>
                    </li>
                    <li><a href="page-blank.jsp" onclick="setTimeout(location.reload.bind(location), 1)">Genero2</a>
                    </li>
                    <li>
                        <a href="page-blank.jsp" onclick="setTimeout(location.reload.bind(location), 1)">Genero3</a>
                    </li>
                    <li>
                        <a href="page-blank.jsp" onclick="setTimeout(location.reload.bind(location), 1)">Genero4</a>
                    </li>
                    <li>
                        <a href="page-blank.jsp" onclick="setTimeout(location.reload.bind(location), 1)">Genero5</a>
                    </li>

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
                                <a class="ajaxifyPage" href="profile.jsp" onclick="setTimeout(location.reload.bind(location), 1)">
                                    <i class="icon-user-4  s-24"></i>
                                    <div class="pt-1">Mi perfil</div>
                                </a>
                            </div>
                            <div class="col text-center">
                                <a class="ajaxifyPage" href="#" id="abrir-popup-cuenta">
                                    <i class="icon-cog  s-24"></i>
                                    <div class="pt-1">Ajustes cuenta</div>
                                </a>
                            </div>
                            <div class="col text-center">
                                <a class="ajaxifyPage" href="#" onclick="setTimeout(location.reload.bind(location), 1)">
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
<!-- END BARRA DE ABAJO -->

<!--  
########################################################################
############### ACABA BASE DE TODAS LAS PAGINAS    #####################
########################################################################
-->

</nav>
<!--Page Content-->
<main id="pageContent" class="page has-sidebar">
<div class="container-fluid relative animatedParent animateOnce p-lg-5">
	<div class="container-fluid relative animatedParent animateOnce p-0">
		<div class="card no-b shadow no-r">
			<div class="animated fadeInUpShort">
				<!--Banner-->

					<div class="has-bottom-gradient">
						<div class="row pt-5 ml-lg-5 mr-lg-5">
							<div class="col-md-10 offset-1">
								<div class="row my-5 pt-5">
									<div class="col-md-3">
										<img src="assets/img/demo/a1.jpg" alt="/">
									</div>
									<div class="col-md-9">
										<div class="d-md-flex align-items-center justify-content-between">
											<h1 class="my-3 text-orange">Where We Belong</h1>
											<div class="ml-auto mb-2">
												<a href="#" class="snackbar ml-3" data-text="You like this song"
												   data-pos="top-right"
												   data-showAction="true"
												   data-actionText="ok"
												   data-actionTextColor="#fff"
												   data-backgroundColor="#0c101b"><i class="icon-heart s-24"></i></a>
												<a href="#" class="snackbar ml-3" data-text="Thanks for sharing"
												   data-pos="top-right"
												   data-showAction="true"
												   data-actionText="ok"
												   data-actionTextColor="#fff"
												   data-backgroundColor="#0c101b"><i class="icon-share-1 s-24"></i></a>
											</div>
										</div>

										<div class="text-orange my-2">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br>Architecto atque
												aut blanditiis consectetur</p>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
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
												<div class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<a class="no-ajaxy media-url" href="http://34.69.44.48/almacen-mp3/18.mp3" >
																	<i class="icon-play s-28"></i>
																</a>					
															</div>
															<div class="col-6">
																<h6>Dance with me tonight</h6>
															</div>
															<span class=" ml-auto"> 5:03</span>
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																	<div class="ml-auto">
																		<a href="#" class="btn-favorito icon-star active"></a>
																		<a href="#" class="btn-icono icon-minus-circle"></a>
																	</div>
														</div>
													</li>
												</div>
												<div class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<a class="no-ajaxy media-url" href="assets/media/track1.mp3">
																	<i class="icon-play s-28"></i>
																</a>
															</div>
															<div class="col-6">
																<h6>Dance with me tonight</h6>
															</div>
															<span class=" ml-auto"> 5:03</span>
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																	<div class="ml-auto">
																		<a href="#" class="btn-favorito icon-star active"></a>
																		<a href="#" class="btn-icono icon-minus-circle"></a>
																	</div>
														</div>
													</li>
												</div>
												<div class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<a class="no-ajaxy media-url" href="assets/media/track1.mp3">
																	<i class="icon-play s-28"></i>
																</a>
															</div>
															<div class="col-6">
																<h6>Dance with me tonight</h6>
															</div>
															<span class=" ml-auto"> 5:03</span>
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																	<div class="ml-auto">
																		<a href="#" class="btn-favorito icon-star active"></a>
																		<a href="#" class="btn-icono icon-minus-circle"></a>
																	</div>
														</div>
													</li>
												</div>
												<div class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<a class="no-ajaxy media-url" "http://34.69.44.48/almacen-mp3/18.mp3">
																	<i class="icon-play s-28"></i>
																</a>
															</div>
															<div class="col-6">
																<h6>Dance with me tonight</h6>
															</div>
															<span class=" ml-auto"> 5:03</span>
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																	<div class="ml-auto">
																		<a href="#" class="btn-favorito icon-star active"></a>
																		<a href="#" class="btn-icono icon-minus-circle"></a>
																	</div>
														</div>
													</li>
												</div>
												<div class="cancion">
													<li class="list-group-item my-1">
														<div class="d-flex align-items-center">
															<div class="col-1">
																<a class="no-ajaxy media-url" href="assets/media/track1.mp3">
																	<i class="icon-play s-28"></i>
																</a>
															</div>
															<div class="col-6">
																<h6>Dance with me tonight</h6>
															</div>
															<span class=" ml-auto"> 5:03</span>
																<a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
																	<div class="ml-auto">
																		<a href="#" class="btn-favorito icon-star active"></a>
																		<a href="#" class="btn-icono icon-minus-circle"></a>
																	</div>
														</div>
													</li>
												</div>
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

<!-- Mirrored from xvelopers.com/demos/html/record-light/album-single.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 05 Apr 2020 17:22:12 GMT -->
</html>