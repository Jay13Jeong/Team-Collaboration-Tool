package com.beet.HWABO.cpost.model.vo;

public class HashTag implements java.io.Serializable{
	private static final long serialVersionUId = 1144L;
	
	private String tagid;
	private String tagname;
	
	public HashTag() {}

	public HashTag(String tagid, String tagname) {
		super();
		this.tagid = tagid;
		this.tagname = tagname;
	}

	public String getTagid() {
		return tagid;
	}

	public void setTagid(String tagid) {
		this.tagid = tagid;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	@Override
	public String toString() {
		return "Hashtag [tagid=" + tagid + ", tagname=" + tagname + "]";
	}
	
	
}
