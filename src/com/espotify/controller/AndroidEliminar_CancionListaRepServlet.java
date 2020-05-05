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
@WebServlet("/AndroidEliminar_CancionListaRepServlet")
public class AndroidEliminar_CancionListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidEliminar_CancionListaRepServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidEliminar_CancionListaServlet~ ---"); 
        
        String email = parametrosPeticion.getString("email");
        String nombreLista = parametrosPeticion.getString("nombrePlaylist");
        String nombreCancion = parametrosPeticion.getString("nombreCancion");
        
        getServletContext().log("Parametros: " + email + "," + nombreLista + "," + nombreCancion);
        
        
        if (nombreLista.contentEquals("misCanciones")) {
        	
        }
        
        CancionDAO canciondao = new CancionDAO();
        
        int idLista = ListaReproduccionDAO.obtenerIdLista(nombreLista);
        int idCancion = new CancionDAO().obtenerIdCancion(nombreCancion);
        
        getServletContext().log("ID's: " + idLista + "," + idCancion);
        
        boolean borrado = ListaReproduccionDAO.borrarCancionLista(idCancion, idLista);
       
        // Lanzar JSON
        JSONObject respuestaPeticion = new JSONObject();
        if (borrado) {
        	respuestaPeticion.put("estado", "ok");
        } else {
        	respuestaPeticion.put("estado", "fail");
        }
        
        
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
