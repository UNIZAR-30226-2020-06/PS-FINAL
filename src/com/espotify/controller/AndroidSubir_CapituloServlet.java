package com.espotify.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
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

import com.espotify.dao.CancionDAO;
import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.GeneroDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.SubirAudioDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;


/**
 * Servlet implementation class AndroidVal
 */
@WebServlet("/AndroidSubir_CapituloServlet")
public class AndroidSubir_CapituloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL_PRINCIPAL = "https://espotify.ddns.net/almacen-mp3/";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidSubir_CapituloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		getServletContext().log("--- ~AndroidSubir_CapituloServlet~ ---");
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        
        String cancion = parametrosPeticion.getString("capitulo");
        String titulo = parametrosPeticion.getString("nombreCapitulo");
        String genero = parametrosPeticion.getString("generoCapitulo");
        String podcast = parametrosPeticion.getString("nombrePodcast");
        String email = parametrosPeticion.getString("email");
        int  idUsuario = Integer.parseInt(UsuarioDAO.obtenerId(email));
        
        int lastId = SubirAudioDAO.obtenerUltimaCancionId() + 1;
        String ficheroCancion = lastId + ".mp3";

        byte[] decodedString = Base64.getDecoder().decode(new String(cancion).getBytes("UTF-8"));
        try (OutputStream stream = new FileOutputStream("/var/www/html/almacen-mp3/" + ficheroCancion)) {
            stream.write(decodedString);
        }
        
        File ficheroAudio = new File("/var/www/html/almacen-mp3/" + ficheroCancion);
        
        ficheroAudio.setReadable(true, false);
		ficheroAudio.setExecutable(true, false);
		ficheroAudio.setWritable(true, false);
        
        CancionDAO ca = new CancionDAO();
        GeneroDAO gd = new GeneroDAO();
        int idGenero = gd.obtenerIdGenero(genero);
        
        getServletContext().log("idGenero: " + idGenero);
        int exito = ca.subirCancion(titulo, idUsuario, idGenero, URL_PRINCIPAL + ficheroCancion);
        
        
        int idLista = ListaReproduccionDAO.obtenerIdLista(podcast);
        ListaReproduccionDAO.anyadirAudio(lastId, idLista);
       
        boolean resultado = ListaReproduccionDAO.anyadirAudio(lastId, idLista);
        
        JSONObject respuestaPeticion = new JSONObject();
        if(exito == 1) {
        	respuestaPeticion.put("estado", "ok");
        } else {
        	respuestaPeticion.put("estado", "fail");
        }
        
        getServletContext().log("------------------------------------");
        
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
