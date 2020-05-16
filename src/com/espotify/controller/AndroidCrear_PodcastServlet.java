package com.espotify.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
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

import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidCrear_PodcastServlet
 */
@WebServlet("/AndroidCrear_PodcastServlet")
public class AndroidCrear_PodcastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DIRECTORIO_IMAGEN_PODCASTS = "/var/www/html/almacen-mp3/almacen-img/listas/";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidCrear_PodcastServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidCrear_PodcastRepServlet~ ---");
        
        String email = parametrosPeticion.getString("email");
        String nombreLista = parametrosPeticion.getString("nombrePodcast");
        String descripcion = parametrosPeticion.getString("descripcion");
        String imagenCodificada = parametrosPeticion.getString("imagen");
        
        String idUsuario = UsuarioDAO.obtenerIdDesdeEmail(email);
        ListaReproduccionDAO.crear(idUsuario, nombreLista, descripcion, "podcast");
        
        JSONObject respuestaPeticion = new JSONObject();
        respuestaPeticion.put("creado", "ok");
        
        int  idLista = ListaReproduccionDAO.obtenerIdLista(nombreLista);
        String ficheroImagen = idLista + ".jpg";

        byte[] decodedString = Base64.getDecoder().decode(new String(imagenCodificada).getBytes("UTF-8"));
        try (OutputStream stream = new FileOutputStream(DIRECTORIO_IMAGEN_PODCASTS + ficheroImagen)) {
            stream.write(decodedString);
        }
        
        File ficheroImagenLocal = new File(DIRECTORIO_IMAGEN_PODCASTS + ficheroImagen);
        
        ficheroImagenLocal.setReadable(true, false);
		ficheroImagenLocal.setExecutable(true, false);
		ficheroImagenLocal.setWritable(true, false);
        
        // Lanzar JSON
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
