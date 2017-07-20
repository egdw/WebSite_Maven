package com.website.entites;

import java.util.ArrayList;

public class NeteaseMusicSongs {
	private long id;
	private String name;
	private ArrayList<NeteaseMusicArtists> artists;
	private NeteaseMusicAlbum album;
	private String mp3Url;
	private long djProgramId;
	private String page;

	private ArrayList<String> lyrics;

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

	public ArrayList<NeteaseMusicArtists> getArtists() {
		return artists;
	}

	public void setArtists(ArrayList<NeteaseMusicArtists> artists) {
		this.artists = artists;
	}

	public NeteaseMusicAlbum getAlbum() {
		return album;
	}

	public void setAlbum(NeteaseMusicAlbum album) {
		this.album = album;
	}

	public String getMp3Url() {
		return mp3Url;
	}

	public void setMp3Url(String mp3Url) {
		this.mp3Url = mp3Url;
	}

	public long getDjProgramId() {
		return djProgramId;
	}

	public void setDjProgramId(long djProgramId) {
		this.djProgramId = djProgramId;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "NeteaseMusicSongs [id=" + id + ", name=" + name + ", artists="
				+ artists + ", album=" + album + ", mp3Url=" + mp3Url
				+ ", djProgramId=" + djProgramId + ", page=" + page + "]";
	}

	public NeteaseMusicSongs(long id, String name,
			ArrayList<NeteaseMusicArtists> artists, NeteaseMusicAlbum album,
			String mp3Url, long djProgramId, String page) {
		super();
		this.id = id;
		this.name = name;
		this.artists = artists;
		this.album = album;
		this.mp3Url = mp3Url;
		this.djProgramId = djProgramId;
		this.page = page;
	}

	public NeteaseMusicSongs() {
		super();
	}

	public ArrayList<String> getLyrics() {
		return lyrics;
	}

	public void setLyrics(ArrayList<String> lyrics) {
		this.lyrics = lyrics;
	}

}
