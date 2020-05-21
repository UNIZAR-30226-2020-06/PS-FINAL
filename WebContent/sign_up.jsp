<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from xvelopers.com/demos/html/record-light/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 05 Apr 2020 17:22:07 GMT -->
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
	.row {
		display: flex;
		flex-wrap: wrap;
		margin-right: -150px;
		margin-left: 60px;
	}

	p {
		font-size: 14px;
		font-weight: 300;
		letter-spacing: .2px;
		margin-top: 20px;
	}
	.card {
		top: -420px;
	}
</style>

<%
String error1= (String)request.getParameter("error1");
String error2= (String)request.getParameter("error2");
%>

<main>
<div id="primary" class="p-t-b-100 height-full">
    <div class="container">
        <div class="text-center s-14 l-s-2 my-5">
            <a class="my-5" href="inicio.jsp">

                <img style="position: relative;top:-170px;max-width: 40%;" src="assets/img/logo1.png">

            </a>
        </div>
        <div class="row">
            <div class="col-md-10 mx-md-auto">
                <div class="mt-5">
                    <div class="row grid">
                        <div class="col-md-7 card p-5">
                            <form class="form-material" action="hacer_registro" method="post">
                                <!-- Input -->
								<div class="body">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" name="nombre" class="form-control" required="">
                                            <label class="form-label">Nombre de usuario</label>
                                        </div>
                                    </div>
									<div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="email" name="email" class="form-control" required="">
                                            <label class="form-label">Email</label>
                                        </div>
                                    </div>
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="password" name="contrasena" class="form-control" required="">
                                            <label class="form-label">Contrase�a</label>
                                        </div>
                                    </div>
									<div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="password" name="password" class="form-control" required="">
                                            <label class="form-label">Confirmar contrase�a</label>
                                        </div>
                                    </div>
									<div class="form-group form-float">
                                        <div class="form-line">
                                            <input type="text" name="descripcion" class="form-control">
                                            <label class="form-label">Descripci�n</label>
                                        </div>
                                    </div>
                                    
                                    <%
									if (error1!=null) {
									%>
									<h1 style="color: #F00;font-size: 14px;">Error: Las contrase�as coinciden.</h1>
									<% } 
									else if(error2!=null){
									%>
									<h1 style="color: #F00;font-size: 14px;">Error: Usuario ya registrado.</h1>
									<% } %>

                                    <input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
                                           value="Registrarme">
										   
									<p><a href="login.jsp">>>Ya tengo una cuenta</a></p>

                                </div>
                                <!-- #END# Input -->
                            </form>
                        </div>
                    </div>
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