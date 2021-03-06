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
import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_ProfileServlet
 */
@WebServlet("/AndroidModificar_UsuarioServlet")
public class AndroidModificar_UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidModificar_UsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidModificar_UsuarioServlet~ ---");
        
        String nombre = parametrosPeticion.getString("nombre");
        String descripcion = parametrosPeticion.getString("descripcion");
        String email = parametrosPeticion.getString("email");
        String emailNuevo = parametrosPeticion.getString("emailNuevo");
        String nuevaContrasenya = parametrosPeticion.getString("contrasenya");
        getServletContext().log("Parametros: " + parametrosPeticion);
        JSONObject respuestaPeticion = new JSONObject();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        getServletContext().log("Nuevo email: " + emailNuevo);
        
        String idUsuario = UsuarioDAO.obtenerIdDesdeEmail(email);
        UsuarioDAO.cambiar_info(nombre, descripcion, emailNuevo, idUsuario);
        if (!nuevaContrasenya.equals("")) {
        	UsuarioDAO.cambiar_pass_noverify(nuevaContrasenya, idUsuario);
        }
        
        
        respuestaPeticion.put("estado", "ok");
        
       
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
