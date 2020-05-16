package com.espotify.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.ComentariosDAO;

/**
 * Servlet implementation Servlet
 */
public class Eliminar_ComentarioAudioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Eliminar_ComentarioAudioServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType( "text/html; charset=iso-8859-1" );
		PrintWriter out = response.getWriter();
		
		System.out.println("Borrar comentario de cancion");
		int idComentario = Integer.parseInt(request.getParameter("idComentario"));
		
		Boolean eliminado = new ComentariosDAO().quitarComentarioAudio(idComentario);
		if(eliminado) {
			//HttpSession session = request.getSession();
			//session.setAttribute("eliminado", eliminado);

			//RequestDispatcher dispatcher=request.getRequestDispatcher("audio.jsp");
	        //dispatcher.forward(request, response);
			
			out.println("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
			out.println("<strong>Comentario borrado correctamente.</strong>");
			out.println("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.println("<span aria-hidden='true'>&times;</span>");
			out.println("</button>");
			out.println("</div>");
		}else {
			//response.sendRedirect("audio.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}