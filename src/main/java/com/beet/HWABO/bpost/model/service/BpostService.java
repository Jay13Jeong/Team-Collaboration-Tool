package com.beet.HWABO.bpost.model.service;



import java.util.ArrayList;

import com.beet.HWABO.bpost.model.vo.Bpost;

public interface BpostService {
	
	int insertBpost(Bpost bpost);
	ArrayList<Bpost> selectList();
	int deleteBpost(Bpost bpost);
	Bpost selectBpost(String bno);
	int updateBpost(Bpost bpost);
	String selectBno();
	ArrayList<Bpost> selectfilelist(String bno);
	
}
