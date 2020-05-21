package com.espotify.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.ComentariosDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.Comentario;
import com.espotify.model.ListaReproduccion;


/**
 * Servlet implementation class GetAll_ComentCanServlet
 */
@WebServlet("/GetAll_ComentCanServlet")
public class GetAll_ComentCanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAll_ComentCanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Mostrar comentarios cancion");
		response.setContentType( "text/html; charset=iso-8859-1" );
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String nombre = (String) session.getAttribute("nombre");
		int idAudio = Integer.valueOf(request.getParameter("idAudio"));
		
		new ComentariosDAO();
		List<Comentario> comentarios = ComentariosDAO.getComentariosAudio(idAudio);
		
		//request.setAttribute("comentCancion", comentarios);
		if(comentarios.size() != 0) {
			for(int i=0; i<comentarios.size(); i++){
				out.println("<div class='media my-5 ' style='margin-top: -1rem !important;margin-bottom: -1rem !important;'>");
					out.println("<div class='media-body'>");
						out.println("<h6 class='mt-0'>" + comentarios.get(i).getUsuario() + "</h6>");
						out.println("<div class='form-line'><textarea readonly='' rows='5' class='form-control r-0' style='resize: none;width: 80%;border-color: transparent;height: 62px;' color:=''>");
							out.println(comentarios.get(i).getDescripcion());
						out.println("</textarea></div>");
						if(nombre.equals(comentarios.get(i).getUsuario())) {
						out.println("<a id=\"deleteComentCancion\" style='position: relative;left: 280px;top: -70px;' href=\"#\" data-toggle=\"control-sidebar\""
										+ "onclick=\"document.getElementById(\'comentarioID').value=\'" + comentarios.get(i).getId() + "\';"
										+ "document.getElementById('overlay-borrar-coment-cancion').classList.add('active');\">");
							out.println("<i class='icon-trash-o'></i>");
						out.println("</a>");
						}
					out.println("</div>");
				out.println("</div>");
			}
		}
		else {
			out.println("<div class='media my-5 ' style='margin-top: -1rem !important;margin-bottom: 2rem !important;'>");
			out.println("<div class='media-body'>");
			out.println("<div class='form-line'>");
			out.println("No hay ning�n comentario todav�a.");
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
