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
import com.espotify.dao.TransmisionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.Audio;
import com.espotify.model.ListaReproduccion;
import com.espotify.model.Transmision;
import com.espotify.model.Usuario;

/**
 * Servlet implementation class AndroidGet_AllTransmisionesServlet
 */
@WebServlet("/AndroidGet_AllTransmisionesServlet")
public class AndroidGet_AllTransmisionesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidGet_AllTransmisionesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        JSONObject parametrosPeticion = JSONAdapter.parsarJSON(request);
        getServletContext().log("--- ~AndroidGet_AllTransmisionesServlet~ ---");
        getServletContext().log("Parametros: " + parametrosPeticion);
        
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        List<Transmision> lista = TransmisionDAO.getTodasTransmisiones();
        getServletContext().log("Transmisiones: " + lista);
        
        boolean hayTransmisiones = false;
        String nombresTransmision = "";
        String urlsTransmision = "";
        String usuariosTransmision = "";
        String activaTransmision = "";
        
        for (Transmision t : lista) {
    		nombresTransmision += t.getNombre() + "|";
    		usuariosTransmision += t.getUsuario() + "|";
    		
    		if(t.getActiva()) {
    			activaTransmision += "true|";
    			urlsTransmision += TransmisionDAO.getURLTransmision(t.getId()) + "|";
    		} else {
    			activaTransmision += "false|";
    			urlsTransmision += "|";
    		}
        	hayTransmisiones = true;
        }

        JSONObject respuestaPeticion = new JSONObject();
        
        if (hayTransmisiones) {
        	nombresTransmision = nombresTransmision.substring(0, nombresTransmision.length() - 1);
        	urlsTransmision = urlsTransmision.substring(0, urlsTransmision.length() - 1);
        	usuariosTransmision = usuariosTransmision.substring(0, usuariosTransmision.length() - 1);
        	activaTransmision = activaTransmision.substring(0, activaTransmision.length() - 1);
        	
        }
        
        respuestaPeticion.put("nombresTransmision", nombresTransmision);
        respuestaPeticion.put("urlsTransmision", urlsTransmision);
        respuestaPeticion.put("usuariosTransmision", usuariosTransmision);
        respuestaPeticion.put("activaTransmision", activaTransmision);
        getServletContext().log("Respuesta: " + respuestaPeticion);
        getServletContext().log("----------------------------------------");
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
