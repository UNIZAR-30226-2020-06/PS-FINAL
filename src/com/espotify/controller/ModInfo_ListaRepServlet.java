package com.espotify.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;

/**
 * Servlet implementation Servlet
 */
public class ModInfo_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModInfo_ListaRepServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		int usuario = Integer.valueOf((String) session.getAttribute("id"));
		String nombreNew = request.getParameter("nombreNew");
		String nombreOld = request.getParameter("nombreOld");
		String descripcion = request.getParameter("descripcion");
		String imagen = "";
		String tipo = "ListaRep";
		
		Boolean cambiada = new ListaReproduccionDAO().cambiar_info(nombreOld,nombreNew,usuario,descripcion,imagen,tipo);
		if(cambiada) {
			try{
				ListaReproduccion infoLista = new ListaReproduccionDAO().getInfoList(nombreNew,usuario,tipo);
				List<Audio> audios = new ListaReproduccionDAO().getAudios(nombreNew,usuario,tipo);

				
				session.setAttribute("infoLista", infoLista);
				session.setAttribute("audios", audios);
					
				//RequestDispatcher dispatcher=request.getRequestDispatcher("listaRep.jsp");
				//dispatcher.forward(request, response);

			}catch(Throwable theException) {
				//response.sendRedirect("modifListaRep.jsp");
			}
		}
		request.getRequestDispatcher("lista_rep-single.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
