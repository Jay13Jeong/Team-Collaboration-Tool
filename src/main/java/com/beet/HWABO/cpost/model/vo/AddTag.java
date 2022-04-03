package com.beet.HWABO.cpost.model.vo;

public class AddTag implements java.io.Serializable{
	private static final long serialVersionUId = 1122L;
	
	private String cno;
	private String tagid;
	
	public AddTag() {}

	public AddTag(String cno, String tagid) {
		super();
		cno = cno;
		this.tagid = tagid;
	}

	@Override
	public String toString() {
		return "AddTag [cno=" + cno + ", tagid=" + tagid + "]";
	}

	
	
	

}
