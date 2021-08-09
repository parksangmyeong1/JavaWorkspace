package com.bitcamp.op.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/regMember")
public class RegMemberController {

	@RequestMapping(method = RequestMethod.GET)
	public String regForm() {
		
		return "member/regForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String regView() {
		
		
		return "member/regView";
	}
	
}
