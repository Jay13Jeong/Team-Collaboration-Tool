package com.beet.HWABO.reply.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.reply.model.vo.Reply;


@Repository("replyDao")
public class ReplyDao {

	private static final Logger logger = LoggerFactory.getLogger(ReplyDao.class);
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	public ReplyDao() {}
	
	
	public int insertReply(Reply reply) {
		logger.info("replyDao 옴 : " + reply);
		return session.insert("replyMapper.insertReply", reply);
	}


	public List<Reply> selectOneList(String no) {
		logger.info("replyDao 옴 no : " + no);
		return session.selectList("replyMapper.selectOneList", no);
	}


	public ArrayList<Reply> selectList() {
		List<Reply> list = session.selectList("replyMapper.selectList");
		return (ArrayList<Reply>)list;
	}


	public int updatereply(Reply reply) {
		logger.info("dao repiy :" + reply);
		return session.update("replyMapper.updatereply", reply);
	}


	public int deletereply(Reply reply) {
		logger.info("dao repiy :" + reply);
		return session.delete("replyMapper.deletereply", reply);
	}


	public int insertRereply(Reply reply) {
		logger.info("replyDao 옴 : " + reply);
		return session.insert("replyMapper.insertRereply", reply);
	}

}
