package com.website.entites;

import java.util.Arrays;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class WebsiteProject {
    private Long projectId;

    private String projectUrl;

    private String projectTopic;

    private String projectText;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 
    private Date projectCreateDate;

    private byte[] projectImg;

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getProjectUrl() {
        return projectUrl;
    }

    public void setProjectUrl(String projectUrl) {
        this.projectUrl = projectUrl;
    }

    public String getProjectTopic() {
        return projectTopic;
    }

    public void setProjectTopic(String projectTopic) {
        this.projectTopic = projectTopic;
    }

    public String getProjectText() {
        return projectText;
    }

    public void setProjectText(String projectText) {
        this.projectText = projectText;
    }

    public Date getProjectCreateDate() {
        return projectCreateDate;
    }

    public void setProjectCreateDate(Date projectCreateDate) {
        this.projectCreateDate = projectCreateDate;
    }

    public byte[] getProjectImg() {
        return projectImg;
    }

    public void setProjectImg(byte[] projectImg) {
        this.projectImg = projectImg;
    }

	@Override
	public String toString() {
		return "WebsiteProject [projectId=" + projectId + ", projectUrl="
				+ projectUrl + ", projectTopic=" + projectTopic
				+ ", projectText=" + projectText + ", projectCreateDate="
				+ projectCreateDate + ", projectImg="
				+ Arrays.toString(projectImg) + "]";
	}
    
    
}