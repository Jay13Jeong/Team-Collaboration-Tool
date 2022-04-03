package com.beet.HWABO.bpost.model.vo;

import java.sql.Date;

import javax.validation.constraints.Future;

public class Bpost implements java.io.Serializable{

	private static final long serialVersionUID = 3333L;
	
	
	private String bno;
	private String btitle;
	private String bucode;
	private String bwriter;
	private Date bstartday;
	private Date bendday;
	private String bkind;
	private String bcharge;
	private String bcontent;
	
	private Date benrolldate;
	private String bopen;
	private String brenamefile;
	private String boriginfile;
	private String bpnum;
	private String bchargename;
	
	public Bpost() {
		super();
	}
	
	

	public Bpost(String bno, String btitle, String bucode, String bwriter, Date bstartday, Date bendday, String bkind,
			String bcharge, String bcontent, Date benrolldate, String bopen, String brenamefile, String boriginfile,
			String bpnum, String bchargename) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bucode = bucode;
		this.bwriter = bwriter;
		this.bstartday = bstartday;
		this.bendday = bendday;
		this.bkind = bkind;
		this.bcharge = bcharge;
		this.bcontent = bcontent;
		this.benrolldate = benrolldate;
		this.bopen = bopen;
		this.brenamefile = brenamefile;
		this.boriginfile = boriginfile;
		this.bpnum = bpnum;
		this.bchargename = bchargename;
	}



	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBucode() {
		return bucode;
	}

	public void setBucode(String bucode) {
		this.bucode = bucode;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public Date getBstartday() {
		return bstartday;
	}

	public void setBstartday(Date bstartday) {
		this.bstartday = bstartday;
	}

	public Date getBendday() {
		return bendday;
	}

	public void setBendday(Date bendday) {
		this.bendday = bendday;
	}

	public String getBkind() {
		return bkind;
	}

	public void setBkind(String bkind) {
		this.bkind = bkind;
	}

	public String getBcharge() {
		return bcharge;
	}

	public void setBcharge(String bcharge) {
		this.bcharge = bcharge;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public Date getBenrolldate() {
		return benrolldate;
	}

	public void setBenrolldate(Date benrolldate) {
		this.benrolldate = benrolldate;
	}

	public String getBopen() {
		return bopen;
	}

	public void setBopen(String bopen) {
		this.bopen = bopen;
	}

	public String getBrenamefile() {
		return brenamefile;
	}

	public void setBrenamefile(String brenamefile) {
		this.brenamefile = brenamefile;
	}

	public String getBoriginfile() {
		return boriginfile;
	}

	public void setBoriginfile(String boriginfile) {
		this.boriginfile = boriginfile;
	}

	
	public String getBpnum() {
		return bpnum;
	}


	public void setBpnum(String bpnum) {
		this.bpnum = bpnum;
	}

	
	

	public String getBchargename() {
		return bchargename;
	}



	public void setBchargename(String bchargename) {
		this.bchargename = bchargename;
	}



	@Override
	public String toString() {
		return "Bpost [bno=" + bno + ", btitle=" + btitle + ", bucode=" + bucode + ", bwriter=" + bwriter
				+ ", bstartday=" + bstartday + ", bendday=" + bendday + ", bkind=" + bkind + ", bcharge=" + bcharge
				+ ", bcontent=" + bcontent + ", benrolldate=" + benrolldate + ", bopen=" + bopen + ", brenamefile="
				+ brenamefile + ", boriginfile=" + boriginfile + ", bpnum=" + bpnum + ", bchargename=" + bchargename
				+ "]";
	}



	

	

}
