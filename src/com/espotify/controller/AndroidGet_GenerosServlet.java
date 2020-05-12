package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.espotify.dao.GeneroDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_GenerosServlet
 */
@WebServlet("/AndroidGet_GenerosServlet")
public class AndroidGet_GenerosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_GenerosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_GenerosServlet~ ---");
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("Parametros: " + parametrosPeticion);
        
        GeneroDAO gdao = new GeneroDAO();
        ArrayList<Genero> listaGeneros = gdao.obtenerGeneroMusica();
        String generos = "";
        
        for(Genero g : listaGeneros) {
        	generos += g.getNombre() + "|";	
        }
        
        generos = generos.substring(0, generos.length() - 1);
    	
        JSONObject respuestaPeticion = new JSONObject();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        respuestaPeticion.put("generos", generos);
        getServletContext().log("Parametros respuesta: " + generos);
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
