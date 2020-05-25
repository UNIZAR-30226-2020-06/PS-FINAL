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
import com.espotify.dao.GeneroDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidEliminar_ListaRepServlet
 */
@WebServlet("/AndroidModificar_CapituloServlet")
public class AndroidModificar_CapituloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidModificar_CapituloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidModificar_CapituloServlet~ ---");
        getServletContext().log("Parametros: " +parametrosPeticion);
        
        String email = parametrosPeticion.getString("email");
        String idCacncion = parametrosPeticion.getString("idCapitulo");
        String nombreViejoCancion = parametrosPeticion.getString("nombrePodcastViejo");
        String nombreNuevoCancion = parametrosPeticion.getString("nombrePodcastNuevo");
        String generoNuevoCancion = parametrosPeticion.getString("generoPodcastNuevo");
        
        CancionDAO canciondao = new CancionDAO();
        GeneroDAO generodao = new GeneroDAO();
        int idGenero = generodao.obtenerIdGenero(generoNuevoCancion);
        
        
        boolean cambiado = canciondao.modificarCancion(nombreNuevoCancion, idGenero, Integer.parseInt(idCacncion));
        
        JSONObject respuestaPeticion = new JSONObject();
        if(cambiado) {
        	respuestaPeticion.put("estado", "ok");
        } else {
        	respuestaPeticion.put("estado", "fail");
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
