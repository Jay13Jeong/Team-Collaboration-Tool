package com.beet.HWABO.spost.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Spost implements Serializable{
	private static final long serialVersionUID = 2323L;
	
	private String sno;
	private String stitle;
	private String sucode;
	private String swriter;
	private Date sstartday;
	private Date sendday;
	private String splace;
	private String scontent;
	private Date senrolldate;
	private String sopen;
	private String spnum;
	private String stringstart;
	private String stringend;
	
	public Spost() {
		super();
	}

	public Spost(String sno, String stitle, String sucode, String swriter, Date sstartday, Date sendday, String splace,
			String scontent, Date senrolldate, String sopen, String spnum, String stringstart, String stringend) {
		super();
		this.sno = sno;
		this.stitle = stitle;
		this.sucode = sucode;
		this.swriter = swriter;
		this.sstartday = sstartday;
		this.sendday = sendday;
		this.splace = splace;
		this.scontent = scontent;
		this.senrolldate = senrolldate;
		this.sopen = sopen;
		this.spnum = spnum;
		this.stringstart = stringstart;
		this.stringend = stringend;
	}





	public String getStringstart() {
		return stringstart;
	}

	public void setStringstart(String stringstart) {
		this.stringstart = stringstart;
	}

	public String getStringend() {
		return stringend;
	}

	public void setStringend(String stringend) {
		this.stringend = stringend;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getSwriter() {
		return swriter;
	}

	public void setSwriter(String swriter) {
		this.swriter = swriter;
	}

	public String getSucode() {
		return sucode;
	}

	public void setSucode(String sucode) {
		this.sucode = sucode;
	}

	public Date getSstartday() {
		return sstartday;
	}

	public void setSstartday(Date sstartday) {
		this.sstartday = sstartday;
	}

	public Date getSendday() {
		return sendday;
	}

	public void setSendday(Date sendday) {
		this.sendday = sendday;
	}

	public String getSplace() {
		return splace;
	}

	public void setSplace(String splace) {
		this.splace = splace;
	}


	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public Date getSenrolldate() {
		return senrolldate;
	}

	public void setSenrolldate(Date senrolldate) {
		this.senrolldate = senrolldate;
	}

	public String getSopen() {
		return sopen;
	}

	public void setSopen(String sopen) {
		this.sopen = sopen;
	}

	public String getSpnum() {
		return spnum;
	}

	public void setSpnum(String spnum) {
		this.spnum = spnum;
	}

	@Override
	public String toString() {
		return "Spost [sno=" + sno + ", stitle=" + stitle + ", sucode=" + sucode + ", swriter=" + swriter
				+ ", sstartday=" + sstartday + ", sendday=" + sendday + ", splace=" + splace + ", scontent=" + scontent
				+ ", senrolldate=" + senrolldate + ", sopen=" + sopen + ", spnum=" + spnum + ", stringstart="
				+ stringstart + ", stringend=" + stringend + "]";
	}


	
}

