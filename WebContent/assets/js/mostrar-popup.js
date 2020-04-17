var btnAbrirCancion = document.getElementById('abrir-popup'),
	overlayCancion = document.getElementById('overlay-subir-cancion'),
	btnCerrarCancion = document.getElementById('btn-cerrar-subir-cancion');
	
var btnAbrirPerfil = document.getElementById('abrir-popup-perfil'),
	overlayPerfil = document.getElementById('overlay-perfil');
	btnCerrarPerfil = document.getElementById('btn-cerrar-perfil');

var btnAbrirCuenta = document.getElementById('abrir-popup-cuenta'),
	overlayCuenta = document.getElementById('overlay-cuenta');
	btnCerrarCuenta = document.getElementById('btn-cerrar-cuenta');
	
var btnAbrirFoto = document.getElementById('abrir-popup-foto'),
	overlayFoto = document.getElementById('overlay-foto');
	btnCerrarFoto = document.getElementById('btn-cerrar-foto');
	
var btnAbrirCrearLR = document.getElementById('abrir-listas-reproduccion'),
	overlayCrearLR = document.getElementById('overlay-listas-reproduccion');
	btnCerrarCrearLR = document.getElementById('btn-cerrar-listas-reproduccion');
	
var overlayAnadirLR = document.getElementById('overlay-anadir-listas-reproduccion'),
	btnCerrarAnadirLR = document.getElementById('btn-cerrar-anadir-listas-reproduccion');

btnAbrirPerfil.addEventListener('click', function(){
	overlayPerfil.classList.add('active');
});

btnCerrarPerfil.addEventListener('click', function(){
	overlayPerfil.classList.remove('active');
});

btnAbrirCancion.addEventListener('click', function(){
	overlayCancion.classList.add('active');
});

btnCerrarCancion.addEventListener('click', function(){
	overlayCancion.classList.remove('active');
});

btnAbrirCuenta.addEventListener('click', function(){
	overlayCuenta.classList.add('active');
});

btnCerrarCuenta.addEventListener('click', function(){
	overlayCuenta.classList.remove('active');
});


btnAbrirFoto.addEventListener('click', function(){
	overlayFoto.classList.add('active');
});

btnCerrarFoto.addEventListener('click', function(){
	overlayFoto.classList.remove('active');
});

btnAbrirCrearLR.addEventListener('click', function(){
	overlayCrearLR.classList.add('active');
});

btnCerrarCrearLR.addEventListener('click', function(){
	overlayCrearLR.classList.remove('active');
});

btnCerrarAnadirLR.addEventListener('click', function(){
	overlayAnadirLR.classList.remove('active');
});