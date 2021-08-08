package com.bitcamp.mm.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.mm.service.RegMemberService;


@Controller
@RequestMapping("/member/regMember")
public class RegMemberController {
	
	@Autowired
	RegMemberService service;

	@RequestMapping(method = RequestMethod.GET)
	public String dispatchRegForm() {
		return "/member/regForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String dispatchRegView(HttpServletRequest request) throws FileUploadException {
		request.setAttribute("resultReg", service.regMember(request));
		
		return "/member/regView";
	}
}