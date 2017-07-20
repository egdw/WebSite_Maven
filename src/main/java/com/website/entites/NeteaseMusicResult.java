package com.website.entites;

import java.util.ArrayList;

public class NeteaseMusicResult {
	private long songCount;
	private ArrayList<NeteaseMusicSongs> songs;

	public long getSongCount() {
		return songCount;
	}

	public void setSongCount(long songCount) {
		this.songCount = songCount;
	}

	public ArrayList<NeteaseMusicSongs> getSongs() {
		return songs;
	}

	public void setSongs(ArrayList<NeteaseMusicSongs> songs) {
		this.songs = songs;
	}

	@Override
	public String toString() {
		return "NeteaseMusicResult [songCount=" + songCount + ", songs="
				+ songs + "]";
	}

}
