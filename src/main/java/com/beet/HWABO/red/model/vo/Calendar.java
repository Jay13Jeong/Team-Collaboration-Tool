package com.beet.HWABO.red.model.vo;

import java.sql.Date;

public class Calendar {
	private String calno; 
	private String pnum; 
	private String ucode; 
	private String uname;
	private java.sql.Date enrolldate; 
	private String title; 
	private String start_date; 
	private String end_date; 
	private String allday;
	public String getCalno() {
		return calno;
	}
	public void setCalno(String calno) {
		this.calno = calno;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public java.sql.Date getEnrolldate() {
		return enrolldate;
	}
	public void setEnrolldate(java.sql.Date enrolldate) {
		this.enrolldate = enrolldate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getAllday() {
		return allday;
	}
	public void setAllday(String allday) {
		this.allday = allday;
	}
	@Override
	public String toString() {
		return "Calendar [calno=" + calno + ", pnum=" + pnum + ", ucode=" + ucode + ", uname=" + uname + ", enrolldate="
				+ enrolldate + ", title=" + title + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", allday=" + allday + "]";
	}
	public Calendar(String calno, String pnum, String ucode, String uname, Date enrolldate, String title,
			String start_date, String end_date, String allday) {
		super();
		this.calno = calno;
		this.pnum = pnum;
		this.ucode = ucode;
		this.uname = uname;
		this.enrolldate = enrolldate;
		this.title = title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.allday = allday;
	}
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
