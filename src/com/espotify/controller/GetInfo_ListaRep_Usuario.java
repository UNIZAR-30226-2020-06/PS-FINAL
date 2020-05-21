package com.espotify.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.LikesDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Collections;

/**
 * Servlet implementation Servlet
 */
public class GetInfo_ListaRep_Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int ADMIN = 100; 
    /**
     * @see HttpServlet#HttpServlet()
     */
	public GetInfo_ListaRep_Usuario() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String)session.getAttribute("id"));
		int id= Integer.valueOf(request.getParameter("id"));
		LikesDAO likesDAO = new LikesDAO();


		//String aleatorio = request.getParameter("aleatorio");
		log("HOLA");
		try{
			ListaReproduccion infoLista = new ListaReproduccionDAO().getInfoListId(id);
			List<Audio> audios = new ListaReproduccionDAO().getAudiosId(id);
			
			//if (aleatorio.equals("si")) {
			//	Collections.shuffle(audios);
			//}
			
			if(likesDAO.tieneLikeLista(usuario, infoLista.getId())) {
				request.setAttribute("likeLista", "likeLista");
			} else {
				request.setAttribute("likeLista", null);
			}
			
			List<ListaReproduccion> listaslr = new ListaReproduccionDAO().showLists(usuario,"ListaRep");
			
			request.setAttribute("infoLista", infoLista);
			request.setAttribute("audios", audios);
			if (usuario ==ADMIN){
				request.getRequestDispatcher("lista-rep-admin.jsp").forward(request, response);
			}else {
				request.setAttribute("listaslr", listaslr);
				request.getRequestDispatcher("lista_rep_otro_usuario.jsp").forward(request, response);
			}
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
		doGet(request, response);
	}

}
