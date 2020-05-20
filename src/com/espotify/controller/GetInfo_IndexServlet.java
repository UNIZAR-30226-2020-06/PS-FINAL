package com.espotify.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.GeneroDAO;
import com.espotify.dao.LikesDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.TransmisionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Transmision;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/GetInfo_IndexServlet")
public class GetInfo_IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInfo_IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String)session.getAttribute("id"));
				
		List<ListaReproduccion> listas = new ListaReproduccionDAO().showLists(usuario,"ListaRep");
		if (listas.size() > 4) {
			listas = listas.subList(0, 5);
			request.setAttribute("listas",listas);
		} else {
			request.setAttribute("listas", listas);
		}
		List<Audio> fav = new FavoritosDAO().getAudios(usuario);
		
		for(Audio cancion :  fav) {
			if(LikesDAO.tieneLikeAudio(usuario, cancion.getId())) {
				cancion.setLikeUsuario("like");
			} else {
				cancion.setLikeUsuario(null);
			}
		}
		
		if (fav.size() > 4) {
			List<Audio>audios = fav.subList(0, 5);
			request.setAttribute("audios",audios);
		} else {
			request.setAttribute("audios",fav);
		}

		List<Transmision> transmisiones = new TransmisionDAO().getTransmisionesUsersSeguidos(usuario);
		request.setAttribute("transmisiones", transmisiones);
		request.getRequestDispatcher("index.jsp").forward( request, response );
		//response.sendRedirect("index.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
