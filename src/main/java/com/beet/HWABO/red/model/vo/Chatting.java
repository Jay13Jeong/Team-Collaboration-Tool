package com.beet.HWABO.red.model.vo;

import java.sql.Timestamp;

public class Chatting {
	private String ucode;
	private String project_num;
	private String project_name;
	private String uname;
	private String content;
	private java.sql.Timestamp chat_time;
	private String orignal_file;
	private String rename_file;
	
	public Chatting() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getProject_num() {
		return project_num;
	}

	public void setProject_num(String project_num) {
		this.project_num = project_num;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Timestamp getChat_time() {
		return chat_time;
	}

	public void setChat_time(java.sql.Timestamp chat_time) {
		this.chat_time = chat_time;
	}

	public String getOrignal_file() {
		return orignal_file;
	}

	public void setOrignal_file(String orignal_file) {
		this.orignal_file = orignal_file;
	}

	public String getRename_file() {
		return rename_file;
	}

	public void setRename_file(String rename_file) {
		this.rename_file = rename_file;
	}

	@Override
	public String toString() {
		return "Chatting [ucode=" + ucode + ", project_num=" + project_num + ", project_name=" + project_name
				+ ", uname=" + uname + ", content=" + content + ", chat_time=" + chat_time + ", orignal_file="
				+ orignal_file + ", rename_file=" + rename_file + "]";
	}

	public Chatting(String ucode, String project_num, String project_name, String uname, String content,
			Timestamp chat_time, String orignal_file, String rename_file) {
		super();
		this.ucode = ucode;
		this.project_num = project_num;
		this.project_name = project_name;
		this.uname = uname;
		this.content = content;
		this.chat_time = chat_time;
		this.orignal_file = orignal_file;
		this.rename_file = rename_file;
	}

}
