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
 * Servlet implementation class ModificarInfo_CapituloServlet
 */
@WebServlet("/ModificarInfo_CapituloServlet")
public class ModificarInfo_CapituloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int ADMIN = 100;     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarInfo_CapituloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ENTRE EN MODIFICAR");
		HttpSession session = request.getSession();
		int usuario=Integer.valueOf((String)session.getAttribute("id"));
		String titulo = request.getParameter("titulo");
		int genero = Integer.valueOf(request.getParameter("genero"));
		System.out.println(genero + "++++++++++++++++++++++++++++++++++++");
		int id = Integer.parseInt(request.getParameter("id"));
		CapituloPodcastDAO capitulo = new CapituloPodcastDAO();
		if (capitulo.modificarCapituloPodcast(titulo, genero, id)) {
			if(ADMIN ==usuario) {
				request.getRequestDispatcher("perfil_admin").forward(request, response);
			}else {
				request.getRequestDispatcher("/obtener_contenido_perfil").forward(request, response);
			}
		}else {
			System.out.println("Error al modificar");
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
