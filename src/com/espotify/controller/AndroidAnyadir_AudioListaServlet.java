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

import org.json.JSONArray;
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
 * Servlet implementation class AndroidAnyadir_AudioListaServlet
 */
@WebServlet("/AndroidAnyadir_AudioListaServlet")
public class AndroidAnyadir_AudioListaServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidAnyadir_AudioListaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidAnyadir_AudioListaServlet~ ---");
		
		JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log(JSONAdapter.obtenerParametros(request)); 
        
        String idAudio = parametrosPeticion.getString("idAudio");
        String nombreLista = parametrosPeticion.getString("nombreLista");
        
        CancionDAO cancion = new CancionDAO();
        int idLista = ListaReproduccionDAO.obtenerIdLista(nombreLista);
        
        JSONObject respuestaPeticion = new JSONObject();
       
        boolean resultado = ListaReproduccionDAO.anyadirAudio(Integer.parseInt(idAudio), idLista);
        if (resultado) {
        	respuestaPeticion.put("status", "ok");
        } else {
        	respuestaPeticion.put("status", "fail");
        }        
        
        // Lanzar JSON
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        out.print(respuestaPeticion.toString());
        
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
