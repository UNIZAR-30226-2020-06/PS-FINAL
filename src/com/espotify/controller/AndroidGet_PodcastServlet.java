package com.espotify.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.ListaReproduccion;


/**
 * Servlet implementation class AndroidGet_PodcastServlet
 */
@WebServlet("/AndroidGet_PodcastServlet")
public class AndroidGet_PodcastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_PodcastServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_PodcastServlet~ ---");
        
		
		List<ListaReproduccion> listaPodcasts = ListaReproduccionDAO.showAllLists("podcast");
		
		getServletContext().log("Exito: " + listaPodcasts);
		
        String nombresPodcast = "";
        String descripcionesPodcast = "";
       
        boolean hayPodcasts = false;
        
        for(ListaReproduccion lista : listaPodcasts) {
        	nombresPodcast += lista.getNombre() + "|";
        	descripcionesPodcast += lista.getDescripcion() + "|";
        	hayPodcasts = true;
        }
        
        
        if(hayPodcasts) {
        	nombresPodcast = nombresPodcast.substring(0, nombresPodcast.length() - 1);
        	descripcionesPodcast = descripcionesPodcast.substring(0, descripcionesPodcast.length() - 1);
        }
    	
        
        JSONObject respuestaPeticion = new JSONObject();
        respuestaPeticion.put("lista", nombresPodcast);
        respuestaPeticion.put("listaDescripcion", descripcionesPodcast);
        
        // Lanzar JSON
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        out.print(respuestaPeticion.toString());
        getServletContext().log("Respuesta: " + respuestaPeticion);
        getServletContext().log("-------------------------------------------");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
