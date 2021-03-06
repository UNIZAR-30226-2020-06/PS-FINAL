package com.espotify.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.LikesDAO;
import com.espotify.model.Audio;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Collections;

/**
 * Servlet implementation Servlet
 */
public class GetInfo_FavoritosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInfo_FavoritosServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		//String aleatorio = request.getParameter("aleatorio");
		LikesDAO likesDAO = new LikesDAO();
		
		try{
			List<Audio> audios = new FavoritosDAO().getAudios(usuario);
			
			//if (aleatorio.equals("si")) {
			//	Collections.shuffle(audios);
			//}
			for(Audio audio :  audios) {
				audio.setNumLikes(LikesDAO.obtenerNLikesAudio(audio.getId()));
				if(likesDAO.tieneLikeAudio(usuario, audio.getId())) {
					audio.setLikeUsuario("like");
				} else {
					audio.setLikeUsuario(null);
				}
				
			}

			request.setAttribute("audios", audios);
			request.setAttribute("fav", 1);
			//RequestDispatcher dispatcher=request.getRequestDispatcher("favoritos.jsp");
			//dispatcher.forward(request, response);
			request.getRequestDispatcher("lista_rep-single.jsp").forward(request, response);

		}catch(Throwable theException) {
			//response.sendRedirect("user.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}