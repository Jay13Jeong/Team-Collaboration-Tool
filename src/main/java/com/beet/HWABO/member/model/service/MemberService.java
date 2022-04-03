package com.beet.HWABO.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.beet.HWABO.invite.model.vo.Invite;
import com.beet.HWABO.member.model.vo.Member;
import com.beet.HWABO.member.model.vo.PjMember;
import com.beet.HWABO.red.model.vo.Project;

public interface MemberService {
	int insertUser(Member member);

	Member selectLogin(Member member);

	Member selectMember(String ucode);

	int updateAuth(Member member);

	int updateUst(Member member);

	int selectEmailCheck(String uemail);

	int updateInfo(Member member);

	int deleteUser(String ucode);

	int updateImg(Member member);

	int updatePwd(Member member);

	int insertInvtNew(Invite invt);

	ArrayList<Member> selectNotMember(String pnum);

	int updateTmpPwd(Member member);

	int insertSnsUser(Member member);

	ArrayList<Member> selectPMember(String pnum);

	Invite selectInvtChk(String invtkey);

	int insertPjMember(PjMember pjmember);

	Member selectEmailMember(String uemail);

	int updatepjadmin(PjMember pjm);

	ArrayList<Invite> selectInvtList(String pnum);

	int deleteInvt(String invtkey);

	Project selectPjdetail(String pnum);

	Member selectInvted(String uemail);

	int updatePjImg(Project project);

	int updatePjDetail(Project project);

	
}
