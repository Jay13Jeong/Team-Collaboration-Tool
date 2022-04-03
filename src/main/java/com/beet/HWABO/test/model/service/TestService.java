package com.beet.HWABO.test.model.service;

import com.beet.HWABO.test.model.vo.CryptoUser;

public interface TestService {
	int insertUser(CryptoUser user);
	CryptoUser selectLogin(CryptoUser user);
}
