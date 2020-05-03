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

import org.json.HTTP;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.espotify.dao.CancionDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
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
        String email = parametrosPeticion.getString("email");
        JSONObject respuestaPeticion = new JSONObject();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        Usuario u = new UsuarioDAO().obtenerInfo(email);
        respuestaPeticion.put("nombreUsuario", u.getNombre());
        respuestaPeticion.put("descripcion", u.getDescripcion());
        respuestaPeticion.put("email", u.getCorreo());
        
        String idUsuario = UsuarioDAO.obtenerId(email);
        
        CancionDAO canciondao = new CancionDAO();
        List<ListaReproduccion> listas = new ListaReproduccionDAO().showLists(idUsuario, "ListaRep");
        List<Audio> audios = canciondao.obtenerCancionesUsuario(Integer.parseInt(idUsuario));
        //getServletContext().log("Listas recibidas: " + respuestaPeticion.toString()); 
        String listasReproduccion = "";
        String listasDescripcion = "";
        String audiosUsuarioTitulo = "";
        String audiosUsuarioUrls = "";
        
        boolean tieneListas = false;
        boolean tieneAudios = false;
        
        for(ListaReproduccion lista : listas) {
        	listasReproduccion += lista.getNombre() + "|";
        	listasDescripcion += lista.getDescripcion() + "|";
        	tieneListas = true;
        }
        
        for (Audio audio : audios) {
        	audiosUsuarioTitulo += audio.getTitulo() + "|";
        	audiosUsuarioUrls += audio.getUrl() + "|";
        	tieneAudios = true;
        }
        
        if(tieneListas) {
        	listasReproduccion = listasReproduccion.substring(0, listasReproduccion.length() - 1);
        }
        
    	if (tieneAudios) {
    		audiosUsuarioTitulo = audiosUsuarioTitulo.substring(0, audiosUsuarioTitulo.length() - 1);
        	audiosUsuarioUrls = audiosUsuarioUrls.substring(0, audiosUsuarioUrls.length() - 1);
    	}
    	
        respuestaPeticion.put("lista", listasReproduccion);
        respuestaPeticion.put("listaDescripcion", listasDescripcion);
        respuestaPeticion.put("audiosTitulo", audiosUsuarioTitulo);
        respuestaPeticion.put("audiosUrl", audiosUsuarioUrls);
        
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
