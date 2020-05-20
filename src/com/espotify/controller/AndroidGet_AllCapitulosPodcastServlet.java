package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.espotify.dao.CapituloPodcastDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_AllCapitulosPodcastServlet
 */
@WebServlet("/AndroidGet_AllCapitulosPodcastServlet")
public class AndroidGet_AllCapitulosPodcastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_AllCapitulosPodcastServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_AllCapitulosPodcastServlet~ ---");
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("Parametros: " + parametrosPeticion);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        

        CapituloPodcastDAO cpd = new CapituloPodcastDAO();
        List<Audio> capitulosPodcastLista = cpd.obtenerTodosCapitulos();
        
        String nombresPodcast = "";
        String urlsPodcast = "";
        
        boolean tieneCapitulos = false;
        
        for (Audio podcast : capitulosPodcastLista) {
        	nombresPodcast += podcast.getTitulo() + "|";
        	urlsPodcast += podcast.getUrl() + "|";
        	tieneCapitulos = true;
        }
        
        if(tieneCapitulos) {
        	nombresPodcast = nombresPodcast.substring(0, nombresPodcast.length() - 1);
        	urlsPodcast = urlsPodcast.substring(0, urlsPodcast.length() - 1);
        }
        
        JSONObject respuestaPeticion =new JSONObject();
        respuestaPeticion.put("nombresPodcast", nombresPodcast);
        respuestaPeticion.put("urlsPodcast", urlsPodcast);
        
        getServletContext().log("Respuesta: " + respuestaPeticion);
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        
        out.print(respuestaPeticion.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
