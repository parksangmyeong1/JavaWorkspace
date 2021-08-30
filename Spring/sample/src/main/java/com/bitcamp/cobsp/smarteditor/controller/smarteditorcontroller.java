package com.bitcamp.cobsp.smarteditor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class smarteditorcontroller {
	
	@RequestMapping("/smarteditor")
	public String index() {
			
		return "smartEditor";
	}
}
