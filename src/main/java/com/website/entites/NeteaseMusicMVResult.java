package com.website.entites;

import java.util.ArrayList;

public class NeteaseMusicMVResult {
	private int mvCount;
	private ArrayList<NeteaseMusicMV> mvs;

	public NeteaseMusicMVResult() {
		super();
	}

	public int getMvCount() {
		return mvCount;
	}

	public void setMvCount(int mvCount) {
		this.mvCount = mvCount;
	}

	public ArrayList<NeteaseMusicMV> getMvs() {
		return mvs;
	}

	public void setMvs(ArrayList<NeteaseMusicMV> mvs) {
		this.mvs = mvs;
	}

	@Override
	public String toString() {
		return "NeteaseMusicMVResult [mvCount=" + mvCount + ", mvs=" + mvs
				+ "]";
	}

}
