package com.beet.HWABO.chat.model.vo;

import java.sql.Date;

public class Chat implements java.io.Serializable{
	
	private static final long serialVersionUID = 9991L;
	
	private String no;
	private String participant;
	private String maker;
	private java.sql.Date chatdate;
	private String images;
	private String originalfile;
	private String renamefile;
	private String content;
	
	public Chat() {}

	public Chat(String no, String participant, String maker, Date chatdate, String images, String originalfile,
			String renamefile, String content) {
		super();
		this.no = no;
		this.participant = participant;
		this.maker = maker;
		this.chatdate = chatdate;
		this.images = images;
		this.originalfile = originalfile;
		this.renamefile = renamefile;
		this.content = content;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getParticipant() {
		return participant;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public java.sql.Date getChatdate() {
		return chatdate;
	}

	public void setChatdate(java.sql.Date chatdate) {
		this.chatdate = chatdate;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getRenamefile() {
		return renamefile;
	}

	public void setRenamefile(String renamefile) {
		this.renamefile = renamefile;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Chat [no=" + no + ", participant=" + participant + ", maker=" + maker + ", chatdate=" + chatdate
				+ ", images=" + images + ", originalfile=" + originalfile + ", renamefile=" + renamefile + ", content="
				+ content + "]";
	}
	
	
	
}
