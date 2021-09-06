package com.bitcamp.cobsp.views.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cobsp.views.service.viewsAddService;

@Controller
public class viewsController {

	@Autowired
	private viewsAddService addService;
	
	// 조회수 증가
	@RequestMapping(value = "/views/addViews", method = RequestMethod.GET) 
	@ResponseBody
	public void addViews(
			@ModelAttribute("postIdx") int postIdx) {

		addService.addViews(postIdx);
	}

}