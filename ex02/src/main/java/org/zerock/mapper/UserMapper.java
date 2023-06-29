package org.zerock.mapper;

import org.zerock.domain.UserVO;

public interface UserMapper {
	public void register(UserVO vo);
	
	public UserVO login(UserVO vo);
}
