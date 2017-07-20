package com.website.entites;

import java.util.ArrayList;

public class NeteaseMusicAlbum {
	private long id;
	private String name;
	private NeteaseMusicArtists artist;
	private String picUrl;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public NeteaseMusicArtists getArtist() {
		return artist;
	}

	public void setArtist(NeteaseMusicArtists artist) {
		this.artist = artist;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	@Override
	public String toString() {
		return "NeteaseMusicAlbum [id=" + id + ", name=" + name + ", artist="
				+ artist + ", picUrl=" + picUrl + "]";
	}
	
}
