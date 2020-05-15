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
public class Search_EspecificoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_EspecificoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String)session.getAttribute("id"));
		String nombre = request.getParameter("nombre");
		String tipo= request.getParameter("tipo");
		request.setAttribute("nombre", nombre);
		BusquedasDAO busquedas = new BusquedasDAO();
		try{
			switch (tipo) {
			case "usuario":
				List<Usuario> usuarios = new ArrayList<Usuario>();
				busquedas.searchUsuariosCompletos(nombre, usuarios);
				request.setAttribute("usuarios", usuarios);
				request.setAttribute("tipo", "Usuarios");
				break;
			case "ListaRep":
				List<ListaReproduccion> listas = new ArrayList<ListaReproduccion>();
				busquedas.searchListasCompletas(nombre, listas);
				request.setAttribute("listas", listas);
				request.setAttribute("tipo", "Listas de Reproduccion");
				break;
			case "cancion":
				List<Audio> canciones = new ArrayList<Audio>();
				busquedas.searchCancionesCompletas(nombre, canciones);
				request.setAttribute("canciones", canciones);
				request.setAttribute("tipo", "Canciones");
				break;
			case "podcast":
				List<ListaReproduccion> podcasts = new ArrayList<ListaReproduccion>();
				busquedas.searchPodcastsCompletas(nombre, podcasts);
				request.setAttribute("podcasts", podcasts);
				request.setAttribute("tipo", "Podcasts");
				break;
			case "transmision":
				List<Transmision> transmisiones = new ArrayList<Transmision>();
				busquedas.searchTransmisionesCompletas(nombre, transmisiones);
				request.setAttribute("transmisiones", transmisiones);
				request.setAttribute("tipo", "Transmisiones");
				break;
				
			case "capitulo":
				List<Audio> capitulos = new ArrayList<Audio>();
				busquedas.searchCapitulosCompletas(nombre, capitulos);
				request.setAttribute("capitulos", capitulos);
				request.setAttribute("tipo", "Capitulos");
				break;
				
			}	
			
			List<ListaReproduccion> listaslr = new ListaReproduccionDAO().showLists(usuario,"ListaRep");
			request.setAttribute("listaslr", listaslr);
			//RequestDispatcher dispatcher=request.getRequestDispatcher("busqueda.jsp");
			//dispatcher.forward(request, response);
			request.getRequestDispatcher("buscar-especifico.jsp").forward(request, response);
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