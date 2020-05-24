
package com.espotify.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.espotify.dao.ListaReproduccionDAO;
import com.espotify.dao.UsuarioDAO;
import com.espotify.model.ListaReproduccion;

/**
 * Servlet implementation Servlet
 */
public class Crear_ListaRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ALMACEN_PATH = "/var/www/html/almacen-mp3/almacen-img/listas/";
	private static final String RUTA = "https://espotify.ddns.net/almacen-mp3/almacen-img/listas/";
       
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().log("Creando una lista de reproduccion...");		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		HttpSession session = request.getSession();
		int usuario = Integer.parseInt((String) session.getAttribute("id"));
		

		try {
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			for(FileItem file: fileItemsList)
				getServletContext().log("POSICION: "+ fileItemsList.indexOf(file) + " Contenido: " + file.getFieldName() + "---" + file.getString());
			String nombre = (String)fileItemsList.get(1).getString();
			String descripcion = (String)fileItemsList.get(2).getString();
			String tipo = (String)fileItemsList.get(3).getString();
			
			ListaReproduccionDAO listaReproduccionDAO = new ListaReproduccionDAO();
			if(listaReproduccionDAO.crear(usuario, nombre, descripcion, tipo)) {
				if(fileItemsList.get(0) != null) {
					ListaReproduccion lista = listaReproduccionDAO.getInfoList(nombre, usuario, tipo);
					if(subirImagenAlmacen(lista.getId(), fileItemsList.get(0))) {
						if(tipo.equals("podcast")) {
							request.getRequestDispatcher("mostrar_podcasts?tipo=podcast&pagina=10").forward(request, response);
						} else {
							request.getRequestDispatcher("mostrar_lrs?tipo=ListaRep&pagina=10").forward(request, response);
						}
					} else {
						out.write("Error al subir la imagen");
					}
				}
				if(tipo.equals("podcast")) {
					request.getRequestDispatcher("mostrar_podcasts?tipo=podcast&pagina=10").forward(request, response);
				} else {
					request.getRequestDispatcher("mostrar_lrs?tipo=ListaRep&pagina=10").forward(request, response);
				}
			} else {
				out.write("Error al crear una lista de reproducción");
			}
						
			//out.write("<a href=\"UploadDownloadFileServlet?fileName="+fileItem.getName()+"\">Download "+fileItem.getName()+"</a>");
			//gooogle.es		

		} catch (FileUploadException e) {
			getServletContext().log("FAIL: " + e.toString());
			out.write("Se ha producido un error al subir el fichero");
		} catch (Exception e) {
			getServletContext().log("FAIL: " + e.toString());
			out.write("Se ha producido un error al subir el fichero");
		}
		//out.write("</body></html>");
	}
	
	private boolean subirImagenAlmacen(int id, FileItem fileItem) {
		getServletContext().log("FieldName="+fileItem.getFieldName());
		getServletContext().log("FileName="+fileItem.getName());
		getServletContext().log("Contenido="+fileItem.getContentType());
		getServletContext().log("Tama�o (B)="+fileItem.getSize());
		//getServletContext().log("Directorio fichero: " + request.getServletContext().getAttribute("FILES_DIR"));
		getServletContext().log("Nombre fichero: " + fileItem.getName());
	//	getServletContext().log("Got a form field: " + fileItem.getFieldName()+ " " +fileItem.getString());
		String rutaImagen = ALMACEN_PATH + id + ".jpg";
		
		getServletContext().log("Ruta audio: " + rutaImagen);
		
		File ficheroImagen = new File(rutaImagen);
		getServletContext().log("Absolute Path at server="+ficheroImagen.getAbsolutePath());
		
		if(ficheroImagen.exists()) {
			ficheroImagen.delete();
		}
		
		try {
			fileItem.write(ficheroImagen);
			ficheroImagen.setReadable(true, false);
			ficheroImagen.setExecutable(true, false);
			ficheroImagen.setWritable(true, false);
			
			return true;
		} catch (Exception e) {
			getServletContext().log("FAIL: " + e.toString());		
			return false;
		}
	}

}


