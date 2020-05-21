package com.espotify.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.BusquedasDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Transmision;
import com.espotify.model.Usuario;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/**
 * Servlet implementation Servlet
 */
public class Search_BusquedasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int ADMIN = 100;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_BusquedasServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String)session.getAttribute("id"));
		String nombre = request.getParameter("nombre");
		log(nombre);
		try{
			
			List<Audio> canciones = new ArrayList<Audio>();
	 		List<Audio> capitulos = new ArrayList<Audio>();
			List<ListaReproduccion> listas = new ArrayList<ListaReproduccion>();
			List<ListaReproduccion> podcasts = new ArrayList<ListaReproduccion>();
			List<Transmision> transmisiones = new ArrayList<Transmision>();
			List<Usuario> usuarios = new ArrayList<Usuario>();
			List<ListaReproduccion> listaslr = new ListaReproduccionDAO().showLists(usuario,"ListaRep");
			request.setAttribute("listaslr", listaslr);
			List<ListaReproduccion> podcastslr = new ListaReproduccionDAO().showLists(usuario,"podcast");
			request.setAttribute("podcastslr", podcastslr);
			BusquedasDAO busquedas = new BusquedasDAO();
			busquedas.searchAll(nombre,canciones,capitulos,listas,podcasts,transmisiones,usuarios);
			request.setAttribute("canciones", canciones);
			request.setAttribute("capitulos", capitulos);
			request.setAttribute("listas", listas);
			request.setAttribute("podcasts", podcasts);
			request.setAttribute("transmisiones", transmisiones);
			request.setAttribute("usuarios", usuarios);
			request.setAttribute("busqueda", nombre);
			if (usuario ==ADMIN) {
				request.getRequestDispatcher("buscar-general-admin.jsp").forward(request, response);
			}else {
				//RequestDispatcher dispatcher=request.getRequestDispatcher("busqueda.jsp");
				//dispatcher.forward(request, response);
				request.getRequestDispatcher("buscar-general.jsp").forward(request, response);
			}
		}catch(Throwable theException) {
			//response.sendRedirect("inicio.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}