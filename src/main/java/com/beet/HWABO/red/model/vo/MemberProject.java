package com.beet.HWABO.red.model.vo;

import java.sql.Date;

public class MemberProject implements java.io.Serializable{

	private final static long seralVersionUID = 8772432423L;

	private String uemail; 
	private String upwd; 
	private String uname; 
	private String uphone; 
	private String ugroup; 
	private String urole; 
	private String ust; 
	private String ucert; 
	private java.sql.Date udate; 
	private String signtype; 
	private String accesstoken; 
	private String uimg;
	private String uactive;
	private String ucode;
	private String star;
	private String project_num;
	private String name; 
	private String pjadmin; 
	private String explain; 
	private java.sql.Date startday; 
	private java.sql.Date endday; 
	private java.sql.Date uploaddate; 
	private String open; 
	private int goal;
	private int done; 
	private int right;
	private String order_by;
	
	public MemberProject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberProject(String uemail, String upwd, String uname, String uphone, String ugroup, String urole,
			String ust, String ucert, Date udate, String signtype, String accesstoken, String uimg, String uactive,
			String ucode, String star, String project_num, String name, String pjadmin, String explain, Date startday,
			Date endday, Date uploaddate, String open, int goal, int done, int right, String order_by) {
		super();
		this.uemail = uemail;
		this.upwd = upwd;
		this.uname = uname;
		this.uphone = uphone;
		this.ugroup = ugroup;
		this.urole = urole;
		this.ust = ust;
		this.ucert = ucert;
		this.udate = udate;
		this.signtype = signtype;
		this.accesstoken = accesstoken;
		this.uimg = uimg;
		this.uactive = uactive;
		this.ucode = ucode;
		this.star = star;
		this.project_num = project_num;
		this.name = name;
		this.pjadmin = pjadmin;
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

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUgroup() {
		return ugroup;
	}

	public void setUgroup(String ugroup) {
		this.ugroup = ugroup;
	}

	public String getUrole() {
		return urole;
	}

	public void setUrole(String urole) {
		this.urole = urole;
	}

	public String getUst() {
		return ust;
	}

	public void setUst(String ust) {
		this.ust = ust;
	}

	public String getUcert() {
		return ucert;
	}

	public void setUcert(String ucert) {
		this.ucert = ucert;
	}

	public java.sql.Date getUdate() {
		return udate;
	}

	public void setUdate(java.sql.Date udate) {
		this.udate = udate;
	}

	public String getSigntype() {
		return signtype;
	}

	public void setSigntype(String signtype) {
		this.signtype = signtype;
	}

	public String getAccesstoken() {
		return accesstoken;
	}

	public void setAccesstoken(String accesstoken) {
		this.accesstoken = accesstoken;
	}

	public String getUimg() {
		return uimg;
	}

	public void setUimg(String uimg) {
		this.uimg = uimg;
	}

	public String getUactive() {
		return uactive;
	}

	public void setUactive(String uactive) {
		this.uactive = uactive;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
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

	public String getPjadmin() {
		return pjadmin;
	}

	public void setPjadmin(String pjadmin) {
		this.pjadmin = pjadmin;
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

	public String getOrder_by() {
		return order_by;
	}

	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}

	@Override
	public String toString() {
		return "MemberProject [uemail=" + uemail + ", upwd=" + upwd + ", uname=" + uname + ", uphone=" + uphone
				+ ", ugroup=" + ugroup + ", urole=" + urole + ", ust=" + ust + ", ucert=" + ucert + ", udate=" + udate
				+ ", signtype=" + signtype + ", accesstoken=" + accesstoken + ", uimg=" + uimg + ", uactive=" + uactive
				+ ", ucode=" + ucode + ", star=" + star + ", project_num=" + project_num + ", name=" + name
				+ ", pjadmin=" + pjadmin + ", explain=" + explain + ", startday=" + startday + ", endday=" + endday
				+ ", uploaddate=" + uploaddate + ", open=" + open + ", goal=" + goal + ", done=" + done + ", right="
				+ right + ", order_by=" + order_by + "]";
	}

	
	
}
