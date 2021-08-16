package com.bitcamp.mm.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.service.DelMemberService;

@Controller
public class DelMemberController {
	
	@Autowired
	DelMemberService service;
	
	@RequestMapping("/member/memberDel{idx}")
	public String getDelMember(
			HttpServletRequest request,
			@RequestParam("idx") String idx) {
		
		try {
			service.getPage(request, idx);
			System.out.println("1" + idx);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "member/memberDel";
	}

}
