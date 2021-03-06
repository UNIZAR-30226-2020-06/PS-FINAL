package com.espotify.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.espotify.model.ConnectionManager;
import com.espotify.model.Audio;


public class CancionDAO {
	private static String nombreGenero = null;
	private static String nombreAutor = null;
	
	private final static String INSERT_QUERY = "INSERT INTO Reproductor_musica.Audio (titulo, usuario, genero, url) VALUES (?,?,?, ?)";
	private final static String GET_ID_GENERO_QUERY = "SELECT g.id FROM Reproductor_musica.Genero g WHERE g.nombre = ? AND g.tipo = 'cancion'";
	private final static String GET_ID_AUTOR_QUERY = "SELECT a.id FROM Reproductor_musica.Usuario a WHERE nombre = ?";
	private final static String INSERT_URL_QUERY = "UPDATE Reproductor_musica.Audio SET url = ? WHERE id = ?";
	private final static String DELETE_QUERY = "DELETE FROM Reproductor_musica.Audio WHERE id = ?";
	private final static String GET_ID_CANCION_QUERY = "SELECT a.id FROM Reproductor_musica.Audio a WHERE titulo = ?";
	private final static String GET_ID_CANCION_AUTOR_QUERY = "SELECT a.id FROM Reproductor_musica.Audio a WHERE titulo = ? AND usuario = ?";
	private final static String GET_ID_ULTIMA_CANCION_QUERY = "SELECT a.id FROM Reproductor_musica.Audio a ORDER BY a.id DESC LIMIT 1";
	private final static String UPDATE_QUERY = "UPDATE Reproductor_musica.Audio SET titulo = ?, genero = ? WHERE id = ?";
	private final static String GET_NOMBRE_AUTOR_QUERY = "SELECT a.nombre FROM Reproductor_musica.Usuario a WHERE a.id = ?";
	private final static String GET_NOMBRE_GENERO_QUERY = "SELECT g.nombre FROM Reproductor_musica.Genero g WHERE g.id = ? AND g.tipo = 'cancion'";
	private final static String GET_TIPO_AUDIO = "SELECT g.tipo FROM Reproductor_musica.Audio a, Reproductor_musica.Genero g WHERE a.genero = g.id AND a.id = ?";

	private final static String GET_CANCIONES_USUARIO = "SELECT a.id, a.titulo, a.url, a.usuario, a.genero FROM Reproductor_musica.Audio a WHERE a.usuario = ? AND a.genero IN (SELECT g.id FROM Reproductor_musica.Genero g WHERE g.tipo = 'cancion')";
	private final static String GET_TODOS_QUERY = "SELECT * FROM Reproductor_musica.Audio WHERE genero IN (SELECT id FROM Reproductor_musica.Genero WHERE tipo = 'cancion')";
	private final static String GET_MASLIKES_QUERY = "SELECT a.id, a.url, a.titulo, a.usuario, a.genero" + 
													 " FROM Reproductor_musica.Audio a, Reproductor_musica.LikesAudio la" + 
													 " WHERE a.id = la.audio AND a.genero = ? GROUP BY a.id ORDER BY COUNT(la.audio) DESC LIMIT 20";	
	private final static String GET_NOLIKES_QUERY = "SELECT a.id, a.url, a.titulo, a.usuario, a.genero" + 
													" FROM Reproductor_musica.Audio a, Reproductor_musica.LikesAudio la" + 
													" WHERE a.id NOT IN (SELECT la.audio FROM Reproductor_musica.LikesAudio la) AND a.genero = ? GROUP BY a.id LIMIT 20";
	
	private final static String GET_INFO_QUERY = "SELECT a.id, a.url, a.titulo, u.nombre, g.nombre, (SELECT count(*) FROM Reproductor_musica.LikesAudio la WHERE la.audio = a.id) AS likes " + 
												 "FROM Reproductor_musica.Audio a, Reproductor_musica.Usuario u, Reproductor_musica.Genero g WHERE a.usuario = u.id AND a.genero = g.id AND a.id = ?";
	public int subirCancion(String titulo, int autor, int genero, String ruta) {
		System.out.println("SubirCancion Entro+++++++++++++++++");
		//int id_autor = obtenerIDAutor(autor);
		//int id_genero = obtenerIDGenero(genero);
		//System.out.println(id_genero);
		if (insertarCancion(titulo, autor, genero, ruta)) {
			return 1;
		}
		return 0;
	}
	
	public Audio obtenerInfoAudio(int id) {
		Connection conn;
		Audio a = null;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_INFO_QUERY);	
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				a = new Audio(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
			}
			ConnectionManager.releaseConnection(conn);
			
			return a;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la canción");
			return null;
		}
	}
	
	
	public List<Audio> obtenerCanciones() {
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_TODOS_QUERY);				
			ResultSet rs = ps.executeQuery();
			Audio a;
			List<Audio> listaAudios = new ArrayList<>();
			
			while(rs.next()) { 
				System.out.println("params: " + rs.getString(1) + rs.getString(2) + rs.getString(3) + rs.getString(4) + rs.getString(5));
				a = new Audio(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				listaAudios.add(a);
			}
			ConnectionManager.releaseConnection(conn);
			
			return listaAudios;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la canción");
			return null;
		}
	}
	
	public boolean insertar_url(String url, int id) {
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(INSERT_URL_QUERY);
			System.out.println(id);
			ps.setString(1, url);
			ps.setInt(2, id);
			
			ps.executeUpdate();
			
			ConnectionManager.releaseConnection(conn);
			System.out.println("SE HA INSERTADO LA URL");
			return true;
		} catch (SQLException e) {
			System.out.println("Error al insertar url");
			return false;
		}	
	}
	
	
	public boolean borrarCancion(int id) {
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(DELETE_QUERY);
			ps.setInt(1, id);
			
			ps.executeUpdate();
			
			ConnectionManager.releaseConnection(conn);
			
			new File("/var/www/html/almacen-mp3/" + id + ".mp3").delete();
			
			System.out.println("SE HA BORRADO LA CANCION");
			return true;
		} catch (SQLException e) {
			System.out.println("Error al borrar cancion");
			return false;
		}	
	}
	
	public boolean modificarCancion(String titulo, int genero, int id){
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(UPDATE_QUERY);
			ps.setString(1, titulo);
			ps.setInt(2, genero);
			ps.setInt(3, id);
			System.out.println(titulo);
			System.out.println(id);
			System.out.println(genero);
			ps.executeUpdate();
			
			ConnectionManager.releaseConnection(conn);
			System.out.println("SE HA MODIFICA LA CANCION");
			return true;
		} catch (SQLException e) {
			System.out.println("Error al modificar cancion");
			return false;
		}	
	}
	
	
	public String obtenerNombreAutor(int id_autor) {
		System.out.println("obtenerIDCancion Entro +++++++++++++++++");
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_NOMBRE_AUTOR_QUERY);
			ps.setInt(1, id_autor);
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
	
	public List<Audio> obtenerCancionesPorGenero(int idGenero) {
		Connection conn;
		List<Audio> listaAudios = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_MASLIKES_QUERY);				
			ps.setInt(1, idGenero);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				listaAudios.add(new Audio(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
			}
			
			PreparedStatement ps2 = conn.prepareStatement(GET_NOLIKES_QUERY);		
			ps2.setInt(1, idGenero);
			ResultSet rs2 = ps2.executeQuery();
			
			while(rs2.next()) { 
				listaAudios.add(new Audio(rs2.getString(1), rs2.getString(2), rs2.getString(3), rs2.getString(4), rs2.getString(5)));
			}
			
			ConnectionManager.releaseConnection(conn);
			
			return listaAudios;
		} catch (SQLException e) {
			return null;
		}
	}
	
	public String obtenerNombreGenero(int id_genero) {
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_NOMBRE_GENERO_QUERY);
			ps.setInt(1, id_genero);
			ResultSet rs = ps.executeQuery();
			String nombre = null;
			while(rs.next())
				nombre = rs.getString(1);
			ConnectionManager.releaseConnection(conn);
			return nombre;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la canci�n");
			return null;
		}
	}
	
	public String obtenerTipoAudio(int idAudio) {
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_TIPO_AUDIO);
			ps.setInt(1, idAudio);
			ResultSet rs = ps.executeQuery();
			String tipoAudio = "";
			
			while(rs.next())
				tipoAudio = rs.getString(1);
			
			ConnectionManager.releaseConnection(conn);
			return tipoAudio;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}
	}

	public String obtenerInfoCancion(int id_genero) {
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_NOMBRE_GENERO_QUERY);
			ps.setInt(1, id_genero);
			ResultSet rs = ps.executeQuery();
			String nombre = null;
			while(rs.next())
				nombre = rs.getString(1);
			ConnectionManager.releaseConnection(conn);
			return nombre;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la canci�n");
			return null;
		}
	}


	private int obtenerIDAutor(String autor) {
		System.out.println("obtenerIDAUTOR Entro +++++++++++++++++");
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ID_AUTOR_QUERY);
			
			ps.setString(1, autor);
			
			ResultSet rs = ps.executeQuery();
			System.out.println("EXITOO");
			int id_autor = 0;
			while(rs.next())
				id_autor = rs.getInt(1);
			ConnectionManager.releaseConnection(conn);
			
			return id_autor;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id del autor de la canción");
			return 0;
		}
	}


	private boolean insertarCancion(String titulo, int id_autor, int id_genero, String ruta) {
		System.out.println("insertarCancion Entro +++++++++++++++++");
		Connection conn;

			try {
				conn = ConnectionManager.getConnection();
			
				PreparedStatement ps = conn.prepareStatement(INSERT_QUERY);
				System.out.println(titulo);
				System.out.println(id_autor);
				System.out.println(id_genero);
				ps.setString(1, titulo);
				ps.setInt(2, id_autor);
				ps.setInt(3, id_genero);
				ps.setString(4, ruta);
				ps.executeUpdate();
				
				ConnectionManager.releaseConnection(conn);
				System.out.println("insertarCancion Salgo +++++++++++++++++");			
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		
	}

	public int obtenerIdCancion(String titulo) {
		System.out.println("obtenerIDCancion Entro +++++++++++++++++");
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ID_CANCION_QUERY);
			
			ps.setString(1, titulo);
			
			ResultSet rs = ps.executeQuery();
			int id = 0;
			while(rs.next())
				id = rs.getInt(1);
			ConnectionManager.releaseConnection(conn);
			return id;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la ultima canción");
			return 0;
		}
	}
	
	public int obtenerIdCancion(String titulo, int idUsuario) {
		System.out.println("obtenerIDCancion Entro +++++++++++++++++");
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ID_CANCION_AUTOR_QUERY);
			
			ps.setString(1, titulo);
			ps.setInt(2, idUsuario);
			
			ResultSet rs = ps.executeQuery();
			int id = 0;
			while(rs.next())
				id = rs.getInt(1);
			ConnectionManager.releaseConnection(conn);
			return id;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la ultima canción");
			return 0;
		}
	}
		
	private int obtenerUltimaCancion() {
		System.out.println("obtenerIDCancion Entro +++++++++++++++++");
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_ID_ULTIMA_CANCION_QUERY);				
			ResultSet rs = ps.executeQuery();
			int id = 0;
			while(rs.next())
				id = rs.getInt(1);
			ConnectionManager.releaseConnection(conn);
			return id;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener el id de la canción");
			return 0;
		}
	}
	
	public ArrayList<Audio> obtenerCancionesUsuario(int id_usuario){
		ArrayList<Audio> canciones = new ArrayList<Audio>();
		Connection conn;
		try {
			conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(GET_CANCIONES_USUARIO);
			ps.setInt(1, id_usuario);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				canciones.add(new Audio(rs.getString(1), rs.getString(3), rs.getString(2), rs.getString(4), obtenerNombreGenero(Integer.valueOf(rs.getString(5)))));	
			}
			ConnectionManager.releaseConnection(conn);
			return canciones;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error al obtener las canciones");
			return null;
		}		
	}
}
