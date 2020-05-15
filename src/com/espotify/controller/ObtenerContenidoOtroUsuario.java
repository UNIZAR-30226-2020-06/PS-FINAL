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
import com.espotify.dao.ListaReproduccionDAO;
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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerContenidoOtroUsuario() {
        super();
        // TODO Auto-generated constructor stub
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
		request.setAttribute("nombre", usuario.getNombre());
		request.setAttribute("descripcion", usuario.getDescripcion());
		request.setAttribute("email", usuario.getCorreo());
		request.setAttribute("imagen", usuario.getImagen());
		
		ArrayList<Audio> canciones = new CancionDAO().obtenerCancionesUsuario(idUsuario);
		request.setAttribute("canciones", canciones);
		ArrayList<Audio> capitulos = new CapituloPodcastDAO().obtenerCapitulosPodcastUsuario(idUsuario);
		request.setAttribute("capitulos", capitulos);
		List<ListaReproduccion> listaslr = new ListaReproduccionDAO().showLists(idUsuario,"ListaRep");
		request.setAttribute("listaslr", listaslr);
		List<ListaReproduccion> podcasts = new ListaReproduccionDAO().showLists(idUsuario,"podcast");
		request.setAttribute("podcasts", podcasts);
		
		List<ListaReproduccion> mislistas = new ListaReproduccionDAO().showLists(id,"ListaRep");
		request.setAttribute("mislistas", mislistas);
		
		List<ListaReproduccion> misPodcasts = new ListaReproduccionDAO().showLists(id,"podcast");
		request.setAttribute("misPodcasts", misPodcasts);

		request.getRequestDispatcher("perfil_usuario.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
