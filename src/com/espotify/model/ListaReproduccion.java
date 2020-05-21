package com.espotify.model;

/**
 * Clase que define la estructura de una lista de reproducci�n.
 */

public class ListaReproduccion {
	
    private int id;
	private String usuario;
	private String nombre;
	private String descripcion;
	private String imagen;
	private String tipo;
	
	public ListaReproduccion(String id, String nombre, String usuario, String descripcion, String imagen, String tipo) {
		super();
        this.id = Integer.parseInt(id);
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.imagen = imagen;
		this.tipo = tipo;
		this.usuario = usuario;
	}
	
    public int getId() {
        return id;
    }
    
	public String getNombre() {
		return nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public String getImagen() {
		return imagen;
	}
	
	public String getTipo() {
		return tipo;
	}
	
	public String getUsuario() {
		return usuario;
	}
}
