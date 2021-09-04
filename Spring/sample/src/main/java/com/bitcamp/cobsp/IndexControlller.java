package com.bitcamp.cobsp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexControlller {
	
	@RequestMapping("/index")
	public void index() {
	}
	
	@RequestMapping("/")
	public String index1() {
		return "redirect:/index";
	}

}
