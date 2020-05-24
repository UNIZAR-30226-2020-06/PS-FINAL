package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.CancionDAO;

/**
 * Servlet implementation class ModificarInfo_CancionServlet
 */
@WebServlet("/ModificarInfo_CancionServlet")
public class ModificarInfo_CancionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int ADMIN = 100;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarInfo_CancionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int usuario=Integer.valueOf((String)session.getAttribute("id"));
		String titulo = request.getParameter("titulo");
		int genero = Integer.valueOf(request.getParameter("genero"));
		System.out.println(genero + "++++++++++++++++++++++++++++++++++++");
		int id = Integer.parseInt(request.getParameter("id"));
		CancionDAO cancion = new CancionDAO();
		if (cancion.modificarCancion(titulo, genero, id)) {
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
		doGet(request, response);
	}

}
