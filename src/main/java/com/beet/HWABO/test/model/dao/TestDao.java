package com.beet.HWABO.test.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.test.model.vo.CryptoUser;

@Repository("testDao")
public class TestDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public TestDao(){}
	

	public int insertUser(CryptoUser user) {
		return session.insert("testMapper.insertCUser", user);
	}

	public CryptoUser selectLogin(CryptoUser user) {
		return session.selectOne("testMapper.selectLogin", user);
	}

}
