package com.bitcamp.mm.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.mm.service.LoginService;


@Controller
@RequestMapping("/member/login")
public class LoginController {
	
	@Autowired
	LoginService service;

	@RequestMapping(method = RequestMethod.GET)
	public String loginForm(
			@CookieValue(value = "reId", required = false) String reId,
			Model model) {
		model.addAttribute("reId", reId);
		return "member/loginForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String loginView(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		service.loginMember(request, response, session);
		
		return "member/login";
	}
}