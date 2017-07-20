package com.website.entites;

import java.util.ArrayList;
import java.util.Arrays;

public class NeteaseMusicMV {
	private int id;
	private String cover;
	private String name;
	private int playCount;
	private String briefDesc;
	private String desc;
	private String artistName;
	private int artistId;
	private int duration;
	private int mark;
	private ArrayList<NeteaseMusicMVArtist> artists;

	

	@Override
	public String toString() {
		return "NeteaseMusicMV [id=" + id + ", cover=" + cover + ", name=" + name + ", playCount=" + playCount
				+ ", briefDesc=" + briefDesc + ", desc=" + desc + ", artistName=" + artistName + ", artistId="
				+ artistId + ", duration=" + duration + ", mark=" + mark + ", artists=" + artists + "]";
	}



	public NeteaseMusicMV(int id, String cover, String name, int playCount, String briefDesc, String desc,
			String artistName, int artistId, int duration, int mark, ArrayList<NeteaseMusicMVArtist> artists) {
		super();
		this.id = id;
		this.cover = cover;
		this.name = name;
		this.playCount = playCount;
		this.briefDesc = briefDesc;
		this.desc = desc;
		this.artistName = artistName;
		this.artistId = artistId;
		this.duration = duration;
		this.mark = mark;
		this.artists = artists;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getCover() {
		return cover;
	}



	public void setCover(String cover) {
		this.cover = cover;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getPlayCount() {
		return playCount;
	}



	public void setPlayCount(int playCount) {
		this.playCount = playCount;
	}



	public String getBriefDesc() {
		return briefDesc;
	}



	public void setBriefDesc(String briefDesc) {
		this.briefDesc = briefDesc;
	}



	public String getDesc() {
		return desc;
	}



	public void setDesc(String desc) {
		this.desc = desc;
	}



	public String getArtistName() {
		return artistName;
	}



	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}



	public int getArtistId() {
		return artistId;
	}



	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}



	public int getDuration() {
		return duration;
	}



	public void setDuration(int duration) {
		this.duration = duration;
	}



	public int getMark() {
		return mark;
	}



	public void setMark(int mark) {
		this.mark = mark;
	}



	public ArrayList<NeteaseMusicMVArtist> getArtists() {
		return artists;
	}



	public void setArtists(ArrayList<NeteaseMusicMVArtist> artists) {
		this.artists = artists;
	}



	public NeteaseMusicMV() {
		super();
	}

}
