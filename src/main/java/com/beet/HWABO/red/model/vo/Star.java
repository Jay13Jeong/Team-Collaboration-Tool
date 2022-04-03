package com.beet.HWABO.red.model.vo;

public class Star implements java.io.Serializable{
	
	private final static long serialVersionUID = 84565434345345L;
	private String ucode;
	private String star;
	public String getUcode() {
		return ucode;
	}
	public void setUcode(String ucode) {
		this.ucode = ucode;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "Star [ucode=" + ucode + ", star=" + star + "]";
	}
	public Star(String ucode, String star) {
		super();
		this.ucode = ucode;
		this.star = star;
	}
	public Star() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
