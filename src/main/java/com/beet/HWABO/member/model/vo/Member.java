package com.beet.HWABO.member.model.vo;

import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class Member implements java.io.Serializable{
	private static final long serialVersionUId = 1166L;
	
	
	private String ucode;
	
	@NotNull(message="이메일을 입력해주세요")
	@Pattern(regexp="^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", message="올바른 이메일을 입력해주세요")
	private String uemail;

	@NotNull(message="비밀번호를 입력해주세요")
	@Pattern(regexp="^[a-zA-Z0-9]{6,}$", message="비밀번호는 영어소문자와 숫자를 이용하여 6글자 이상 입력해야합니다")
	private String upwd;
	@NotNull(message="이름을 입력해주세요")
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
	private String pnum;
	private String pjadmin;
	private String invtkey;
	private String invtuse;
	
	public Member(){}

	public Member(String ucode,
			@NotNull(message = "이메일을 입력해주세요") @Pattern(regexp = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", message = "올바른 이메일을 입력해주세요") String uemail,
			@NotNull(message = "비밀번호를 입력해주세요") @Pattern(regexp = "^[a-zA-Z0-9]{6,}$", message = "비밀번호는 영어소문자와 숫자를 이용하여 6글자 이상 입력해야합니다") String upwd,
			@NotNull(message = "이름을 입력해주세요") String uname, String uphone, String ugroup, String urole, String ust,
			String ucert, Date udate, String signtype, String accesstoken, String uimg, String uactive, String pnum,
			String pjadmin, String invtkey, String invtuse) {
		super();
		this.ucode = ucode;
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
		this.pnum = pnum;
		this.pjadmin = pjadmin;
		this.invtkey = invtkey;
		this.invtuse = invtuse;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
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

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getPjadmin() {
		return pjadmin;
	}

	public void setPjadmin(String pjadmin) {
		this.pjadmin = pjadmin;
	}

	public String getInvtkey() {
		return invtkey;
	}

	public void setInvtkey(String invtkey) {
		this.invtkey = invtkey;
	}

	public String getInvtuse() {
		return invtuse;
	}

	public void setInvtuse(String invtuse) {
		this.invtuse = invtuse;
	}

	@Override
	public String toString() {
		return "Member [ucode=" + ucode + ", uemail=" + uemail + ", upwd=" + upwd + ", uname=" + uname + ", uphone="
				+ uphone + ", ugroup=" + ugroup + ", urole=" + urole + ", ust=" + ust + ", ucert=" + ucert + ", udate="
				+ udate + ", signtype=" + signtype + ", accesstoken=" + accesstoken + ", uimg=" + uimg + ", uactive="
				+ uactive + ", pnum=" + pnum + ", pjadmin=" + pjadmin + ", invtkey=" + invtkey + ", invtuse=" + invtuse
				+ "]";
	}

	
	
	

	
	
	

}
