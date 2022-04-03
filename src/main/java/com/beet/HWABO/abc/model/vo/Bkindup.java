package com.beet.HWABO.abc.model.vo;

import java.io.Serializable;

public class Bkindup implements Serializable{
	private static final long serialVersionUID = 21125556L;
	private String bno;
	private String bkind;
	
	public Bkindup() {
		super();
	}

	public Bkindup(String bno, String bkind) {
		super();
		this.bno = bno;
		this.bkind = bkind;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getBkind() {
		return bkind;
	}

	public void setBkind(String bkind) {
		this.bkind = bkind;
	}

	@Override
	public String toString() {
		return "Bkindup [bno=" + bno + ", bkind=" + bkind + "]";
	}
	
	
}
