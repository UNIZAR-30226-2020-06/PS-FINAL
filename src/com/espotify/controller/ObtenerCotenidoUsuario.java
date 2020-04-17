package com.espotify.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.CancionDAO;
import com.espotify.dao.GeneroDAO;
import com.espotify.model.Audio;
import com.espotify.model.Genero;
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
		request.setAttribute("canciones", canciones);
		ArrayList<Genero> generos = new GeneroDAO().obtenerGeneroMusica();
		request.setAttribute("generos", generos);
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}