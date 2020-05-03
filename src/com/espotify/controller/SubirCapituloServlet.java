package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.CancionDAO;
import com.espotify.dao.CapituloPodcastDAO;

/**
 * Servlet implementation class SubirCapituloServlet
 */
@WebServlet("/SubirCapituloServlet")
public class SubirCapituloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubirCapituloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("---------------------------------------------------------------");
		String nombre = (String) request.getParameter("titulo");
		System.out.println(nombre);
		int autor = Integer.valueOf((String) session.getAttribute("id"));
		System.out.println(autor);
		int genero = Integer.valueOf(request.getParameter("genero"));
		System.out.println(genero);
		String ruta = (String) request.getParameter("ruta");
		System.out.println(ruta);	
		System.out.println("------------------------------------------------------------------------");
		CapituloPodcastDAO cancion = new CapituloPodcastDAO();
		if (cancion.subirCapituloPodcast(nombre, autor, genero, ruta) != 0) {

			request.getRequestDispatcher("/obtener_contenido_perfil").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
