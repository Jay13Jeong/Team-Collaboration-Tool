package com.beet.HWABO.abc.model.vo;

import java.io.Serializable;

public class Love implements Serializable{
	private static final long serialVersionUID = 2653451L;
	
	private String no;
	private String ucode;
	
	public Love() {
		super();
	}

	public Love(String no, String ucode) {
		super();
		this.no = no;
		this.ucode = ucode;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	@Override
	public String toString() {
		return "Love [no=" + no + ", ucode=" + ucode + "]";
	}
	
	
}
