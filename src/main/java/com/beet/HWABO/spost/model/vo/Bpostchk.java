package com.beet.HWABO.spost.model.vo;

import java.io.Serializable;
import java.util.List;

public class Bpostchk implements Serializable{

	private static final long serialVersionUID = 24568421L;
	
	private String ucode;
	private String pnum;
	private List<String> types;
	
	public Bpostchk() {
		super();
	}

	public Bpostchk(String ucode, String pnum, List<String> types) {
		super();
		this.ucode = ucode;
		this.pnum = pnum;
		this.types = types;
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

	public List<String> getTypes() {
		return types;
	}

	public void setTypes(List<String> types) {
		this.types = types;
	}

	@Override
	public String toString() {
		return "Bpostchk [ucode=" + ucode + ", pnum=" + pnum + ", types=" + types + "]";
	}
	
	
}
