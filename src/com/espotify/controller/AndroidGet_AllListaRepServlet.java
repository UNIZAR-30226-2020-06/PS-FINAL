package com.espotify.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.model.ListaReproduccion;


/**
 * Servlet implementation class AndroidGet_AllListaRepServlet
 */
@WebServlet("/AndroidGet_AllListaRepServlet")
public class AndroidGet_AllListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_AllListaRepServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_AllListaRepServlet~ ---");
        
		List<ListaReproduccion> listasReproduccion = ListaReproduccionDAO.showAllLists("ListaRep");
		
		getServletContext().log("Exito: " + listasReproduccion);
		
        String nombrePlaylist = "";
        String descripcionPlaylist = "";
        String imagenPlaylist = "";
       
        boolean hayListas = false;
        
        for(ListaReproduccion lista : listasReproduccion) {
        	nombrePlaylist += lista.getNombre() + "|";
        	descripcionPlaylist += lista.getDescripcion() + "|";
        	
        	if(lista.getImagen() != null && !lista.getImagen().equals("")) {
        		URL obj = new URL(lista.getImagen());
        		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        		con.setRequestMethod("GET");

        		int responseCode = con.getResponseCode();
        		
        		if(responseCode == 200) {
        			imagenPlaylist += lista.getImagen() + "|";
        		} else {
        			imagenPlaylist += "|";
        		}
        	} else {
        		imagenPlaylist += "|";
        	}
        	hayListas = true;
        }
        
        
        if(hayListas) {
        	nombrePlaylist = nombrePlaylist.substring(0, nombrePlaylist.length() - 1);
        	descripcionPlaylist = descripcionPlaylist.substring(0, descripcionPlaylist.length() - 1);
        	imagenPlaylist = imagenPlaylist.substring(0, imagenPlaylist.length() - 1);
        }
    	
        
        JSONObject respuestaPeticion = new JSONObject();
        respuestaPeticion.put("lista", nombrePlaylist);
        respuestaPeticion.put("listaDescripcion", descripcionPlaylist);
        respuestaPeticion.put("listaImagen", imagenPlaylist);
        
        // Lanzar JSON
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        out.print(respuestaPeticion.toString());
        getServletContext().log("Respuesta: " + respuestaPeticion);
        getServletContext().log("-------------------------------------------");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
