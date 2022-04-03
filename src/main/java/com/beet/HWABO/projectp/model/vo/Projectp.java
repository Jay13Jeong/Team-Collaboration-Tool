package com.beet.HWABO.projectp.model.vo;

public class Projectp implements java.io.Serializable {
	private static final long serialVersionUID = 44473L;
	
	private String participantsname;
	private String adminwhether;
	
	public Projectp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Projectp(String participantsname, String adminwhether) {
		super();
		this.participantsname = participantsname;
		this.adminwhether = adminwhether;
	}
	public String getParticipantsname() {
		return participantsname;
	}
	public void setParticipantsname(String participantsname) {
		this.participantsname = participantsname;
	}
	public String getAdminwhether() {
		return adminwhether;
	}
	public void setAdminwhether(String adminwhether) {
		this.adminwhether = adminwhether;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Projectp [participantsname=" + participantsname + ", adminwhether=" + adminwhether + "]";
	}
	
	

}
