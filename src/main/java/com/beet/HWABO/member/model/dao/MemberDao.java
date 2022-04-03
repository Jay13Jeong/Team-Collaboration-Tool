package com.beet.HWABO.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.invite.model.vo.Invite;
import com.beet.HWABO.member.model.vo.Member;
import com.beet.HWABO.member.model.vo.PjMember;
import com.beet.HWABO.red.model.vo.Project;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public MemberDao(){}
	

	public int insertUser(Member member) {
		return session.insert("memberMapper.insertUser", member);
	}

	public Member selectLogin(Member member) {
		return session.selectOne("memberMapper.selectLogin", member);
	}


	public int updateAuth(Member member) {
		return session.update("memberMapper.updateAuth", member);
	}

	public int updateUst(Member member) {
		return session.update("memberMapper.updateUst", member);
	}


	public int selectEmailCheck(String uemail) {
		return session.selectOne("memberMapper.selectEmailCheck", uemail);
	}


	public Member selectMember(String ucode) {
		return session.selectOne("memberMapper.selectMember", ucode);
	}


	public int updateInfo(Member member) {
		return session.update("memberMapper.updateInfo", member);
	}


	public int deleteUser(String ucode) {
		return session.delete("memberMapper.deleteUser", ucode);
	}


	public int updateImg(Member member) {
		return session.update("memberMapper.updateImg", member);
	}


	public int updatePwd(Member member) {
		return session.update("memberMapper.updatePwd", member);
	}


	public int insertInvtNew(Invite invt) {
		return session.insert("memberMapper.insertInvtNew", invt);
	}


	public ArrayList<Member> selectNotMember(String pnum) {
		List<Member> nmlist = session.selectList("memberMapper.selectNotMember", pnum);
		return (ArrayList<Member>)nmlist;
	}


	public int updateTmpPwd(Member member) {
		return session.update("memberMapper.updateTmpPwd", member);
	}


	public int insertSnsUser(Member member) {
		return session.insert("memberMapper.insertSnsUser", member);
	}


	public ArrayList<Member> selectPMember(String pnum) {
		List<Member> pmlist = session.selectList("memberMapper.selectPMember", pnum);
		return (ArrayList<Member>)pmlist;
	}


	public Invite selectInvtChk(String invtkey) {
		return session.selectOne("memberMapper.selectInvtChk", invtkey);
	}


	public int insertPjMember(PjMember pjmember) {
		return session.insert("memberMapper.insertPjMember", pjmember);
	}


	public Member selectEmailMember(String uemail) {
		return session.selectOne("memberMapper.selectEmailMember", uemail);
	}


	public int updatepjadmin(PjMember pjm) {
		return session.update("memberMapper.updatepjadmin", pjm);
	}


	public ArrayList<Invite> selectInvtList(String pnum) {
		List<Invite> invtlist = session.selectList("memberMapper.selectInvtList", pnum);
		return (ArrayList<Invite>)invtlist;
	}


	public int deleteInvt(String invtkey) {
		return session.delete("memberMapper.deleteInvt", invtkey);
	}


	public Project selectPjdetail(String pnum) {
		return session.selectOne("memberMapper.selectPjdetail", pnum);
	}


	public Member selectInvted(String uemail) {
		return session.selectOne("memberMapper.selectInvted", uemail);
	}


	public int updatePjImg(Project project) {
		return session.update("memberMapper.updatePjImg", project);
	}


	public int updatePjDetail(Project project) {
		return session.update("memberMapper.updatePjDetail", project);
	}
	
	
	
	
	


	

}
