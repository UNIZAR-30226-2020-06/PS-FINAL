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

/**
 * Servlet implementation class SubirImagenPodcast_Servlet
 */
@WebServlet("/SubirImagenPodcast_Servlet")
public class SubirImagenPodcast_Servlet extends HttpServlet {
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
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().log("Comienza subida de imagen...");		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		

		try {
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			for(FileItem file: fileItemsList)
				getServletContext().log("POSICION: "+ fileItemsList.indexOf(file) + " Contenido: " + file.getFieldName() + "---" + file.getString());
			int idPodcast = Integer.valueOf((String)fileItemsList.get(1).getString());
			getServletContext().log("AQUI EL ID: "+ idPodcast);
			
				FileItem fileItem = fileItemsList.get(0);
				getServletContext().log("FieldName="+fileItem.getFieldName());
				getServletContext().log("FileName="+fileItem.getName());
				getServletContext().log("Contenido="+fileItem.getContentType());
				getServletContext().log("Tama�o (B)="+fileItem.getSize());
				//getServletContext().log("Directorio fichero: " + request.getServletContext().getAttribute("FILES_DIR"));
				getServletContext().log("Nombre fichero: " + fileItem.getName());
			//	getServletContext().log("Got a form field: " + fileItem.getFieldName()+ " " +fileItem.getString());
				String rutaImagen = ALMACEN_PATH + idPodcast + ".jpg";
				
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
				
				request.setAttribute("ruta", RUTA + idPodcast + ".jpg");
				//out.write("<a href=\"UploadDownloadFileServlet?fileName="+fileItem.getName()+"\">Download "+fileItem.getName()+"</a>");
				//gooogle.es
				
			
			request.getRequestDispatcher("mostrar_podcasts?tipo=podcast&pagina=10").forward(request, response);

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
