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
public class BorrarAudio_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int ADMIN = 100; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarAudio_ListaRepServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String audio = request.getParameter("idAudio");
		String lista = request.getParameter("idLista");
		String nombre = request.getParameter("nombreLista");
		String tipo = request.getParameter("tipo");
		int idAudio = Integer.valueOf(audio);
		int idLista = Integer.valueOf(lista);
				
		Boolean anyadida = new ListaReproduccionDAO().quitarAudio(idAudio, idLista);
		
		if (anyadida) {
			log("La cancion se ha borrado correctamente");
		} else {
			log("La cancon no se ha podido borrar");
		}
		HttpSession session = request.getSession();
		session.setAttribute("anyadida?", anyadida);
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		String redir="";
		if (tipo.equals("ListaRep")) {
			if (usuario == ADMIN) {
				request.getRequestDispatcher("obtener_info_lr_usuario?id="+idLista+"&pagina=10").forward(request, response);
			}else {
				redir = "obtener_info_lr?nombre=" + nombre;
			}
		} else {
			
			if (usuario == ADMIN) {
				request.getRequestDispatcher("obtener_info_podcast_usuario?id"+idLista+"&pagina=10").forward(request, response);
			}else {
				redir = "obtener_info_podcast?nombre=" +nombre;
		
			}
		}
		
		request.getRequestDispatcher(redir).forward(request, response);
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
