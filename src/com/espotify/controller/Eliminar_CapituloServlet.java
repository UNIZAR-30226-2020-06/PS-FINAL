package com.espotify.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.CapituloPodcastDAO;

/**
 * Servlet implementation class Eliminar_CancionServlet
 */
@WebServlet("/Eliminar_CapituloServlet")
public class Eliminar_CapituloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int ADMIN = 100;     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Eliminar_CapituloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType( "text/html; charset=iso-8859-1" );
		PrintWriter out = response.getWriter();
		
		int id_capitulo = Integer.parseInt((String) request.getParameter("id_capitulo"));
		CapituloPodcastDAO cancion = new CapituloPodcastDAO();
		if (cancion.borrarCapituloPodcast(id_capitulo)) {
			System.out.println("Entro");
			HttpSession session = request.getSession();
			int usuario = Integer.valueOf((String) session.getAttribute("id"));
			if (usuario == ADMIN) {
				request.getRequestDispatcher("perfil_admin").forward(request, response);
			}else {
				request.getRequestDispatcher("/obtener_contenido_perfil").forward(request, response);
			}
			out.println("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
			out.println("<strong>Cap�tulo eliminada correctamente.</strong>");
			out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.println("<span aria-hidden='true'>&times;</span>");
			out.println("</button>");
			out.println("</div>");
		}else {
			System.out.println("Error al eliminar capitulo");
			out.println("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
			out.println("<strong>Ha ocurrido un error. </strong> No se ha podido eliminar el cap�tulo. Vuelva a intentarlo.");
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