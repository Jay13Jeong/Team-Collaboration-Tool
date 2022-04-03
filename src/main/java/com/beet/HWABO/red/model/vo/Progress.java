package com.beet.HWABO.red.model.vo;

public class Progress implements java.io.Serializable{
	private final static long serialVersionUID = 833454L;
	
	private String ucode; 
	private String project_num; 
	private String name; 
	private int goal; 
	private int done; 
	private String title; 
	private String content;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getDone() {
		return done;
	}
	public void setDone(int done) {
		this.done = done;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Progress [ucode=" + ucode + ", project_num=" + project_num + ", name=" + name + ", goal=" + goal
				+ ", done=" + done + ", title=" + title + ", content=" + content + "]";
	}
	public Progress(String ucode, String project_num, String name, int goal, int done, String title, String content) {
		super();
		this.ucode = ucode;
		this.project_num = project_num;
		this.name = name;
		this.goal = goal;
		this.done = done;
		this.title = title;
		this.content = content;
	}
	public Progress() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
