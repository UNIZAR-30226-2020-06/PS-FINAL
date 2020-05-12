package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Collections;
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

import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_FavoritosServlet
 */
@WebServlet("/AndroidGet_FavoritosServlet")
public class AndroidGet_FavoritosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_FavoritosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidGet_FavoritosServlet~ ---");
        
        String email = parametrosPeticion.getString("email");
        JSONObject respuestaPeticion = new JSONObject();
        
        
        String idUsuario = UsuarioDAO.obtenerIdDesdeEmail(email);
        List<Audio> audios = new FavoritosDAO().getAudios(Integer.parseInt(idUsuario));
        
        String nombresAudio = "";
        String urlsAudio = "";
        boolean tieneAudios = false;
        for(Audio audio : audios) {
        	nombresAudio += audio.getTitulo() + "|";
        	urlsAudio += audio.getUrl() +  "|";
        	tieneAudios = true;
        }
        
        if(tieneAudios) {
        	nombresAudio = nombresAudio.substring(0, nombresAudio.length() - 1);
        	urlsAudio = urlsAudio.substring(0, urlsAudio.length() - 1);
        } 
        
        // Lanzar JSON
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        respuestaPeticion.put("nombresAudio", nombresAudio);
    	respuestaPeticion.put("urlsAudio", urlsAudio);
    	getServletContext().log("Respuesta: " + respuestaPeticion);
        getServletContext().log("--------------------------------------");
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
