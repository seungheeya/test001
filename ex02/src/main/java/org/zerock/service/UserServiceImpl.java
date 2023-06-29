package org.zerock.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public UserVO login(UserVO vo, HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession();
		UserVO login = mapper.login(vo);
		
		if(login == null) {
			session.setAttribute("user", null);
		}
		else {
			session.setAttribute("user", login);
		}
		return login;
	}

}
