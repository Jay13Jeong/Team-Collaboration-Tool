package com.beet.HWABO.cabinet.model.vo;

import java.sql.Date;

public class Cabinet implements java.io.Serializable{

	private static final long serialVersionUID = 3311L;
	
	private String ucode;
	private String no;
	private String pnum;
	private Date enrolldate;
	
	public Cabinet() {
		super();
	}

	public Cabinet(String ucode, String no, String pnum, Date enrolldate) {
		super();
		this.ucode = ucode;
		this.no = no;
		this.pnum = pnum;
		this.enrolldate = enrolldate;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "Cabinet [ucode=" + ucode + ", no=" + no + ", pnum=" + pnum + ", enrolldate=" + enrolldate + "]";
	}

	
	
	
	
	
	
}
