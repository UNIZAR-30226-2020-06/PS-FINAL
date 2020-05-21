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
@WebServlet("/Val_UsuarioServlet")
public class Val_UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Val_UsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("nombre");
		String password = request.getParameter("contrasena");
		
		Usuario u = new UsuarioDAO().login(usuario, password);

		if(u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", u.getId());
			log(u.getId());
			session.setAttribute("nombre", u.getNombre());
			session.setAttribute("email", u.getCorreo());
			session.setAttribute("descripcion", u.getDescripcion());
			session.setAttribute("imagen", u.getImagen());
			ArrayList<Genero> generos = new GeneroDAO().obtenerGeneroMusica();
			session.setAttribute("generos", generos);
			List<ListaReproduccion> listas = new ListaReproduccionDAO().showLists(u.getId(),"ListaRep");
			if (listas.size() > 4) {
				listas = listas.subList(0, 5);
				request.setAttribute("listas",listas);
			} else {
				request.setAttribute("listas", listas);
			}
			List<Audio> fav = new FavoritosDAO().getAudios(Integer.valueOf(u.getId()));
			for(Audio cancion :  fav) {
				if(LikesDAO.tieneLikeAudio(Integer.parseInt(u.getId()), cancion.getId())) {
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
			
			if(u.getImagen()!=null) {
				session.setAttribute("hayfoto", "si");
			} else {
				session.setAttribute("hayfoto", null);
			}
			List<Transmision> transmisiones = new TransmisionDAO().getTransmisionesUsersSeguidos(Integer.parseInt(u.getId()));
			request.setAttribute("transmisiones", transmisiones);
			
			request.getRequestDispatcher("index.jsp?pagina=0").forward( request, response );
			//response.sendRedirect("index.jsp");
		}else {
			//response.getWriter().println("<div class='popup' id='popup'><a href='#' id='btn-cerrar-popup' class='btn-cerrar-popup'><i class='fas fa-times'></i></a><h3>Datos incorrectos</h3><h4>Email o contrase�a incorrectos, int�ntelo de nuevo.</h4><form action=''><div class='contenedor-inputs'></div><input type='submit' class='btn-cerrar-popup' value='Entendido'></form></div>");
			response.sendRedirect("login.jsp?p=error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
