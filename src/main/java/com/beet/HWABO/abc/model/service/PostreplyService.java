package com.beet.HWABO.abc.model.service;

import java.util.ArrayList;

import com.beet.HWABO.abc.model.vo.Postreply;

public interface PostreplyService {
	ArrayList<Postreply> selectPostReply(String no);
	int insertPostReply(Postreply postreply);
	int updatePostReply(String replyno);
	int deletePostReply(String replyno);
}
