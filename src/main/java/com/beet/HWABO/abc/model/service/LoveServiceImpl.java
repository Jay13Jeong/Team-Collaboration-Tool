package com.beet.HWABO.abc.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beet.HWABO.abc.model.dao.LoveDao;
import com.beet.HWABO.abc.model.vo.Love;

@Service("loveService")
public class LoveServiceImpl implements LoveService{

	@Autowired
	private LoveDao loveDao;
	
	public LoveServiceImpl() {};
	
	@Override
	public int selectCountLove(String no) {
		return loveDao.selectCountLove(no);
	}
	
	@Override
	public int selectDuplicationChk(Love love) {
		return loveDao.selectDuplicationChk(love);
	}

	@Override
	public int insertSpostLove(Love love) {
		return loveDao.insertSpostLove(love);
	}

	@Override
	public int deleteSpostLove(Love love) {
		return loveDao.deleteSpostLove(love);
	}



}
