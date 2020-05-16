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
 * Servlet implementation class AndroidEliminar_ListaRepServlet
 */
@WebServlet("/AndroidModificar_ListaRepServlet")
public class AndroidModificar_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DIRECTORIO_IMAGEN_LISTAS = "/var/www/html/almacen-mp3/almacen-img/listas/";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidModificar_ListaRepServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidModificar_ListaRepServlet~ ---");
        
        String email = parametrosPeticion.getString("email");
        String nombreViejoPlayList = parametrosPeticion.getString("nombrePlaylistViejo");
        String nombreNuevoPlayList = parametrosPeticion.getString("nombrePlaylistNuevo");
        String descripcion = parametrosPeticion.getString("descripcion");
        String imagenCodificada = parametrosPeticion.getString("imagen");
        
        String idUsuario = UsuarioDAO.obtenerIdDesdeEmail(email);
        boolean cambiado = ListaReproduccionDAO.cambiar_info(nombreViejoPlayList, nombreNuevoPlayList, idUsuario, descripcion, null, "ListaRep");
        
        JSONObject respuestaPeticion = new JSONObject();
        if(cambiado) {
        	respuestaPeticion.put("estado", "ok");
        } else {
        	respuestaPeticion.put("estado", "fail");
        }
        
        if (imagenCodificada != null) {
        	int  idLista = ListaReproduccionDAO.obtenerIdLista(nombreNuevoPlayList);
            String ficheroImagen = idLista + ".jpg";
            
            File ficheroImagenLocal = new File(DIRECTORIO_IMAGEN_LISTAS + ficheroImagen);
            if (ficheroImagenLocal.exists()) {
            	ficheroImagenLocal.delete();
            }

            byte[] decodedString = Base64.getDecoder().decode(new String(imagenCodificada).getBytes("UTF-8"));
            try (OutputStream stream = new FileOutputStream(DIRECTORIO_IMAGEN_LISTAS + ficheroImagen)) {
                stream.write(decodedString);
            }
            
            ficheroImagenLocal.setReadable(true, false);
    		ficheroImagenLocal.setExecutable(true, false);
    		ficheroImagenLocal.setWritable(true, false);
        }
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
