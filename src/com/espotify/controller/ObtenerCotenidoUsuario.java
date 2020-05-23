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
import com.espotify.dao.TransmisionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.Estacion;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Transmision;
import com.mysql.cj.Session;

/**
 * Servlet implementation class ObtenerCotenidoUsuario
 */
@WebServlet("/ObtenerCotenidoUsuario")
public class ObtenerCotenidoUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtenerCotenidoUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idUsuario = Integer.valueOf((String) session.getAttribute("id"));
		ArrayList<Audio> canciones = new CancionDAO().obtenerCancionesUsuario(idUsuario);
		
		for(Audio cancion :  canciones) {
			if(LikesDAO.tieneLikeAudio(idUsuario, cancion.getId())) {
				cancion.setLikeUsuario("like");
			} else {
				cancion.setLikeUsuario(null);
			}
		}
		request.setAttribute("canciones", canciones);
		
		
		ArrayList<Audio> capitulos = new CapituloPodcastDAO().obtenerCapitulosPodcastUsuario(idUsuario);
		for(Audio capitulo :  capitulos) {
			if(LikesDAO.tieneLikeAudio(idUsuario, capitulo.getId())) {
				capitulo.setLikeUsuario("like");
			} else {
				capitulo.setLikeUsuario(null);
			}
		}
		request.setAttribute("capitulos", capitulos);
		
		ArrayList<Genero> categorias = new GeneroDAO().obtenerGeneroCapitulo();
		request.setAttribute("categorias", categorias);
		
		List<ListaReproduccion> listaslr = new ListaReproduccionDAO().showLists(idUsuario,"ListaRep");
		request.setAttribute("listaslr", listaslr);
		List<ListaReproduccion> podcasts = new ListaReproduccionDAO().showLists(idUsuario,"podcast");
		request.setAttribute("podcasts", podcasts);
		
		int numSeguidores = new UsuarioDAO().obtenerNumSeguidores(idUsuario);
		request.setAttribute("numSeguidores", numSeguidores);
		
		TransmisionDAO transmisionDAO = new TransmisionDAO();
		List<Estacion> estaciones = transmisionDAO.getEstacionesLibres();
		List<Transmision> transmisiones = transmisionDAO.getTransmisionUsuario(idUsuario);
		for(Estacion estacion : estaciones)
			System.out.println("++++++" + estacion.getUrl());
		request.setAttribute("estaciones", estaciones);
		request.setAttribute("transmisiones", transmisiones);
		
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}