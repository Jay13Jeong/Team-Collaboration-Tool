package com.beet.HWABO.member.model.vo;

public class PjMember implements java.io.Serializable{
	private static final long serialVersionUID = 118554L;
	
	private String pnum;
	private String ucode;
	private String pjadmin;
	
	public PjMember() {
		
	}

	public PjMember(String pnum, String ucode, String pjadmin) {
		super();
		this.pnum = pnum;
		this.ucode = ucode;
		this.pjadmin = pjadmin;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getUcode() {
		return ucode; 	
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getPjadmin() {
		return pjadmin;
	}

	public void setPjadmin(String pjadmin) {
		this.pjadmin = pjadmin;
	}

	@Override
	public String toString() {
		return "PjMember [pnum=" + pnum + ", ucode=" + ucode + ", pjadmin=" + pjadmin + "]";
	}
	
	
	
}
