package com.bitcamp.mm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.mm.service.MemberListService;

@Controller
public class ListController {
	
	@Autowired
	MemberListService service;

	@RequestMapping("/member/memberList")
	public String getListView(HttpServletRequest request) {
		service.listMember(request);
		
		return "member/listView";
	}
}
