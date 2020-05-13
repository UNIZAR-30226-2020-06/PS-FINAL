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

import com.espotify.dao.CancionDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_AudiosGeneroServlet
 */
@WebServlet("/AndroidGet_AudiosGeneroServlet")
public class AndroidGet_AudiosGeneroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_AudiosGeneroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("JSON Object: " + parametrosPeticion);
        String genero = parametrosPeticion.getString("genero");
       
        JSONObject respuestaPeticion = new JSONObject();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        CancionDAO ca = new CancionDAO();
        List<Audio> audios =  ca.obtenerCancionesPorGenero(genero);
        
        String nombresAudio = "";
        String urlsAudio = "";
        boolean hayAudios = false;
        
        for(Audio audio : audios) {
        	nombresAudio += audio.getTitulo() + "|";
        	urlsAudio += audio.getUrl() + "|";
        	hayAudios = true;
        }
        
        if(hayAudios) {
        	nombresAudio = nombresAudio.substring(0, nombresAudio.length() - 1);
        	urlsAudio = urlsAudio.substring(0, urlsAudio.length() - 1);
        }
        
        respuestaPeticion.put("nombresAudio", nombresAudio);
        respuestaPeticion.put("urlsAudio", urlsAudio);
        
        
        // finally output the json string       
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
