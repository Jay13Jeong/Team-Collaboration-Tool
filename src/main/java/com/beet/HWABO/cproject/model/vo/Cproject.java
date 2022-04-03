package com.beet.HWABO.cproject.model.vo;

public class Cproject implements java.io.Serializable {
	private static final long serialVersionUID = 4441L;
	
	private String projectname;
	private String wauthority;
	private String lauthority;
	private String dauthority;
	
	public Cproject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cproject(String projectname, String wauthority, String lauthority, String dauthority) {
		super();
		this.projectname = projectname;
		this.wauthority = wauthority;
		this.lauthority = lauthority;
		this.dauthority = dauthority;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getWauthority() {
		return wauthority;
	}

	public void setWauthority(String wauthority) {
		this.wauthority = wauthority;
	}

	public String getLauthority() {
		return lauthority;
	}

	public void setLauthority(String lauthority) {
		this.lauthority = lauthority;
	}

	public String getDauthority() {
		return dauthority;
	}

	public void setDauthority(String dauthority) {
		this.dauthority = dauthority;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Cproject [projectname=" + projectname + ", wauthority=" + wauthority + ", lauthority=" + lauthority
				+ ", dauthority=" + dauthority + "]";
	}
	
	
	
}
