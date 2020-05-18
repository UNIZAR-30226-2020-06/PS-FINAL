package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.LikesDAO;

/**
 * Servlet implementation class LikeAudio_Servlet
 */
@WebServlet("/LikeAudio_Servlet")
public class LikeAudio_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeAudio_Servlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LikesDAO likesDAO = new LikesDAO();
		Boolean resultado = false;
		
		System.out.println("ENTROOOOOO  AQUII");
		
		HttpSession session = request.getSession();
		int id = Integer.parseInt((String) session.getAttribute("id"));
		
		Boolean like = Boolean.parseBoolean((String) request.getParameter("like"));
		int idAudio = Integer.parseInt((String) request.getParameter("idAudio"));
		
		if(like) {
			resultado = likesDAO.quitarLikeAudio(id, idAudio);
		} else {
			resultado = likesDAO.anyadirLikeAudio(id, idAudio);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
