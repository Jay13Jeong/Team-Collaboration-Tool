package com.beet.HWABO.red.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PostPlus implements Serializable{
	private static final long serialVersionUID = 8453474L;
	
	//common (4)
	private String firstword;
	private String no;
	private Date enrolldate;
	private String pnum;
	private String ucode;
	
	//spost (13)
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
	
	//Bpost (15)
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
	
	//Cpost (10)
	private String cno;
	private String cpnum;
	private String ctitle;
	private String cucode;
	private String cwriter;
	private String ccontent;
	private java.sql.Date cenrolldate;
	private String copen;
	private String hashtags;
	private String mentions;
	private String addonuse;
	//addon(6)
	private String ofile1;
	private String rfile1;
	private String ofile2;
	private String rfile2;
	private String ofile3;
	private String rfile3;
	
	public PostPlus() {
		super();
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

	public String getFirstword() {
		return firstword;
	}

	public void setFirstword(String firstword) {
		this.firstword = firstword;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
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

	public String getSucode() {
		return sucode;
	}

	public void setSucode(String sucode) {
		this.sucode = sucode;
	}

	public String getSwriter() {
		return swriter;
	}

	public void setSwriter(String swriter) {
		this.swriter = swriter;
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

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getCpnum() {
		return cpnum;
	}

	public void setCpnum(String cpnum) {
		this.cpnum = cpnum;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCucode() {
		return cucode;
	}

	public void setCucode(String cucode) {
		this.cucode = cucode;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public java.sql.Date getCenrolldate() {
		return cenrolldate;
	}

	public void setCenrolldate(java.sql.Date cenrolldate) {
		this.cenrolldate = cenrolldate;
	}

	public String getCopen() {
		return copen;
	}

	public void setCopen(String copen) {
		this.copen = copen;
	}

	public String getHashtags() {
		return hashtags;
	}

	public void setHashtags(String hashtags) {
		this.hashtags = hashtags;
	}

	public String getMentions() {
		return mentions;
	}

	public void setMentions(String mentions) {
		this.mentions = mentions;
	}

	public String getAddonuse() {
		return addonuse;
	}

	public void setAddonuse(String addonuse) {
		this.addonuse = addonuse;
	}

	public String getOfile1() {
		return ofile1;
	}

	public void setOfile1(String ofile1) {
		this.ofile1 = ofile1;
	}

	public String getRfile1() {
		return rfile1;
	}

	public void setRfile1(String rfile1) {
		this.rfile1 = rfile1;
	}

	public String getOfile2() {
		return ofile2;
	}

	public void setOfile2(String ofile2) {
		this.ofile2 = ofile2;
	}

	public String getRfile2() {
		return rfile2;
	}

	public void setRfile2(String rfile2) {
		this.rfile2 = rfile2;
	}

	public String getOfile3() {
		return ofile3;
	}

	public void setOfile3(String ofile3) {
		this.ofile3 = ofile3;
	}

	public String getRfile3() {
		return rfile3;
	}

	public void setRfile3(String rfile3) {
		this.rfile3 = rfile3;
	}


	
	@Override
	public String toString() {
		return "PostPlus [firstword=" + firstword + ", no=" + no + ", enrolldate=" + enrolldate + ", pnum=" + pnum
				+ ", ucode=" + ucode + ", sno=" + sno + ", stitle=" + stitle + ", sucode=" + sucode + ", swriter="
				+ swriter + ", sstartday=" + sstartday + ", sendday=" + sendday + ", splace=" + splace + ", scontent="
				+ scontent + ", senrolldate=" + senrolldate + ", sopen=" + sopen + ", spnum=" + spnum + ", stringstart="
				+ stringstart + ", stringend=" + stringend + ", bno=" + bno + ", btitle=" + btitle + ", bucode="
				+ bucode + ", bwriter=" + bwriter + ", bstartday=" + bstartday + ", bendday=" + bendday + ", bkind="
				+ bkind + ", bcharge=" + bcharge + ", bcontent=" + bcontent + ", benrolldate=" + benrolldate
				+ ", bopen=" + bopen + ", brenamefile=" + brenamefile + ", boriginfile=" + boriginfile + ", bpnum="
				+ bpnum + ", bchargename=" + bchargename + ", cno=" + cno + ", cpnum=" + cpnum + ", ctitle=" + ctitle
				+ ", cucode=" + cucode + ", cwriter=" + cwriter + ", ccontent=" + ccontent + ", cenrolldate="
				+ cenrolldate + ", copen=" + copen + ", hashtags=" + hashtags + ", mentions=" + mentions + ", addonuse="
				+ addonuse + ", ofile1=" + ofile1 + ", rfile1=" + rfile1 + ", ofile2=" + ofile2 + ", rfile2=" + rfile2
				+ ", ofile3=" + ofile3 + ", rfile3=" + rfile3 + "]";
	}



	public PostPlus(String firstword, String no, Date enrolldate, String pnum, String ucode, String sno, String stitle,
			String sucode, String swriter, Date sstartday, Date sendday, String splace, String scontent,
			Date senrolldate, String sopen, String spnum, String stringstart, String stringend, String bno,
			String btitle, String bucode, String bwriter, Date bstartday, Date bendday, String bkind, String bcharge,
			String bcontent, Date benrolldate, String bopen, String brenamefile, String boriginfile, String bpnum,
			String bchargename, String cno, String cpnum, String ctitle, String cucode, String cwriter, String ccontent,
			Date cenrolldate, String copen, String hashtags, String mentions, String addonuse, String ofile1,
			String rfile1, String ofile2, String rfile2, String ofile3, String rfile3) {
		super();
		this.firstword = firstword;
		this.no = no;
		this.enrolldate = enrolldate;
		this.pnum = pnum;
		this.ucode = ucode;
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
		this.cno = cno;
		this.cpnum = cpnum;
		this.ctitle = ctitle;
		this.cucode = cucode;
		this.cwriter = cwriter;
		this.ccontent = ccontent;
		this.cenrolldate = cenrolldate;
		this.copen = copen;
		this.hashtags = hashtags;
		this.mentions = mentions;
		this.addonuse = addonuse;
		this.ofile1 = ofile1;
		this.rfile1 = rfile1;
		this.ofile2 = ofile2;
		this.rfile2 = rfile2;
		this.ofile3 = ofile3;
		this.rfile3 = rfile3;
	}



}
