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
 * Servlet implementation class AndroidGet_ProfileServlet
 */
@WebServlet("/AndroidGet_CapitulosPodcastServlet")
public class AndroidGet_CapitulosPodcastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_CapitulosPodcastServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_CapitulosPodcastServlet~ ---");
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("Parametros: " + parametrosPeticion);
        
        String nombrePodcast = parametrosPeticion.getString("podcast");
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        
        CapituloPodcastDAO cpd = new CapituloPodcastDAO();
        List<Audio> capitulosPodcastLista = cpd.obtenerCapitulosPodcast(nombrePodcast);
        
        ListaReproduccion lp = ListaReproduccionDAO.getInfoList(nombrePodcast, "podcast");
        String descripcion =lp.getDescripcion();
        String imagen = lp.getImagen();
        Usuario autor = UsuarioDAO.obtenerInfo(Integer.parseInt(lp.getUsuario()));
        String nombreAutor = autor.getNombre();
        
        String nombresPodcast = "";
        String urlsPodcast = "";
        String idsPodcast = "";
      
        boolean tieneCapitulos = false;
        
        for (Audio podcast : capitulosPodcastLista) {
        	nombresPodcast += podcast.getTitulo() + "|";
        	urlsPodcast += podcast.getUrl() + "|";
        	idsPodcast += podcast.getId() + "|";
        	tieneCapitulos = true;
        }
        
        if(tieneCapitulos) {
        	nombresPodcast = nombresPodcast.substring(0, nombresPodcast.length() - 1);
        	urlsPodcast = urlsPodcast.substring(0, urlsPodcast.length() - 1);
        	idsPodcast = idsPodcast.substring(0, idsPodcast.length() - 1);
        }
        
        JSONObject respuestaPeticion =new JSONObject();
        respuestaPeticion.put("descripcion", descripcion);
        respuestaPeticion.put("imagen", imagen);
        respuestaPeticion.put("autor", nombreAutor);
        respuestaPeticion.put("nombresPodcast", nombresPodcast);
        respuestaPeticion.put("urlsPodcast", urlsPodcast);
        respuestaPeticion.put("idsPodcast", idsPodcast);
        
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
