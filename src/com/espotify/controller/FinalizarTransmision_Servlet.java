package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.espotify.dao.TransmisionDAO;

/**
 * Servlet implementation class FinalizarTransmision_Servlet
 */
@WebServlet("/FinalizarTransmision_Servlet")
public class FinalizarTransmision_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalizarTransmision_Servlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf((String) request.getParameter("idTransmision"));
		String url = (String) request.getParameter("url");
		
		TransmisionDAO transmisionDAO = new TransmisionDAO();
		
		if (transmisionDAO.parar(id, url)) {
			//request.getRequestDispatcher("/obtener_contenido_perfil").forward(request, response);
		} else {
			System.out.println("ERROR AL ELIMINAR");
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
