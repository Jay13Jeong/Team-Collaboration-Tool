package com.beet.HWABO.abc.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beet.HWABO.abc.model.dao.PostreplyDao;
import com.beet.HWABO.abc.model.vo.Postreply;

@Service("postreplyService")
public class PostreplyServiceImpl implements PostreplyService{
	
	@Autowired
	private PostreplyDao postreplyDao;
	
	public PostreplyServiceImpl () {}

	@Override
	public ArrayList<Postreply> selectPostReply(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPostReply(Postreply postreply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePostReply(String replyno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePostReply(String replyno) {
		// TODO Auto-generated method stub
		return 0;
	};
	

}
