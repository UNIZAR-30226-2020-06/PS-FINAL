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
 * Servlet implementation class LikeTransmision_Servlet
 */
@WebServlet("/LikeTransmision_Servlet")
public class LikeTransmision_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeTransmision_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LikesDAO likesDAO = new LikesDAO();
		Boolean resultado = false;
				
		HttpSession session = request.getSession();
		int id = Integer.parseInt((String) session.getAttribute("id"));
		
		Boolean like = Boolean.parseBoolean((String) request.getParameter("like"));
		int idTransmsion = Integer.parseInt((String) request.getParameter("idTransmision"));
		
		if(like) {
			resultado = likesDAO.quitarLikeTrans(id, idTransmsion);
		} else {
			resultado = likesDAO.anyadirLikeTrans(id, idTransmsion);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
