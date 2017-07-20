package com.website.entites;

public class NeteaseMusicMvData {
	private int id;
	private String name;
	private String artistId;
	private String artistName;
	private String briefDesc;
	private String desc;
	private String cover;
	private String coverId;
	private String playCount;
	private String subCount;
	private String shareCount;
	private String commentCount;
	private String duration;
	private String nType;
	private String publishTime;
	private NeteaseMusicMVBrs brs;

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

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
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

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getCoverId() {
		return coverId;
	}

	public void setCoverId(String coverId) {
		this.coverId = coverId;
	}

	public String getPlayCount() {
		return playCount;
	}

	public void setPlayCount(String playCount) {
		this.playCount = playCount;
	}

	public String getSubCount() {
		return subCount;
	}

	public void setSubCount(String subCount) {
		this.subCount = subCount;
	}

	public String getShareCount() {
		return shareCount;
	}

	public void setShareCount(String shareCount) {
		this.shareCount = shareCount;
	}

	public String getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getnType() {
		return nType;
	}

	public void setnType(String nType) {
		this.nType = nType;
	}

	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public NeteaseMusicMVBrs getBrs() {
		return brs;
	}

	public void setBrs(NeteaseMusicMVBrs brs) {
		this.brs = brs;
	}

	@Override
	public String toString() {
		return "NeteaseMusicMvData [id=" + id + ", name=" + name
				+ ", artistId=" + artistId + ", artistName=" + artistName
				+ ", briefDesc=" + briefDesc + ", desc=" + desc + ", cover="
				+ cover + ", coverId=" + coverId + ", playCount=" + playCount
				+ ", subCount=" + subCount + ", shareCount=" + shareCount
				+ ", commentCount=" + commentCount + ", duration=" + duration
				+ ", nType=" + nType + ", publishTime=" + publishTime
				+ ", brs=" + brs + "]";
	}

	public NeteaseMusicMvData(int id, String name, String artistId,
			String artistName, String briefDesc, String desc, String cover,
			String coverId, String playCount, String subCount,
			String shareCount, String commentCount, String duration,
			String nType, String publishTime, NeteaseMusicMVBrs brs) {
		super();
		this.id = id;
		this.name = name;
		this.artistId = artistId;
		this.artistName = artistName;
		this.briefDesc = briefDesc;
		this.desc = desc;
		this.cover = cover;
		this.coverId = coverId;
		this.playCount = playCount;
		this.subCount = subCount;
		this.shareCount = shareCount;
		this.commentCount = commentCount;
		this.duration = duration;
		this.nType = nType;
		this.publishTime = publishTime;
		this.brs = brs;
	}

	public NeteaseMusicMvData() {
		super();
	}

}
