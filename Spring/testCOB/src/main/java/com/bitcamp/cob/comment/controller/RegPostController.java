package com.bitcamp.cob.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegPostController {

//	@Autowired
//	private PostRegServcie sevice;
	
	@RequestMapping("/post/postReg")
	public String regPostForm() {
		return "post/regPostForm";
	}
}
