package org.zerock.service;

import javax.servlet.http.HttpServletRequest;

import org.zerock.domain.UserVO;

public interface UserService {

	public void register(UserVO vo) throws Exception;
	
	public UserVO login(UserVO vo, HttpServletRequest req) throws Exception;
}
