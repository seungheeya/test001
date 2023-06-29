package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService{
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public void register(UserVO vo) throws Exception{
		mapper.register(vo);
	}
	
	@Override
	public UserVO login(UserVO vo) throws Exception{
		return mapper.login(vo);
	}

}
