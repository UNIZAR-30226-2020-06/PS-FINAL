package com.espotify.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
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
import com.espotify.dao.SubirAudioDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.Genero;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;


/**
 * Servlet implementation class AndroidSubir_ImagenUsuarioServlet
 */
@WebServlet("/AndroidSubir_ImagenUsuarioServlet")
public class AndroidSubir_ImagenUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidSubir_ImagenUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		getServletContext().log("--- ~AndroidSubir_ImagenUsuarioServlet~ ---");
		
        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        
        String imagenCodificada = parametrosPeticion.getString("imagen");
        String email = parametrosPeticion.getString("email");
        
        byte[] imagenDecodificada = Base64.getDecoder().decode(new String(imagenCodificada).getBytes("UTF-8"));
        
        String idUsuario = UsuarioDAO.obtenerId(email);
        
        boolean exito = UsuarioDAO.actualizarImagen(idUsuario, imagenDecodificada);
        getServletContext().log("IdUsuario: " + idUsuario + "Exito: " + exito);
        JSONObject respuestaPeticion = new JSONObject();
       
        
        if(exito) {
        	respuestaPeticion.put("estado", "ok");
        } else {
        	respuestaPeticion.put("estado", "fail");
        }
        
        getServletContext().log("------------------------------------");
        
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
