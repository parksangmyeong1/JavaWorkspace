package com.bitcamp.firstSpring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberMypageController {

	@RequestMapping("/member/mypage/{id}")	// 변수 값으로 사용
	public String mypage(
			@PathVariable("id") String uid,
			Model model) {
		
		System.out.println(uid);
		
		model.addAttribute("userId", uid);
		
		return "member/mypage";
	}
	
}