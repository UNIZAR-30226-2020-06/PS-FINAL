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

import com.espotify.dao.CancionDAO;
import com.espotify.dao.CapituloPodcastDAO;
import com.espotify.dao.GeneroDAO;
import com.espotify.dao.LikesDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.SeguirDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;
import com.mysql.cj.Session;

/**
 * Servlet implementation class ObtenerCotenidoUsuario
 */
public class ObtenerContenidoOtroUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int ADMIN = 100;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerContenidoOtroUsuario() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = Integer.valueOf((String) session.getAttribute("id"));
		int idUsuario = Integer.valueOf(request.getParameter("nombre"));
		//int idUsuario = Integer.valueOf(new UsuarioDAO().obtenerIdDesdeNombreUsuario(nombre));
		if (id == idUsuario) {
			request.getRequestDispatcher("obtener_contenido_perfil").forward(request, response);
		}
		System.out.printf("%d", idUsuario);
		Usuario usuario = new UsuarioDAO().obtenerInfo(idUsuario);
		log(usuario.getNombre());
		/*request.setAttribute("nombre", usuario.getNombre());
		request.setAttribute("descripcion", usuario.getDescripcion());
		request.setAttribute("email", usuario.getCorreo());
		request.setAttribute("imagen", usuario.getImagen());*/
		request.setAttribute("usuario", usuario);
		
		Boolean seguido = new SeguirDAO().isFollowing(id, idUsuario);
		if(seguido) {
			request.setAttribute("seguido", "seguido");
		}else {
			request.setAttribute("seguido", "");
		}
		
		ArrayList<Audio> canciones = new CancionDAO().obtenerCancionesUsuario(idUsuario);
		for(Audio cancion :  canciones) {
			if(LikesDAO.tieneLikeAudio(id, cancion.getId())) {
				System.out.println("CANCION LIKE" + cancion.getId());
				cancion.setLikeUsuario("like");
			} else {
				System.out.println("CANCION NO LIKE" + cancion.getId());
				cancion.setLikeUsuario(null);
			}
		}
		request.setAttribute("canciones", canciones);
		
		ArrayList<Audio> capitulos = new CapituloPodcastDAO().obtenerCapitulosPodcastUsuario(idUsuario);
		for(Audio capitulo :  capitulos) {
			if(LikesDAO.tieneLikeAudio(id, capitulo.getId())) {
				System.out.println("CAPITULO  LIKE" + capitulo.getId());
				capitulo.setLikeUsuario("like");
			} else {
				System.out.println("CAPITULO NO LIKE" + capitulo.getId());
				capitulo.setLikeUsuario(null);
			}
		}
		request.setAttribute("capitulos", capitulos);
		
		List<ListaReproduccion> listaslr = new ListaReproduccionDAO().showLists(idUsuario,"ListaRep");
		request.setAttribute("listaslr", listaslr);
		List<ListaReproduccion> podcasts = new ListaReproduccionDAO().showLists(idUsuario,"podcast");
		request.setAttribute("podcasts", podcasts);
		
		if (id == ADMIN){
			request.getRequestDispatcher("perfil_usuario_admin.jsp?pagina=10").forward(request, response);
		}else {
			List<ListaReproduccion> mislistas = new ListaReproduccionDAO().showLists(id,"ListaRep");
			request.setAttribute("mislistas", mislistas);
			
			List<ListaReproduccion> misPodcasts = new ListaReproduccionDAO().showLists(id,"podcast");
			request.setAttribute("misPodcasts", misPodcasts);
		

			request.getRequestDispatcher("perfil_usuario.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
