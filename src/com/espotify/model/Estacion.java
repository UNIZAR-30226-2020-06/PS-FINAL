package com.espotify.model;

public class Estacion {
	private int id;
	private String url;
	private boolean libre;
	
	public Estacion(int id, String url, boolean libre) {
		this.id = id;
		this.url = url;
		this.libre = libre;
	}
	
	public String getUrl() {
		return url;
	}
	
	public int getId() {
		return id;
	}
	
	public boolean getLibre() {
		return libre;
	}
}
