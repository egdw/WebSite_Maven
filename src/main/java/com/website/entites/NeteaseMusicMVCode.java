package com.website.entites;


public class NeteaseMusicMVCode {
	private NeteaseMusicMVResult result;
	private int code;

	public NeteaseMusicMVCode(NeteaseMusicMVResult result, int code) {
		super();
		this.result = result;
		this.code = code;
	}

	@Override
	public String toString() {
		return "NeteaseMusicMVCode [result=" + result + ", code=" + code + "]";
	}

	public NeteaseMusicMVResult getResult() {
		return result;
	}

	public void setResult(NeteaseMusicMVResult result) {
		this.result = result;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public NeteaseMusicMVCode() {
		super();
	}

}
