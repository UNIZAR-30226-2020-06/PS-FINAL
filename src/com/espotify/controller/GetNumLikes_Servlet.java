package com.espotify.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.espotify.dao.LikesDAO;

/**
 * Servlet implementation class GetNumLikes_Servlet
 */
@WebServlet("/GetNumLikes_Servlet")
public class GetNumLikes_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNumLikes_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType( "text/html; charset=iso-8859-1" );
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt((String) request.getParameter("idLike"));
		String tipo = (String) request.getParameter("tipo");
		
		System.out.println(tipo + "++++++++++++++++");
		int numLikes = 0;
		
		if(tipo.equals("ListaRep")) {
			numLikes = LikesDAO.obtenerNLikesLista(id);
		} else if(tipo.equals("Transmision")) {
			numLikes =  LikesDAO.obtenerNLikesTransmision(id);
		} else {
			numLikes = LikesDAO.obtenerNLikesAudio(id);
		}
		
		out.println(numLikes);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
