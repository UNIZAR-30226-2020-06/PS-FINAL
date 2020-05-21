package com.espotify.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.CancionDAO;

/**
 * Servlet implementation class Eliminar_CancionServlet
 */
@WebServlet("/Eliminar_CancionServlet")
public class Eliminar_CancionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int ADMIN = 100;     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Eliminar_CancionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType( "text/html; charset=iso-8859-1" );
		PrintWriter out = response.getWriter();
		
		int id_cancion = Integer.parseInt((String) request.getParameter("id_cancion"));
		CancionDAO cancion = new CancionDAO();
		if (cancion.borrarCancion(id_cancion)) {
			System.out.println("Entro");
			HttpSession session = request.getSession();
			int usuario = Integer.valueOf((String) session.getAttribute("id"));
			if (usuario == ADMIN) {
				request.getRequestDispatcher("perfil_admin").forward(request, response);
			}else {
				request.getRequestDispatcher("/obtener_contenido_perfil").forward(request, response);
			}			
			out.println("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
			out.println("<strong>Canción eliminada correctamente.</strong>");
			out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.println("<span aria-hidden='true'>&times;</span>");
			out.println("</button>");
			out.println("</div>");
		}else {
			System.out.println("Error al eliminar cancion");
			out.println("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
			out.println("<strong>Ha ocurrido un error. </strong> No se ha podido eliminar la canción. Vuelva a intentarlo.");
			out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.println("<span aria-hidden='true'>&times;</span>");
			out.println("</button>");
			out.println("</div>");
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
