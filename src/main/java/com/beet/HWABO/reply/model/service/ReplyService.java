package com.beet.HWABO.reply.model.service;

import java.util.ArrayList;
import java.util.List;

import com.beet.HWABO.reply.model.vo.Reply;

public interface ReplyService {

	int insertReply(Reply reply);

	List<Reply> selectOneList(String no);

	ArrayList<Reply> selectList();

	int updatereply(Reply reply);

	int deletereply(Reply reply);

	int insertRereply(Reply reply);

}
