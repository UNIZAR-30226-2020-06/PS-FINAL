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
public class AnyadirAudio_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnyadirAudio_ListaRepServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String lista = request.getParameter("idLista");
		String nombre = request.getParameter("nombreLista");
		String tipo = request.getParameter("tipo");
		log(lista);
		log(nombre);
		log(tipo);

		int idLista = Integer.valueOf(lista);
		
		Boolean anyadida=false;	
		String redir="";
		log("Hola?");
		if (tipo.equals("ListaRep")) {
			String audio = request.getParameter("idAudio");
			int idAudio = Integer.valueOf(audio);		
			anyadida = new ListaReproduccionDAO().anyadirAudio(idAudio, idLista);
			redir = "obtener_info_lr?nombre=" + nombre;
		} else {
			String audio = request.getParameter("idAudioP");
			int idAudio = Integer.valueOf(audio);
			anyadida = new ListaReproduccionDAO().anyadirAudio(idAudio, idLista);
			redir = "obtener_info_podcast?nombre=" + nombre;
		}
		log("Donde redirige: " +redir);
		
		if (anyadida) {
			log("La cancion se ha aadido correctamente");
		} else {
			log("La cancon no se ha podido aadir");
		}
		HttpSession session = request.getSession();
		session.setAttribute("anyadida?", anyadida);
		
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
