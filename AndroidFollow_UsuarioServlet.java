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

import com.espotify.dao.JSONAdapter;
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.SeguirDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidFollow_UsuarioServlet
 */
@WebServlet("/AndroidFollow_UsuarioServlet")
public class AndroidFollow_UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidFollow_UsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidFollow_UsuarioServlet~ ---");
        getServletContext().log("Parametros: " + parametrosPeticion);
        
        String email = parametrosPeticion.getString("email");
        String nombreUsuario = parametrosPeticion.getString("usuario");

        String usuario1 = UsuarioDAO.obtenerIdDesdeEmail(email);
        int usuario2 = UsuarioDAO.obtenerIdDesdeNombreUsuario(nombreUsuario);
        
        SeguirDAO.followUser(Integer.parseInt(usuario1), usuario2);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        JSONObject respuestaPeticion = new JSONObject();
        
        // finally output the json string       
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
