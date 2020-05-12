package com.espotify.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;

/**
 * Servlet implementation class GetInfo_PodcastServlet
 */

public class GetInfo_Podcast_Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInfo_Podcast_Usuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int usuario = Integer.valueOf(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String tipo = "podcast";
		//String aleatorio = request.getParameter("aleatorio");
		
		try{
			ListaReproduccion infoPodcast = new ListaReproduccionDAO().getInfoList(nombre,usuario,tipo);
			List<Audio> audios = new ListaReproduccionDAO().getAudios(nombre,usuario,tipo);
			
			//if (aleatorio.equals("si")) {
			//	Collections.shuffle(audios);
			//}			
			
			request.setAttribute("infoPodcast", infoPodcast);
			request.setAttribute("audios", audios);
				
			request.getRequestDispatcher("podcasts_otro_usuario.jsp").forward(request, response);
			//RequestDispatcher dispatcher=request.getRequestDispatcher("user.jsp");
			//dispatcher.forward(request, response);

		}catch(Throwable theException) {
			//response.sendRedirect("crearListaRep.jsp");
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
