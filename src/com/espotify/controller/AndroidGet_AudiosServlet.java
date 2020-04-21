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

import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_ProfileServlet
 */
@WebServlet("/AndroidGet_AudiosServlet")
public class AndroidGet_AudiosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_AudiosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("JSON Object: " + parametrosPeticion);
        
        String email = parametrosPeticion.getString("email");
        String nombrePlaylist = parametrosPeticion.getString("nombrePlaylist");

        JSONObject respuestaPeticion = new JSONObject();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        Usuario u = new UsuarioDAO().obtenerInfo(email);
        respuestaPeticion.put("nombreUsuario", u.getNombre());
        respuestaPeticion.put("descripcion", u.getDescripcion());
        respuestaPeticion.put("email", u.getCorreo());
        
        String idUsuario = UsuarioDAO.obtenerId(email);
        int usuario = Integer.valueOf(idUsuario);
        List<Audio> audios =  ListaReproduccionDAO.getAudios(nombrePlaylist, usuario, "ListaRep");
        getServletContext().log("Audios recibidos" + audios); 
        
        String nombresAudio = "";
        String urlsAudio = "";
        
        for(Audio audio : audios) {
        	nombresAudio += audio.getTitulo() + "|";
        	urlsAudio += audio.getUrl() + "|";
        }
        
        nombresAudio = nombresAudio.substring(0, nombresAudio.length() - 1);
        
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
