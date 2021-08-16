package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.mm.member.domain.MemberRegRequest;
import com.bitcamp.mm.member.service.MemberRegService;

@Controller
@RequestMapping("/member/memberReg")
public class RegMemberController {
	
	@Autowired
	private MemberRegService service;

	@RequestMapping(method = RequestMethod.GET)
	public String regForm() {
		
		return "member/regForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String regView(
			@ModelAttribute("regRequest") MemberRegRequest memberRegRequest,
			HttpServletRequest request,
			Model model) throws FileUploadException {
		
		int resultCnt = service.regMember(memberRegRequest, request);
		model.addAttribute("resultReg", resultCnt);
		
		String view = "member/regView";
		
		if(resultCnt == 1) {
			// 인덱스 페이지로 리다이렉트
			// 리다이렉트 하면 model resultReg값이 같이 간다.
			view = "redirect:/index";
		}
		
		return view;
	}
	
}
