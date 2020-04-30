<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from xvelopers.com/demos/html/record-light/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 05 Apr 2020 17:22:07 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/basic/logo.ico">
    <title>Espotify</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
</head>
<!--style="background-size: cover;background-repeat: no-repeat; background-position: center center;background-attachment: fixed;"-->
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

<style>
	.btn-group-sm > .btn, .btn.btn-sm {
		position: absolute;
		bottom: 80px;
	}
	.p-5 {
		padding: 3rem !important;
		position: absolute;
		right: -100px;
		width: 50%;
		height: 600%;
		bottom: 100px;
	}
	.btn-group-lg > .btn, .btn-lg {
		border-radius: 20px;
		font-size: 16px;
	}
	.btn-primary {
		color: #fff;
		background-color: #000;
		border-color: #000;
	}
</style>

<main>
<div id="primary" class="p-t-b-100 height-full">
    <div class="container">
        <div class="text-center s-14 l-s-2 my-5">
            <a class="my-5" href="inicio.jsp" >
				<img style="position: relative;top:-170px;max-width: 40%;" src="assets/img/logo1.png">
			</a>
        </div>
		
		<div class="row">
            <div class="col-md-10 mx-md-auto">
                <div class="mt-5">
					<img style="max-width: 70%; position: absolute; left: -160px; bottom: 70px;" src="assets/img/music.png">
                </div>
				<div class="col-md-7 card p-5">
					<h1 class="mt-3 font-weight-lighter"><b>Bienvenido</h1>
					<div class="pt-3 mb-5">
						<p>Vender la empresa.</p>
                    </div>
					<a href="sign_up.jsp"  class="btn btn-primary btn-lg">Regístrate</a>
					<a href="login.jsp"  class="btn btn-primary btn-lg">Iniciar sesión</a>
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


</body>

</html>