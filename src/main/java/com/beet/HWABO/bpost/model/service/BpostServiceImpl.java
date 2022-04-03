package com.beet.HWABO.bpost.model.service;


import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beet.HWABO.bpost.model.dao.BpostDao;
import com.beet.HWABO.bpost.model.vo.Bpost;

@Service("bpostService")
public class BpostServiceImpl implements BpostService{

	private static final Logger logger = LoggerFactory.getLogger(BpostServiceImpl.class);
	
	@Autowired
	private BpostDao bpostDao;
	
	@Override
	public int insertBpost(Bpost bpost) {
	
		logger.info("service 옴 : " + bpost);
		
		return bpostDao.insertBpost(bpost);
	}

	@Override
	public ArrayList<Bpost> selectList() {
		
		return bpostDao.selectList();
	}

	@Override
	public int deleteBpost(Bpost bpost) {
	
		logger.info("service 옴 : " + bpost);
		return bpostDao.deleteBpost(bpost);
	}

	@Override
	public Bpost selectBpost(String bno) {
		logger.info("service 옴 : " + bno);
		return bpostDao.selectBpost(bno);
	}

	@Override
	public int updateBpost(Bpost bpost) {
		logger.info("update service 옴 : " + bpost);
		return bpostDao.updateBpost(bpost);
	}

	@Override
	public String selectBno() {
		
		return bpostDao.selectBno();
	}

	@Override
	public ArrayList<Bpost> selectfilelist(String bno) {
		
		return bpostDao.selectfilelist(bno);
	}

	

	

}
