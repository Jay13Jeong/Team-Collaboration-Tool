package com.beet.HWABO.spost.model.service;

import java.util.ArrayList;
import java.util.List;

import com.beet.HWABO.abc.model.vo.Bkindup;
import com.beet.HWABO.abc.model.vo.Love;
import com.beet.HWABO.abc.model.vo.Postreply;
import com.beet.HWABO.bpost.model.vo.Bpost;
import com.beet.HWABO.member.model.vo.PjMember;
import com.beet.HWABO.spost.model.vo.Bpostchk;
import com.beet.HWABO.spost.model.vo.Post;
import com.beet.HWABO.spost.model.vo.Spost;

public interface SpostService {
	//Spost
	Spost selectOneSpost(String sno);
	ArrayList<Spost> selectAllSpost();
	
	int insertSpost(Spost spost);
	int deleteSpost(String sno);
	int updateSpost(Spost spost);
	
	//Bpost
	ArrayList<Bpost> selectMyBPOST(PjMember pmember);
	ArrayList<Bpost> selectMyRequestedBPOST(PjMember pmember);
	
	Bpost selectOneBpost(String bno);
	ArrayList<Bpost> chooseBpost(Bpostchk chk);
	
	//all Post
	ArrayList<Post> selectMyPost(PjMember pmember);
	ArrayList<Post> selectMyPOSTspost(PjMember pmember);
	ArrayList<Post> selectMyPOSTbpost(PjMember pmember);
	ArrayList<Post> selectMyPOSTcpost(PjMember pmember);
	
	//Love
	int insertSpostLove(Love love);
	int deleteSpostLove(Love love);

	//Postreply
	int insertPostReply(Postreply reply);
	int updatePostReply(String postno);
	int deletePostReply(String postno);
	
	
	int bkindUpdate(Bkindup bk);
	

}
