package com.beet.HWABO.abc.model.service;

import com.beet.HWABO.abc.model.vo.Love;

public interface LoveService {
	int selectCountLove(String no);
	int selectDuplicationChk(Love love);
	int insertSpostLove(Love love);
	int deleteSpostLove(Love love);
}
