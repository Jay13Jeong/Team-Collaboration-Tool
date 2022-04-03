package com.beet.HWABO.cpost.model.vo;

public class AddOn implements java.io.Serializable{
	private static final long serialVersionUId = 1111L;
	
	private String cno;
	private String localno;
	private String mapx;
	private String mapy;
	private String ofile1;
	private String rfile1;
	private String ofile2;
	private String rfile2;
	private String ofile3;
	private String rfile3;
	
	public AddOn() {}

	public AddOn(String cno, String localno, String mapx, String mapy, String ofile1, String rfile1, String ofile2,
			String rfile2, String ofile3, String rfile3) {
		super();
		this.cno = cno;
		this.localno = localno;
		this.mapx = mapx;
		this.mapy = mapy;
		this.ofile1 = ofile1;
		this.rfile1 = rfile1;
		this.ofile2 = ofile2;
		this.rfile2 = rfile2;
		this.ofile3 = ofile3;
		this.rfile3 = rfile3;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getLocalno() {
		return localno;
	}

	public void setLocalno(String localno) {
		this.localno = localno;
	}

	public String getMapx() {
		return mapx;
	}

	public void setMapx(String mapx) {
		this.mapx = mapx;
	}

	public String getMapy() {
		return mapy;
	}

	public void setMapy(String mapy) {
		this.mapy = mapy;
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
		return "AddOn [cno=" + cno + ", localno=" + localno + ", mapx=" + mapx + ", mapy=" + mapy + ", ofile1=" + ofile1
				+ ", rfile1=" + rfile1 + ", ofile2=" + ofile2 + ", rfile2=" + rfile2 + ", ofile3=" + ofile3
				+ ", rfile3=" + rfile3 + "]";
	}


}
