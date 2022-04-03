package com.beet.HWABO.red.model.vo;

import java.sql.Date;

public class Project implements java.io.Serializable{
	
	private final static long seralVersionUID = 82432423L;
	private String project_num;
	private String name; 
	private String explain; 
	private java.sql.Date startday; 
	private java.sql.Date endday; 
	private java.sql.Date uploaddate; 
	private String open; 
	private int goal;
	private int done; 
	private int right;
	private String order_by;
	public Project(String project_num, String name, String explain, Date startday, Date endday, Date uploaddate,
			String open, int goal, int done, int right, String order_by) {
		super();
		this.project_num = project_num;
		this.name = name;
		this.explain = explain;
		this.startday = startday;
		this.endday = endday;
		this.uploaddate = uploaddate;
		this.open = open;
		this.goal = goal;
		this.done = done;
		this.right = right;
		this.order_by = order_by;
	}
	public String getOrder_by() {
		return order_by;
	}
	public void setOrder_by(String order_by) {
		this.order_by = order_by;
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
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public java.sql.Date getStartday() {
		return startday;
	}
	public void setStartday(java.sql.Date startday) {
		this.startday = startday;
	}
	public java.sql.Date getEndday() {
		return endday;
	}
	public void setEndday(java.sql.Date endday) {
		this.endday = endday;
	}
	public java.sql.Date getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(java.sql.Date uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
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
	public int getRight() {
		return right;
	}
	public void setRight(int right) {
		this.right = right;
	}
	@Override
	public String toString() {
		return "Project [project_num=" + project_num + ", name=" + name + ", explain=" + explain + ", startday="
				+ startday + ", endday=" + endday + ", uploaddate=" + uploaddate + ", open=" + open + ", goal=" + goal
				+ ", done=" + done + ", right=" + right + ", order_by=" + order_by + "]";
	}
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
