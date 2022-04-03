package com.beet.HWABO.cpost.model.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beet.HWABO.cpost.model.dao.CpostDao;
import com.beet.HWABO.cpost.model.vo.AddOn;
import com.beet.HWABO.cpost.model.vo.Cpost;

@Service("cpostService")
public class CpostServiceImpl implements CpostService{

	private static final Logger logger = LoggerFactory.getLogger(CpostServiceImpl.class);

	@Autowired
	private CpostDao cpostDao;
	
	@Override
	public int insertCpost(Cpost cpost) {
		return cpostDao.insertCpost(cpost);
	}


	@Override
	public String selectCno() {
		return cpostDao.selectCno();
	}


	@Override
	public int updateCfile(AddOn addon) {
		return cpostDao.updateCfile(addon);
	}


	@Override
	public ArrayList<Cpost> selectCpList() {
		return cpostDao.selectCpList();
	}


	@Override
	public Cpost selectCpOne(String cno) {
		return cpostDao.selectCpOne(cno);
	}


	@Override
	public int updateCpost(Cpost cpost) {
		return cpostDao.updateCpost(cpost);
	}


	@Override
	public int deleteCpost(String cno) {
		return cpostDao.deleteCpost(cno);
	}


	@Override
	public int updateCfileAll(AddOn addon) {
		return cpostDao.updateCfileAll(addon);
	}


	@Override
	public int deleteAddon(String cno) {
		return cpostDao.deleteAddon(cno);
	}


}
