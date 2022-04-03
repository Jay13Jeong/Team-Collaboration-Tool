package com.beet.HWABO.cabinet.model.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beet.HWABO.cabinet.model.dao.CabinetDao;
import com.beet.HWABO.cabinet.model.vo.Cabinet;

import com.beet.HWABO.cabinet.model.vo.realpost;


@Service("cabinetService")
public class CabinetServiceImpl implements CabinetService{

	private static final Logger logger = LoggerFactory.getLogger(CabinetServiceImpl.class);
	
	
	@Autowired
	private CabinetDao cabinetDao;
	
	@Override
	public int insertCabinet(Cabinet cabinet) {
		logger.info("cabinetService 옴 :"+ cabinet);
		
		
		return cabinetDao.insertCabinet(cabinet);
	}

	@Override
	public int deleteCabinet(Cabinet cabinet) {
		logger.info("service 옴" + cabinet);
		return cabinetDao.deleteCabinet(cabinet);
	}

	@Override
	public ArrayList<Cabinet> selectUser(Cabinet cabinet) {
		logger.info("service 옴 ucode, pnum :" + cabinet);
		return cabinetDao.selectUser(cabinet);
	}

	@Override
	public int delWithCabinet(String no) {
		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!service 옴 no :" + no);
		return cabinetDao.deleteWithCabinet(no);
	}

	@Override
	public ArrayList<realpost> selectCabinetList(realpost realpost) {
		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!service 옴 cabinetKK :" + realpost);
		return cabinetDao.selectCabinetList(realpost);
	}

	/*
	 * @Override public ArrayList<Cabinet> selectUser(String ucode, String pnum) {
	 * logger.info("service 옴 ucode, pnum :" + ucode+", " + pnum); return
	 * cabinetDao.selectUser(ucode, pnum); }
	 */
	
}
