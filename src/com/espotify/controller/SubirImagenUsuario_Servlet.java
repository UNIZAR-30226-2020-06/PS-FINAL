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

import com.espotify.dao.GeneroDAO;
import com.espotify.dao.SubirAudioDAO;
import com.espotify.model.Genero;

@WebServlet("/SubirImagenUsuario_Servlet")
public class SubirImagenUsuario_Servlet extends HttpServlet {
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
		getServletContext().log("Comienza subida de imagen...");
		if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		
		HttpSession session = request.getSession();
		int idUsuario = Integer.valueOf((String) session.getAttribute("id"));

		try {
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
			int lastId = SubirAudioDAO.obtenerUltimaCancionId();
			while(fileItemsIterator.hasNext()){
				FileItem fileItem = fileItemsIterator.next();
				getServletContext().log("FieldName="+fileItem.getFieldName());
				getServletContext().log("FileName="+fileItem.getName());
				getServletContext().log("Contenido="+fileItem.getContentType());
				getServletContext().log("Tama�o (B)="+fileItem.getSize());
				//getServletContext().log("Directorio fichero: " + request.getServletContext().getAttribute("FILES_DIR"));
				getServletContext().log("Nombre fichero: " + fileItem.getName());
				
				String rutaImagen = ALMACEN_PATH + idUsuario + ".jpg";
				
				getServletContext().log("Ruta audio: " + rutaImagen);
				
				File ficheroImagen = new File(rutaImagen);
				getServletContext().log("Absolute Path at server="+ficheroImagen.getAbsolutePath());
				
				if(ficheroImagen.exists()) {
					ficheroImagen.delete();
				}
				
				fileItem.write(ficheroImagen);
				
				ficheroImagen.setReadable(true, false);
				ficheroImagen.setExecutable(true, false);
				ficheroImagen.setWritable(true, false);
				
				request.setAttribute("ruta", RUTA + idUsuario + ".jpg");
				//out.write("<a href=\"UploadDownloadFileServlet?fileName="+fileItem.getName()+"\">Download "+fileItem.getName()+"</a>");
				//gooogle.es
				
			}
			
			request.getRequestDispatcher("obtener_contenido_perfil").forward(request, response);

		} catch (FileUploadException e) {
			getServletContext().log("FAIL: " + e.toString());
			out.write("Se ha producido un error al subir el fichero");
		} catch (Exception e) {
			getServletContext().log("FAIL: " + e.toString());
			out.write("Se ha producido un error al subir el fichero");
		}
		//out.write("</body></html>");
	}

}
