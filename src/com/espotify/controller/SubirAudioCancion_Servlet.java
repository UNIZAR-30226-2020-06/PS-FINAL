package com.espotify.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.espotify.dao.CancionDAO;
import com.espotify.dao.GeneroDAO;
import com.espotify.dao.SubirAudioDAO;
import com.espotify.model.Genero;

@WebServlet("/SubirAudioCancion_Servlet")
public class SubirAudioCancion_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ALMACEN_PATH = "/var/www/html/almacen-mp3/";
	private static final String RUTA = "https://espotify.ddns.net/almacen-mp3/";
	/*
	 * Constructor principal
	 * 
	 */
	
    private ServletFileUpload uploader = null;
	@Override
	public void init() throws ServletException{
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
		fileFactory.setRepository(filesDir);
		this.uploader = new ServletFileUpload(fileFactory);
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int autor = Integer.valueOf((String) session.getAttribute("id"));
		
		getServletContext().log("Comienza subida de MP3...");
		if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		
		try {
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			
			
	
			for(FileItem file: fileItemsList)
				getServletContext().log("POSICION: "+ fileItemsList.indexOf(file) + " Contenido: " + file.getFieldName() + "---" + file.getString());
			String nombre = (String)fileItemsList.get(1).getString();
			int genero = Integer.valueOf((String)fileItemsList.get(2).getString());
			
			
			CancionDAO cancion = new CancionDAO();
			if (cancion.subirCancion(nombre, autor, genero, "") != 0) {
				int id = cancion.obtenerIdCancion(nombre, autor);
				String ruta = subirAudioAlmacen(id, fileItemsList.get(0));
				if(ruta != null) {
					if(cancion.insertar_url(ruta, id)) {
						request.getRequestDispatcher("/obtener_contenido_perfil?pagina=10").forward(request, response);
					} else {
						cancion.borrarCancion(id);
						getServletContext().log("ERROR AL AGREGAR LA URL: " + ruta);
					}
				} else {
					cancion.borrarCancion(id);
					getServletContext().log("ERROR AL SUBIR LA CANCION AL ALMACEN");
				}
			} else {
				out.write("Se ha producido un error al guardar en la base de datos");
			}
		} catch (FileUploadException e) {
			getServletContext().log("FAIL: " + e.toString());
			out.write("Se ha producido un error al subir el fichero");
		}
		/*} catch (Exception e) {
			getServletContext().log("FAIL: " + e.toString());
			out.write("Se ha producido un error al subir el fichero");
		}*/
		//out.write("</body></html>");
	}
	
	
	private String subirAudioAlmacen(int id, FileItem fileItem) {
		getServletContext().log("FieldName="+fileItem.getFieldName());
		getServletContext().log("FileName="+fileItem.getName());
		getServletContext().log("Contenido="+fileItem.getContentType());
		getServletContext().log("Tama�o (B)="+fileItem.getSize());
		//getServletContext().log("Directorio fichero: " + request.getServletContext().getAttribute("FILES_DIR"));
		getServletContext().log("Nombre fichero: " + fileItem.getName());
		
		String rutaAudio = ALMACEN_PATH + id + ".mp3";
		
		getServletContext().log("Ruta audio: " + rutaAudio);
		
		File ficheroAudio = new File(rutaAudio);
		getServletContext().log("Absolute Path at server="+ficheroAudio.getAbsolutePath());
		
		try {
			fileItem.write(ficheroAudio);
			ficheroAudio.setReadable(true, false);
			ficheroAudio.setExecutable(true, false);
			ficheroAudio.setWritable(true, false);
			String ruta = RUTA + id + ".mp3";
			return ruta;
		} catch (Exception e) {
			getServletContext().log("FAIL: " + e.toString());		
			return null;
		}
	}

}