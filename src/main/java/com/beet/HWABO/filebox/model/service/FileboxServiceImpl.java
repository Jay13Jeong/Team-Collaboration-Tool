package com.beet.HWABO.filebox.model.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beet.HWABO.filebox.model.dao.FileboxDao;
import com.beet.HWABO.filebox.model.vo.Filebox;

@Service("FileboxService")
public class FileboxServiceImpl implements FileboxService{

	
	
	private static final Logger logger = LoggerFactory.getLogger(FileboxServiceImpl.class);
	
	@Autowired
	private FileboxDao fileboxDao;
	
	@Override
	public ArrayList<Filebox> selectList(String pnum) {
		logger.info("dao 도착 " );
		return fileboxDao.selectList(pnum);
	}

	@Override
	public ArrayList<Filebox> selectTxtList(String pnum) {
		logger.info("dao 도착 pnum" + pnum);
		return fileboxDao.selectTxtList(pnum);
	}

	@Override
	public ArrayList<Filebox> selectZipList(String pnum) {

		logger.info("dao 도착 pnum" + pnum);
		return fileboxDao.selectZipList(pnum);
	}
	
	@Override
	public ArrayList<Filebox> selectPptList(String pnum) {
		logger.info("dao 도착 pnum" + pnum);
		return fileboxDao.selectPptList(pnum);
	}

	@Override
	public ArrayList<Filebox> selectEtcList(String pnum) {
		logger.info("dao 도착 pnum" + pnum);
		return fileboxDao.selectEtcList(pnum);
	}

	

}
