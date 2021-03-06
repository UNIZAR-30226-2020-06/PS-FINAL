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
import com.espotify.dao.SeguirDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_OtrosProfileServlet
 */
@WebServlet("/AndroidGet_OtrosProfileServlet")
public class AndroidGet_OtrosProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_OtrosProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_OtrosProfileServlet~ ---");
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("Parametros: " + parametrosPeticion);
        String nombreUsuario = parametrosPeticion.getString("nombreUsuario");
        JSONObject respuestaPeticion = new JSONObject();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        int idUsuario = UsuarioDAO.obtenerIdDesdeNombreUsuario(nombreUsuario);
        Usuario u = new UsuarioDAO().obtenerInfo(idUsuario);
        
        /*
        Blob imagenBlob = UsuarioDAO.obtenerBlobImagen(email);
        int blobLength;
		try {
			blobLength = (int) imagenBlob.length();
			byte[] blobAsBytes = imagenBlob.getBytes(1, blobLength);
			//respuestaPeticion.put("imagen", blobAsBytes);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		*/
        
        respuestaPeticion.put("nombreUsuario", u.getNombre());
        respuestaPeticion.put("descripcion", u.getDescripcion());
        respuestaPeticion.put("imagenUsuario", u.getImagen());
        
        
        int nSeguidores = SeguirDAO.getNumFollowers(idUsuario);
        
        CancionDAO canciondao = new CancionDAO();
        List<ListaReproduccion> listas = new ListaReproduccionDAO().showLists(idUsuario, "ListaRep");
        List<Audio> audios = canciondao.obtenerCancionesUsuario(idUsuario);
        List<ListaReproduccion> pocasts = new ListaReproduccionDAO().showLists(idUsuario, "podcast");
        //getServletContext().log("Listas recibidas: " + respuestaPeticion.toString()); 
        String listasReproduccion = "";
        String listasDescripcion = "";
        String audiosUsuarioTitulo = "";
        String audiosUsuarioUrls = "";
        String audiosUsuarioIds = "";
        String podcasts = "";
        String podcastsUsuarioDescripcion = "";
        String listasImagen = "";
        String podcastsImagen = "";
        
        boolean tieneListas = false;
        boolean tieneAudios = false;
        boolean tienePodcasts = false;
        
        for(ListaReproduccion lista : listas) {
        	listasReproduccion += lista.getNombre() + "|";
        	listasDescripcion += lista.getDescripcion() + "|";
        	listasImagen += lista.getImagen() + "|";
        	tieneListas = true;
        }
        
        for (Audio audio : audios) {
        	audiosUsuarioTitulo += audio.getTitulo() + "|";
        	audiosUsuarioUrls += audio.getUrl() + "|";
        	audiosUsuarioIds += audio.getId() + "|";
        	tieneAudios = true;
        }
        
        for (ListaReproduccion podcast : pocasts) {
        	podcasts += podcast.getNombre() + "|";
        	podcastsUsuarioDescripcion += podcast.getDescripcion() + "|";
        	podcastsImagen += podcast.getImagen() + "|";
        	tienePodcasts = true;
        } 
        
        
        if(tieneListas) {
        	listasDescripcion = listasDescripcion.substring(0, listasDescripcion.length() - 1);
        	listasReproduccion = listasReproduccion.substring(0, listasReproduccion.length() - 1);
        	listasImagen = listasImagen.substring(0, listasImagen.length() - 1);
        } 
        
    	if (tieneAudios) {
    		audiosUsuarioTitulo = audiosUsuarioTitulo.substring(0, audiosUsuarioTitulo.length() - 1);
        	audiosUsuarioUrls = audiosUsuarioUrls.substring(0, audiosUsuarioUrls.length() - 1);
        	audiosUsuarioIds = audiosUsuarioIds.substring(0, audiosUsuarioIds.length() - 1);
    	} 
    	
    	if (tienePodcasts) {
    		podcasts = podcasts.substring(0, podcasts.length() - 1);
    		podcastsUsuarioDescripcion = podcastsUsuarioDescripcion.substring(0, podcastsUsuarioDescripcion.length() - 1);
    		podcastsImagen = podcastsImagen.substring(0, podcastsImagen.length() - 1);

    	} 
    	
        respuestaPeticion.put("lista", listasReproduccion);
        respuestaPeticion.put("listaDescripcion", listasDescripcion);
        respuestaPeticion.put("imagenesPlaylists", listasImagen);
        respuestaPeticion.put("audiosTitulo", audiosUsuarioTitulo);
        respuestaPeticion.put("audiosUrl", audiosUsuarioUrls);
        respuestaPeticion.put("podcasts", podcasts);
        respuestaPeticion.put("podcastsDescripcion", podcastsUsuarioDescripcion);
        respuestaPeticion.put("imagenesPodcasts", podcastsImagen);
        respuestaPeticion.put("numSeguidores", nSeguidores);
        getServletContext().log("Respuesta: " + respuestaPeticion.toString());
        getServletContext().log("-------------------------------------------");
        // Lanzar JSON
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
