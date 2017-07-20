package com.website.entites;

import java.util.ArrayList;

public class NeteaseMusicMvModel {
	private int code;
	private NeteaseMusicMvData data;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public NeteaseMusicMvData getData() {
		return data;
	}

	public void setData(NeteaseMusicMvData data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "NeteaseMusicMvModel [code=" + code + ", data=" + data + "]";
	}

	public NeteaseMusicMvModel(int code, NeteaseMusicMvData data) {
		super();
		this.code = code;
		this.data = data;
	}

	public NeteaseMusicMvModel() {
		super();
	}

}
