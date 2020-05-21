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
import com.espotify.dao.ComentariosDAO;
import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.TransmisionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Transmision;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidEliminar_ComentarioServlet
 */
@WebServlet("/AndroidEliminar_ComentarioServlet")
public class AndroidEliminar_ComentarioServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidEliminar_ComentarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidEliminar_ComentarioServlet~ ---");
		JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
		getServletContext().log("Parametros: " + parametrosPeticion);
        getServletContext().log(JSONAdapter.obtenerParametros(request)); 
        
        String comentario = parametrosPeticion.getString("comentario");
        String usuario = parametrosPeticion.getString("usuario");
        
        int idUsuario = UsuarioDAO.obtenerIdDesdeNombreUsuario(usuario);
        int idComentario = ComentariosDAO.obtenerIdComentario(comentario, idUsuario);
        getServletContext().log("Id usuario: " + idUsuario + " error: " + idComentario);
        ComentariosDAO.quitarComentarioAudio(idComentario);
        
        // Lanzar JSON
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        
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
