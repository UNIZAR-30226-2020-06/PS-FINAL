package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.SeguirDAO;

/**
 * Servlet implementation class SeguirUsuario_Servlet
 */
@WebServlet("/SeguirUsuario_Servlet")
public class SeguirUsuario_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeguirUsuario_Servlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SeguirDAO seguirDAO = new SeguirDAO();
		Boolean resultado = false;
		
		HttpSession session = request.getSession();
		int id = Integer.parseInt((String) session.getAttribute("id"));
		int idUsuarioSeguido = Integer.parseInt((String) request.getParameter("idUsuario"));
		Boolean seguido = Boolean.valueOf((String) request.getParameter("seguido"));
		
		if(seguido) {
			
			resultado = seguirDAO.unfollowUser(id, idUsuarioSeguido);
		} else {
			resultado = seguirDAO.followUser(id, idUsuarioSeguido);
		}
		request.getRequestDispatcher("obtener_usuario?nombre="+ idUsuarioSeguido).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
