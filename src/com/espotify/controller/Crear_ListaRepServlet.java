
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
public class Crear_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Crear_ListaRepServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		String tipo = request.getParameter("tipo"); //Mirar esto!!!
		
		Boolean creada = new ListaReproduccionDAO().crear(usuario,nombre,descripcion,tipo);
		if(creada) {
			/* �feedback?
			session.setAttribute("nombre", nombre);
			session.setAttribute("descripcion", descripcion);
			session.setAttribute("tipo", tipo);
			*/
			//RequestDispatcher dispatcher=request.getRequestDispatcher("user.jsp");
	        //dispatcher.forward(request, response);
			if(tipo.contentEquals("podcast")) {
				request.getRequestDispatcher("mostrar_podcasts").forward(request, response);// Vuevle al mismo lugar donde se hace la peticion
			}else {
				request.getRequestDispatcher("mostrar_lrs").forward(request, response);// Vuevle al mismo lugar donde se hace la peticion
			}
			
		}else {
			//response.sendRedirect("crearListaRep.jsp");
			System.out.println("ERROR SERVLET CREAR LISTA DE REPRODUCCIÓN");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}


