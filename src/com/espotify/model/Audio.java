package com.espotify.model;

/**
 * Clase que define la estructura de un audio.
 */

public class Audio {
	
    private int id;
	private String url;
	private String titulo;
	private String usuario;
	private String genero;
	private String likeUsuario;
	private int numLikes;
	
	public Audio(String id, String url, String titulo, String usuario, String genero) {
		super();
        this.id = Integer.parseInt(id);
		this.url = url;
		this.titulo = titulo;
		this.usuario = usuario;
		this.genero = genero;
	}
	
	public Audio(String id, String url, String titulo, String usuario, String genero, int nLikes) {
		super();
        this.id = Integer.parseInt(id);
		this.url = url;
		this.titulo = titulo;
		this.usuario = usuario;
		this.genero = genero;
		this.numLikes = nLikes;
	}
	
    public int getId() {
        return id;
    }
	
	public String getUrl() {
        return url;
	}

	public String getTitulo() {
        return titulo;
    }
	
	public String getUsuario() {
		return usuario;
	}

	public String getGenero() {
        return genero;
    }
	
	public void setLikeUsuario(String likeUsuario) {
		this.likeUsuario = likeUsuario;
	}
	
	public String getLikeUsuario() {
		return likeUsuario;
	}
	
	public void setNumLikes(int numLikes) {
		this.numLikes = numLikes;
	}
	
	public int getNumLikes() {
		return numLikes;
	}
}