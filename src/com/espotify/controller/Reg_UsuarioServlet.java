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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.espotify.dao.UsuarioDAO;


/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/Reg_UsuarioServlet")
public class Reg_UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ALMACEN_PATH = "/var/www/html/almacen-mp3/almacen-img/usuarios/";
	private static final String RUTA = "https://espotify.ddns.net/almacen-mp3/almacen-img/usuarios/";	
	
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
		getServletContext().log("Comienza registro...");		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		

		try {
			int id = 0;
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			for(FileItem file: fileItemsList)
				getServletContext().log("POSICION: "+ fileItemsList.indexOf(file) + " Contenido: " + file.getFieldName() + "---" + file.getString());
			String nombre = (String)fileItemsList.get(1).getString();
			String email = (String)fileItemsList.get(2).getString();
			String contrasena = (String)fileItemsList.get(3).getString();
			String repeticionContrasena = (String)fileItemsList.get(4).getString();
			String descripcion = (String)fileItemsList.get(5).getString();
			
			if(contrasena.equals(repeticionContrasena)) {
				UsuarioDAO usuarioDAO = new UsuarioDAO();
				Boolean registro = usuarioDAO.register(nombre, email, repeticionContrasena, descripcion);
				if(registro) {
					id = Integer.parseInt(usuarioDAO.obtenerIdDesdeEmail(email));
					FileItem fileItem = fileItemsList.get(0);
					if(subirImagenAlmacen(id, fileItem)) {
						response.sendRedirect("inicio.jsp");
					}
				}
			}	
			response.sendRedirect("sign_up.jsp?error2=usuario_existente");
			
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