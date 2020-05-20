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

import com.espotify.dao.CancionDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.LikesDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.SeguirDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidLike_BoolServlet
 */
@WebServlet("/AndroidLike_BoolServlet")
public class AndroidLike_BoolServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidLike_BoolServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidLike_BoolServlet~ ---");
        getServletContext().log("Parametros: " + parametrosPeticion);
        
        String email = parametrosPeticion.getString("email");
        String titulo = parametrosPeticion.getString("titulo");
        String tipo = parametrosPeticion.getString("tipo");

        int idUsuario = Integer.parseInt(UsuarioDAO.obtenerIdDesdeEmail(email));
        
        
        
        JSONObject respuestaPeticion = new JSONObject();
        String tieneLike = "false";
        
        switch (tipo) {
	    	case "lista":
	    		if(tieneLikeLista(titulo, idUsuario)) {
	    			tieneLike = "true";
	    		} 
	    		break;
	    		
	    	case "audio":
	    		if(tieneLikeAudio(titulo, idUsuario)) {
	    			tieneLike = "true";
	    		}
	    		break;
	    		
	    	case "transmision":
	    		if(tieneLikeTransmision(titulo, idUsuario)) {
	    			tieneLike = "true";
	    		}
	    		break;
        }
        
        respuestaPeticion.put("likeado", tieneLike);
        getServletContext().log("Respuesta: " + respuestaPeticion);
        getServletContext().log("---------------------------------");
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(respuestaPeticion.toString());

        // finally output the json string       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	private boolean tieneLikeAudio(String titulo, int idUsuario) {
		CancionDAO ca = new CancionDAO();
		int idAudio = ca.obtenerIdCancion(titulo);
		getServletContext().log("ID AUDIO A COMPROBAR LIKE: " + idAudio);
		boolean tieneLike = LikesDAO.tieneLikeAudio(idUsuario, idAudio);
		getServletContext().log("Tiene like LIKE: " + tieneLike);
		return tieneLike;
	}
	
	private boolean tieneLikeLista(String titulo, int idUsuario) {
		int idLista = ListaReproduccionDAO.obtenerIdLista(titulo);
		return LikesDAO.tieneLikeLista(idUsuario, idLista);
	}
	
	private boolean tieneLikeTransmision(String titulo, int idUsuario) {
		CancionDAO ca = new CancionDAO();
		int idTransmision = ca.obtenerIdCancion(titulo);
		return LikesDAO.tieneLikeTrans(idUsuario, idTransmision);
	}

}
