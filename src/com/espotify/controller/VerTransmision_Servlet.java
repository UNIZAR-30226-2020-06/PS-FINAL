package com.espotify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.LikesDAO;
import com.espotify.dao.TransmisionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Transmision;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class VerTransmision_Servlet
 */
@WebServlet("/VerTransmision_Servlet")
public class VerTransmision_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerTransmision_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = Integer.parseInt((String) session.getAttribute("id"));
		
		int idTransmision = Integer.parseInt((String) request.getParameter("idTransmision"));
		Transmision transmision = new TransmisionDAO().getTransmisionPorId(idTransmision);
		Usuario usuario = new UsuarioDAO().obtenerInfo(transmision.getUsuario());
		LikesDAO like = new LikesDAO();
		
		transmision.setNumLikes(like.obtenerNLikesTransmision(idTransmision));
		if(like.tieneLikeTrans(id, transmision.getId())) {
			System.out.println("ENTRO NULL");
			request.setAttribute("like", "like");
		}else {
			request.setAttribute("like", null);
		}
		
		request.setAttribute("usuario", usuario);
		request.setAttribute("transmision", transmision);
		request.getRequestDispatcher("ver-transmision.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
