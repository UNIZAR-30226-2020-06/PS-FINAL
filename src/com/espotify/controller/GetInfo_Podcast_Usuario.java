package com.espotify.controller;

import java.io.IOException;
import java.util.List;

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

/**
 * Servlet implementation class GetInfo_PodcastServlet
 */

public class GetInfo_Podcast_Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int ADMIN = 100;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInfo_Podcast_Usuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String)session.getAttribute("id"));
		
		int id = Integer.valueOf(request.getParameter("id"));

		LikesDAO likesDAO = new LikesDAO();

		//String aleatorio = request.getParameter("aleatorio");
		
		try{
			ListaReproduccion infoPodcast = new ListaReproduccionDAO().getInfoListId(id);
			List<Audio> audios = new ListaReproduccionDAO().getAudiosId(id);
			for(Audio capitulo :  audios) {
				capitulo.setNumLikes(LikesDAO.obtenerNLikesAudio(capitulo.getId()));
				if(LikesDAO.tieneLikeAudio(usuario, capitulo.getId())) {
					System.out.println("CAPITULO  LIKE" + capitulo.getId());
					capitulo.setLikeUsuario("like");
				} else {
					System.out.println("CAPITULO NO LIKE" + capitulo.getId());
					capitulo.setLikeUsuario(null);
				}
			}
			
			infoPodcast.setNumLikes(likesDAO.obtenerNLikesLista(infoPodcast.getId()));
			if(likesDAO.tieneLikeLista(usuario, infoPodcast.getId())) {
				request.setAttribute("likePodcast", "likePodcast");
			} else {
				request.setAttribute("likePodcast", null);
			}
			//if (aleatorio.equals("si")) {
			//	Collections.shuffle(audios);
			//}			
			log(request.getParameter("id"));
			request.setAttribute("infoPodcast", infoPodcast);
			request.setAttribute("audios", audios);
			if (usuario == ADMIN) {
				request.getRequestDispatcher("podcasts-admin.jsp?pagina=10").forward(request, response);
			}else {
				request.getRequestDispatcher("podcasts_otro_usuario.jsp?pagina=10").forward(request, response);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}