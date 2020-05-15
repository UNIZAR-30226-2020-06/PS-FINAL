package com.espotify.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.espotify.dao.JSONAdapter;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidVal
 */
@WebServlet("/AndroidVal_UsuarioServlet")
public class AndroidVal_UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PETICION_LOGIN = "login";
	private static final String PETICION_REGISTRO = "registrar";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidVal_UsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().log("PETICION RECIBIDA: CLIENTE ANDROID - LOGIN"); 
		
		

		JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
	    getServletContext().log("--- ~AndroidVal_UsuarioServlet~ ---");
	    getServletContext().log("Parametros: " + parametrosPeticion);
        
        String usuario = parametrosPeticion.getString("usuario");
        String contrasena = parametrosPeticion.getString("contrasenya");
        
        JSONObject respuestaPeticion = new JSONObject();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        Usuario u = new UsuarioDAO().login(usuario, contrasena);
        if(u != null) {
        	getServletContext().log("Login OK");
        	respuestaPeticion.put("respuesta", "ok");
        	respuestaPeticion.put("email", u.getCorreo());
        	out.print(respuestaPeticion.toString());
        } else {
        	getServletContext().log("Registro FAIL");
        	respuestaPeticion.put("respuesta", "error");
        	out.print(respuestaPeticion.toString());
        }
        
        // finally output the json string       
        // out.print(parametrosPeticion.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
