package com.beet.HWABO.abc.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("postreplyDao")
public class PostreplyDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public PostreplyDao() {};
	
	
	
	
	
	
}
