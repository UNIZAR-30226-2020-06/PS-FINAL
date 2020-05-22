package com.espotify.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.GeneroDAO;
import com.espotify.dao.LikesDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.TransmisionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Transmision;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class UsuarioServlet
 */
public class ObtenerInfoAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerInfoAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			log("HOLA?");
			ArrayList<Genero> generos = new GeneroDAO().obtenerGeneroMusica();
			request.setAttribute("generos", generos);
			ArrayList<Genero> categorias = new GeneroDAO().obtenerGeneroCapitulo();
			request.setAttribute("categorias", categorias);
			request.getRequestDispatcher("perfil_admin.jsp?pagina=0").forward( request, response );

			//response.getWriter().println("<div class='popup' id='popup'><a href='#' id='btn-cerrar-popup' class='btn-cerrar-popup'><i class='fas fa-times'></i></a><h3>Datos incorrectos</h3><h4>Email o contrase�a incorrectos, int�ntelo de nuevo.</h4><form action=''><div class='contenedor-inputs'></div><input type='submit' class='btn-cerrar-popup' value='Entendido'></form></div>");
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
