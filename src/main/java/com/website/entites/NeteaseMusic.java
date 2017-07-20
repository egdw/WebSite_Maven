package com.website.entites;


public class NeteaseMusic {
	private int code;
	private NeteaseMusicResult result;
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public NeteaseMusicResult getResult() {
		return result;
	}

	public void setResult(NeteaseMusicResult result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "NeteaseMusic [code=" + code + ", result=" + result + "]";
	}

	


}
