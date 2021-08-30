package com.bitcamp.cobsp.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cobsp.post.domain.Post;
import com.bitcamp.cobsp.post.service.PostListService;

@Controller
public class PostListController {

	@Autowired
	private PostListService listService ;

	@RequestMapping("/post/postList")
	public String getList(
			Model model) {
		
		List<Post> list = null;
		
		list = listService.getPostList();
		
		model.addAttribute("postList", list);
		return "post/postList";
	}

}