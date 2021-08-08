package com.bitcamp.mm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {

	@RequestMapping("member/logout")
	public String logoutMember(HttpServletRequest request) {
		
		request.getSession().invalidate();
		
		return "member/logout";
	}
}