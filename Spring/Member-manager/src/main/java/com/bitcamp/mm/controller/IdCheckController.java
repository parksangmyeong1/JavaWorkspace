package com.bitcamp.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.service.IdCheckService;

@Controller
public class IdCheckController {
	
	@Autowired
	private IdCheckService service;

	@RequestMapping(value="/member/idCheck", method=RequestMethod.POST)
	public String idCheck(
			@RequestParam("mid") String uid,
			Model model) {
		
		model.addAttribute("IdCheck", service.idCheck(uid));
		
		return "member/idcheck";
	}
	
}
