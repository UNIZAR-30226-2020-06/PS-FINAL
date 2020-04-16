package com.espotify.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.espotify.model.ConnectionManager;
import com.espotify.model.Genero;

public class GeneroDAO {
	private final static String GET_ID_GENERO_MUSICA = "SELECT g.id FROM Reproductor_musica.Genero g WHERE g.tipo = 'cancion'";
	private final static String GET_NOMBRE_GENERO_MUSICA = "SELECT g.nombre FROM Reproductor_musica.Genero g WHERE g.id = ? AND g.tipo = 'cancion'";
	private final static String GET_ID_GENERO_PODCAST = "SELECT g.id FROM Reproductor_musica.Genero g WHERE g.tipo = 'podcast'";
	private final static String GET_NOMBRE_GENERO_PODCAST = "SELECT g.nombre FROM Reproductor_musica.Genero g WHERE g.id = ? AND g.tipo = 'podcast'";

	private final static String CANCION = "cancion";
	private final static String PODCAST = "podacast";

	
	public ArrayList<Genero> obtenerGeneroMusica() {
		ArrayList<Genero> generos = new ArrayList<Genero>();
		
		ArrayList<Integer> ids = obtenerIdGeneroMusica();
		for(int id: ids) {
			generos.add(new Genero(id, obtenerNombreMusica(id), CANCION));
		}
		return generos;
	}
	
	private ArrayList<Integer> obtenerIdGeneroMusica() {
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ID_GENERO_MUSICA);
			ResultSet rs = ps.executeQuery();
			ArrayList<Integer> ids = new ArrayList<Integer>();
			while(rs.next())
				ids.add(Integer.parseInt(rs.getString(1)));
			ConnectionManager.releaseConnection(conn);
			return ids; 
		} catch (SQLException e) {
			System.out.println("Error al obtener los ids de los generos");
			return null;
		}
	}
	
	private String obtenerNombreMusica(int id) {
		System.out.println("obtenerIDCancion Entro +++++++++++++++++");
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_NOMBRE_GENERO_MUSICA);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			String nombre = null;
			while(rs.next())
				nombre = rs.getString(1);
			ConnectionManager.releaseConnection(conn);
			return nombre;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la canción");
			return null;
		}
	}
}
