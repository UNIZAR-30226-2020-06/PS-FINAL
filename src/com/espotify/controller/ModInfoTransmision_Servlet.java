package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.espotify.dao.TransmisionDAO;
import com.espotify.model.Transmision;

/**
 * Servlet implementation class ModInfoTransmision_Servlet
 */
@WebServlet("/ModInfoTransmision_Servlet")
public class ModInfoTransmision_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModInfoTransmision_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf((String) request.getParameter("idTransmision"));
		String nombre = (String) request.getParameter("nombre");
		String descripcion = (String) request.getParameter("descripcion");
		TransmisionDAO transmisionDAO = new TransmisionDAO();
		if(transmisionDAO.cambiar_info(nombre, descripcion, id)) {
			Transmision transmision = transmisionDAO.getTransmisionPorId(id);
			request.setAttribute("transmision", transmision);
			request.getRequestDispatcher("control-transmision.jsp").forward(request, response);
		} else {
			System.out.println("ERROR AL MODIFICAR");
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
