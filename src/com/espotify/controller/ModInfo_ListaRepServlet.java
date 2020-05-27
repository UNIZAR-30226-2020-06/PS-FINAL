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
	private static final int ADMIN = 100;    
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
		String tipo = request.getParameter("tipo");
		log(nombreNew);
		log(nombreOld);
		log(descripcion);
		log(tipo);
		
			
		Boolean cambiada = false;
		if (usuario ==ADMIN) {
			int idLista = Integer.valueOf(request.getParameter("idLista"));
			cambiada = new ListaReproduccionDAO().cambiar_info(nombreNew, descripcion, imagen, idLista);
			if(cambiada) {
				try{
					ListaReproduccion infoLista = new ListaReproduccionDAO().getInfoListId(idLista);
					List<Audio> audios = new ListaReproduccionDAO().getAudios(idLista);

					if (!audios.isEmpty()) {
						request.setAttribute("audios", audios);
					}
					String redir="";
					//RequestDispatcher dispatcher=request.getRequestDispatcher("listaRep.jsp");
					//dispatcher.forward(request, response);
					if(tipo.equals("podcast")) {
						System.out.println("ENTRO");
						log("PODCAST");
						request.setAttribute("infoPodcast", infoLista);
						request.getRequestDispatcher("obtener_info_lr_usuario?id="+infoLista.getId()+"&pagina=10").forward(request, response);
						}
					else {
						log("LISTA");
						request.setAttribute("infoLista", infoLista);
						request.getRequestDispatcher("obtener_info_lr_usuario?id="+infoLista.getId()+"&pagina=10").forward(request, response);
						}
					
					
				}catch(Throwable theException) {
					//response.sendRedirect("modifListaRep.jsp");
					System.out.println("ERROR EN SERVLET");
				}
		
			}else {
				log("Pues NO VA");
			}
		}
		else {
			cambiada = new ListaReproduccionDAO().cambiar_info(nombreOld,nombreNew,usuario,descripcion,imagen,tipo);
			if(cambiada) {
				try{
					ListaReproduccion infoLista = new ListaReproduccionDAO().getInfoList(nombreNew,usuario,tipo);
					List<Audio> audios = new ListaReproduccionDAO().getAudios(nombreNew,usuario,tipo);

					if (!audios.isEmpty()) {
						request.setAttribute("audios", audios);
					}
					String redir="";
					//RequestDispatcher dispatcher=request.getRequestDispatcher("listaRep.jsp");
					//dispatcher.forward(request, response);
					if(tipo.equals("podcast")) {
						System.out.println("ENTRO");
						log("PODCAST");
						request.setAttribute("infoPodcast", infoLista);
						redir = "obtener_info_podcast?nombre=" + nombreNew+"&pagina=10";
						log(redir);
						request.getRequestDispatcher(redir).forward(request, response);
						}
					else {
						log("LISTA");
						request.setAttribute("infoLista", infoLista);
						redir = "obtener_info_lr?nombre=" + nombreNew+"&pagina=10";
						request.getRequestDispatcher(redir).forward(request, response);
						}
					
					
				}catch(Throwable theException) {
					//response.sendRedirect("modifListaRep.jsp");
					System.out.println("ERROR EN SERVLET");
				}
		
			}else {
				log("Pues NO VA");
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
