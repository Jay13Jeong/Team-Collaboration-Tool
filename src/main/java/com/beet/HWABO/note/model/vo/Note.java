package com.beet.HWABO.note.model.vo;

import java.util.Date;

public class Note implements java.io.Serializable{

	private static final long serialVersionUID = 3111L;
	
	private String noteno;
	private String ucode;
	private String ncontent;
	private String filerename;
	private String fileoriginname;
	private Date notedate;
	
	public Note() {
		super();
	}

	public Note(String noteno, String ucode, String ncontent, String filerename, String fileoriginname, Date notedate) {
		super();
		this.noteno = noteno;
		this.ucode = ucode;
		this.ncontent = ncontent;
		this.filerename = filerename;
		this.fileoriginname = fileoriginname;
		this.notedate = notedate;
	}

	public String getNoteno() {
		return noteno;
	}

	public void setNoteno(String noteno) {
		this.noteno = noteno;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getFilerename() {
		return filerename;
	}

	public void setFilerename(String filerename) {
		this.filerename = filerename;
	}

	public String getFileoriginname() {
		return fileoriginname;
	}

	public void setFileoriginname(String fileoriginname) {
		this.fileoriginname = fileoriginname;
	}

	public Date getNotedate() {
		return notedate;
	}

	public void setNotedate(Date notedate) {
		this.notedate = notedate;
	}

	@Override
	public String toString() {
		return "Note [noteno=" + noteno + ", ucode=" + ucode + ", ncontent=" + ncontent + ", filerename=" + filerename
				+ ", fileoriginname=" + fileoriginname + ", notedate=" + notedate + "]";
	}
	
	
	
}



