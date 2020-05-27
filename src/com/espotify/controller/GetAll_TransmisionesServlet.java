package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

import com.espotify.dao.TransmisionDAO;
import com.espotify.model.Estacion;
import com.espotify.model.Transmision;

/**
 * Servlet implementation class GetAll_TransmisionesSrvlet
 */
@WebServlet("/GetAll_TransmisionesSrvlet")
public class GetAll_TransmisionesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAll_TransmisionesServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//PONER PARA USUARIOS SEGUIDOS
		//int idUsuario = Integer.parseInt(session.getId());
		List<Transmision> transmisiones = new TransmisionDAO().getTransmisionPorNombre("PruebaEscuchar");
		//List<Transmision> transmisiones = new TransmisionDAO().getTransmisionesUsersSeguidos(idUsuario);
		List<Estacion> estaciones =  new TransmisionDAO().getEstacionesLibres();
		request.setAttribute("estaciones", estaciones);
		
		request.setAttribute("transmisiones", transmisiones);
		request.getRequestDispatcher("mostrar_transmisiones.jsp").forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
