package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.HTTP;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.espotify.dao.CancionDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

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
