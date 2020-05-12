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

import com.espotify.dao.FavoritosDAO;
import com.espotify.dao.JSONAdapter;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;

/**
 * Servlet implementation class AndroidCancion_Test
 */

@WebServlet("/AndroidCancion_Test")
public class AndroidCancion_Test extends HttpServlet {
	

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidCancion_Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("PETICION RECIBIDA [GETPROFILE]: " + parametrosPeticion); 
        
        String email = parametrosPeticion.getString("email");
        JSONObject respuestaPeticion = new JSONObject();
        
        
        String idUsuario = UsuarioDAO.obtenerIdDesdeEmail(email);
        List<Audio> audios = new FavoritosDAO().getAudios(Integer.parseInt(idUsuario));
        JSONArray audiosJSON = new JSONArray();
        JSONObject datosAudio;
        
        getServletContext().log("ENVIADO [GETPROFILE]: " + respuestaPeticion.toString()); 
        
        // Lanzar JSON
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        out.print(respuestaPeticion.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}