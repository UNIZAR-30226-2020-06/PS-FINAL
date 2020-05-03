package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.espotify.dao.CapituloPodcastDAO;

/**
 * Servlet implementation class Eliminar_CancionServlet
 */
@WebServlet("/Eliminar_CapituloServlet")
public class Eliminar_CapituloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Eliminar_CapituloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_capitulo = Integer.parseInt((String) request.getParameter("id_capitulo"));
		CapituloPodcastDAO cancion = new CapituloPodcastDAO();
		if (cancion.borrarCapituloPodcast(id_capitulo)) {
			System.out.println("Entro");
			request.getRequestDispatcher("/obtener_contenido_perfil").forward(request, response);
		}else {
			System.out.println("Error al eliminar cancion");
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
