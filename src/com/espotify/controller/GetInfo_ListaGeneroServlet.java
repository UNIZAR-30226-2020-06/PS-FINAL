package com.espotify.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.CancionDAO;
import com.espotify.dao.FavoritosDAO;
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
public class GetInfo_ListaGeneroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int ADMIN =100;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInfo_ListaGeneroServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		//String aleatorio = request.getParameter("aleatorio");
		int idGenero =Integer.valueOf(request.getParameter("idGenero"));
		LikesDAO likesDAO = new LikesDAO();
		String gen = request.getParameter("nombre");
		ListaReproduccionDAO.crear(ADMIN, "TOP "+gen, "Lo mejor de "+gen+" en una playlist", "ListaRep");
		ListaReproduccion infoLista = new ListaReproduccionDAO().getInfoList("TOP "+gen, ADMIN, "ListaRep");
		try{
			List<Audio> audios = new CancionDAO().obtenerCancionesPorGenero(idGenero);
			List<Audio> aud_lista= new ListaReproduccionDAO().getAudiosId(infoLista.getId());
			//if (aleatorio.equals("si")) {
			//	Collections.shuffle(audios);
			//}
			for(Audio audio : aud_lista) {
				Boolean anyadida = new ListaReproduccionDAO().quitarAudio(audio.getId(), infoLista.getId());
			}
			for(Audio audio :  audios) {
				audio.setNumLikes(likesDAO.obtenerNLikesAudio(audio.getId()));
				if(likesDAO.tieneLikeAudio(usuario, audio.getId())) {
					audio.setLikeUsuario("like");
				} else {
					audio.setLikeUsuario(null);
				}
				new ListaReproduccionDAO().anyadirAudio(audio.getId(), infoLista.getId());
			}

			request.setAttribute("audios", audios);
			request.setAttribute("id", infoLista.getId());
			request.setAttribute("infoLista", infoLista);
			request.setAttribute("gen", gen);
			//RequestDispatcher dispatcher=request.getRequestDispatcher("favoritos.jsp");
			//dispatcher.forward(request, response);
			request.getRequestDispatcher("listas-generos.jsp?pagina=10").forward(request, response);

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