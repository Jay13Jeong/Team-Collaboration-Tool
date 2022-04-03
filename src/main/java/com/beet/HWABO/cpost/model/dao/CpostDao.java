package com.beet.HWABO.cpost.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.cpost.model.vo.AddOn;
import com.beet.HWABO.cpost.model.vo.Cpost;

@Repository("cpostDao")
public class CpostDao {
	
	private static final Logger logger = LoggerFactory.getLogger(CpostDao.class);
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertCpost(Cpost cpost) {
		return session.insert("cpostMapper.insertCpost", cpost);
	}

	public String selectCno() {
		return session.selectOne("cpostMapper.selectCno");
	}

	public int updateCfile(AddOn addon) {
		return session.insert("cpostMapper.updateCfile", addon);
	}

	public ArrayList<Cpost> selectCpList() {
		List<Cpost> cplist = session.selectList("cpostMapper.selectCpList");
		return (ArrayList<Cpost>)cplist;
	}

	public Cpost selectCpOne(String cno) {
		return session.selectOne("cpostMapper.selectCpOne", cno);
	}

	public int updateCpost(Cpost cpost) {
		return session.update("cpostMapper.updateCpost", cpost);
	}

	public int deleteCpost(String cno) {
		return session.update("cpostMapper.deleteCpost", cno);
	}

	public int updateCfileAll(AddOn addon) {
		return session.update("cpostMapper.updateCfileAll", addon);
	}

	public int deleteAddon(String cno) {
		return session.delete("cpostMapper.deleteAddon", cno);
	}



}
