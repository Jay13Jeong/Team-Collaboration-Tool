package com.beet.HWABO.cpost.model.service;

import java.util.ArrayList;

import com.beet.HWABO.cpost.model.vo.AddOn;
import com.beet.HWABO.cpost.model.vo.Cpost;

public interface CpostService {
	int insertCpost(Cpost cpost);
	String selectCno();
	int updateCfile(AddOn addon);
	ArrayList<Cpost> selectCpList();
	Cpost selectCpOne(String cno);
	
	int updateCpost(Cpost cpost);
	int deleteCpost(String cno);
	int updateCfileAll(AddOn addon);
	int deleteAddon(String cno);

	
	
}
