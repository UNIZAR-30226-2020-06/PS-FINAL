
package com.espotify.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.FavoritosDAO;
import com.espotify.model.ListaReproduccion;

/**
 * Servlet implementation Servlet
 */
public class AnyadirAudio_FavoritosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnyadirAudio_FavoritosServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		String audio = request.getParameter("idAudio");
		int idAudio = Integer.valueOf(audio);
		
		Boolean anyadida = new FavoritosDAO().anyadirAudio(usuario, idAudio);
		
		if (anyadida) {
			log("La cancion se ha añadido correctamente");
		} else {
			log("La cancion no se ha podido añadir");
		}
		
		session.setAttribute("anyadida?", anyadida);
		
		request.getRequestDispatcher("obtener_info_fav").forward(request, response);
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
