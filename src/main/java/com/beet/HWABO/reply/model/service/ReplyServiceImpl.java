package com.beet.HWABO.reply.model.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beet.HWABO.reply.model.dao.ReplyDao;
import com.beet.HWABO.reply.model.vo.Reply;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	
	private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public int insertReply(Reply reply) {
		logger.info("replyService 옴 :"+ reply);
		return replyDao.insertReply(reply);
	}

	@Override
	public List<Reply> selectOneList(String no) {
		logger.info("replyService 옴  no :"+ no);
		return replyDao.selectOneList(no);
	}

	@Override
	public ArrayList<Reply> selectList() {
	
		return replyDao.selectList();
	}

	@Override
	public int updatereply(Reply reply) {
		logger.info("service reply : " + reply);
		return replyDao.updatereply(reply);
	}

	@Override
	public int deletereply(Reply reply) {
		logger.info("service reply : " + reply);
		return replyDao.deletereply(reply);
	}

	@Override
	public int insertRereply(Reply reply) {
		logger.info("service reply : " + reply);
		return replyDao.insertRereply(reply);
	}

}
