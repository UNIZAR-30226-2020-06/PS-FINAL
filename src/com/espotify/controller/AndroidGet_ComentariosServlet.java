package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.espotify.model.Comentario;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Transmision;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_ComentariosServlet
 */
@WebServlet("/AndroidGet_ComentariosServlet")
public class AndroidGet_ComentariosServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_ComentariosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("--- ~AndroidGet_ComantariosServlet~ ---");
		
		JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log(JSONAdapter.obtenerParametros(request)); 
        
        String titulo = parametrosPeticion.getString("titulo");
        CancionDAO ca = new CancionDAO();
        int idCancion = ca.obtenerIdCancion(titulo);
        List<Comentario> listaComentarios = new ArrayList<Comentario>();
        
        if (idCancion > 0) {
        	listaComentarios = ComentariosDAO.getComentariosAudio(idCancion);            
        } else {
        	int idTransmision = TransmisionDAO.getIdTransmision(titulo);
        	if (idTransmision > 0) {
        		listaComentarios = ComentariosDAO.getComentariosTrans(idTransmision); 
        	}
        }
        
        String descripcionComentarios = "";
        String usuarioComentarios = "";
        
        boolean tieneComentarios = false;
        for (Comentario c : listaComentarios) {
        	descripcionComentarios += c.getDescripcion() + "|";
        	usuarioComentarios += c.getUsuario() + "|";
        	tieneComentarios = true;
        }
        
        if(tieneComentarios) {
        	descripcionComentarios = descripcionComentarios.substring(0, descripcionComentarios.length() - 1);
        	usuarioComentarios = usuarioComentarios.substring(0, usuarioComentarios.length() - 1);
        }
        
        JSONObject respuestaPeticion =new JSONObject();
        respuestaPeticion.put("comentario", descripcionComentarios);
        respuestaPeticion.put("usuarios", usuarioComentarios);
        
        getServletContext().log("Respuesta: " + respuestaPeticion);
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        
        out.print(respuestaPeticion.toString());
        
        // Lanzar JSON
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
