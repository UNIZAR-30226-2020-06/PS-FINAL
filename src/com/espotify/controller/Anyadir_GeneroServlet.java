
package com.espotify.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.GeneroDAO;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;

/**
 * Servlet implementation Servlet
 */
public class Anyadir_GeneroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Anyadir_GeneroServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String nombre = request.getParameter("nombre");
		String tipo = request.getParameter("tipo");
		
		Boolean anyadido = new GeneroDAO().anyadir(nombre, tipo);
		
		if (anyadido) {
			log("El genero se ha a�adido correctamente");
		} else {
			log("El genero no se ha podido a�adir");
		}
		
		session.setAttribute("anyadido?", anyadido);
		ArrayList<Genero> generos = new GeneroDAO().obtenerGeneroMusica();
		session.setAttribute("generos", generos);
		ArrayList<Genero> categorias = new GeneroDAO().obtenerGeneroCapitulo();
		session.setAttribute("categorias", categorias);
		
		request.getRequestDispatcher("perfil_admin.jsp?pagina=0").forward(request, response);
		//request.getRequestDispatcher("obtener_info_fav").forward(request, response);
		//RequestDispatcher dispatcher=request.getRequestDispatcher("audio.jsp");
        //dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
