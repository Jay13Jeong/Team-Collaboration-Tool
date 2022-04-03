package com.beet.HWABO.invite.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Invite implements java.io.Serializable{
	private static final long serialVersionUId = 1155L;
	
	private String invtkey;
	private String ucode;
	private String pnum;
	private String invtemail;
	private String invtuse;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date exprtdate;
	
	public Invite() {}

	public Invite(String invtkey, String ucode, String pnum, String invtemail, String invtuse, Date exprtdate) {
		super();
		this.invtkey = invtkey;
		this.ucode = ucode;
		this.pnum = pnum;
		this.invtemail = invtemail;
		this.invtuse = invtuse;
		this.exprtdate = exprtdate;
	}

	public String getInvtkey() {
		return invtkey;
	}

	public void setInvtkey(String invtkey) {
		this.invtkey = invtkey;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getInvtemail() {
		return invtemail;
	}

	public void setInvtemail(String invtemail) {
		this.invtemail = invtemail;
	}

	public String getInvtuse() {
		return invtuse;
	}

	public void setInvtuse(String invtuse) {
		this.invtuse = invtuse;
	}

	public java.sql.Date getExprtdate() {
		return exprtdate;
	}

	public void setExprtdate(java.sql.Date exprtdate) {
		this.exprtdate = exprtdate;
	}

	@Override
	public String toString() {
		return "Invite [invtkey=" + invtkey + ", ucode=" + ucode + ", pnum=" + pnum + ", invtemail=" + invtemail
				+ ", invtuse=" + invtuse + ", exprtdate=" + exprtdate + "]";
	}

	
	
	
}
