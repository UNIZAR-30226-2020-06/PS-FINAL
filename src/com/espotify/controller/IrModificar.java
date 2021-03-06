package com.espotify.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.espotify.dao.GeneroDAO;
import com.espotify.model.Genero;

/**
 * Servlet implementation class IrModificar
 */
@WebServlet("/IrModificar")
public class IrModificar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IrModificar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("id_audio", request.getParameter("id_audio"));
		Boolean cancion = Boolean.valueOf((String)request.getParameter("cancion"));
		ArrayList<Genero> generos = null;
		if(cancion) {
			generos = new GeneroDAO().obtenerGeneroMusica();
		} else {
			generos = new GeneroDAO().obtenerGeneroCapitulo();
		}
		request.setAttribute("generos", generos);
		request.setAttribute("cancion", cancion);
		System.out.println(request.getParameter("cancion") + "-------------------------");
		request.getRequestDispatcher("formulario-datos-cancion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
