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

import com.espotify.dao.UsuarioDAO;

/**
 * Servlet implementation class AndroidTesting
 */
@WebServlet("/AndroidReg_UsuarioServlet")
public class AndroidReg_UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PETICION_LOGIN = "login";
	private static final String PETICION_REGISTRO = "registrar";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidReg_UsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().log("PETICION RECIBIDA: CLIENTE ANDROID"); 

		// Parsear JSON!
        StringBuilder sb = new StringBuilder();
        String s;
        while ((s = request.getReader().readLine()) != null) {
           sb.append(s);
        }

        getServletContext().log("String recibido: " + sb.toString()); //got the full request as string. 
        String parseJSON = sb.toString();

        JSONObject parametrosPeticion = new JSONObject(parseJSON);
        getServletContext().log("JSON Object: " + parametrosPeticion);

        String nombre = parametrosPeticion.getString("nombreUsuario");
        String email = parametrosPeticion.getString("correo");
        String contrasena = parametrosPeticion.getString("contrasenya");
        String descripcion = parametrosPeticion.getString("descripcion");

        JSONObject respuestaPeticion = new JSONObject();

        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        boolean reg = new UsuarioDAO().register(nombre, email, contrasena, descripcion, null);
        if(reg) {
        	getServletContext().log("Registro OK");
        	respuestaPeticion.put("respuesta", "ok");
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


	private void redireccionarPeticion(JSONObject peticion, HttpServletRequest request) {
		String peticionServlet = peticion.getString("peticion");

		switch(peticionServlet) {
			case PETICION_REGISTRO:
				//request.

		}
	}

}