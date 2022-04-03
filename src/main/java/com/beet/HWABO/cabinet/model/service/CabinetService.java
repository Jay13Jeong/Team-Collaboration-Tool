package com.beet.HWABO.cabinet.model.service;

import java.util.ArrayList;

import com.beet.HWABO.cabinet.model.vo.Cabinet;

import com.beet.HWABO.cabinet.model.vo.realpost;

public interface CabinetService {

	int insertCabinet(Cabinet cabinet);

	int deleteCabinet(Cabinet cabinet);


	ArrayList<Cabinet> selectUser(Cabinet cabinet);

	int delWithCabinet(String no);

	ArrayList<realpost> selectCabinetList(realpost realpost);
	
}
