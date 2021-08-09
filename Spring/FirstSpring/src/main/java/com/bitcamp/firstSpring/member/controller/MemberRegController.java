package com.bitcamp.firstSpring.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.firstSpring.member.domain.MemberRequest;

@Controller
@RequestMapping("/member/regForm")
public class MemberRegController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String getMember() {
		System.out.println("GET방식입니다.");
		// /WEB-INF/views/member/loginForm.jsp
		return "member/memberRegForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String getMemberForm(
			@RequestParam("memberid") String mid,
			@RequestParam("password") String mpw,
			@RequestParam("membername") String mname,
			// @RequestParam("photo") String photo,
			HttpServletRequest request,
			@ModelAttribute("memberReq") MemberRequest memberRequest,
			Model model) {
		
		model.addAttribute("mid", mid);
		model.addAttribute("mpw", mpw);
		model.addAttribute("mname", mname);
		// model.addAttribute("photo", photo);
		
		String uid = request.getParameter("memberid");
		String upw = request.getParameter("password");
		String uname = request.getParameter("membername");
		// String mphoto = request.getParameter("photo");
		
		model.addAttribute("mid", uid);
		model.addAttribute("mpw", upw);
		model.addAttribute("mname", uname);
		// model.addAttribute("mphoto", mphoto);
		
		// /WEB-INF/views/member/loginForm.jsp
		return "member/memberReg";
	}
}
