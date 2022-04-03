package com.beet.HWABO.reply.model.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Reply implements java.io.Serializable {

	private static final long serialVersionUID = 39988L;
	
	private String replyno;
	private String no;
	private String content;
	private String ucode;
	private String uname;
	private java.sql.Timestamp enrolldate;
	private java.sql.Timestamp secondenroll;
	private String kind;
	private String parent;
	
	public Reply() {
		
		super();
		
	}

	


	public Reply(String replyno, String no, String content, String ucode, String uname, Timestamp enrolldate,
			Timestamp secondenroll, String kind, String parent) {
		super();
		this.replyno = replyno;
		this.no = no;
		this.content = content;
		this.ucode = ucode;
		this.uname = uname;
		this.enrolldate = enrolldate;
		this.secondenroll = secondenroll;
		this.kind = kind;
		this.parent = parent;
	}





	public String getReplyno() {
		return replyno;
	}

	public void setReplyno(String replyno) {
		this.replyno = replyno;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}





	public java.sql.Timestamp getEnrolldate() {
		return enrolldate;
	}




	public void setEnrolldate(java.sql.Timestamp enrolldate) {
		this.enrolldate = enrolldate;
	}




	public java.sql.Timestamp getSecondenroll() {
		return secondenroll;
	}




	public void setSecondenroll(java.sql.Timestamp secondenroll) {
		this.secondenroll = secondenroll;
	}




	public String getKind() {
		return kind;
	}






	public void setKind(String kind) {
		this.kind = kind;
	}






	public String getParent() {
		return parent;
	}



	public void setParent(String parent) {
		this.parent = parent;
	}




	@Override
	public String toString() {
		return "Reply [replyno=" + replyno + ", no=" + no + ", content=" + content + ", ucode=" + ucode + ", uname="
				+ uname + ", enrolldate=" + enrolldate + ", secondenroll=" + secondenroll + ", kind=" + kind
				+ ", parent=" + parent + "]";
	}











	
	
	 
	
}
