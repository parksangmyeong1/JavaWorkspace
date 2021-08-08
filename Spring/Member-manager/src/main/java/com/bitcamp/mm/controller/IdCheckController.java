package com.bitcamp.mm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.mm.service.IdCheckService;

@Controller
public class IdCheckController {

	@Autowired
	IdCheckService service;
	
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.POST)
	public String idCheck(HttpServletRequest request) {
		
		String memberId = request.getParameter("mid");
		
		request.setAttribute("resultIdCheck", service.idCheck(memberId));
		
		return "member/idCheck";
	}
	
}
