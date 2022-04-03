package com.beet.HWABO.abc.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.abc.model.vo.Love;

@Repository("loveDao")
public class LoveDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public LoveDao() {};
	
	public int selectCountLove(String no) {
		return session.selectOne("loveMapper.selectCountLove", no);
	}


	public int selectDuplicationChk(Love love) {
		return session.selectOne("loveMapper.selectDuplicationChk", love);
	}
	
	
	public int insertSpostLove(Love love) {
		return session.insert("loveMapper.insertSpostLove", love);
	}

	
	public int deleteSpostLove(Love love) {
		return session.insert("loveMapper.deleteSpostLove", love);
	}
	
	
	
}
