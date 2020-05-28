package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Collections;
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
@WebServlet("/AndroidEliminar_CapituloPodcastServlet")
public class AndroidEliminar_CapituloPodcastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidEliminar_CapituloPodcastServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidEliminar_CapituloPodcastServlet~ ---"); 
        
        String email = parametrosPeticion.getString("email");
        String nombreLista = parametrosPeticion.getString("nombrePodcast");
        String idCapitulo = parametrosPeticion.getString("idCapitulo");
        
        
        getServletContext().log("Parametros: " + email + "," + nombreLista + "," + idCapitulo);
        
        CancionDAO canciondao = new CancionDAO();
        
        int idLista = ListaReproduccionDAO.obtenerIdLista(nombreLista);
        getServletContext().log("ID's: " + idLista + "," + idCapitulo);
        boolean borrado = ListaReproduccionDAO.borrarCancionLista(Integer.parseInt(idCapitulo), idLista);
       
        // Lanzar JSON
        JSONObject respuestaPeticion = new JSONObject();
        if (borrado) {
        	respuestaPeticion.put("estado", "ok");
        } else {
        	respuestaPeticion.put("estado", "fail");
        }
        
        canciondao.borrarCancion(Integer.parseInt(idCapitulo));
        
        
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
