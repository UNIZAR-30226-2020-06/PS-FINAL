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
 * Servlet implementation class LikeLista_Servlet
 */
@WebServlet("/LikeLista_Servlet")
public class LikeLista_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeLista_Servlet() {
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
		int idLista = Integer.parseInt((String) request.getParameter("idLista"));
		
		if(like) {
			resultado = likesDAO.quitarLikeLista(id, idLista);
		} else {
			resultado = likesDAO.anyadirLikeLista(id, idLista);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
