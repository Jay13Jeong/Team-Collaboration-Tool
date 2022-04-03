package com.beet.HWABO.filebox.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beet.HWABO.filebox.model.vo.Filebox;

@Repository("fileboxDao")
public class FileboxDao {
	private static final Logger logger = LoggerFactory.getLogger(FileboxDao.class);
	
	@Autowired
	private SqlSessionTemplate session;
	
	public FileboxDao() {}
	
	public ArrayList<Filebox> selectList(String pnum) {
		
		List<Filebox>list = session.selectList("fileboxMapper.selectList", pnum);
		logger.info("리턴 된 파일박스 리스트 : "+list.toString());
		return (ArrayList<Filebox>)list;
	}

	public ArrayList<Filebox> selectTxtList(String pnum) {
		List<Filebox>list = session.selectList("fileboxMapper.selectTxtList", pnum);
		logger.info("리턴 된 파일박스 리스트 : "+list.toString());
		return (ArrayList<Filebox>)list;
	}

	public ArrayList<Filebox> selectZipList(String pnum) {
		List<Filebox>list = session.selectList("fileboxMapper.selectZipList", pnum);
		logger.info("리턴 된 파일박스 리스트 : "+list.toString());
		return (ArrayList<Filebox>)list;
	}

	public ArrayList<Filebox> selectEtcList(String pnum) {
		List<Filebox>list = session.selectList("fileboxMapper.selectEtcList", pnum);
		logger.info("리턴 된 파일박스 리스트 : "+list.toString());
		return (ArrayList<Filebox>)list;
	}

	public ArrayList<Filebox> selectPptList(String pnum) {
		List<Filebox>list = session.selectList("fileboxMapper.selectPptList", pnum);
		logger.info("리턴 된 파일박스 리스트 : "+list.toString());
		return (ArrayList<Filebox>)list;
	}

}
