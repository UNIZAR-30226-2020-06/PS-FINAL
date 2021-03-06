
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

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/**
 * Servlet implementation Servlet
 */
public class GetAll_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAll_ListaRepServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		String tipo = request.getParameter("tipo");
		try{
			List<ListaReproduccion> listas = new ListaReproduccionDAO().showLists(usuario,tipo);
			for(ListaReproduccion lista : listas) {
				getServletContext().log("+++++++++++++" + lista.getNombre());
			}
			request.setAttribute("listas", listas);
				
			//RequestDispatcher dispatcher=request.getRequestDispatcher("user.jsp");
			//dispatcher.forward(request, response);
			
			request.getRequestDispatcher("listas_rep.jsp").forward(request, response);

		}catch(Throwable theException) {
			//response.sendRedirect("crearListaRep.jsp");
			getServletContext().log("ERROR+++++++++++++");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

