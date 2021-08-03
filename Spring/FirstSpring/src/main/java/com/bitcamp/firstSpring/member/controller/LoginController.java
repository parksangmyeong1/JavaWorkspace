package com.bitcamp.firstSpring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/member/loginForm")
	public String getLoginForm() {
		
		// /WEB-INF/views/member/loginForm.jsp
		return "member/loginForm";
	}
}
