package com.website.entites;

import java.util.ArrayList;
import java.util.Arrays;

public class NeteaseMusicMVArtist {
	private int id;
	private String name;
	private ArrayList<String> alias;

	public NeteaseMusicMVArtist(int id, String name, ArrayList<String> alias) {
		super();
		this.id = id;
		this.name = name;
		this.alias = alias;
	}

	@Override
	public String toString() {
		return "NeteaseMusicMVArtist [id=" + id + ", name=" + name + ", alias=" + alias + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<String> getAlias() {
		return alias;
	}

	public void setAlias(ArrayList<String> alias) {
		this.alias = alias;
	}

	public NeteaseMusicMVArtist() {
		super();
	}

}
