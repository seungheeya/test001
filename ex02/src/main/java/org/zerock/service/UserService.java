package org.zerock.service;

import org.zerock.domain.UserVO;

public interface UserService {

	public void register(UserVO vo) throws Exception;
	
	public UserVO login(UserVO vo) throws Exception;
}
