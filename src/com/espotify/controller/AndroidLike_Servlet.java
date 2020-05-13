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
import com.espotify.dao.LikesDAO;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.TransmisionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidVal
 */
@WebServlet("/AndroidLike_Servlet")
public class AndroidLike_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public AndroidLike_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().log("--- ~AndroidLikeServlet~ ---");
		
		JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("Parametros: " + parametrosPeticion); 
        
        String nombre = parametrosPeticion.getString("nombre");
        String email = parametrosPeticion.getString("email");
        String tipo = parametrosPeticion.getString("tipo");
        
        int idUsuario = Integer.parseInt(UsuarioDAO.obtenerIdDesdeEmail(email));
        
        switch (tipo) {
        	case "lista":
        		gestionarLikeLista(nombre, idUsuario);
        		break;
        		
        	case "audio":
        		gestionarLikeAudio(nombre, idUsuario);
        		break;
        		
        	case "transmision":
        		gestionarLikeTransmision(nombre, idUsuario);
        		break;
        }
        
        
        getServletContext().log("-------------------------------------------");
	}
	
	private void gestionarLikeLista(String nombre, int idUsuario) {
		int idLista = ListaReproduccionDAO.obtenerIdLista(nombre);
		
		if(!LikesDAO.anyadirLikeLista(idUsuario, idLista)) {
			LikesDAO.quitarLikeLista(idUsuario, idLista);
		}
	}
	
	private void gestionarLikeAudio(String nombre, int idUsuario) {
		CancionDAO ca = new CancionDAO();
		int idAudio = ca.obtenerIdCancion(nombre);
		
		if(!LikesDAO.anyadirLikeAudio(idUsuario, idAudio)) {
			LikesDAO.quitarLikeAudio(idUsuario, idAudio);
		}
	}
	
	private void gestionarLikeTransmision(String nombre, int idUsuario) {

		int idTransmision = TransmisionDAO.getIdTransmision(nombre);
		
		if(!LikesDAO.anyadirLikeTrans(idUsuario, idTransmision)) {
			LikesDAO.anyadirLikeTrans(idUsuario, idTransmision);
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
