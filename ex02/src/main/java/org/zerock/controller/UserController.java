package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserController {
	private UserService service;
	
	@GetMapping("/user/register")
	public void getRegister() {
		log.info("get register");
	}
	
	@PostMapping("/user/register")
	public String register(UserVO vo) throws Exception{
		log.info("register: " + vo);
		service.register(vo);
		return "redirect:/board/list";
	}
	
	@PostMapping("/user/login")
	public String login(UserVO vo, HttpServletRequest req) throws Exception{
		log.info("login");
		
		service.login(vo, req);
		return "";
	}
	
}
