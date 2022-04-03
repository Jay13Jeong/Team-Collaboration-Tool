package com.beet.HWABO.bpost.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.bpost.model.vo.Bpost;

@Repository("bpostDao")
public class BpostDao {

	private static final Logger logger = LoggerFactory.getLogger(BpostDao.class);
	
	@Autowired
	private SqlSessionTemplate session;
	
	public BpostDao() {}
	
	public int insertBpost(Bpost bpost) {
		logger.info("bpost dao : " + bpost);
		return session.insert("bpostMapper.insertBpost", bpost);
	}

	public ArrayList<Bpost> selectList() {
		List<Bpost> list = session.selectList("bpostMapper.selectList");
		return (ArrayList<Bpost>)list;
	}

	public int deleteBpost(Bpost bpost) {
		logger.info("bpost dao : " + bpost);
		return session.delete("bpostMapper.deleteBpost", bpost);
	}

	public Bpost selectBpost(String bno) {
		logger.info("bpost dao : " + bno);
		return session.selectOne("bpostMapper.selectBpost", bno);
	}

	public int updateBpost(Bpost bpost) {
		logger.info("updatebpost dao : " + bpost);
		return session.update("bpostMapper.updateBpost", bpost);
	}

	

	public String selectBno() {
		
		return session.selectOne("bpostMapper.selectBno");
	}

	public ArrayList<Bpost> selectfilelist(String bno) {
		logger.info("selectfilelist dao : " + bno);
		List<Bpost> list = session.selectList("bpostMapper.selectfilelist", bno);
		return (ArrayList<Bpost>)list;
	}


}
