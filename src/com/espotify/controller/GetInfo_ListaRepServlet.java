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
public class GetInfo_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInfo_ListaRepServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		String nombre = request.getParameter("nombre");
		String tipo = "ListaRep";
		List<ListaReproduccion> listas = new ListaReproduccionDAO().showLists(usuario,"ListaRep");
		LikesDAO likesDAO = new LikesDAO();
		
		//String aleatorio = request.getParameter("aleatorio");
		log(nombre);
		try{
			ListaReproduccion infoLista = new ListaReproduccionDAO().getInfoList(nombre,usuario,tipo);
			List<Audio> audios = new ListaReproduccionDAO().getAudios(nombre,usuario,tipo);
			
			for(Audio audio :  audios) {
				if(likesDAO.tieneLikeAudio(usuario, audio.getId())) {
					audio.setLikeUsuario("like");
				} else {
					audio.setLikeUsuario(null);
				}
				
			}
			
			//if (aleatorio.equals("si")) {
			//	Collections.shuffle(audios);
			//}
			if(likesDAO.tieneLikeLista(usuario, infoLista.getId())) {
				request.setAttribute("likeLista", "likeLista");
			} else {
				request.setAttribute("likeLista", null);
			}
			request.setAttribute("listaslr", listas);
			request.setAttribute("infoLista", infoLista);
			request.setAttribute("audios", audios);
				
			request.getRequestDispatcher("lista_rep-single.jsp?pagina=10").forward(request, response);
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
