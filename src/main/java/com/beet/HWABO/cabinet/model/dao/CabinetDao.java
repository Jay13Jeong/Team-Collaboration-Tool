package com.beet.HWABO.cabinet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.cabinet.model.vo.Cabinet;
import com.beet.HWABO.cabinet.model.vo.realpost;


@Repository("cabinetDao")
public class CabinetDao {

	private static final Logger logger = LoggerFactory.getLogger(CabinetDao.class);
	
	@Autowired
	private SqlSessionTemplate session;
	
	public CabinetDao() {}
	
	public int insertCabinet(Cabinet cabinet) {
		logger.info("cabinet dao :"+ cabinet);
		return session.insert("cabinetMapper.insertCabinet", cabinet);
	}

	public int deleteCabinet(Cabinet cabinet) {
		logger.info("cabinet dao :"+ cabinet);
		return session.delete("cabinetMapper.deleteCabinet", cabinet);
	}

	public ArrayList<Cabinet> selectUser(Cabinet cabinet) {
		logger.info("cabinet dao :"+ cabinet);
		List<Cabinet> list = session.selectList("cabinetMapper.selectUser", cabinet);
		return (ArrayList<Cabinet>)list;
	}

	public int deleteWithCabinet(String no) {
		logger.info("cabinet dao no :"+ no);
		return session.delete("cabinetMapper.deleteWithCabinet", no);
	}

	public ArrayList<realpost> selectCabinetList(realpost realpost) {
		List<realpost> list = session.selectList("cabinetMapper.selectCabinetList", realpost);
		return (ArrayList<realpost>)list;
	}


}
