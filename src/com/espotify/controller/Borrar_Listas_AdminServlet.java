
package com.espotify.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.ListaReproduccion;

/**
 * Servlet implementation Servlet
 */
public class Borrar_Listas_AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Borrar_Listas_AdminServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int idLista = Integer.valueOf(request.getParameter("idLista"));
		log("HOLA");
		Boolean borrada = new ListaReproduccionDAO().borrar(idLista);
		if(borrada) {
			log("XD");
			request.getRequestDispatcher("perfil_admin");
			//RequestDispatcher dispatcher=request.getRequestDispatcher("user.jsp");
	        //dispatcher.forward(request, response);
		}else {
			log(":(");
			String url = request.getHeader("referer");
			//response.sendRedirect("ListaRep.jsp");
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

