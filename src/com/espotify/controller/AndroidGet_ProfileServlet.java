package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;
import java.util.Random;

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
 * Servlet implementation class AndroidGet_ProfileServlet
 */
@WebServlet("/AndroidGet_ProfileServlet")
public class AndroidGet_ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_ProfileServlet~ ---");
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("Parametros: " + parametrosPeticion);
        String email = parametrosPeticion.getString("email");
        JSONObject respuestaPeticion = new JSONObject();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        int idUsuario = Integer.parseInt(UsuarioDAO.obtenerIdDesdeEmail(email));
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
        respuestaPeticion.put("email", u.getCorreo());
        respuestaPeticion.put("imagen", u.getImagen());
        
        int nSeguidores = SeguirDAO.getNumFollowers(idUsuario);
        
        CancionDAO canciondao = new CancionDAO();
        List<ListaReproduccion> listas = new ListaReproduccionDAO().showLists(idUsuario, "ListaRep");
        List<Audio> audios = canciondao.obtenerCancionesUsuario(idUsuario);
        List<ListaReproduccion> pocasts = new ListaReproduccionDAO().showLists(idUsuario, "podcast");
        //getServletContext().log("Listas recibidas: " + respuestaPeticion.toString()); 
        String listasReproduccion = "";
        String listasDescripcion = "";
        String listasImagenes = "";
        String audiosUsuarioTitulo = "";
        String audiosUsuarioUrls = "";
        
        String podcasts = "";
        String podcastsUsuarioDescripcion = "";
        String podcastsImagenes = "";
        
        boolean tieneListas = false;
        boolean tieneAudios = false;
        boolean tienePodcasts = false;
        
        for(ListaReproduccion lista : listas) {
        	listasReproduccion += lista.getNombre() + "|";
        	listasDescripcion += lista.getDescripcion() + "|";
        	if(lista.getImagen() != null && !lista.getImagen().equals("")) {
        		URL obj = new URL(lista.getImagen());
        		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        		con.setRequestMethod("GET");

        		int responseCode = con.getResponseCode();
        		
        		if(responseCode == 200) {
        			listasImagenes += lista.getImagen() + "|";
        		} else {
        			listasImagenes += "|";
        		}
        	} else {
        		listasImagenes += "|";
        	}
        	
        	tieneListas = true;
        }
        
        for (Audio audio : audios) {
        	audiosUsuarioTitulo += audio.getTitulo() + "|";
        	audiosUsuarioUrls += audio.getUrl() + "|";
        	tieneAudios = true;
        }
        
        for (ListaReproduccion podcast : pocasts) {
        	podcasts += podcast.getNombre() + "|";
        	podcastsUsuarioDescripcion += podcast.getDescripcion() + "|";
        	if(podcast.getImagen() != null && !podcast.getImagen().equals("")) {
        		URL obj = new URL(podcast.getImagen());
        		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        		con.setRequestMethod("GET");

        		int responseCode = con.getResponseCode();
        		
        		if(responseCode == 200) {
        			podcastsImagenes += podcast.getImagen() + "|";
        		} else {
        			podcastsImagenes += "|";
        		}
        	} else {
        		podcastsImagenes += "|";
        	}
        	tienePodcasts = true;
        } 
        
        
        if(tieneListas) {
        	listasDescripcion = listasDescripcion.substring(0, listasDescripcion.length() - 1);
        	listasReproduccion = listasReproduccion.substring(0, listasReproduccion.length() - 1);
        	listasImagenes = listasImagenes.substring(0, listasImagenes.length() - 1);
        } 
        
    	if (tieneAudios) {
    		audiosUsuarioTitulo = audiosUsuarioTitulo.substring(0, audiosUsuarioTitulo.length() - 1);
        	audiosUsuarioUrls = audiosUsuarioUrls.substring(0, audiosUsuarioUrls.length() - 1);
    	} 
    	
    	if (tienePodcasts) {
    		podcasts = podcasts.substring(0, podcasts.length() - 1);
    		podcastsUsuarioDescripcion = podcastsUsuarioDescripcion.substring(0, podcastsUsuarioDescripcion.length() - 1);
    		podcastsImagenes = podcastsImagenes.substring(0, podcastsImagenes.length() - 1);

    	} 
    	
        respuestaPeticion.put("lista", listasReproduccion);
        respuestaPeticion.put("listaDescripcion", listasDescripcion);
        respuestaPeticion.put("audiosTitulo", audiosUsuarioTitulo);
        respuestaPeticion.put("audiosUrl", audiosUsuarioUrls);
        respuestaPeticion.put("imagenesPlaylists", listasImagenes);
        respuestaPeticion.put("podcasts", podcasts);
        respuestaPeticion.put("podcastsDescripcion", podcastsUsuarioDescripcion);
        respuestaPeticion.put("imagenesPodcasts", podcastsImagenes);
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
	
	private int generarAleatorio() {
		 Random r = new Random(); 
		 return r.nextInt() * (999999 - 1) + 1;
	}

}
