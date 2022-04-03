package com.beet.HWABO.filebox.model.vo;

import java.sql.Date;

public class Filebox implements java.io.Serializable{

	private static final long serialVersionUID = 3633L;
	
	private String no;
	private String title;
	private String writer;
	private Date enroll;
	private String o;
	private String r; 
	private String pnum;
	
	public Filebox() {
		super();
		
	}

	

	public Filebox(String no, String title, String writer, Date enroll, String o, String r, String pnum) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.enroll = enroll;
		this.o = o;
		this.r = r;
		this.pnum = pnum;
	}



	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getEnroll() {
		return enroll;
	}

	public void setEnroll(Date enroll) {
		this.enroll = enroll;
	}

	public String getO() {
		return o;
	}

	public void setO(String o) {
		this.o = o;
	}

	public String getR() {
		return r;
	}

	public void setR(String r) {
		this.r = r;
	}

	
	
	public String getPnum() {
		return pnum;
	}



	public void setPnum(String pnum) {
		this.pnum = pnum;
	}



	@Override
	public String toString() {
		return "Filebox [no=" + no + ", title=" + title + ", writer=" + writer + ", enroll=" + enroll + ", o=" + o
				+ ", r=" + r + ", pnum=" + pnum + "]";
	}


	
	
}













