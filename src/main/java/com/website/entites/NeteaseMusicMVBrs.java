package com.website.entites;

public class NeteaseMusicMVBrs {
	private String bq;
	private String lq;
	private String mq;
	private String hq;

	public String getBq() {
		return bq;
	}

	public void setBq(String bq) {
		this.bq = bq;
	}

	public String getLq() {
		return lq;
	}

	public void setLq(String lq) {
		this.lq = lq;
	}

	public String getMq() {
		return mq;
	}

	public void setMq(String mq) {
		this.mq = mq;
	}

	public String getHq() {
		return hq;
	}

	public void setHq(String hq) {
		this.hq = hq;
	}

	@Override
	public String toString() {
		return "NeteaseMusicMVBrs [bq=" + bq + ", lq=" + lq + ", mq=" + mq
				+ ", hq=" + hq + "]";
	}

	public NeteaseMusicMVBrs(String bq, String lq, String mq, String hq) {
		super();
		this.bq = bq;
		this.lq = lq;
		this.mq = mq;
		this.hq = hq;
	}

	public NeteaseMusicMVBrs() {
		super();
	}

}
